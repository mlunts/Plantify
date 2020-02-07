//
//  ExploreTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 05.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    
    // MARK: - properties
    
    private var families: [Family] = []
    
    @IBOutlet private weak var exploreHeaderLabel: UILabel!
    @IBOutlet private weak var viewAllLabel: UILabel!
    @IBOutlet private weak var familiesCollectionView: UICollectionView!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBehaviour() 
        setFamilies()
        setContent()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - private
    
    private func setContent() {
        viewAllLabel.text = L10n.homePageViewAll
        exploreHeaderLabel.text = L10n.homePageExploreHeader
    }
    
    private func setBehaviour() {
        familiesCollectionView.delegate = self
        familiesCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func setFamilies() {
        families.append(Family(name: L10n.familyAsteraceae, image: Asset.familyAsteraceae.image, backgroundColor: Asset.petiteOrchid.color))
        families.append(Family(name: L10n.familyLiliaceae, image: Asset.familyLiliaceae.image, backgroundColor: Asset.paarl.color))
        families.append(Family(name: L10n.familyRosaceae, image: Asset.familyRosaceae.image, backgroundColor: Asset.tumbleweed.color))
        families.append(Family(name: L10n.familyRanunculaceae, image: Asset.familyRanunculaceae.image, backgroundColor: Asset.shoking.color))
        
        familiesCollectionView.reloadData()
    }
    
    private func registerCell() {
        familiesCollectionView.registerCell(ExploreFamilyCollectionViewCell.self)
    }
    
}

extension ExploreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return families.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExploreFamilyCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(family: families[indexPath.row])
        
        return cell
    }
    
    
}
