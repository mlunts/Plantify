//
//  ColorRandomizer.swift
//  Plantify
//
//  Created by Marina Lunts on 09.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class ColorRandomiser {
    
    private let colors = [Asset.fbDeco.color, Asset.fbCreamCan.color, Asset.fbHibiscus.color, Asset.fbPinkLace.color, Asset.fbZiggurat.color, Asset.fbJellyBean.color, Asset.fbTonysPink.color, Asset.fbChelseaCucumber.color]
    
    func getColor() -> UIColor {
        return colors.randomElement()!
    }
}
