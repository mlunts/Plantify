//
//  Plant.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import Foundation
import UIKit

struct Flower: Codable {
    
    var id: Int
    var name: String
    var botanicalName: String?
    var information: String
    var seasons: String
    var toxicities: String?
    var uses: String
    var tribeName: String
    var familyName: String
    var orderName: String
    var type: String
    var imageFilename: String
    
    // MARK: - public
    
    func poisonedString() -> String {
        return L10n.plantInfoPoisoned
    }
}
