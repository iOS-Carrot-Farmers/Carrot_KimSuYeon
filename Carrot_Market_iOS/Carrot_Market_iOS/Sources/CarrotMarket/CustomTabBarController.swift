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
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let townVC = self.storyboard?.instantiateViewController(withIdentifier: "TownVC"),
              let myAroundVC = self.storyboard?.instantiateViewController(withIdentifier: "MyAroundVC"),
              let chatVC = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC"),
              let myCarrotVC = self.storyboard?.instantiateViewController(withIdentifier: "MyCarrotVC")
        else { return }
        
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        townVC.tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(named: "townIcon"), selectedImage: UIImage(named: "townIconFill"))
        myAroundVC.tabBarItem = UITabBarItem(title: "내 근처", image: UIImage(named: "myAroundIcon"), selectedImage: UIImage(named: "myAroundIconFill"))
        chatVC.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(named: "chatIcon"), selectedImage: UIImage(named: "chatIconFill"))
        myCarrotVC.tabBarItem = UITabBarItem(title: "나의 당근 ", image: UIImage(named: "myCarrotIcon"), selectedImage: UIImage(named: "myCarrotIconFill"))
        
        setViewControllers([homeVC,townVC,myAroundVC,chatVC,myCarrotVC], animated: true)
    }
    
    func setTabBarStyle() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
