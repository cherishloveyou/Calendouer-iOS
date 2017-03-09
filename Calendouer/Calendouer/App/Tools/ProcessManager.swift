//
//  ProcessManager.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/8.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProcessManager: NSObject {
    
    public func GetWeather(Switch authority: Bool, latitude: CGFloat, longitude: CGFloat, handle: @escaping (_ weather: WeatherObject) -> Void) {
        let url: String = "https://api.thinkpage.cn/v3/weather/daily.json?key=txyws41isbyqnma5&location=\(latitude):\(longitude)&language=zh-Hans&unit=c"
        Alamofire.request(url).responseJSON { response in
            let json = JSON(response.result.value!)
            var dataDic: [String: String] = [:]
            dataDic["name"]                 = json["results"][0]["location"]["name"].stringValue
            dataDic["path"]                 = json["results"][0]["location"]["path"].stringValue
            dataDic["id"]                   = json["results"][0]["location"]["id"].stringValue
            dataDic["country"]              = json["results"][0]["location"]["country"].stringValue
            dataDic["timezone"]             = json["results"][0]["location"]["timezone"].stringValue
            dataDic["timezone_offset"]      = json["results"][0]["location"]["timezone_offset"].stringValue
            dataDic["date"]                 = json["results"][0]["daily"][0]["date"].stringValue
            dataDic["text_day"]             = json["results"][0]["daily"][0]["text_day"].stringValue
            dataDic["code_day"]             = json["results"][0]["daily"][0]["code_day"].stringValue
            dataDic["text_night"]           = json["results"][0]["daily"][0]["text_night"].stringValue
            dataDic["code_night"]           = json["results"][0]["daily"][0]["code_night"].stringValue
            dataDic["high"]                 = json["results"][0]["daily"][0]["high"].stringValue
            dataDic["low"]                  = json["results"][0]["daily"][0]["low"].stringValue
            dataDic["precip"]               = json["results"][0]["daily"][0]["precip"].stringValue
            dataDic["wind_direction"]       = json["results"][0]["daily"][0]["wind_direction"].stringValue
            dataDic["wind_direction_degree"] = json["results"][0]["daily"][0]["wind_direction_degree"].stringValue
            dataDic["wind_speed"]           = json["results"][0]["daily"][0]["wind_speed"].stringValue
            dataDic["wind_scale"]           = json["results"][0]["daily"][0]["wind_scale"].stringValue
            
            let weather: WeatherObject = WeatherObject(Dictionary: dataDic)
            handle(weather)
        }
    }
    
//    public func GetWeather(Switch authority: Bool, handle: )
}

