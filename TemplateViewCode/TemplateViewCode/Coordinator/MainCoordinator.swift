//
//  MainCoordinator.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 15/06/21.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

protocol MainCoordinatorParentDelegate: AnyObject {
    func didFinish(coordinator: MainCoordinator)
}

@objc class MainCoordinator: NSObject {
    
    // MARK: - Private properties

    internal var identifier: String { return String(describing: Self.self) }
    internal var childCoordinators = [String: MainCoordinator]()
    
    // MARK: - Public properties
    
    var rootViewController: MainViewController? {
        didSet {
            rootViewController?.delegate = self
        }
    }
    
    weak var parent: MainCoordinatorParentDelegate?
    
    // MARK: - Public methods
    
    func start() {
        fatalError("Start method should be implemented.")
    }

    func coordinate(to coordinator: MainCoordinator, parent: MainCoordinator) {
        
        store(coordinator)
        coordinator.parent = parent
        coordinator.start()
    }
}

// MARK: - Private methods

extension MainCoordinator {
    
    private func store(_ coordinator: MainCoordinator) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func free(_ coordinator: MainCoordinator) {
        childCoordinators[coordinator.identifier] = nil
    }
}

// MARK: - BaseCoordinatorParentDelegate

extension MainCoordinator: MainCoordinatorParentDelegate {
    
    func didFinish(coordinator: MainCoordinator) {
        free(coordinator)
    }
}

// MARK: - BaseViewControllerDelegate

extension MainCoordinator: MainViewControllerDelegate {
    
    func didMoveFromNavigationStack(_ viewController: UIViewController) {
        guard rootViewController === viewController else { return }
        
        parent?.didFinish(coordinator: self)
    }
}
