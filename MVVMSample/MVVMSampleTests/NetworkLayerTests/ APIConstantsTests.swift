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

