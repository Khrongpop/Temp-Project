//
//  AppManager.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import UIKit
import Foundation

class AppManager: NSObject {
    static let shared = AppManager()
    
    private var tabCount: Int = 0
    private var allowSelectedTab: Bool = true
    private weak var previousVC: UIViewController?

    enum TabBarType: Int {
        case home = 0, more
    }

    func tabBar() -> UITabBarController {
        let tabBarView = UITabBarController()
        let viewControllers: [UIViewController]? = [
            // TODO:- Add viewcontrollers here
            homeView(),
            homeView()
        ]

        tabBarView.viewControllers = viewControllers
        tabBarView.tabBar.isTranslucent = false
        tabBarView.view.backgroundColor = .white
        tabBarView.delegate = self
        
        return tabBarView
    }

    func initApp() -> UIViewController {
        return embededInNavigationController(HomeViewController.instance)
    }

    deinit {
        previousVC = nil
    }
    
}

extension AppManager {
     func homeView() -> UIViewController {
        let view = HomeViewController.instance
        view.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: TabBarType.home.rawValue)
        view.hidesBottomBarWhenPushed = false
        return embededInNavigationController(view)
    }

    func moreView() -> UIViewController {
        let view = MoreViewController.instance
        view.tabBarItem = UITabBarItem(title: "More", image: nil, tag: TabBarType.more.rawValue)
        view.hidesBottomBarWhenPushed = false
        return embededInNavigationController(view)
    }
}

extension AppManager {
    private func embededInNavigationController(_ view: UIViewController) -> UIViewController {
        return BaseNavigationViewController(rootViewController: view)
    }
}

extension AppManager {
    var version: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    var build: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
    
    var bundleId: String {
        return Bundle.main.bundleIdentifier ?? "khrongpop.Temp-Project"
    }
}

// MARK:- Tab bar delegate

extension AppManager: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return allowSelectedTab
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if previousVC?.tabBarItem.tag == viewController.tabBarItem.tag {
            tabCount += 1
        }

        viewController.navigationController?.popToRootViewController(animated: true)
        previousVC = viewController
    }
}
