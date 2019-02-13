//
//  CountryViewController.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource {

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return town.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TownTableViewCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! TownTableViewCell
        
        cell.CityLabel.text = town[indexPath.row].cityName
        
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
        
        let c:Double = town[indexPath.row].celsius
        if c < 10 {
            cell.temperature.textColor = UIColor.blue
        }
        cell.temperature.text = "섭씨 \(c)도 /"
        
        let rain:Int = town[indexPath.row].rainfall
        cell.rainLabel.text = "강수확률 \(rain)%"
        if rain > 50 {
            cell.rainLabel.textColor = UIColor.orange
        }
        
        return cell
    }
   
    



}
