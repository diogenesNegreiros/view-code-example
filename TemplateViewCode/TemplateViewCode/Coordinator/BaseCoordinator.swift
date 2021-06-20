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

protocol BaseCoordinatorParentDelegate: AnyObject {
    func didFinish(coordinator: BaseCoordinator)
}

@objc class BaseCoordinator: NSObject {
    
    // MARK: - Private properties

    internal var identifier: String { return String(describing: Self.self) }
    internal var childCoordinators = [String: BaseCoordinator]()
    
    // MARK: - Public properties
    
    weak var parentDelegate: BaseCoordinatorParentDelegate?
    var rootViewController: MainViewController? {
        didSet {
            rootViewController?.delegate = self
        }
    }
    
    // MARK: - Public methods
    
    func start() {
        fatalError("Should be implemented.")
    }

    func coordinate(to coordinator: BaseCoordinator, parent: BaseCoordinator) {
        
        coordinator.parentDelegate = parent
        childStore(coordinator)
        coordinator.start()
    }
}

// MARK: - Private methods

extension BaseCoordinator {
    
    private func childStore(_ coordinator: BaseCoordinator) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func childFree(_ coordinator: BaseCoordinator) {
        childCoordinators[coordinator.identifier] = nil
    }
}


// MARK: - BaseViewControllerDelegate

extension BaseCoordinator: MainViewControllerDelegate {
    
    func didMoveFromNavigationStack(_ viewController: UIViewController) {
        guard rootViewController === viewController else { return }
        
        parentDelegate?.didFinish(coordinator: self)
    }
    
}

// MARK: - BaseCoordinatorParentDelegate

extension BaseCoordinator: BaseCoordinatorParentDelegate {
    
    func didFinish(coordinator: BaseCoordinator) {
        childFree(coordinator)
    }
}
