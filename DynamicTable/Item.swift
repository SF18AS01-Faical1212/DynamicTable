//
//  File.swift
//  DynamicTable
//
//  Created by Faical Sawadogo1212 on 01/12/19.
//  Copyright © 2019 Faical Sawadogo1212 All rights reserved.
//

import Foundation

class Item {
    var name = ""
    var number : Int?
    let date   = NSDate()
    
    init(name: String, number: Int?) {
        self.name = name
        self.number = number
    }
}

