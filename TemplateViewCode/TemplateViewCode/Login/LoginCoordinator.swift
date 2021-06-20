//
//  LoginCoordinator.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 20/06/21.
//

import Foundation
import UIKit

final class LoginCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    var user: User = User(name: "", password: "")
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    override func start() {
        let viewModel = LoginViewModel(user: self.user)
        let vcController = LoginViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(vcController, animated: true)
    }
    
    func goToTable() {
        let viewModel = DepositViewModel()
        let vcController = DepositListViewController(viewModel: viewModel)
        navigationController.pushViewController(vcController, animated: true)
    }
    
}
