//
//  Plant.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import Foundation

class Plant: NSObject {
    
    public var id: Int
    public var name: String
    public var botanicalName: String
    public var information: String
    public var flowerTime: String
    public var poisoned: Bool
    public var sideEffects: String
    public var tribe: String
    public var family: String
    public var order: String
    public var generalUse = [String]()
    public var problemSolvers = [String]()
   
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
    
    public func getTaxonomy() -> [Int : (String, String)] {
        var taxonomy = [Int : (String, String)]()
        taxonomy[0] = (self.order, "Order:")
        taxonomy[1] = (self.family, "Family:")
        taxonomy[2] = (self.tribe, "Tribe")
        return taxonomy
    }
    
    public func setGeneralUse(array: [String])  {
        for element in array {
            generalUse.append(element)
        }
    }
    
    public func setProblemSolvers(array: [String])  {
        for element in array {
            problemSolvers.append(element)
        }
    }
}
