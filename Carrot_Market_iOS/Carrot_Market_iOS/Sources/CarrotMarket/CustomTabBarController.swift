//
//  CustomTabBarController.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/03.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTabBarStyle()
    }
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
        else { return }
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        
        setViewControllers([homeVC], animated: true)
    }
    
    func setTabBarStyle() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
