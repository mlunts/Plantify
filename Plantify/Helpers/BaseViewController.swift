//
//  BaseViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 05.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit
import Then

protocol ActivityIndicatorProtocol {
    func showActivityIndicator(_ isShow: Bool)
}

class BaseViewController: UIViewController {
    
    // MARK: - properties
    
    private let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    lazy private var activityIndicator = UIActivityIndicatorView(style: .gray).then {
        if $0.superview == nil {
            view.addSubview($0)
        }
        $0.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - public
    
    func alert(message: String, title: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: L10n.alertTitleOK, style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension BaseViewController: ActivityIndicatorProtocol {
    func showActivityIndicator(_ isShow: Bool) {
        if isShow {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
