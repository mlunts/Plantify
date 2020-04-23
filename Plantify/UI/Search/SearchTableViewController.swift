//
//  SearchTableViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 23.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class SearchTableViewController: BaseViewController {
    
    // MARK: - properties
    
    var orders = [Order]()
    var results = [Dictionary<String, Int>.Element]()
    var isSeguePerformed = false
    
    @IBOutlet private weak var noPlantsLabel: UILabel!
    @IBOutlet private weak var resultsTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
        setupContent()
    }
    
    
    // MARK: - public
    
    static func instantiate(with orders: [Order]) -> UIViewController {
        let vc = StoryboardScene.Search.searchTableViewController.instantiate()
        
        vc.orders = orders
        return vc
    }
    
    // MARK: - private
    
    private func setupBehaviour() {
        setNib("TaxonomyTableViewCell")
    }
    
    private func setupContent() {
        noPlantsLabel.text = L10n.searchPageNoFoundError
    }
    
    private func handleNoResults(_ bool: Bool) {
        noPlantsLabel.isHidden = !bool
    }
    
    private func setNib(_ name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        resultsTableView.register(nib.self, forCellReuseIdentifier: name)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
         results.removeAll()
        let text = searchText.lowercased()
        
        orders.forEach { (order) in
            order.flowers.forEach { (flower) in
                if flower.name.lowercased().contains(text) {
                    results.append((flower.name, 5))
                }
                
                if order.name.lowercased().contains(text) && !results.contains(where: {$0.key ==  order.name}) {
                    results.append((order.name, 0))
                }
            }
        }
        
        if results.count == 0  {
            handleNoResults(true)
        } else {
            handleNoResults(false)
        }
        
        resultsTableView.reloadData()
    }
    
    private func goToViewController(index: Int) {
        var vc: UIViewController?
        let result = results[index]
        
        switch result.value {
        case 0:
            if let order = orders.first(where: { $0.name ==  result.key}) {
                vc = PlantsViewController.instantiate(with: order)
            }
        case 5:
            var flower: Flower?
            orders.forEach { (order) in
                for element in order.flowers where element.name == result.key {
                    flower = element
                }
            }
            
            vc = PlantDetailsViewController.instantiate(with: flower!, source: .identification)
        default:
            return
        }
        
        if let vc = vc {
            isSeguePerformed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension SearchTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaxonomyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.setContent(index: results[indexPath.row].value, value: results[indexPath.row].key)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        goToViewController(index: indexPath.row)
    }
    
    
}

extension SearchTableViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        handleNoResults(false)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if isSeguePerformed == false {
            results.removeAll()
        } else {
            isSeguePerformed = false
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        handleNoResults(false)
        
        results.removeAll()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        filterContentForSearchText(text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
}
