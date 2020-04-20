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
    
    // MARK: - public
    
    func addFlower(_ flower: Flower) {
        guard var flowers = getFlowers() else {
            var flowers = [Flower]()
            flowers.append(flower)
            
            saveToUserDefaults(flowers)
            
            return
        }
        
        if !isPlantExist(flowers, selectedFlower: flower) {
            flowers.insert(flower, at: 0)
            
            if flowers.count > 5 {
                flowers.remove(at: 5)
            }
            
            saveToUserDefaults(flowers)
        }
    }
    
    func getFlowers() -> [Flower]? {
//        if let data = UserDefaults.standard.data(forKey: "recentFlowers"),
//            let recentFlowers = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Flower] {
//            return recentFlowers
//        } else {
            return nil
//        }
    }
    
    // MARK: - private
    
    private func saveToUserDefaults(_ flowers: [Flower]) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: flowers)
        UserDefaults.standard.set(encodedData, forKey: "recentFlowers")
    }
    
    private func isPlantExist(_ flowers: [Flower], selectedFlower: Flower) -> Bool {
        return flowers.contains(where: { $0.id == selectedFlower.id })
    }
}
