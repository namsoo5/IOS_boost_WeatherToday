//
//  Country.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import Foundation

/*
 
 [
 {"korean_name":"한국","asset_name":"kr"},
 {"korean_name":"독일","asset_name":"de"},
 {"korean_name":"이탈리아","asset_name":"it"},
 {"korean_name":"미국","asset_name":"us"},
 {"korean_name":"프랑스","asset_name":"fr"},
 {"korean_name":"일본","asset_name":"jp"}
 ]
 
 */


//나라별정보
class Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey{
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
