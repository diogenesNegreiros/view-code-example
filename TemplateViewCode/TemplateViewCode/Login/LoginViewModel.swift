//
//  LoginViewModel.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 14/06/21.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func startFetchUser()
    func stopFetchUser(msg: String,isLogin: Bool)
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    var user: User = User(name: "", password: "")
    
    init(user: User) {
        self.user = user
    }
    
    func fetchUser(userLogin: User) {
        
        self.delegate?.startFetchUser()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            if userLogin.name == "Dino" && userLogin.password == "1234" {
                self?.delegate?.stopFetchUser(msg: "Bem vindo \(userLogin.name)!", isLogin: true)
            }
            else {
                self?.delegate?.stopFetchUser(msg: "Login ou senha incorretos!", isLogin: false)
            }
        }
    }
}
