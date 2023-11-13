//
//  MainTabVCViewController.swift
//  secondProject
//
//  Created by Руслан on 29.10.2023.
//
import UIKit

class MainTabVC: UITabBarController {

    private var menuVC = MenuScreenVC()
    private var basketVC = BasketScreenVC()
    private var detailVC = DetailScreenVC()
    
//    private var menuVC: MenuScreenVC {
//       let controller = MenuScreenVC()
//        return controller
//    }()
//
//    private var basketVC: BasketScreenVC {
//        let controller = BasketScreenVC()
////        let image = UIImage(systemName: "basket")
////        let selectedImage = UIImage(systemName: "basketSelected")
////        let tabItem = UITabBarItem.init(title: "Корзина", image: image, selectedImage: selectedImage)
////        controll.tabBarItem = tabItem
//        return controller
//    }()
//
//
//    private var detailVC: DetailScreenVC {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    
    }
    
    private func setup() {
        tabBar.tintColor = .orange
        viewControllers = [menuVC, detailVC, basketVC]
        
        for (index, controller) in [menuVC, detailVC, basketVC].enumerated() {
            let page = TabBarPage.init(index: index)
            let tabItem = UITabBarItem.init(title: page?.getTitle(), image: page?.image(), selectedImage: page?.iconSelected())
            controller.tabBarItem = tabItem
        }
    }
}
