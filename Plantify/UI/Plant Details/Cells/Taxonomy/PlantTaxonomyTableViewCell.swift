//
//  PlantTaxonomyTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 16.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantTaxonomyTableViewCell: UITableViewCell {
    
    // MARK: - properties
    
    private var flower: Flower!
    
    @IBOutlet private weak var taxonomyTableView: UITableView!
    @IBOutlet private weak var taxonomyTableViewHeightContraint: NSLayoutConstraint!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBehaviour()
    }
    
    // MARK: - public
    
    func setContent(flower: Flower) {
        self.flower = flower
        
        taxonomyTableView.reloadData()
        setupTableHeight()
    }
    
    // MARK: - private
    
    private func setupBehaviour() {
        taxonomyTableView.dataSource = self
        taxonomyTableView.delegate = self
        
        setNib("TaxonomyTableViewCell")
    }
    
    private func setupTableHeight() {
        let font = UIFont.systemFont(ofSize: 16)
        
        taxonomyTableViewHeightContraint.constant = 3*45 + flower.uses.height(withConstrainedWidth: (taxonomyTableView.bounds.width - 100), font: font)
    }
    
    private func setNib(_ name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        taxonomyTableView.register(nib.self, forCellReuseIdentifier: name)
    }
    
    private func getValueForIndex(_ index: Int) -> String {
        switch index {
        case 0:
            return flower.orderName
        case 1:
            return flower.familyName
        case 2:
            return flower.tribeName
        case 3:
            return flower.botanicalName ?? ""
        default:
            return flower.uses
        }
    }
    
}

extension PlantTaxonomyTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flower.botanicalName?.isEmpty ?? true ? 4 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaxonomyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        let index = flower.botanicalName?.isEmpty ?? true && indexPath.row == 3 ? indexPath.row + 1 : indexPath.row
        
        cell.setContent(index: index, value: getValueForIndex(index))
        
        return cell
    }
}
