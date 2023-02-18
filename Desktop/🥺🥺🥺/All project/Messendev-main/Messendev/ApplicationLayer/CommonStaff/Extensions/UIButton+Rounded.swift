//
//  UIButton+Rounded.swift
//  Messendev
//
//  Created by Иван Карплюк on 04.02.2023.
//

import UIKit

final class RoundedButton: UIButton {
    
    convenience init(img: UIImage,
                     backgroundColor: UIColor,
                     tintColor: UIColor,
                     isShadow: Bool,
                     shadowColor: UIColor,
                     myView: UIView,
                     touchType: UIControl.Event,
                     selector: Selector)
    {
        self.init()
        
        //MARK: - СHANGEABLE PROPERTIES
        
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        
        //MARK: - TARGET
        
        self.addTarget(myView, action: selector, for: touchType)
        
        //MARK: - SHADOW
        
        if isShadow {
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
        //MARK: - CONST PROPERTIES
        
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        
        //MARK: - IMAGE
        
        self.setImage(img, for: .normal)
    }
}
