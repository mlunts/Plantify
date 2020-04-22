//
//  PlantsViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantsViewController: BaseViewController {
    
    // MARK: - properties
    
    var order: Order!
    
    private lazy var plantsCollectionViewController = PlantsTableViewController.instantiate(with: order)
    
    @IBOutlet private weak var plantsCollectionViewContainer: UIView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupContent()
    }
    
    // MARK: - public
    
    static func instantiate(with order: Order) -> UIViewController {
        let vc = StoryboardScene.Plants.plantsViewController.instantiate()
        vc.order = order
        
        return vc
    }
    
    
    // MARK: - private
    
    private func setupContent() {
        title = L10n.ordersPageHeader
        
        navigationItem.title = order.name
    }
    
    private func setupViewHierarchy() {
        addChildVC(plantsCollectionViewController, to: plantsCollectionViewContainer)
    }
    
}
