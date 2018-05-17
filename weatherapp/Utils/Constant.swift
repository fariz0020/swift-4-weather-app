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
        static let baseIconUrl = "https://openweathermap.org/img/w/"
        static let baseImagesUrl = "https://pixabay.com/api"
        static let weather = "weather"
    }
    
    struct ParameterKey {
        static let q = "q"
        static let apiKey = "apiKey"
        static let units = "units"
        static let key = "key"
        static let image_type = "photo"
        static let orientation = "orientation"
        static let per_page = "per_page"
        static let mid_width = "min_width"
        static let min_height = "min_height"
    }
    
    struct WeatherParameterValue {
        static let API_KEY = "72c165523c0e72840087f75a65b4cb65"
        static let units = "metric"
    }
    
    struct ImagesParameterValue {
        static let API_KEY = "1144830-77ad7dc6e6eb55a3da4965a3c"
        static let IMAGE_TYPE = "photo"
        static let ORIENTATION = "vertical"
        static let PER_PAGE  = "3"
        static let MIN_WIDTH = "600"
        static let MIN_HEIGHT = "800"
    }
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
