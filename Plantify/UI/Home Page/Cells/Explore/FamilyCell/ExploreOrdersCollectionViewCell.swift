//
//  ExploreOrdersCollectionViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 06.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class ExploreOrdersCollectionViewCell: UICollectionViewCell {

    // MARK: - properties

    @IBOutlet private weak var familyNameLabel: UILabel!
    @IBOutlet private weak var flowerImageView: UIImageView!
    
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyle()
    }

    // MARK: - public
    
    func setContent(with order: Order) {
        familyNameLabel.text = order.name
        flowerImageView.image = UIImage().getImage(from: order.imageFilename)
        
        backgroundColor = ColorRandomiser().getColor()
    }

    // MARK: - private
    
    func setStyle() {
        flowerImageView.dropShadow(shadowOffset: CGSize(width: 0, height: 1.0), shadowOpacity: 0.2, shadowRadius: 3, shadowColor: .black)
    }
}
