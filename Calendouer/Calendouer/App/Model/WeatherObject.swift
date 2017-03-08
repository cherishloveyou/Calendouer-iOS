//
//  WeatherObject.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/8.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class WeatherObject: NSObject {
    var id: String = ""
    var name: String = ""
    var country: String = ""
    var path: String = ""
    var timezone: String = ""
    var timezone_offset: String = ""
    var date: String = ""
    var text_day: String = ""
    var code_day: String = ""
    var text_night: String = ""
    var code_night: String = ""
    var high: String = ""
    var low: String = ""
    var precip: String = ""
    var wind_direction: String = ""
    var wind_direction_degree: String = ""
    var wind_speed: String = ""
    var wind_scale: String = ""
    
    init(Dictionary dic: [String: String]) {
        super.init()
        if let id = dic["id"] {
            self.id = id
        }
        if let name = dic["name"] {
            self.name = name
        }
        if let country = dic["country"] {
            self.country = country
        }
        if let path = dic["path"] {
            self.path = path
        }
        if let timezone = dic["timezone"] {
            self.timezone = timezone
        }
        if let timezone_offset = dic["timezone_offset"] {
            self.timezone_offset = timezone_offset
        }
        if let date = dic["date"] {
            self.date = date
        }
        if let text_day = dic["text_day"] {
            self.text_day = text_day
        }
        if let code_day = dic["code_day"] {
            self.code_day = code_day
        }
        if let text_night = dic["text_night"] {
            self.text_night = text_night
        }
        if let high = dic["high"] {
            self.high = high
        }
        if let low = dic["low"] {
            self.low = low
        }
        if let precip = dic["precip"] {
            self.precip = precip
        }
        if let wind_direction = dic["wind_direction"] {
            self.wind_direction = wind_direction
        }
        if let wind_direction_degree = dic["wind_direction_degree"] {
            self.wind_direction_degree = wind_direction_degree
        }
        if let wind_speed = dic["wind_speed"] {
            self.wind_speed = wind_speed
        }
        if let wind_scale = dic["wind_scale"] {
            self.wind_scale = wind_scale
        }
    }
}
