//
//  ViewController.swift
//  WeatherApp19
//
//  Created by Guest User on 16.10.2019.
//  Copyright © 2019 Guest User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //Var and let
    var url = "https://www.metaweather.com/api/location/44418/"
    let form = DateFormatter()
    let dtForm = "YYYY/MM/DD"
    var actualDay = 0
    var now = Date()
    
    
    struct WeatherInfo{
        var date : String
        var minTemp : Double
        var maxTemp : Double
        var pressure : Double?
        var weather : String?
        var humidity : String?
        var windSpeed : Double?
        var windDirection : String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
    }
    
    func initSetup() {
        form.dateFormat = dtForm
        parseJSON(date:now)
    }
    
    func UpdateImage(imgInfo: String){
        var tempUrl = URL(string: "https://www.metaweather.com/static/img/weather/png/64/\(imgInfo)")
        
        URLSession.shared.dataTask(with: tempUrl!){
            data,resp,err in
            DispatchQueue.main.async {
                let img = UIImage(data: data!)
                //Updating image
                self.weatherImg.image =  image
            }
        }
    }
    
    
    func parseJSON(date: Date) {
        let strDate = form.string(from: date)
        var fullUrl = URL(string: "\(url)\(strDate)"))
        
        URLSession.shared.dataTask(with: fullUrl!){
            data, resp, err in
            
            let dateJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
            
            let firstRecord = dateJson!![0]
            
            let weatherInfo = Weather(
                date:strDate,
                minTemp: firstRecord["min_temp"] as! Double,
                maxTemp: firstRecord["max_temp"] as! Double,
                pressure: firstRecord["air_pressure"] as? Double,
                weather: firstRecord["weather_state_abbr"] as? String,
                humidity: firstRecord["humidity"] as? Int,
                windSpeed: firstRecord["wind_speed"] as? Double,
                windDirection: firstRecord["wind_direction_compass"] as? String)
            
            DispatchQueue.main.async{
                //method to update UI
            }
            
            //loading image
            
        }.resume()
    }
 
    
    

}

