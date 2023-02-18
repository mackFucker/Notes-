//
//  UserDefaultsService.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol UserDefaultService {
    var isLogin: Bool { get set }
    var isNotFirstLaunch: Bool { get set }
}

final class UserDefaultServiceImpl: UserDefaultService {
    
    private enum Keys {
        static let isLogin = "isLogin"
        static let isNotFirstLaunch = "isNotFirstLaunch"
    }
    
    private let storage = UserDefaults.standard

    var isLogin: Bool {
        get {
            return storage.bool(forKey: Keys.isLogin)
        }
        set {
            storage.set(newValue, forKey: Keys.isLogin)
        }
    }
    
    var isNotFirstLaunch: Bool {
        get {
            return storage.bool(forKey: Keys.isNotFirstLaunch)
        }
        set {
            storage.set(newValue, forKey: Keys.isNotFirstLaunch)
        }
    }
}
