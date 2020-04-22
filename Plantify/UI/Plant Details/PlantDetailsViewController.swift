//
//  PlantDetailsViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 15.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

enum PlantDetailsSource {
    case identification, list
}

class PlantDetailsViewController: UIViewController {
    
    // MARK: - properties
    
    private lazy var plantDetailsTableViewController = PlantDetailsTableViewController.instantiate(with: flower, source: source)
    private var flower: Flower!
    private var source: PlantDetailsSource!
    
    @IBOutlet private weak var plantDetailsTableViewContainer: UIView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupBehaviour()
        setupContent()
    }
    
    // MARK: - public
    
    static func instantiate(with flower: Flower, source: PlantDetailsSource) -> UIViewController {
        let vc = StoryboardScene.PlantDetails.plantDetailsViewController.instantiate()
        
        vc.flower = flower
        vc.source = source
        
        return vc
    }
    
    // MARK: - private
    
    private func setupViewHierarchy() {
        addChildVC(plantDetailsTableViewController, to: plantDetailsTableViewContainer)
    }
    
    private func setupContent() {
        title = flower.name
    }
    
    private func setupBehaviour() {
       navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
}
