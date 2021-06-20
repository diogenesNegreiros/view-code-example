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
            print("Executou SceneDelegate")
            let userDefault = User(name: "", password: "")
            let navController = UINavigationController()
            let coordinator = LoginCoordinator(navigationController: navController, user: userDefault)
            coordinator.start()
            
            let window = UIWindow (windowScene: widowScene)
            window.rootViewController = navController
            window.makeKeyAndVisible()
            self.window = window
        }
    }
}

