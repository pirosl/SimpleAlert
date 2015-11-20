//
//  SimpleAlertTests.swift
//  SimpleAlertTests
//
//  Created by TCASSEMBLER on 08/11/2015.
//  Copyright © 2015 TCASSEMBLER. All rights reserved.
//

import XCTest
@testable import SimpleAlert

class SimpleAlertTests: XCTestCase {
    
    // Application view controller
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        
        // Create the ViewController
        let storyboard = UIStoryboard(name: "Main",
            bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateInitialViewController() as! ViewController
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test initial state of the View controller
    // UIButton must be hidden
    // seconds must be set to 60
    // UILabel must be set to "60 seconds"
    func testInitialState() {
        let storyboard = UIStoryboard(name: "Main",
            bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateInitialViewController() as! ViewController
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
        
        // Check UIButton visibility
        XCTAssertEqual(true, viewController.restartButton.hidden)
        // Check seconds member variable
        XCTAssertEqual(60, viewController.seconds)
        // Check UILable text value
        XCTAssertEqual("60 seconds", viewController.timeLabel.text)
    }
    
    // Test if updateLable() updates correctly the label and seconds variable
    func testupdateLabelRandom() {
        // First take a random number between 1 and 60
        let seconds = Int(arc4random_uniform(60) + 1)
        viewController.seconds = seconds
        // Call updateLabel method
        viewController.updateLabel()
        // Check UILable text value
        if seconds > 2 {
            XCTAssertEqual("\(seconds-1) seconds", viewController.timeLabel.text)
        }
        else {
            XCTAssertEqual("\(seconds-1) second", viewController.timeLabel.text)
        }
        
        // Check seconds value
        XCTAssertEqual(seconds-1, viewController.seconds)
        // Make sure as well UIButton is hidden as timer is counting down
        XCTAssertEqual(true, viewController.restartButton.hidden)
    }
    
    // Test if updateLable() updates correctly the label and seconds variable at the end of countdown
    func testupdateLabelZero() {
        // First set seconds to 1
        let seconds = 1
        viewController.seconds = seconds
        // Call updateLabel method
        viewController.updateLabel()
        // Check UILable text value
        XCTAssertEqual("", viewController.timeLabel.text)
        
        // Check seconds value
        XCTAssertEqual(0, viewController.seconds)
        // Make sure as well UIButton is still hidden
        XCTAssertEqual(true, viewController.restartButton.hidden)
    }
    
}
