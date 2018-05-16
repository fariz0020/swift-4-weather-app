//
//  Constant.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

struct ApiConstant {
    struct EndPoint {
        static let baseUrl = "https://api.openweathermap.org/data/2.5"
        static let weather = "weather"
    }
    
    struct ParameterKey {
        static let q = "q"
        static let apiKey = "apiKey"
    }
    
    static let API_KEY = "72c165523c0e72840087f75a65b4cb65"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum StatusCode: Int {
    case ok = 200
    case notFound = 404
}

struct Strings {
    static let APP_NAME = "WeatherApp"
    static let STR_OK = "OK"
    static let STR_API_ERROR = "Failed connect to server, please check internet"
    static let connectionError = "Connection failed, please check internet"
    static let dialogError = "Oooppss"
    static let formError = "Please fill the form"
}

struct SegueID {
    static let weatherSegue = "segueToWeather"
}

struct StoryboardID {
    static let mainStoryboard = "MainStoryboard"
    static let weatherStoryboard = "WeatherStoryboard"
}

struct StoryboardName {
    static let main = "Main"
    static let weather = "Weather"
}
