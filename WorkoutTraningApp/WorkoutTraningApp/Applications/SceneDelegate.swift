//
//  SceneDelegate.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 25.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabBarController = tabBarController()
    
        guard let windowScene = ( scene as? UIWindowScene) else {return}
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
}
