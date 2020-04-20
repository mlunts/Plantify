//
//  OrdersViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 20.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class OrdersViewController: BaseViewController {
    
    // MARK: - properties
    
    var orders: [Order]!
    
    private lazy var ordersCollectionViewController = OrdersCollectionViewController.instantiate(with: orders)
    @IBOutlet weak var ordersCollectionViewContainer: UIView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupContent()
    }
    
    // MARK: - public
    
    static func instantiate(with orders: [Order]) -> UIViewController {
        let vc = StoryboardScene.Orders.ordersViewController.instantiate()
        
        vc.orders = orders
        
        return vc
    }
    
    
    // MARK: - private
    
    private func setupContent() {
        title = L10n.ordersPageHeader
    }
    
    private func setupViewHierarchy() {
        addChildVC(ordersCollectionViewController, to: ordersCollectionViewContainer)
    }
    
    
}
