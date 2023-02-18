//
//  Router.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import UIKit

protocol Router {
    var presenter: UINavigationController? { get }
    
    func present(_ module: Presentable?)
    func push(_ module: Presentable?)
    func popController(animated: Bool)
    func dismissController(animated: Bool)
}

protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  func toPresent() -> UIViewController? {
    return self
  }
}

protocol BaseView: NSObjectProtocol, Presentable {}

final class RouterImpl: Router {
    init(rootVC: UINavigationController) {
        self.presenter = rootVC
    }
    
    var presenter: UINavigationController?
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        presenter?.present(controller, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        presenter?.pushViewController(controller, animated: animated)
    }
    
    func popController(animated: Bool = true) {
        presenter?.popViewController(animated: animated)
    }
    
    func dismissController(animated: Bool = true) {
        presenter?.dismiss(animated: animated)
    }
}
