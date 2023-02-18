//
//  Date+Extension.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
        return dateFormatter.string(from: self)
    }
}
