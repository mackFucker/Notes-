//
//  UILabel+.swift
//  CapyMessenger
//
//  Created by Иван Карплюк on 27.01.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .rounded(ofSize: 16, weight: .bold), textColor: UIColor) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
