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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlToGetDrivers = "http://apis.is/rides/samferda-drivers/"
        let urlToGetPassengers = "http://apis.is/rides/samferda-passengers/"
        
      getDataFromURL(url: urlToGetPassengers)
        
    }
    
    func getDataFromURL(url: String) {
        
        if let url = URL(string: url) {
            if let data = try? String(contentsOf: url) {
                let dataAsJSON = JSON(parseJSON: data)
                parse(json: dataAsJSON)
                writeJSONtoFile(json: dataAsJSON)
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
    
    func writeJSONtoFile(json: JSON) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd_MM_yyyy"
//        var dateString = dateFormatter.string(from:Date())
//
//        let fileName = "\(dateString).json"
//        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
//        let text = json
//        let data = Data(text.stringValue.utf8)
//        do {
//
//            try data.write(to: url, options: .atomic)
//            print("Zapisuje")
//        } catch {
//            print(error)
//        }
        
        let str = "Super long string here"
        let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
        
        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
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

