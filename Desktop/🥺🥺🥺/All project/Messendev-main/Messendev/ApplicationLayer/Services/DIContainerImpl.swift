//
//  DIContainer.swift
//  Messendev
//
//  Created by Роман Анпилов on 06.02.2023.
//

import Foundation

final class DIContainer: DICprotocol {
    var services: [String : Any]
    
    static var shared = DIContainer()
    
    private init () { services = [:] }
}
