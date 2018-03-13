//
//  Advertisement.swift
//  CarpoolingIS
//
//  Created by Jakub Ziemann on 13.03.2018.
//  Copyright © 2018 Jakub Ziemann. All rights reserved.
//

import Foundation

struct Result: Codable  {
    var link: String
    var from: String
    var to: String
    var date: String
    var time: String
    
    init(link: String, from:String, to: String, date: String, time: String) {
        self.link = link
        self.from = from
        self.to = to
        self.date = date
        self.time = time
    }
    
}
