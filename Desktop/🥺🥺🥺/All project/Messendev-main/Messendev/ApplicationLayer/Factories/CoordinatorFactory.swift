//
//  CoordinatorFactory.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol CoordinatorFactory {
    func makeApplicationCoordinator(router: Router) -> ApplicationCoordinator
    func makeAuthCoordinator(router: Router) -> AuthCoordinator
}

final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    private let container = DIContainer.shared
    
    func makeApplicationCoordinator(router: Router) -> ApplicationCoordinator {
        let userDefaults = container.resolve(type: UserDefaultService.self)
        return .init(coordinatorFactory: self,
                     router: router,
                     userDefaultsService: userDefaults)
    }
    
    func makeAuthCoordinator(router: Router) -> AuthCoordinator {
        let authModuleFactory = container.resolve(type: AuthModuleFactory.self)
        return .init(router: router,
                     authModuleFactory: authModuleFactory)
    }
    
//    func makeAuthenticationCoordinator(router: Router) -> 
    
}
