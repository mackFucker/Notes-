//
//  AppDelegate.swift
//  Messendev
//
//  Created by Роман Анпилов on 02.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        registerDependencies()
        
        return true
    }
    
    private func registerDependencies() {
        DIContainer.shared.register(type: AuthModuleFactory.self,
                                    service: AuthModuleFactoryImpl(container: .shared))
        DIContainer.shared.register(type: UserDefaultService.self,
                                    service: UserDefaultServiceImpl())
        DIContainer.shared.register(type: OnboardingServiceable.self,
                                    service: OnboardingMockService())
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }

}

