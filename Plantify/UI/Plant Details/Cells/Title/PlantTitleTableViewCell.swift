//
//  PlantTitleTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 16.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantTitleTableViewCell: UITableViewCell {

    // MARK: - propeties
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - public
    
    func setContent(name: String) {
        nameLabel.text = name
    }
}
