//
//  weatherappTests.swift
//  weatherappTests
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import XCTest
import Alamofire
@testable import weatherapp

class weatherappTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testWeatherApi() {
        let e = expectation(description: "Alamofire")
        let urlString = "https://api.openweathermap.org/data/2.5/weather?apiKey=72c165523c0e72840087f75a65b4cb65&q=Jakarta"
        
        Alamofire.request(urlString)
            .response { response in
                XCTAssertNil(response.error, "Whoops, error \(response.error!.localizedDescription)")
                
                XCTAssertNotNil(response, "No response")
                XCTAssertEqual(response.response?.statusCode ?? 0, 200, "Status code not 200")
                
                e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
