//
//  ViewController.swift
//  IOS_boost_WeatherToday
//
//  Created by 남수김 on 13/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var country: [Country] = []
    
    //나라별 이미지를 가져오기위한 한영 변환함수
    func change(s: String) -> String {
        var changeString: String = ""
        switch s {
        case "한국":
            changeString = "kr"
        case "독일":
            changeString = "de"
        case "이탈리아":
            changeString = "it"
        case "미국":
            changeString = "us"
        case "프랑스":
            changeString = "fr"
        case "일본":
            changeString = "jp"
        default:
            changeString = ""
        
        }
        
        return changeString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let jsonDecoder:JSONDecoder = JSONDecoder()
        
        guard let countryAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.country = try jsonDecoder.decode([Country].self, from: countryAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }

    //행 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    //행 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryTableViewCell
        
        let countryName:String = country[indexPath.row].koreanName
        cell.countryLabel?.text = countryName
        let imgname:String = country[indexPath.row].assetName
        cell.contryImg?.image = UIImage(named: "flag_\(imgname)")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Country" {
            guard let nextView :CountryViewController = segue.destination as? CountryViewController else {
                return
            }
            
            guard let Cell :CountryTableViewCell = sender as? CountryTableViewCell else {
                return
            }
            let store: String = Cell.countryLabel.text!
            nextView.country = store
            nextView.countryEg = change(s: store)
        }
    }

}

