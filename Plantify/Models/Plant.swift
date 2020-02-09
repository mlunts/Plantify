//
//  Plant.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import Foundation
import UIKit

class Plant: NSObject, NSCoding {
    
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
    //    public var generalUse = [String]()
    //    public var problemSolvers = [String]()
    //    public var image: UIImage!
    
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
    
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "plantID")
        self.name = decoder.decodeObject(forKey: "plant_name") as? String ?? ""
        self.botanicalName = decoder.decodeObject(forKey: "botanical_name") as? String ?? ""
        self.information = decoder.decodeObject(forKey: "description") as? String ?? ""
        self.poisoned = decoder.decodeBool(forKey: "poisoned")
        self.sideEffects = decoder.decodeObject(forKey: "side_effects") as? String ?? ""
        self.tribe = decoder.decodeObject(forKey: "tribe_name") as? String ?? ""
        self.family = decoder.decodeObject(forKey: "family_name") as? String ?? ""
        self.order = decoder.decodeObject(forKey: "order_name") as? String ?? ""
        self.flowerTime = decoder.decodeObject(forKey: "flower_time") as? String ?? ""
    }
    
    // MARK: - public
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "plant_name")
        coder.encode(id, forKey: "plantID")
        coder.encode(botanicalName, forKey: "botanical_name")
        coder.encode(information, forKey: "description")
        coder.encode(flowerTime, forKey: "flower_time")
        coder.encode(name, forKey: "plant_name")
        coder.encode(sideEffects, forKey: "side_effects")
        coder.encode(tribe, forKey: "tribe_name")
        coder.encode(order, forKey: "order_name")
        coder.encode(family, forKey: "family_name")
        coder.encode(poisoned, forKey: "poisoned")
        
    }
    
    func getTaxonomy() -> [Int : (String, String)] {
        var taxonomy = [Int : (String, String)]()
        taxonomy[0] = (self.order, "Order:")
        taxonomy[1] = (self.family, "Family:")
        taxonomy[2] = (self.tribe, "Tribe")
        return taxonomy
    }
    
    //    func setGeneralUse(array: [String])  {
    //        for element in array {
    //            generalUse.append(element)
    //        }
    //    }
    //
    //    func setProblemSolvers(array: [String])  {
    //        for element in array {
    //            problemSolvers.append(element)
    //        }
    //    }
    //
    //    func setImage(imageName: String) {
    //        self.image = UIImage(named: imageName)
    //    }
    
    func isObjectEmpty() -> Bool {
        return (id == 0)
    }
}
