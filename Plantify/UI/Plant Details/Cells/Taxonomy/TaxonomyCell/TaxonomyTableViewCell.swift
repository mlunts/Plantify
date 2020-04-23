//
//  TaxonomyTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class TaxonomyTableViewCell: UITableViewCell {

    // MARK: - properties
    
    private var headings = [L10n.plantInfoTaxonomyHeaderOrder, L10n.plantInfoTaxonomyHeaderFamily, L10n.plantInfoTaxonomyHeaderTribe, L10n.plantInfoTaxonomyHeaderBotanicalName, L10n.plantInfoTaxonomyHeaderUses, L10n.plantInfoPlant]
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var headingLabel: UILabel!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    // MARK: - public
    
    func setContent(index: Int, value: String) {
        nameLabel.text = value
        headingLabel.text = headings[index]
    }
    
}
