//
//  CountryViewController.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var countryEg: String?
    var country: String?
    var town:[Town] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = country!
        
        let jsonDecoder:JSONDecoder = JSONDecoder()
        
        guard let townAsset: NSDataAsset = NSDataAsset(name: "\(countryEg!)") else {
            return
        }
        
        do {
            self.town = try jsonDecoder.decode([Town].self, from: townAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        
        
        
    }
    
    // 셀개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return town.count
    }
    
    // 셀값 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TownTableViewCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! TownTableViewCell
        
        //도시이름
        cell.CityLabel.text = town[indexPath.row].cityName
        
        //이미지
        var img: UIImage?
        switch town[indexPath.row].state {
        case 10:
            img = UIImage(named: "sunny")
        case 11:
            img = UIImage(named: "cloudy")
        case 12:
            img = UIImage(named: "rainy")
        case 13:
            img = UIImage(named: "snowy")
        default:
            print("error")
        }
        cell.imgView.image = img
        
        //온도
        let c:Double = town[indexPath.row].celsius
        //온도에따른 텍스트색변경
        if c < 10 {
            cell.temperature.textColor = UIColor.blue
        } else {
            cell.temperature.textColor = UIColor.black
        }
        let f = c * 1.8 + 32
        let format: String = String.init(format: "%.1f", f)
        cell.temperature.text = "섭씨 \(c)도 / 화씨 \(format)도"
        
        //강수확률
        let rain:Int = town[indexPath.row].rainfall
        cell.rainLabel.text = "강수확률 \(rain)%"
        //강수확률에 따른 텍스트변경
        if rain > 50 {
            cell.rainLabel.textColor = UIColor.orange
        } else {
            cell.rainLabel.textColor = UIColor.black
        }
        
        return cell
    }
    
    //클릭하고 넘어갈때 인스턴스에 값저장
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //강수확률
        Detail.instance.rainfall = town[indexPath.row].rainfall
        //온도
        Detail.instance.temperature = town[indexPath.row].celsius
        //날씨상태
        Detail.instance.state = town[indexPath.row].state
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Town" {
            guard let nextView:TownViewController = segue.destination as? TownViewController else {
                return
            }
            guard let cell:TownTableViewCell = sender as? TownTableViewCell else {
                return
            }
            
            nextView.town = cell.CityLabel.text!  //네비게이션 타이틀을 변경하기위함
            
        }
    }
}
