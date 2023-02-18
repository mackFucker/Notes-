//
//  UITextField+UnderLine.swift
//  CapyMessenger
//
//  Created by Иван Карплюк on 27.01.2023.
//

import UIKit

final class UnderLineTextField: UITextField {
    
    convenience init(font: UIFont? = .rounded(ofSize: 20, weight: .bold),
                     returnKeyType: UIReturnKeyType,
                     placeholderText: String,
                     tintcolor: UIColor,
                     secureText: Bool) {
        self.init()
        
        //MARK: - СHANGEABLE PROPERTIES
        
        self.font = font
        self.returnKeyType = returnKeyType
        self.isSecureTextEntry = secureText
        self.tintColor = tintcolor
        
        //MARK: - CONST PROPERTIES
        
        self.borderStyle = .none
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .textField
        
        //MARK: - PLACEHOLDER
        
        let placeholderText = NSAttributedString(string: placeholderText,
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray5])
        self.attributedPlaceholder = placeholderText

        
        //MARK: - UNDER LINE
        
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomView.backgroundColor = .mainGray
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 7),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        
        
    }
}
