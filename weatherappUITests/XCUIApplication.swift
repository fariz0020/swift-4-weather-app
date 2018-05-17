//
//  XCUIApplication.swift
//  weatherappUITests
//
//  Created by Wonderlabs on 5/17/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import XCTest

extension XCUIApplication {
    var isDisplayingMain: Bool {
        return otherElements["mainView"].exists
    }
    var isDisplayingWeather: Bool {
        return otherElements["weatherView"].exists
    }
}
