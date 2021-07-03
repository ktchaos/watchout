//
//  Coordinator.swift
//  WatchOut
//
//  Created by Daniel on 7/2/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var isCompleted: (() -> Void)? { get set }
    func start()
}

extension Coordinator {
    func start(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.start()
        coordinator.isCompleted = { [weak self] in
            self?.free(coordinator: coordinator)
        }
    }

    func free(coordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
    
    func freeAllChildCoordinatorsWith<T>(type: T.Type) {
        self.childCoordinators = self.childCoordinators.filter { $0 is T == false }
    }
    
    func freeAllChildCoordinators() {
        self.childCoordinators.removeAll()
    }
}

protocol TabBarCoordinator: Coordinator {
    var rootViewController: UITabBarController { get }
}

protocol NavigationCoordinator: Coordinator {
    var rootViewController: UINavigationController { get }
}

