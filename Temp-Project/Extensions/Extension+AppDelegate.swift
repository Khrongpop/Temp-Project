//
//  Extension+AppDelegate.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import UIKit

extension AppDelegate {
    func startApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = AppManager.shared.tabBar()
        window?.makeKeyAndVisible()
    }

    func currentController() -> UIViewController {
        var currentController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (currentController.presentedViewController != nil) {
            currentController = currentController.presentedViewController!
        }
        return currentController
    }
    
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
}

extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
