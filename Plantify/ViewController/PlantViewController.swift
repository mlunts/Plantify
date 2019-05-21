//
//  PlantViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import UIKit

class PlantViewController: UIViewController {
    
    public var newImage: UIImage!
    
    private var taxonomy = [Int : (String, String)]()
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var botanicalNameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var poisonLabel: UIImageView!
    
    @IBOutlet weak var taxonomyTable: UITableView!
    
    private var classifiedPlant : Plant!
    private var db = Database()
    var classifiedString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for element in db.fetchJSON() {
            if element.name == classifiedString.capitalized {
                classifiedPlant = element
            }
        }
        taxonomy = classifiedPlant.getTaxonomy()
        updateUI()
    }
    
    
    private func updateUI() {
        imageView.image = newImage
        nameLabel.text = classifiedPlant.name
        botanicalNameLabel.text = classifiedPlant.botanicalName
        infoLabel.text = classifiedPlant.information
        if classifiedPlant.poisoned {
            poisonLabel.isHidden = false
            poisonLabel.tintColor = .red
        } else {
             poisonLabel.isHidden = true
        }
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
