//
//  File.swift
//  Yandex notes
//
//  Created by дэвид Кихтенко on 30.10.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
