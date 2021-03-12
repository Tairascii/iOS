//
//  News.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 12.03.2021.
//

import Foundation
class News{
    var date: String?
    var title: String?
    var body: String?
    init(_ date: String, _ title: String?, _ body: String) {
        self.body = body
        self.title = title
        self.date = date
    }
}
