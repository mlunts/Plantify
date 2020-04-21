//
//  PlatnDetailsTableViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 15.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantDetailsTableViewController: UIViewController {
    
    enum PlantDetails: CaseIterable {
        case image, title, description, basicInfo, taxonomy
    }
    
    // MARK: - properties
    
    private var flower: Flower!
    private var source: PlantDetailsSource!
    
    @IBOutlet private weak var detailsTableView: UITableView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
    }
    
    // MARK: - public
    
    static func instantiate(with flower: Flower, source: PlantDetailsSource) -> UIViewController {
        let vc = StoryboardScene.PlantDetails.plantDetailsTableViewController.instantiate()
        
        vc.flower = flower
        vc.source = source
        
        return vc
    }
    
    // MARK: - private
    
    private func setupBehaviour() {
        setNib("PlantImageTableViewCell")
        setNib("PlantTitleTableViewCell")
        setNib("PlantDescriptionTableViewCell")
        setNib("PlantBasicInformationTableViewCell")
        setNib("PlantTaxonomyTableViewCell")
    }
    
    private func setNib(_ name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        detailsTableView.register(nib.self, forCellReuseIdentifier: name)
    }
}

extension PlantDetailsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PlantDetails.allCases.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch PlantDetails.allCases[indexPath.row] {
        case .image:
            let cell: PlantImageTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(flower: flower)
            
            return cell
        case .title:
            let cell: PlantTitleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(name: flower.name)
            
            return cell
        case .description:
            let cell: PlantDescriptionTableViewCell = tableView.dequeueReusableCell(for: indexPath)

            cell.setContent(with: flower.information)
            
            return cell
        case .basicInfo:
            let cell: PlantBasicInformationTableViewCell = tableView.dequeueReusableCell(for: indexPath)

            cell.setFlower(flower)
            
            return cell
        case .taxonomy:
            let cell: PlantTaxonomyTableViewCell  = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(flower: flower)
            return cell
        }
    }
    
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if source == PlantDetailsSource.list && indexPath.row == 1 {
            return 0
        } else {
            return UITableView.automaticDimension
        }
      }
}
