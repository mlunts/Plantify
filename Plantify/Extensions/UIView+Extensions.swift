//
//  UIView+Extensions.swift
//  Plantify
//
//  Created by Marina Lunts on 05.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

extension UIView {
   
    // MARK: - properties
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    // MARK: - public
    
    func dropShadow(shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0),
                    shadowOpacity: Float,
                    shadowRadius: CGFloat,
                    shadowColor: UIColor = .black) {
        addShadowToLayer(layer: layer,
                         shadowOffset: shadowOffset,
                         shadowOpacity: shadowOpacity,
                         shadowRadius: shadowRadius,
                         shadowColor: shadowColor)
    }
    
    /**
     ## Warnings
     Use this method when bounds is correct, also don’t forget to set backgroundColor to .clear on .xib file
     */
    
    func dropShadowWithRoundedCorners(cornerRadius: CGFloat = 10,
                                      fillColor: UIColor,
                                      shadowColor: UIColor = .black,
                                      shadowRadius: CGFloat,
                                      shadowOpacity: Float,
                                      shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0)) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        addShadowToLayer(layer: shadowLayer,
                         shadowOffset: shadowOffset,
                         shadowOpacity: shadowOpacity,
                         shadowRadius: shadowRadius,
                         shadowColor: shadowColor)
        addShadowLayerToView(shadowLayer)
    }
    
    // MARK: - private
    private func addOrReplaceLayer(with name: String, newLayer: CALayer) {
        let oldLayer = layer.sublayers?.filter { $0.name == name }.first
        if oldLayer != nil {
            guard let oldGradientLayer = oldLayer else { return }
            layer.replaceSublayer(oldGradientLayer, with: newLayer)
        } else {
            layer.insertSublayer(newLayer, at: 0)
        }
    }
    
    private func addShadowToLayer(layer: CALayer, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat, shadowColor: UIColor) {
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
    }
    
    private func addShadowLayerToView(_ shadowLayer: CALayer) {
        backgroundColor = .clear
        shadowLayer.name = CALayer.shadowLayerConstant
        addOrReplaceLayer(with: CALayer.shadowLayerConstant, newLayer: shadowLayer)
    }

//    @discardableResult
//    func fromNib<T: UIView>() -> T! {
//        let contentView = (Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)!.first as? T)!.then {
//            addSubview($0)
//            $0.snp.makeConstraints { (maker) in
//                maker.edges.equalToSuperview()
//            }
//        }
//        return contentView
//    }
}
