//
//  SceneDelegate.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 27/02/21.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let widowScene = scene as? UIWindowScene{
            let viewModel = LoginViewModel()
            
            let window = UIWindow (windowScene: widowScene)
            let vc = LoginViewController(viewModel: viewModel)
            vc.view.backgroundColor = .white
            window.rootViewController = UINavigationController(rootViewController: vc)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

  


}

