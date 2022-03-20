//
//  Order.swift
//  Ordering
//
//  Created by Angel Zambrano on 3/20/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
 
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
