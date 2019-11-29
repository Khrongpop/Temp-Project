//
//  BaseViewControllerProtocol.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol: class {
    static var instance: UIViewController { get }
}

/// MARK - Xib
protocol BaseViewController: BaseViewControllerProtocol {}
extension BaseViewController where Self: UIViewController {
    static var instance: UIViewController {
        return Self(nibName: "\(Self.self)", bundle: nil)
    }
}

/// MARK - Storyboard
protocol BaseViewControllerFromStoryboard: BaseViewControllerProtocol {
    static var identifier: String { get }
    static var storyboardName: String { get }
}

extension BaseViewControllerFromStoryboard where Self: UIViewController {
    static var instance: UIViewController {
        return UIStoryboard(name: Self.storyboardName, bundle: nil).instantiateViewController(withIdentifier: Self.identifier) as! Self
    }
}

