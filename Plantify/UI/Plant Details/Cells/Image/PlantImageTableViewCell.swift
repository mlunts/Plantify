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
    
    private var imageURL: String!
    
    @IBOutlet private weak var flowerImageView: UIImageView!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - public
    
    func setContent(image: String) {
        imageURL = image
        updateView()
    }
    
    // MARK: - private
    
    func updateView() {
        flowerImageView.setCustomImage(imageURL)
        backgroundColor = ColorRandomiser().getColor()
    }
    
}
