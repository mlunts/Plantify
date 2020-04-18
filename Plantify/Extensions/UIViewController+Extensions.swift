//
//  UIViewController+Extensions.swift
//  Plantify
//
//  Created by Marina Lunts on 15.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    func addChildVC(_ childVC: UIViewController, to container: UIView) {
        addChild(childVC)
        container.addSubview(childVC.view)
        childVC.view.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        childVC.didMove(toParent: self)
    }
    
    func setupNavigationMultilineTitle() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        for sview in navigationBar.subviews {
            for ssview in sview.subviews {
                guard let label = ssview as? UILabel else { break }
                if label.text == self.title {
                    label.numberOfLines = 0
                    label.lineBreakMode = .byWordWrapping
                    label.sizeToFit()
                    UIView.animate(withDuration: 0.3, animations: {
                        navigationBar.frame.size.height = 57 + label.frame.height
                    })
                }
            }
        }
    }
}
