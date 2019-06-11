//
//  UIViewController+Extension.swift
//  norm
//
//  Created by hjk on 2017/5/11.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

extension UIViewController {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}
