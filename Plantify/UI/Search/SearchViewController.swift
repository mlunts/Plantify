//
//  SearchViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 23.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    // MARK: - properties
    
    var orders: [Order]!
    
    private lazy var searchTableViewController = SearchTableViewController.instantiate(with: orders)
    @IBOutlet weak var searchCollectionViewContainer: UIView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchOrders()
        setupContent()
    }
    
    // MARK: - public
    
    static func instantiate() -> UIViewController {
        let vc = StoryboardScene.Search.searchViewController.instantiate()
        
        return vc
    }
    
    private func fetchOrders() {
        showActivityIndicator(true)
        NetworkManager.shared.listOfOrders(onSuccess: { [weak self] (orders, _) in
            guard let orders = orders else {
                return
            }
            
            self?.orders = orders
            self?.showActivityIndicator(false)
            self?.setupViewHierarchy()
            
            }, onFailure: { [weak self] (error, _) in
                self?.showActivityIndicator(false)
                self?.alert(message: L10n.errorNoServerAnswer, title: L10n.errorOops)
        })
    }
    
    
    // MARK: - private
    
    private func setupContent() {
        title = L10n.searchPageHeader
    }
    
    private func setupViewHierarchy() {
        addChildVC(searchTableViewController, to: searchCollectionViewContainer)
    }
    
}
