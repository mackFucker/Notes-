//
//  SceneDelegate.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 12.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = MainScreenViewController(notesRepository: NotesDataSource.shared,
                                                      mainView: MainScreenView())
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

