//
//  Api.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Alamofire

struct ApiImage {
    static func performRequest<T: BaseImageResponse>( route: ApiImageRouter, completion: @escaping (ApiImageResult<T>) -> Void) {
        Alamofire.request(route).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                do {
                    let data = response.data
                    
                    let apiResponse = try JSONDecoder().decode(T.self, from: data!)
                    
                    if apiResponse.totalHits! > 0 {
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
    
    static func fetchImages(q: String, completion: @escaping (ApiImageResult<ImageResponse>) -> Void) {
        performRequest(route: ApiImageRouter.image(q: q), completion: completion)
    }
}

public enum ApiImageResult<Value> {
    case success(Value)
    case failure(String)
}

