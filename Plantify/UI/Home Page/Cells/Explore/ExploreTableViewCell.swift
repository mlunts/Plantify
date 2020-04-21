//
//  ExploreTableViewCell.swift
//  Plantify
//
//  Created by Marina Lunts on 05.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

protocol ExploreTableViewCellDelegate: class {
    func endLoading()
    func goToOrders(_ orders: [Order])
    func goToOrder(_ order: Order)
}

class ExploreTableViewCell: UITableViewCell {
    
    // MARK: - properties
    weak var delegate: ExploreTableViewCellDelegate?
    
    private var orders: [Order] = []
    
    @IBOutlet private weak var exploreHeaderLabel: UILabel!
    @IBOutlet private weak var viewAllButton: UIButton!
    @IBOutlet private weak var ordersCollectionView: UICollectionView!
    @IBOutlet private weak var errorLabel: UILabel!
    
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
        viewAllButton.setTitle(L10n.homePageViewAll, for: .normal)
        exploreHeaderLabel.text = L10n.homePageExploreHeader
        errorLabel.text = L10n.errorNoServerAnswer
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
            self?.delegate?.endLoading()
            self?.setNoInternetBehaviour(false)
            
            }, onFailure: { [weak self] (error, _) in
                self?.setNoInternetBehaviour(true)
        })
    }
    
    private func registerCell() {
        ordersCollectionView.registerCell(ExploreOrdersCollectionViewCell.self)
    }
    
    private func setNoInternetBehaviour(_ value: Bool) {
        errorLabel.isHidden = !value
        ordersCollectionView.isHidden = value
    }
    
    // MARK: - actions
    
    @IBAction private func viewAllButtonClicked(_ sender: Any) {
        delegate?.goToOrders(orders)
    }
    
}

extension ExploreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count > 4 ? 4 : orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExploreOrdersCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(with: orders[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.goToOrder(orders[indexPath.row])
    }
}
