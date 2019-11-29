//
//  Navigator.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import Foundation
import UIKit

class Navigator {
    
    var appNavigation: AppNavigation!
    
    static var shared: Navigator = {
        return Navigator(navigation: AppNavigation())
    }()
    
    init(navigation: AppNavigation) {
        self.appNavigation = navigation
    }

}

extension Navigator {
    /// MARK : Push View
    func navigateToMoreView<VC: UIViewController>(_ sender: VC?) {
        guard let view = appNavigation.navigateToMoreView() else { return }
        sender?.navigationController?.pushViewController(view, animated: true)
    }
}

extension Navigator {
    /// MARK : Push View
    func showMoreView<VC: UIViewController>(_ sender: VC?) {
          guard let view = appNavigation.navigateToMoreView() else { return }
//          let nav = BaseNavigationViewController(rootViewController: view)
          sender?.present(view, animated: true)
    }
}
