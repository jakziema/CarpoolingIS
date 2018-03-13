//
//  ViewController.swift
//  CarpoolingIS
//
//  Created by Jakub Ziemann on 13.03.2018.
//  Copyright © 2018 Jakub Ziemann. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    let urlToGetDrivers = "http://apis.is/rides/samferda-drivers/"
    let urlToGetPassengers = "http://apis.is/rides/samferda-passengers/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        print("PASSENGERS")
        getDataFromURL(url: urlToGetPassengers)
        print("DRIVERS")
        getDataFromURL(url: urlToGetDrivers)
        
    }
    
    func getDataFromURL(url: String) {
        if let url = URL(string: url) {
            if let data = try? String(contentsOf: url) {
                let dataAsJSON = JSON(parseJSON: data)
                parse(json: dataAsJSON)
            }
        }
        
    }
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let link = result["link"].stringValue
            let from = result["from"].stringValue
            let to  = result["to"].stringValue
            let date = result["date"].stringValue
            let time = result["time"].stringValue
            
            print("FROM: \(from) TO: \(to) date: \(date)")
        }
        print("\(json["results"].count)")
    }
    
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

