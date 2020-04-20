//
//  Plant.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import Foundation
import UIKit

class Flower: Codable {
    
    var id: Int
    var name: String
    var botanical_name: String?
    var information: String
    var season: String
    var toxic: String?
    var uses: String
    var tribe: String
    var family: String
    var order: String
    var type: String
    //    public var generalUse = [String]()
    //    public var problemSolvers = [String]()
    var image: String
    
    init() {
        self.id = 0
        self.name = ""
        self.botanical_name = ""
        self.information = ""
        self.toxic = ""
        self.uses = ""
        self.tribe = ""
        self.family = ""
        self.order = ""
        self.season = ""
        self.image = ""
        self.type = ""
    }
    
    
    // MARK: - public
    
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
    
    func poisonedString() -> String {
        return L10n.plantInfoPoisoned
    }
    
    func isObjectEmpty() -> Bool {
        return (id == 0)
    }
}
