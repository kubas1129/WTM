//
//  ViewController.swift
//  WeatherApp19
//
//  Created by Guest User on 16.10.2019.
//  Copyright © 2019 Guest User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        task.resume()
    }
    
    var actualDay = 0
    
    let latt = 36.96
    let long = -122.02
    
    //let urlWeid = URL(string: "/api/location/search/?lattlong=\(latt),\(long)")
    
    
    let task = session.dataTask(with: url) { data, response, error in
        
        // ensure there is no error for this HTTP response
        guard error == nil else {
            print ("error: \(error!)")
            return
        }
        
        // ensure there is data returned from this HTTP response
        guard let content = data else {
            print("No data")
            return
        }
        
        // serialise the data / NSData object into Dictionary [String : Any]
        guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
            print("Not containing JSON")
            return
        }
        
        print("gotten json response dictionary is \n \(json)")
        // update UI using the response here
    }


}

