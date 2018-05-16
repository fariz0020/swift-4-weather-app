//
//  ApiResponse.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Foundation

public protocol BaseResponse: Decodable {
    var cod: Int? { get }
}

struct ErrorResponse: BaseResponse {
    let cod: Int?
    let message: String?
}

struct WeatherResponse: BaseResponse {
    var cod: Int?
    
    let coord: Coord?
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let sys: Sys?
    
    let base: String?
    let dt: Int?
    let id: Int?
    let name: String?
}
