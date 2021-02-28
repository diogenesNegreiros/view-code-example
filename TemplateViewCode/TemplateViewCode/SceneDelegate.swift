//
//  SceneDelegate.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 27/02/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let widowScene = scene as? UIWindowScene{
            let window = UIWindow (windowScene: widowScene)
            let vc = ViewController()
            vc.view.backgroundColor = .white
            window.rootViewController = UINavigationController(rootViewController: vc)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

  


}

