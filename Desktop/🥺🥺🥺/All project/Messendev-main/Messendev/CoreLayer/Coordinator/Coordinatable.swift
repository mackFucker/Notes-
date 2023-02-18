//
//  Coordinatable.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

typealias CoordinatorHandler = () -> ()

protocol Coordinatable: AnyObject {
    
    var flowCompletionHandler: CoordinatorHandler? { get set }
    func start()
}

protocol FlowController {
    associatedtype T
    
    var completionHandler: ((T) -> ())? { get set }
}

class BaseCoordinator: Coordinatable {
    
    var childCoordinators: [Coordinatable] = []
    
    var flowCompletionHandler: CoordinatorHandler?
    
    func start() { }
    
    func addDependency(_ coordinator: Coordinatable) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else { return }
        
        if let coordinator = coordinator as? BaseCoordinator,
           !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({$0 !== coordinator})
                .forEach({coordinator.removeDependency($0) })
        }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
