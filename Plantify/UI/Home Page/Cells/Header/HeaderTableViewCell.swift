//
//  HeaderTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 04.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

protocol HeaderTableViewCellDelegate: class {
    func presentIdentifierDialogWindow()
}

class HeaderTableViewCell: UITableViewCell {

    // MARK: - properties
    
    weak var delegate: HeaderTableViewCellDelegate?
    
    @IBOutlet private weak var identifyButton: UIButton!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupStyle()
    }

    // MARK: - private
    
    private func setupStyle() {
        identifyButton.cornerRadius = identifyButton.bounds.height / 3
        identifyButton.dropShadow(shadowOffset: CGSize(width: 0, height: 1.0), shadowOpacity: 1, shadowRadius: 3, shadowColor: Asset.shadyLady.color)
    }
    
    // MARK: - actions
    
    @IBAction private func identifyButtonTapped(_ sender: Any) {
        delegate?.presentIdentifierDialogWindow()
    }
}
