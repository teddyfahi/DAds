//
//  DAdsUITests.swift
//  DAdsUITests
//
//  Created by Teddy Falsen Hiis on 26/03/2023.
//

import XCTest

final class DAdsUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testLaunch() throws {
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testFavoriteTap() throws {
        let favorite = app.images["heart"]
        XCTAssertTrue(favorite.exists)
        favorite.tap()
    }
}
