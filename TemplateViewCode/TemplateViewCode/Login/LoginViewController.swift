//
//  ViewController.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 27/02/21.
//

import Foundation
import UIKit

class LoginViewController: MainViewController {
    
    
    let customView = LoginView()
    var viewModel: LoginViewModel! {
        didSet {
            title = viewModel.user.name
        }
    }
    
    private let coordinator: LoginCoordinator
    
    init(viewModel: LoginViewModel, coordinator: LoginCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        customView.userName.text = "Entre com seu login!"
        customView.buttonOk.addTarget(self, action: #selector(logar), for: .touchUpInside)
        
        let user = User(name: "", password: "")
        viewModel = LoginViewModel(user: user)
        viewModel.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    @objc func logar(){
        print("Clicou no botão logar!")
        customView.indicator.startAnimating()
        let user = User(name: customView.fieldNick.text ?? "", password: customView.fieldPassWord.text ?? "")
        
        viewModel.fetchUser(userLogin: user)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    
    func stopFetchUser(msg: String, isLogin: Bool) {
        customView.userName.text = msg
        
        if isLogin {
            customView.userName.textColor = .green
            self.coordinator.goToTable()
        }
        else{
            customView.userName.textColor = .red
        }
        customView.indicator.stopAnimating()
    }
    
    func startFetchUser() {
        customView.indicator.startAnimating()
    }
}


