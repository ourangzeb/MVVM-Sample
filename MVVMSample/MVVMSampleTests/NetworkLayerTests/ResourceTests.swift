//
//  ResourceTests.swift
//  MVVMSampleTests
//
//  Created by Khan on 14/03/2023.
//

import XCTest

@testable import MVVMSample
class ResourceTests: XCTestCase {
    
    func testGetRequestWithParams() {
        let url = URL(string: "https://api.themoviedb.org/3")!
        let resource = Resource<Movie>(url: url, parameters: [
            "api_key": "181af7fcab50e40fabe2d10cc8b90e37",
            "language": Locale.preferredLanguages[0]
            ])
        let request = resource.request
        
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.absoluteString, "https://api.themoviedb.org/3?language=en&api_key=181af7fcab50e40fabe2d10cc8b90e37")
        XCTAssertNil(request?.httpBody)
    }
    
    
//
    
}

//final class ResourceTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}

