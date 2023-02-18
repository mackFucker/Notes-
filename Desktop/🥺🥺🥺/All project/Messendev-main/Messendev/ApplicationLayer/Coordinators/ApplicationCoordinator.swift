//
//  ApplicationCoordinator.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    private var userDefaultsService: UserDefaultService
    
    init(coordinatorFactory: CoordinatorFactory,
         router: Router,
         userDefaultsService: UserDefaultService) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.userDefaultsService = userDefaultsService
    }
    
    override func start() {
        if !userDefaultsService.isNotFirstLaunch {
            runStartFlow()
            userDefaultsService.isNotFirstLaunch = true
        }
        
        if userDefaultsService.isLogin {
            runMainFlow()
        } else {
            runAuthFlow()
        }
    }
    
    private func runStartFlow() {
        
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
//        coordinator.flowCompletionHandler
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        
    }
}
