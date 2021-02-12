//
//  newCont.swift
//  contact
//
//  Created by Tair Sairanbekov on 11.02.2021.
//
import UIKit
import Foundation
class newCont{
    var name_surname: String?
    var phoneNumber: String?
    var image: UIImage?
    init(_ name_surname:String, _ phoneNumber:String, _ image:UIImage) {
        self.name_surname = name_surname
        self.phoneNumber = phoneNumber
        self.image = image
    }
}
