//
//  Plant.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import Foundation

class Plant: NSObject {
    
    var id: Int
    var name: String
    var botanicalName: String
    var information: String
    var flowerTime: String
    var poisoned: Bool
    var sideEffects: String
    var tribe: String
    var family: String
    var order: String
   
   
    override init() {
        self.id = 0
        self.name = ""
        self.botanicalName = ""
        self.information = ""
        self.poisoned = false
        self.sideEffects = ""
        self.tribe = ""
        self.family = ""
        self.order = ""
        self.flowerTime = ""
    }
    
    func getTaxonomy() -> [Int : (String, String)] {
        var taxonomy = [Int : (String, String)]()
        taxonomy[0] = (self.order, "Order:")
        taxonomy[1] = (self.family, "Family:")
        taxonomy[2] = (self.tribe, "Tribe")
        return taxonomy
    }
}
