//
//  contacs.swift
//  contact
//
//  Created by Tair Sairanbekov on 12.02.2021.
//

import Foundation
import UIKit
struct contacs {
    private var contacts: [newCont] = [newCont.init("Tair", "8777", UIImage.init(named: "male")!)]
    mutating func addCont(_ name_surname:String, _ phoneNumber:String, _ gender:String){
        contacts.append(newCont.init(name_surname,phoneNumber, UIImage.init(named: gender)!))
    }
    mutating func deleteCont(_ index:Int){
        contacts.remove(at: index)
    }
    func getRes()->[newCont]{
        return contacts
    }
}
