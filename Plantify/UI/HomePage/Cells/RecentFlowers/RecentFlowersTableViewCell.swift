//
//  RecentFlowersTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 07.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

protocol RecentFlowersTableViewCellDelegate: class {
    func setCellHeight(_ height: CGFloat)
}

class RecentFlowersTableViewCell: UITableViewCell {
    
    // MARK: - properties
    
    weak var delegate: RecentFlowersTableViewCellDelegate?
    
    private let headerHeight: CGFloat = 80
    private let cellHeight: CGFloat = 85
    
    private var flowers: [Plant]? = []
    
    @IBOutlet private weak var recentFlowersHeaderLabel: UILabel!
    @IBOutlet private weak var noRecentFlowersLabel: UILabel!
    @IBOutlet private weak var recentFlowersTableView: UITableView!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setContent()
        setBehaviour()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - public
    
    func getHeight() {
        if flowers != nil {
            let height = headerHeight + CGFloat(flowers!.count) * cellHeight
            
            delegate?.setCellHeight(height)
        }
    }
    
    // MARK: - private
    
    private func setBehaviour() {
        flowersIsEmpty(flowers == nil)
        
        setNib("RecentFlowerTableViewCell")
        
        recentFlowersTableView.dataSource = self
        recentFlowersTableView.delegate = self
        
    }
    
    private func setContent() {
        getFlowersTable()
        
        recentFlowersHeaderLabel.text = L10n.homePageRecentFlowers
        noRecentFlowersLabel.text = L10n.homePageNoRecentFlowers
    }
    
    private func flowersIsEmpty(_ bool: Bool) {
        recentFlowersTableView.isHidden = bool
        noRecentFlowersLabel.isHidden = !bool
    }
    
    private func getFlowersTable() {
        flowers = RecentFlowersManager.shared.getFlowers()
        
        recentFlowersTableView.reloadData()
    }
    
    private func setNib(_ name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        recentFlowersTableView.register(nib.self, forCellReuseIdentifier: name)
    }
}

extension RecentFlowersTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecentFlowerTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(with: flowers![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
