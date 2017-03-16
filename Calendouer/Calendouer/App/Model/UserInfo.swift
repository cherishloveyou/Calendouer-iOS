//
//  UserInfo.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/13.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

final class UserInfo: NSObject, NSCoding {
    var id = 0
    var name = ""
    
    var isReceiveMovie: Bool = true
    var isReceiveReport: Bool = true
    var isReceiveMatter: Bool = true
    
    convenience init(irMovie: Bool, irReport: Bool, irMatter: Bool) {
        self.init()
        
        self.isReceiveMovie = irMovie
        self.isReceiveMatter = irMatter
        self.isReceiveReport = irReport
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        self.init()
        for child in Mirror(reflecting: self).children {
            if let key = child.label {
                setValue(aDecoder.decodeObject(forKey: key), forKey: key)
            }
        }
    }
    
    func encode(with aCoder: NSCoder) {
        for child in Mirror(reflecting: self).children {
            if let key = child.label {
                aCoder.encode(value(forKey: key), forKey: key)
            }
        }
    }
}
