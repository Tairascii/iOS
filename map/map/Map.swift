//
//  Map.swift
//  map
//
//  Created by Tair Sairanbekov on 24.03.2021.
//

import Foundation
import MapKit

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation")
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            btn.addTarget(self, action: #selector(infoB), for: .touchUpInside)
            annotationView?.rightCalloutAccessoryView = btn
        }
        else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        selPin = view.annotation
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        navItem.title = (selPin?.title)!
        myMap.setRegion(MKCoordinateRegion(center: selPin!.coordinate, span: span), animated: true)
    }
    
    @objc func infoB(sender: UIButton) {
        let nav = (storyboard?.instantiateViewController(identifier: "EditViewController")) as! EditViewController
        nav.name = (selPin?.title)!
        nav.desc = (selPin?.subtitle)!
        nav.coordinate = selPin?.coordinate
        nav.myDelegate = self
        show(nav, sender: self)
    }
}
