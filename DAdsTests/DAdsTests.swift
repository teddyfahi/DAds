//
//  DAdsTests.swift
//  DAdsTests
//
//  Created by Teddy Falsen Hiis on 26/03/2023.
//

import XCTest

final class DAdsTests: XCTestCase {

    func testJsonUrlResponse() {
           let url = URL(string: "https://gist.githubusercontent.com/baldermork/6a1bcc8f429dcdb8f9196e917e5138bd/raw/discover.json")
           XCTAssertNotNil(url, "JSON url is not valid")
           
           let expectation = XCTestExpectation(description: "The url is valid and we have a successful response")
           
           URLSession.shared.dataTask(with: url!) { data, response, error in
               XCTAssertNil(error, "Error: \(error!.localizedDescription)")
               XCTAssertNotNil(response, "Response is nil")
               XCTAssertTrue((response as! HTTPURLResponse).statusCode == 200, "Status code is not 200")
               expectation.fulfill()
           }.resume()
           
           wait(for: [expectation], timeout: 5.0)
       }

}
