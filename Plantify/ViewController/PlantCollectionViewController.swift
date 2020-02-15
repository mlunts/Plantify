//
//  CollectionViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 5/21/19.
//  Copyright © 2019 earine. All rights reserved.
//

import UIKit



class PlantCollectionViewController: UICollectionViewController {
    
    private var db = DatabaseManager()
    private var plants = [Plant]()
    
    private let reuseIdentifier = "collectionCell"
    
    private var selectedPlant = Plant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plants = db.fetchJSON()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToSelectedPlant") {
            let vc = segue.destination as! PlantViewController
            vc.classifiedPlant = selectedPlant
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return plants.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PlantCollectionViewCell
        
//        cell.imageLabel.image = plants[indexPath.row].image
        cell.botanicalNameLabel.text = plants[indexPath.row].botanicalName
        cell.nameLabel.text = plants[indexPath.row].name
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPlant = plants[indexPath.row]
        self.performSegue(withIdentifier: "goToSelectedPlant", sender: nil)
    }
}

