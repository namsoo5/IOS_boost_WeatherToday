//
//  DetailData.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import Foundation
import UIKit

class Detail { //데이터를 넘기기위한 인스턴스객체 생성
    static var instance: Detail = Detail()
    
    var state: Int?
    var rainfall: Int?
    var temperature: Double?
}
