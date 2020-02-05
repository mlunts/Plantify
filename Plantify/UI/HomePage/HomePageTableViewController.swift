//
//  HomePageTableViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 04.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class HomePageTableViewController: UIViewController {
    
    // MARK: - properties
    
    @IBOutlet private weak var homePageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBehaviour()

    }
    
    // MARK: - private
    
    private func setupBehaviour() {
//        homePageTableView.rowHeight = UITableView.automaticDimension
//        homePageTableView.estimatedRowHeight = 600
//        
        let nib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        homePageTableView.register(nib.self, forCellReuseIdentifier: "HeaderTableViewCell")
    }
}

extension HomePageTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell: HeaderTableViewCell = tableView.dequeueReusableCell(for: indexPath)

               return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
}
