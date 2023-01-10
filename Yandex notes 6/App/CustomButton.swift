//
//  CustomButton.swift
//  яндекс заметки
//
//  Created by дэвид Кихтенко on 19.10.2022.
//

import UIKit

public class CustomButton: UIButton {
    
    init(buttonColor: UIColor,
         titel: String?,
         width: CGFloat?,
         height: CGFloat?,
         textSize: CGFloat,
         сolorText: UIColor?,
         shadowOpacity: Float?,
         corner: CGFloat?) {
        super.init(frame: .zero)
        self.backgroundColor = buttonColor
        self.setTitle(titel, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        if let width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        self.heightAnchor.constraint(equalToConstant: height ?? 0).isActive = true
        self.layer.cornerRadius = corner ?? (height ?? 0)/2
        self.setTitleColor(сolorText, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        self.layer.shadowOpacity = shadowOpacity ?? 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

