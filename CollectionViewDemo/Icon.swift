//  Icon.swift
//  CollectionViewDemo
//
//  Created by rlogical-dev-21 on 08/02/21.
//

import Foundation

struct Icon: Hashable {
    var name: String = ""
    var price: Double = 0.0
    var isFeatured: Bool = false
    
    init(name: String, price: Double, isFeatured: Bool) {
        self.name = name
        self.price = price
        self.isFeatured = isFeatured
    }
}
