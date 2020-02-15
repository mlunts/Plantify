//
//  Database.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import SwiftyJSON

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    func fetchJSON() -> [Plant] {
        var plants = [Plant]()
        if let path = Bundle.main.path(forResource: "Plant", ofType: "json")
        {
            do {
                let pathAsData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                let json = try JSON(data: pathAsData as Data)
                
                for i in 0...json.array!.count - 1  {
                    let plant = Plant()
                    //                    phrases.append(Phrase(text: json[type][i]["phrase"].stringValue))
                    plant.id = json[i]["plantID"].intValue
                    plant.name = json[i]["plant_name"].stringValue
                    plant.botanicalName = json[i]["botanical_name"].stringValue
                    plant.information = json[i]["description"].stringValue
                    plant.flowerTime = json[i]["flower_time"].stringValue
                    plant.sideEffects = json[i]["side_effects"].stringValue
                    plant.tribe = json[i]["tribe_name"].stringValue
                    plant.order = json[i]["order_name"].stringValue
                    plant.family = json[i]["family_name"].stringValue
                    plant.imageURL = json[i]["image"].stringValue
//                    plant.setImage(imageName: json[i]["image"].stringValue)
                    if json[i]["poisoned"].intValue == 1 {
                        plant.poisoned = true
                    }
                    if !getArraysDataFromJSON(jsonFileName: "generalUses", plantId: plant.id).isEmpty {
//                        plant.setGeneralUse(array: getArraysDataFromJSON(jsonFileName: "generalUses", plantId: plant.id))
                    }
                    if !getArraysDataFromJSON(jsonFileName: "problemSolvers", plantId: plant.id).isEmpty {
//                        plant.setProblemSolvers(array: getArraysDataFromJSON(jsonFileName: "problemSolvers", plantId: plant.id))
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
    
    private func getArraysDataFromJSON(jsonFileName: String, plantId: Int) -> [String] {
        var array = [String]()
        guard let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") else {
            return []
        }
        do {
            let pathAsData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            let json = try JSON(data: pathAsData as Data)
            
            for i in 0...json.array!.count - 1  {
                if json[i]["plantID"].intValue == plantId {
                    if jsonFileName == "generalUses" {
                        array.append(json[i]["general_use_name"].stringValue)
                    } else if jsonFileName == "problemSolvers" {
                        array.append(json[i]["problem_solver_name"].stringValue)
                    }
                }
            }
        } catch{
            print("Some error")
            return []
        }
        return array
    }
    
    
    
}
