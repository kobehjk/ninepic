//
//  UINavigationBar+Extension.swift
//  norm
//
//  Created by hjk on 2017/9/13.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import Foundation
import UIKit

var overlayKey = "overlay"

extension UINavigationBar{

    
    
    @IBInspectable var overlay :UIView? {
    
        get{
            return objc_getAssociatedObject(self, &overlayKey) as? UIView
        }
        set{
            objc_setAssociatedObject(self, &overlayKey, overlay, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
    }
    
    func kj_setBackgroundColor(color:UIColor) {
        
        guard (self.overlay != nil) else {
            self.overlay?.backgroundColor = backgroundColor
            return
        }
        
        self.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        self.shadowImage = UIImage.init()
        self.overlay = UIView.init(frame: CGRect.init(x: 0, y: -20, width: UIScreen.main.bounds.size.width, height: 64))
        self.overlay?.isUserInteractionEnabled = false
        self.overlay?.backgroundColor = color
        
    }
    
    
}
