//
//  SceneDelegate.swift
//  Practice
//
//  Created by Artem Poletaev on 30.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let taskViewController = TaskViewController()
        let centerViewController = MenuViewController()
        let taskNavigation = UINavigationController(rootViewController: taskViewController)
        let centerNavigation = UINavigationController(rootViewController: centerViewController)
        let tabBarController = UITabBarController()
        
        tabBarController.setViewControllers([taskNavigation,centerNavigation], animated: true)
        taskNavigation.tabBarItem = UITabBarItem(title: "Сегодня", image: UIImage(systemName: "pencil"), tag: 1)
        centerNavigation.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "list.clipboard"), tag: 1)
        
        
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            
        }
        
        
        
        
    }
    

