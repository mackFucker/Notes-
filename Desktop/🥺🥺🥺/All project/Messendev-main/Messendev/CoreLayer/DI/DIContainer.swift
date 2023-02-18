//
//  DIContainer.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol DICprotocol {
    var services: [String:Any] { get set }
    
    mutating func register<Service>(type: Service.Type, service: Any)
    func resolve<Service>(type: Service.Type) -> Service
}

extension DICprotocol {
    mutating func register<Service>(type: Service.Type, service: Any) {
        services["\(type)"] = service
    }
    
    func resolve<Service>(type: Service.Type) -> Service {
        return services["\(type)"] as! Service
    }
}
