//
//  Api.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Alamofire

struct Api {
    static func performRequest<T: BaseResponse>( route: ApiRouter, completion: @escaping (ApiResult<T>) -> Void) {
        Alamofire.request(route).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                do {
                    let data = response.data
                    
                    let apiResponse = try JSONDecoder().decode(T.self, from: data!)
                    
                    if apiResponse.cod == 200 {
                        completion(.success(apiResponse))
                    }else{
                        let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data!)
                        if let message = errorResponse.message {
                            completion(.failure(message))
                        }
                    }
                } catch {
                    print("Error ", error)
                    completion(.failure(Strings.STR_API_ERROR))
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
                print(error)
                completion(.failure(Strings.connectionError))
            }
        })
    }
    
    static func fetchWeather(city: String, completion: @escaping (ApiResult<WeatherResponse>) -> Void) {
        performRequest(route: ApiRouter.weather(city: city), completion: completion)
    }
}

public enum ApiResult<Value> {
    case success(Value)
    case failure(String)
}
