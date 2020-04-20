//
//  OrdersCollectionViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 20.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class OrdersCollectionViewController: BaseViewController {
    
    // MARK: - properties
    
    var orders: [Order]!
    
    @IBOutlet private weak var ordersCollectionView: UICollectionView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBehaviour()
    }
    
    
    // MARK: - public
    
    static func instantiate(with orders: [Order]) -> UIViewController {
        let vc = StoryboardScene.Orders.ordersCollectionViewController.instantiate()
        
        vc.orders = orders
        
        return vc
    }
    
    // MARK: - private
    
    private func setBehaviour() {
        ordersCollectionView.delegate = self
        ordersCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell() {
        ordersCollectionView.registerCell(ExploreOrdersCollectionViewCell.self)
    }
    
}

extension OrdersCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExploreOrdersCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(with: orders[indexPath.row])
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let offsets = 40.0
        let height = 250.0
        let width = (Double(UIScreen.main.bounds.width) / 2.0) - offsets
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
