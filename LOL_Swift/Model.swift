//
//  Model.swift
//  LOL_Swift
//
//  Created by Chenghui on 16/3/16.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

import UIKit

class Model: NSObject {

//    var heroImage : UIImage?
    var name : String?
    var icon : String?
    var intro : String?
    
    init(dict : [String: AnyObject]) {
        
        super.init()
        // 字典转模型
        setValuesForKeysWithDictionary(dict)
    }
    
    // 重写方法, 重写方法防止奔溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("这个方法保证程序不退出的")
        return
    }
    
}
