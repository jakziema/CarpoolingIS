//
//  Advertisements.swift
//  CarpoolingIS
//
//  Created by Jakub Ziemann on 13.03.2018.
//  Copyright © 2018 Jakub Ziemann. All rights reserved.
//

import Foundation

struct Results: Codable {
    var results: [Result]
    
    mutating func addResult(result: Result) {
        results.append(result)
    }
}
