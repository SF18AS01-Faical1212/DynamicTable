//
//  ItemStore.swift
//  DynamicTable
//
//  Created by Faical Sawadogo1212 on 01/12/19.
//  Copyright © 2019 Faical Sawadogo1212. All rights reserved.
//

import Foundation

class ItemStore {
    private var items = [Item]()
    
    func addItem() {
        let item = Item(name: "", number: nil)
        items.append(item)
    }
    
    func getItem(index : Int) -> Item {
        return items[index]
    }
    
    func setItem(number index: Int, item: Item) {
        items[index] = item
    }
}

