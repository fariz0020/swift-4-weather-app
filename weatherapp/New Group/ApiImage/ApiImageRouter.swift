//
//  ApiRouter.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Alamofire

enum ApiImageRouter: URLRequestConvertible {
    
    case image(q: String)
    
    private var method: HTTPMethod {
        switch self {
        case .image:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .image:
            return ""
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .image(let q):
            return [ApiConstant.ParameterKey.q: q,
                    ApiConstant.ParameterKey.key: ApiConstant.ImagesParameterValue.API_KEY,
                    ApiConstant.ParameterKey.per_page: ApiConstant.ImagesParameterValue.PER_PAGE,
                    ApiConstant.ParameterKey.image_type: ApiConstant.ImagesParameterValue.IMAGE_TYPE,
                    ApiConstant.ParameterKey.mid_width: ApiConstant.ImagesParameterValue.MIN_WIDTH,
                    ApiConstant.ParameterKey.min_height: ApiConstant.ImagesParameterValue.MIN_HEIGHT,
                    ApiConstant.ParameterKey.orientation: ApiConstant.ImagesParameterValue.ORIENTATION]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ApiConstant.EndPoint.baseImagesUrl.asURL()
        
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
                case .image:
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

