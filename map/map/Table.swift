//
//  Table.swift
//  map
//
//  Created by Tair Sairanbekov on 26.03.2021.
//

import Foundation
import MapKit

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Location", for: indexPath)
        cell.textLabel?.text = pins[indexPath.row].name
        cell.detailTextLabel?.text = pins[indexPath.row].desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        myTableView.isHidden = true
        showAnn(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let coordinate = getXY(index: indexPath.row)
            delete(object: pins[indexPath.row])
            loadPins()
            myMap.removeAnnotation(getAnn(coordinate: coordinate))
            myTableView.reloadData()
        }
    }
}

