//
//  DayObject.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/10.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class DayObject: NSObject {
    var data: String = ""
    var zodiac: String = ""
    var ganzhi_year: String = ""
    var ganzhi_month: String = ""
    var ganshi_day: String = ""
    var lunar_year: String = ""
    var lunar_month: String = ""
    var lunar_day: String = ""
    var lunar_month_name: String = ""
    var lunar_day_name: String = ""
    var lunar_leap_month: String = ""
    var lunar_festival: String = ""
    var solar_term: String = ""
    
    init(Dictionary dic: [String: String]) {
        super.init()
        if let data = dic["data"] {
            self.data = data
        }
        if let zodiac = dic["zodiac"] {
            self.zodiac = zodiac
        }
        if let ganzhi_year = dic["ganzhi_year"] {
            self.ganzhi_year = ganzhi_year
        }
        if let ganzhi_month = dic["ganshi_month"] {
            self.ganzhi_month = ganzhi_month
        }
        if let ganshi_day = dic["ganshi_day"] {
            self.ganshi_day = ganshi_day
        }
        if let lunar_year = dic["lunar_year"] {
            self.lunar_year = lunar_year
        }
        if let lunar_month = dic["lunar_month"] {
            self.lunar_month = lunar_month
        }
        if let lunar_day = dic["lunar_day"] {
            self.lunar_day = lunar_day
        }
        if let lunar_month_name = dic["lunar_month_name"] {
            self.lunar_month_name = lunar_month_name
        }
        if let lunar_day_name = dic["lunar_day_name"] {
            self.lunar_day_name = lunar_day_name
        }
        if let lunar_leap_month = dic["lunar_leap_month"] {
            self.lunar_leap_month = lunar_leap_month
        }
        if let lunar_festival = dic["lunar_festival"] {
            self.lunar_festival = lunar_festival
        }
        if let solar_term = dic["solar_term"] {
            self.solar_term = solar_term
        }
    }
}
