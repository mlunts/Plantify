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
    
    let section = ["Taxonomy", "General information", "Additional Information"]
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var botanicalNameLabel: UILabel!
    
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
        
        updateUI()
    }
    

    private func updateUI() {
        imageView.image = newImage
        nameLabel.text = classifiedPlant.name
        botanicalNameLabel.text = classifiedPlant.botanicalName
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
