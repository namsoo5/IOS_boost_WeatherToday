//
//  Town.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import Foundation

/*
 {
 "city_name":"베를린",
 "state":12,
 "celsius":10.8,
 "rainfall_probability":60
 }
 */

//도시별 정보
class Town:Codable {
    let cityName:String
    let state:Int
    let celsius:Double
    let rainfall:Int
    
    enum CodingKeys:String, CodingKey {
        case cityName = "city_name"
        case state, celsius
        case rainfall = "rainfall_probability"
    }
}
