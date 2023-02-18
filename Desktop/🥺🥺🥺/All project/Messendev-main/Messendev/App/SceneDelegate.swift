//
//  SceneDelegate.swift
//  Messendev
//
//  Created by Роман Анпилов on 02.02.2023.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appCoordinator: BaseCoordinator?
    private let appFactory = AppFactoryImpl()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
//        self.window?.rootViewController = OnboardingViewController()
//        self.window?.rootViewController = FillUserDataViewController()
//        self.window?.rootViewController = LoginViewController()
        
        self.window?.makeKeyAndVisible()
        let coordinator = appFactory.makeKeyWindowWithCoordinator(window: window)
        self.appCoordinator = coordinator
        coordinator.start()
    }
    
}


