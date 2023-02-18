//
//  UIButton+.swift
//  CapyMessenger
//
//  Created by Иван Карплюк on 27.01.2023.
//

import UIKit

extension UIButton {
    
    convenience init(background: UIColor,
                     titleColor: UIColor,
                     title: String,
                     font: UIFont? = .rounded(ofSize: 20, weight: .bold),
                     cornerRadius: CGFloat,
                     isShadow: Bool,
                     shadowColor: UIColor,
                     myView: UIView,
                     touchType: UIControl.Event,
                     selector: Selector) {
        self.init(type: .system)
        
        //MARK: - СHANGEABLE PROPERTIES
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = background
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        //MARK: - TARGET
        
        self.addTarget(myView, action: selector, for: touchType)
        
        //MARK: - SHADOW
        
        if isShadow {
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeButtonAddLeftImage(image: UIImage) {
        let logo = UIImageView(img: image, contentMode: UIView.ContentMode.scaleAspectFit)
        logo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logo)
        
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            logo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logo.heightAnchor.constraint(equalToConstant: 25),
            logo.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
}

