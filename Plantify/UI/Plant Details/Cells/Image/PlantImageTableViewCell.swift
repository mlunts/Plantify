//
//  PlantImageTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 16.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantImageTableViewCell: UITableViewCell {

    // MARK: - properties
    
    private var flower: Flower!
    
    @IBOutlet private weak var flowerImageView: UIImageView!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - public
    
    func setContent(flower: Flower) {
        self.flower = flower
        
        updateView()
    }
    
    // MARK: - private
    
    func updateView() {
        flowerImageView.setCustomImage(flower.image)
        
        backgroundColor = ColorRandomiser().getColor()
    }
    
}
