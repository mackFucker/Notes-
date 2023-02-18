//
//  UIImageView+.swift
//  CapyMessenger
//
//  Created by Иван Карплюк on 27.01.2023.
//

import UIKit

extension UIImageView {
    
    convenience init(img: UIImage, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = img
        self.contentMode = contentMode
    }
}
