//
//  PlantDescriptionTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 16.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantDescriptionTableViewCell: UITableViewCell {

    // MARK: - properties
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - public
    
    func setContent(with text: String) {
        descriptionLabel.text = text
    }

}
