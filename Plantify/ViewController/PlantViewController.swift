//
//  PlantViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import UIKit

class PlantViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var botanicalNameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var poisonLabel: UIImageView!
    @IBOutlet weak var generalUseKeyLabel: UILabel!
    @IBOutlet weak var generalUseLabel: UILabel!
    @IBOutlet weak var sideEffects: UILabel!
    @IBOutlet weak var problemSolverKeyUseLabel: UILabel!
    @IBOutlet weak var problemSolverUseLabel: UILabel!
    @IBOutlet weak var taxonomyTable: UITableView!
    
    public var classifiedPlant = Plant()
    
    private var db = DatabaseManager()
    private var taxonomy = [Int : (String, String)]()
    
    var classifiedString : String = ""
    public var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if classifiedPlant.isObjectEmpty() {
            for element in db.fetchJSON() {
                if element.name == classifiedString.capitalized {
                    classifiedPlant = element
                }
            }
        }
        taxonomy = classifiedPlant.getTaxonomy()
        updateUI()
    }
    
    
    private func updateUI() {
        if newImage != nil {
            imageView.image = newImage
        } else {
//            imageView.image = classifiedPlant.image
        }
        nameLabel.text = classifiedPlant.name
        botanicalNameLabel.text = classifiedPlant.botanicalName
        infoLabel.text = classifiedPlant.information
        if classifiedPlant.poisoned {
            poisonLabel.isHidden = false
            poisonLabel.tintColor = .red
        } else {
            poisonLabel.isHidden = true
        }
//        if classifiedPlant.generalUse.isEmpty {
//            generalUseKeyLabel.isHidden = true
//            generalUseLabel.isHidden = true
//        } else {
//            generalUseKeyLabel.isHidden = false
//            generalUseLabel.isHidden = false
//            generalUseLabel.text = classifiedPlant.generalUse.joined(separator: "\n")
//        }
        sideEffects.text = classifiedPlant.sideEffects
//        if classifiedPlant.problemSolvers.isEmpty {
//            problemSolverKeyUseLabel.isHidden = true
//            problemSolverUseLabel.isHidden = true
//        } else {
//            problemSolverKeyUseLabel.isHidden = false
//            problemSolverUseLabel.isHidden = false
//            problemSolverUseLabel.text = classifiedPlant.problemSolvers.joined(separator: "\n")
//        }
    }
}

extension PlantViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == taxonomyTable {
            return 3
        } 
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == taxonomyTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taxonomyCell", for: indexPath) as! TaxonomyTableViewCell
            cell.keyLabel.text = taxonomy[indexPath.row]?.1
            cell.valueLabel.text = taxonomy[indexPath.row]?.0
            return cell
        }
        return UITableViewCell()
    }
}
