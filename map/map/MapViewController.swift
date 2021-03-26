//
//  MapViewController.swift
//  map
//
//  Created by Tair Sairanbekov on 23.03.2021.
//

import UIKit
import MapKit
import CoreData

extension MapViewController: EditPinDelegate {
    func edit(name location: String, desc description: String, coordinate: CLLocationCoordinate2D) {
        let index = pins.firstIndex{ (i) -> Bool in
            return i.x == coordinate.latitude && i.y == coordinate.longitude
        }
        delete(object: pins[index!])
        save(name: location, desc: description, x: coordinate.latitude, y: coordinate.longitude)
        loadPins()
        myMap.removeAnnotation(selPin!)
        add(pin: pins[pins.count - 1])
    }
}

class MapViewController: UIViewController {
    var mapType: [Int: MKMapType] = [0: .standard, 1: .satellite, 2: .hybrid]
    var pins: [Pin] = []
    var selPin: MKAnnotation?
    var ind = 0

    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func segmentB(_ sender: UISegmentedControl) {
        myMap.mapType = mapType[sender.selectedSegmentIndex] ?? .standard
    }

    @IBAction func savedB(_ sender: UIBarButtonItem) {
        myTableView.isHidden = !myTableView.isHidden
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPins()
        load()
        myMap.delegate = self
        myTableView.isHidden = true
    }
    
    func load() {
        for pin in pins {
            add(pin: pin)
        }
    }

    @IBAction func longTap(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: self.myMap)
        let coordinate = self.myMap.convert(touchPoint, toCoordinateFrom: self.myMap)
        let alertController = UIAlertController(title: "Add Place", message: "Fill all the fields", preferredStyle: .alert)
        alertController.addTextField{(textField) in textField.placeholder = "Enter title"}
        alertController.addTextField{(textField) in textField.placeholder = "Enter subtitle"}
        let save = UIAlertAction(title: "Add", style: .default, handler: {[weak self](alert) in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            let annotation = MKPointAnnotation()
            annotation.title = firstTextField.text
            annotation.subtitle = secondTextField.text
            annotation.coordinate = coordinate
            self?.myMap.addAnnotation(annotation)
            self?.save(name: annotation.title!, desc: annotation.subtitle!, x: coordinate.latitude, y: coordinate.longitude)
            self?.myTableView.reloadData()
        })
        alertController.addAction(save)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func rightB(_ sender: UIBarButtonItem) {
        if !pins.isEmpty {
            ind += 1
            if (ind >= pins.count) {
                ind = 0
            }
            showAnn(index: ind)
        }
    }
    
    @IBAction func leftB(_ sender: UIBarButtonItem) {
        if !pins.isEmpty {
            ind -= 1
            if (ind < 0) {
                ind = pins.count - 1
            }
            showAnn(index: ind)
        }
    }
    
    func save(name: String, desc: String, x: Double, y: Double) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            if let entity = NSEntityDescription.entity(forEntityName: "Pin", in: context) {
                let pin = NSManagedObject(entity: entity, insertInto: context)
                pin.setValue(name, forKey: "name")
                pin.setValue(desc, forKey: "desc")
                pin.setValue(x, forKey: "x")
                pin.setValue(y, forKey: "y")
                do {
                    try context.save()
                    pins.append(pin as! Pin)
                }
                catch {}
            }
        }
    }
    
    func add(pin: Pin) {
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: pin.x, longitude: pin.y)
        annotation.coordinate = coordinate
        annotation.title = pin.name
        annotation.subtitle = pin.desc
        myMap.addAnnotation(annotation)
    }
    
    func loadPins() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Pin>(entityName: "Pin")
            do {
                try pins = context.fetch(fetchRequest)
            }
            catch {}
        }
    }
    
    func delete(object: Pin) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            context.delete(object)
            do {
                try context.save()
            }
            catch {}
        }
    }
    
    func showAnn(index: Int) {
        let coordinate = getXY(index: index)
        let annotation = getAnn(coordinate: coordinate)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        navItem.title = annotation.title!!
        myMap.selectAnnotation(annotation, animated: true)
        myMap.setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: true)
    }
    
    func getAnn(coordinate: CLLocationCoordinate2D) -> MKAnnotation {
        let index = myMap.annotations.firstIndex { (i) -> Bool in
            return i.coordinate.latitude == coordinate.latitude && i.coordinate.longitude == coordinate.longitude
        }
        return myMap.annotations[index!]
    }
    
    func getXY(index: Int) -> CLLocationCoordinate2D {
        let pin = pins[index]
        return CLLocationCoordinate2D(latitude: pin.x, longitude: pin.y)
    }
    
}



