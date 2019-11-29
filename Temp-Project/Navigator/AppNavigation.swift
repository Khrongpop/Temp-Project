//
//  AppNavigation.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import UIKit

protocol Navigation: class {
    func navigateToMoreView() -> UIViewController?
}

class AppNavigation: Navigation {
    func navigateToMoreView() -> UIViewController? {
        return MoreViewController.instance
    }
}
