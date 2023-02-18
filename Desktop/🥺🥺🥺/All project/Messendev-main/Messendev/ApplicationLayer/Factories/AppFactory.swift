//
//  AppFactory.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import UIKit

protocol AppFactory {
    func makeKeyWindowWithCoordinator(window: UIWindow) -> BaseCoordinator
}

struct AppFactoryImpl: AppFactory {
    func makeKeyWindowWithCoordinator(window: UIWindow) -> BaseCoordinator {
        let rootVC = UINavigationController()
        rootVC.navigationBar.prefersLargeTitles = true
        let router = RouterImpl(rootVC: rootVC)
        let cooridnator = CoordinatorFactoryImpl().makeApplicationCoordinator(router: router)
        window.rootViewController = rootVC
        return cooridnator
    }
}
