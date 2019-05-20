//
//  Database.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import SwiftyJSON

class Database {
    
    func fetchJSON() -> [Plant] {
        var plants = [Plant]()
        if let path = Bundle.main.path(forResource: "Plant", ofType: "json")
        {
            do{
                let pathAsData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                let json = try JSON(data: pathAsData as Data)
                
                for i in 0...json.array!.count - 1  {
                    var plant = Plant()
                    //                    phrases.append(Phrase(text: json[type][i]["phrase"].stringValue))
                    plant.name = json[i]["plant_name"].stringValue
                    plant.botanicalName = json[i]["botanical_name"].stringValue
                    plant.information = json[i]["description"].stringValue
                    plant.flowerTime = json[i]["flower_time"].stringValue
                    plant.sideEffects = json[i]["side_effects"].stringValue
                    plant.tribe = json[i]["tribe_name"].stringValue
                    plant.order = json[i]["order_name"].stringValue
                    plant.family = json[i]["family_name"].stringValue
                    if json[i]["poisened"].intValue == 1 {
                        plant.poisoned = true
                    }
                    plants.append(plant)
                }
            } catch{
                print("Some error")
                return []
            }
        }
        
        return plants
        
    }
    
    
}
