//
//  UIImageView+Extensions.swift
//  Plantify
//
//  Created by Marina Lunts on 09.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = Asset.default.image
            return
        }
        
        guard let url = URL(string: imageURLString) else {
            self.image = Asset.default.image
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : Asset.default.image
            }
        }
    }
}

extension UIImage {

    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
    
        self.init(data: imageData)
    }

}
