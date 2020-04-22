//
//  PlantsTableViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class PlantsTableViewController: BaseViewController {
    
    // MARK: - properties
    
    var order: Order!
    var flowers: [Flower]?
    
    @IBOutlet private weak var noPlantsLabel: UILabel!
    @IBOutlet private weak var plantsTableView: UITableView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
        setupContent()
    }
    
    
    // MARK: - public
    
    static func instantiate(with order: Order) -> UIViewController {
        let vc = StoryboardScene.Plants.plantsTableViewController.instantiate()
        vc.order = order
        return vc
    }
    
    // MARK: - private
    
    private func setupBehaviour() {
        setFlowers()
        
        setNib("FlowerTableViewCell")
    }
    
    private func setupContent() {
        noPlantsLabel.text = L10n.plantsPageNotFound
    }
    
    private func setFlowers() {
        flowers = order.flowers
        noFlowersFound(flowers?.isEmpty ?? false)
    }
    
    private func noFlowersFound(_ value: Bool) {
        noPlantsLabel.isHidden = !value
        plantsTableView.isHidden = value
    }
    
    private func setNib(_ name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        plantsTableView.register(nib.self, forCellReuseIdentifier: name)
    }
}

extension PlantsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FlowerTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(with: flowers![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlantDetailsViewController.instantiate(with: flowers![indexPath.row], source: .list)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
