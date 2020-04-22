//
//  RecentFlowerTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 07.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class FlowerTableViewCell: UITableViewCell {
    
    // MARK: - properties
    
    @IBOutlet private  weak var flowerImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyle()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
    }
    
    // MARK: - public
    
    func setContent(with flower: Flower) {
        nameLabel.text = flower.name
        subTitleLabel.text = flower.information
        flowerImageView.setCustomImage(flower.imageFilename)
    }
    
    // MARK: - private
    
    func setStyle() {
        flowerImageView.backgroundColor = ColorRandomiser().getColor()
    }
    
}
