//
//  weatherappUITests.swift
//  weatherappUITests
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import XCTest

class weatherappUITests: XCTestCase {
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app =  XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDisplayMain() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingMain)
        
        let btnSearch = app.buttons["searchButton"]
        let txtCity = app.textFields["cityText"]
        
        XCTAssertTrue(btnSearch.exists, "The button search exists")
        XCTAssertTrue(txtCity.exists, "The text field city exists")
    }
    
    func testDisplayWeather() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingMain)
        
        let btnSearch = app.buttons["searchButton"]
        let txtCity = app.textFields["cityText"]
        
        XCTAssertTrue(btnSearch.exists, "The button search exists")
        XCTAssertTrue(txtCity.exists, "The text field city exists")
        
        txtCity.tap()
        txtCity.typeText("Jakarta")
        
        XCTAssertEqual(txtCity.value as! String, "Jakarta")
        
        btnSearch.tap()
        
        XCTAssertTrue(app.isDisplayingWeather)
    }
    
}
