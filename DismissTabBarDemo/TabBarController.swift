//
//  ViewController.swift
//  DismissTabBarDemo
//
//  Created by Diego Bustamante on 7/15/20.
//  Copyright © 2020 Diego Bustamante. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMenuBar()
        setUpControllers()
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(_:)), name: tabBarNotificationKey, object: nil)

    }
    
    @objc func notificationReceived(_ notification: Notification) {
        guard let isHidden = notification.userInfo?["isHidden"] as? Bool else { return }
        self.setTabBar(hidden: isHidden)
    }
}

// MARK: Tabbar UI Functions
extension TabBarController {
    fileprivate func setupMenuBar() {
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = UIColor.white
        tabBar.backgroundColor = UIColor.black
    }
    
    fileprivate func setUpControllers() {
        let viewHome = HomeViewController()
        let viewProfile = ProfileViewController()
        let viewSettings = SettingsViewController()


        let viewOne = templateNavController(unselectedImage: UIImage.init(systemName: "house"), selectedImage: UIImage.init(systemName: "house"), rootViewController: viewHome)
         let viewTwo = templateNavController(unselectedImage: UIImage.init(systemName: "person"), selectedImage: UIImage.init(systemName: "person"), rootViewController: viewProfile)
         let viewThree = templateNavController(unselectedImage: UIImage.init(systemName: "gear"), selectedImage: UIImage.init(systemName: "gear"), rootViewController: viewSettings)
         viewControllers = [ viewOne, viewTwo , viewThree]
     }
    
    
    fileprivate func templateNavController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let viewNavController = UINavigationController(rootViewController: viewController)
        viewNavController.tabBarItem.image = unselectedImage
        viewNavController.tabBarItem.selectedImage = selectedImage
        return viewNavController
    }
    
    
}

