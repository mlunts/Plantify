//
//  UICollectionView+Extensions.swift
//  Plantify
//
//  Created by Marina Lunts on 06.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    // MARK: - public
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: String(describing: T.self), bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
}

extension UICollectionViewCell: ReusableView {}
