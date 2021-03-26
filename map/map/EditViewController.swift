//
//  EditViewController.swift
//  map
//
//  Created by Tair Sairanbekov on 26.03.2021.
//

import UIKit
import MapKit

protocol EditPinDelegate {
    func edit(name: String, desc: String, coordinate: CLLocationCoordinate2D)
}

class EditViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    var myDelegate: EditPinDelegate?
    var name: String?
    var desc: String?
    var coordinate: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextField.text = name!
        descriptionTextField.text = desc!
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        myDelegate?.edit(name: locationTextField.text!, desc: descriptionTextField.text!, coordinate: coordinate!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

