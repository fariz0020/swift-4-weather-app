//
//  Sys.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Foundation

struct Sys: Codable {
    let message: Double?
    let country: String?
    let sunrise: Double?
    let sunset: Double?
}
