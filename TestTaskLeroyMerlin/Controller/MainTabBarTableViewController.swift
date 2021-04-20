//
//  MainTabBarTableViewController.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 16.04.2021.
//

import UIKit

class MainTabBarTableViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        let testViewController = TestViewController()
        let mainViewController = MainViewController()
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "list.bullet.rectangle", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavvigationController(rootViewController: mainViewController, title: "Главное", image: peopleImage),
            generateNavvigationController(rootViewController: testViewController, title: "Каталог", image: convImage)
        ]

    }
    
    private func generateNavvigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
