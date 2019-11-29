//
//  HomeViewController.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        // Do any additional setup after loading the view.
    }


}


/// MARK: - Function
extension HomeViewController {
    @IBAction func doShowMoreView() {
        Navigator.shared.showMoreView(self)
    }
    
    @IBAction func navigateToMoreView() {
        Navigator.shared.navigateToMoreView(self)
    }
}
