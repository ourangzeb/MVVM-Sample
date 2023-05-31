//
//  MVVMSampleTests.swift
//  MVVMSampleTests
//
//  Created by Khan on 02/03/2023.
//

import XCTest
@testable import MVVMSample
class ApiConstantsTests: XCTestCase {
    
    func testApiKey() {
        XCTAssertEqual(ApiConstants.apiKey, "181af7fcab50e40fabe2d10cc8b90e37", "The API key should match the expected value")
    }
    
    func testBaseUrl() {
        XCTAssertEqual(ApiConstants.baseUrl, URL(string: "https://api.themoviedb.org/3")!, "The base URL should match the expected value")
    }
    
    func testOriginalImageUrl() {
        XCTAssertEqual(ApiConstants.originalImageUrl, URL(string: "https://image.tmdb.org/t/p/original")!, "The original image URL should match the expected value")
    }
    
    func testSmallImageUrl() {
        XCTAssertEqual(ApiConstants.smallImageUrl, URL(string: "https://image.tmdb.org/t/p/w154")!, "The small image URL should match the expected value")
    }
    
}


//
//class MVVMSampleTests: XCTestCase {
//    XCTAssertEqual
//    override func setUpWithError() throws {
//        XCTAssertEqual(resource.request?.httpBody, "id=123&name=John%20Doe".data(using: .utf8))
//
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

//}
