//
//  ViewController.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 27/02/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let customView = LoginView()
    private var viewModel = LoginViewModel()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.App.name
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func logar(){
        print("Clicou no botão logar!")
    }
    
}


