//
//  File.swift
//  EasyNetTest
//
//  Created by hjk on 2017/8/24.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import Foundation

extension Bundle{
    var namespace: String{
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
        
    }
    
}
