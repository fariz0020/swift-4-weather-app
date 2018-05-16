//
//  ApiRouter.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case weather(city: String)
    
    private var method: HTTPMethod {
        switch self {
        case .weather:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .weather:
            return ApiConstant.EndPoint.weather
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .weather(let city):
            return [ApiConstant.ParameterKey.q: city, ApiConstant.ParameterKey.apiKey: ApiConstant.API_KEY]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ApiConstant.EndPoint.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                switch self {
                case .weather:
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                default:
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    break
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        print("API Call -> ", urlRequest.url?.absoluteString ?? "")
        
        return urlRequest
    }
    

}
