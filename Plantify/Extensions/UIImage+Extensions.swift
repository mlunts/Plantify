//
//  UIImage+Extensions.swift
//  Plantify
//
//  Created by Marina Lunts on 19.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

extension UIImage {
    func getImage(from url: String) -> UIImage {
        let imageUrl = URL(string: url)!
        
        if let image = try? UIImage(withContentsOfUrl: imageUrl) {
            return image
        } else {
            return Asset.default.image
        }
    }
}
