//
//  PlantBasicInformationTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 16.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantBasicInformationTableViewCell: UITableViewCell {
    
    enum PlantBasicInformation: CaseIterable {
        case type, flowerTime, poisoned
        
        var systemPicture: UIImage {
            switch self {
            case .type:
                return Asset.flowerType.image
            case .flowerTime:
                return Asset.flowerTime.image
            case .poisoned:
                return Asset.skullAndBones.image
            }
        }
    }
    
    // MARK: - properties
    
    private var flower: Flower!
    @IBOutlet private weak var basicInfoCollectionView: UICollectionView!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         setupBehaviour()
    }
    
    // MARK: - public
    
    func setFlower(_ flower: Flower) {
        self.flower = flower
    }
    
    // MARK: - private
    
    private func setupBehaviour() {
        basicInfoCollectionView.delegate = self
        basicInfoCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell() {
        basicInfoCollectionView.registerCell(BasicInformationCollectionViewCell.self)
    }
}

extension PlantBasicInformationTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlantBasicInformation.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BasicInformationCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        let cellType = PlantBasicInformation.allCases[indexPath.row]
        
        switch cellType {
        case .type:
            cell.setContent(text: flower.type, picture: cellType.systemPicture)
        case .flowerTime:
            cell.setContent(text: flower.seasons, picture: cellType.systemPicture)
        case .poisoned:
            let text = (flower.toxicities == "" ? L10n.plantInfoNotPoisoned : flower.toxicities) ?? L10n.plantInfoNotPoisoned
            cell.setContent(text: text, picture: cellType.systemPicture)
        }
        
        return cell
    }
    
}

extension PlantBasicInformationTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.5
        let yourHeight = collectionView.bounds.height

        return CGSize(width: yourWidth, height: yourHeight)
    }
}
