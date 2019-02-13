//
//  TownViewController.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import UIKit

class TownViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    var town: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.title = town!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //강수확률Label
        if let rain:Int = Detail.instance.rainfall {
            if rain > 50 {
                self.rainLabel.textColor = UIColor.orange
            }
            
            self.rainLabel.text = "강수확률 \(rain)%"
        }
        
        //온도Label
        if let tem:Double = Detail.instance.temperature {
            
            if tem < 10 {
                self.temperatureLabel.textColor = UIColor.blue
            }else if tem > 25 {
                self.temperatureLabel.textColor = UIColor.red
            }
            
            let f = tem * 1.8 + 32
            let format: String = String.init(format: "%.1f", f)
            self.temperatureLabel.text = "섭씨 \(tem) 도 / 화씨 \(format) 도 "
        }
        
        //이미지, 상태Label
        if let state:Int = Detail.instance.state {
            switch state {
            case 10:
                self.img.image = UIImage(named: "sunny")
                self.weatherLabel.text = "맑음"
            case 11:
                self.img.image = UIImage(named: "cloudy")
                self.weatherLabel.text = "흐림"
            case 12:
                self.img.image = UIImage(named: "rainy")
                self.weatherLabel.text = "비"
            case 13:
                self.img.image = UIImage(named: "snowy")
                self.weatherLabel.text = "눈"
            default:
                print("img_error")
            }
        }
        
        
    }
    
    
    
    
}
