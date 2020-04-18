//
//  BasicInformationCollectionViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 16.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class BasicInformationCollectionViewCell: UICollectionViewCell {

    
    // MARK: - properties
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - public
    
    func setContent(text: String, picture: UIImage) {
        imageView.image = picture
        titleLabel.text = text
    }

}
