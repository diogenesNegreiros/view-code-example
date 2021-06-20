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
    
    weak var parentDelegate: MainCoordinatorParentDelegate?
    
    // MARK: - Public methods
    
    func start() {
        fatalError("Should be implemented.")
    }

    func coordinate(to coordinator: MainCoordinator, parent: MainCoordinator) {
        
        childStore(coordinator)
        coordinator.parentDelegate = parent
        coordinator.start()
    }
}

// MARK: - Private methods

extension MainCoordinator {
    
    private func childStore(_ coordinator: MainCoordinator) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func childFree(_ coordinator: MainCoordinator) {
        childCoordinators[coordinator.identifier] = nil
    }
}

// MARK: - MainCoordinatorParentDelegate

extension MainCoordinator: MainCoordinatorParentDelegate {
    
    func didFinish(coordinator: MainCoordinator) {
        childFree(coordinator)
    }
}

// MARK: - BaseViewControllerDelegate

extension MainCoordinator: MainViewControllerDelegate {
    
    func didMoveFromNavigationStack(_ viewController: UIViewController) {
        guard rootViewController === viewController else { return }
        
        parentDelegate?.didFinish(coordinator: self)
    }
}
