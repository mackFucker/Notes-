//
//  AuthCoordinator.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

final class AuthCoordinator: BaseCoordinator {
    
    private let router: Router
    private let authModuleFactory: AuthModuleFactory
    
    init(router: Router,
         authModuleFactory: AuthModuleFactory) {
        self.router = router
        self.authModuleFactory = authModuleFactory
    }
    
    override func start() {
        showOnboardingScreen()
//        showLoginScreen()
    }
    
    private func showOnboardingScreen() {
        let onboardingScreen = authModuleFactory.makeOnboardingOutput()
        onboardingScreen.onLoginScreen = {[weak self] in
            self?.showLoginScreen()
        }
        router.push(onboardingScreen)
    }
    
    private func showLoginScreen() {
        let loginScreen = authModuleFactory.makeLoginOutput()
        loginScreen.onRegisterButtonTap = { [weak self] in
//            self?.showRegisterScrenn()
        }
        router.push(loginScreen)
    }
    
    private func showFillUserDataScreen() {
        let showFillUserDataScreen = authModuleFactory.makeFillDataUserOutput()
        router.push(showFillUserDataScreen)
    }
    
    private func showOTPVerifyScreen() {
        let showFillUserDataScreen = authModuleFactory.makeOTPVerifyOutput()
        router.push(showFillUserDataScreen)
    }
}
