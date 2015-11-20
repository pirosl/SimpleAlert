//
//  SimpleAlertUITests.swift
//  SimpleAlertUITests
//
//  Created by TCASSEMBLER on 08/11/2015.
//  Copyright © 2015 TCASSEMBLER. All rights reserved.
//

import XCTest

class SimpleAlertUITests: XCTestCase {
    
    // SimpleAlert application
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // Launch application
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test initial state of the View controller
    // UIButton must be hidden
    // UILabel must be set to "60 seconds"
    func testInitialState() {
        // Check UIButton visibility
        XCTAssertEqual(false, app.buttons["restartButton"].hittable)
        // Check UILable value
        XCTAssertEqual("60 seconds", app.staticTexts["counterLabel"].label)
        // Check there is no Alert
        XCTAssertEqual(false, app.alerts["Alert"].exists)
    }
    
    // Test UI after the countdown
    // UIButton must be hidden
    // UILabel must be set to ""
    // there must be an alert
    func testCountDownState() {
        // Wait 90 seconds - after 60 seconds the alert should appear
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 90))
        // Check UIButton visibility
        XCTAssertEqual(false, app.buttons["restartButton"].hittable)
        // Check UILable value
        XCTAssertEqual("", app.staticTexts["counterLabel"].label)
        // Check there is Alert
        XCTAssertEqual(true, app.alerts["Alert"].exists)
    }
    
    // Test UI Alert Cancel button was pressed
    // UIButton must be shown
    // UILabel must be set to ""
    // there must be no alert
    func testAlertCancelButtonPressed() {
        // Wait 90 seconds - after 60 seconds the alert should appear
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 90))
        // tap Cancel button
        app.alerts["Alert"].collectionViews.buttons["Cancel"].tap()
        
        // Check UIButton visibility
        XCTAssertEqual(true, app.buttons["restartButton"].hittable)
        // Check UILable value
        XCTAssertEqual("", app.staticTexts["counterLabel"].label)
        // Check there is Alert
        XCTAssertEqual(false, app.alerts["Alert"].exists)
    }
    
    // Test UI Alert Enter License button was pressed
    // UIButton must be hidden
    // UILabel must be set to ""
    // there must be no alert
    func testAlertEnterLicenseButtonPressed() {
        // Wait 90 seconds - after 60 seconds the alert should appear
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 90))
        // tap Cancel button
        app.alerts["Alert"].collectionViews.buttons["Enter License"].tap()
        
        // Check UIButton visibility
        XCTAssertEqual(false, app.buttons["restartButton"].hittable)
        // Check UILable value
        XCTAssertEqual("", app.staticTexts["counterLabel"].label)
        // Check there is Alert
        XCTAssertEqual(false, app.alerts["Alert"].exists)
    }
    
}
