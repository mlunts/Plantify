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
    
    private var orders: [Order] = []
    
    @IBOutlet private weak var exploreHeaderLabel: UILabel!
    @IBOutlet private weak var viewAllLabel: UILabel!
    @IBOutlet private weak var ordersCollectionView: UICollectionView!
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBehaviour() 
        setContent()
        fetchOrders()
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
        ordersCollectionView.delegate = self
        ordersCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func fetchOrders() {
        NetworkManager.shared.listOfOrders(onSuccess: { [weak self] (orders, _) in
            guard let orders = orders else {
                return
            }
            
            self?.orders = orders
            self?.ordersCollectionView.reloadData()
            
            }, onFailure: { [weak self] (error, _) in
//                self?.showActivityIndicator(false)
//
//                guard let error = error as? CustomError else {
//                    self?.alert(message: CustomError.somethingWrong.message)
//                    return
//                }
//
//                if error == .sessionIsTimeOut {
//                    self?.alert(message: error.message)
//                    UserManager.shared.getNewSessionID { (success) in
//                        if success {
//                            self?.fetchRooms()
//                        }
//                    }
//                } else { self?.alert(message: error.message) }
        })
        
    }

    private func registerCell() {
        ordersCollectionView.registerCell(ExploreOrdersCollectionViewCell.self)
    }
    
}

extension ExploreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExploreOrdersCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(with: orders[indexPath.row])
        
        return cell
    }
    
    
}
