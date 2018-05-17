//
//  ApiResponse.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/17/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Foundation

public protocol BaseImageResponse: Decodable {
    var totalHits: Int? { get }
    var total:Int? { get }
}

struct ImageResponse: BaseImageResponse {
    var totalHits: Int?
    var total: Int?
    
    let hits: [Hits]?
}
