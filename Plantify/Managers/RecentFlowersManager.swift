//
//  RecentFlowersManager.swift
//  Plantify
//
//  Created by Marina Lunts on 07.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Foundation

class RecentFlowersManager {
    
    static let shared = RecentFlowersManager()
    
    private var flowers: [Flower]? 
    
    // MARK: - public
    
    func addFlower(_ flower: Flower) {
        guard flowers?.isEmpty == false else {
            flowers = [flower]

            return
        }

        if flowers!.contains(where: { $0.id == flower.id }) == false {
            flowers!.insert(flower, at: 0)
            
            if flowers!.count > 5 {
                flowers!.remove(at: 5)
            }
        }
    }
    
    func getFlowers() -> [Flower]? {
        return flowers
    }
    
    // MARK: - private
    
    private func isPlantExist(_ flowers: [Flower], selectedFlower: Flower) -> Bool {
        return flowers.contains(where: { $0.id == selectedFlower.id })
    }
}
