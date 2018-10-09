//
//  TabMainViewController.swift
//  九图助手
//
//  Created by 何锦坤 on 2018/10/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit

class TabMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension TabMainViewController{
    
    func setUI() {
        let arrary = [
            ["clsName": "TopViewController","title":"首页","imgName":"tabbar_icon_news"],
            ["clsName": "KJHomeViewController","title":"视频","imgName":"tabbar_icon_video"],
            //            ["":""],
            ["clsName": "KJProfileViewController","title":"我的","imgName":"tabbar_icon_me"]
        ]
        
        var controllers = [UIViewController]()
        
        for dic in arrary {
            controllers.append(addController(dict: dic))
        }
        
        viewControllers = controllers
        
    }
    
    
    
    /// <#Description#>
    ///
    /// - Parameter dict: <#dict description#>
    /// - Returns: <#return value description#>
    func addController(dict:[String:String]) -> UIViewController {
        
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imgName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        let nav = UINavigationController.init(rootViewController: vc)
        nav.tabBarItem.image = UIImage.init(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage.init(named: ""+imageName+"_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary.init(dictionary: [kCTForegroundColorAttributeName:UIColor.red]) as? [NSAttributedStringKey : Any], for: UIControlState.selected)
        
        //        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
        //            [UIColor grayColor], NSForegroundColorAttributeName,
        //            nil] forState:UIControlStateSelected];
        
        return nav
        
        
        
    }
    
}
