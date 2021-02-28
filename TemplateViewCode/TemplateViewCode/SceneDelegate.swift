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
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
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

