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
    var botanicalName: String?
    var information: String
    var seasons: String
    var toxic: String?
    var uses: String
    var tribeName: String
    var familyName: String
    var orderName: String
    var type: String
    //    public var generalUse = [String]()
    //    public var problemSolvers = [String]()
    var imageFilename: String
    
    init() {
        self.id = 0
        self.name = ""
        self.botanicalName = ""
        self.information = ""
        self.toxic = ""
        self.uses = ""
        self.tribeName = ""
        self.familyName = ""
        self.orderName = ""
        self.seasons = ""
        self.imageFilename = ""
        self.type = ""
    }
    
    
    // MARK: - public
    
    func getTaxonomy() -> [Int : (String, String)] {
        var taxonomy = [Int : (String, String)]()
        taxonomy[0] = (self.orderName, "Order:")
        taxonomy[1] = (self.familyName, "Family:")
        taxonomy[2] = (self.tribeName, "Tribe")
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
