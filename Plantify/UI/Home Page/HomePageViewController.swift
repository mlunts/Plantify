//
//  HomePageViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 04.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
        setupStyle()
        
    }
    
    // MARK: - private
    
    private func setupContent() {
        title = L10n.homePageHeader
    }
    
    private func setupStyle() {
        setupNavigationMultilineTitle()
    }

}
