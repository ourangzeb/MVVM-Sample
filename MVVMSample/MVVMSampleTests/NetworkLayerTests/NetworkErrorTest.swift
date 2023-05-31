//
//  NetworkErrorTest.swift
//  MVVMSampleTests
//
//  Created by Khan on 10/03/2023.
//

import Foundation
@testable import MVVMSample
import XCTest

class NetworkErrorTests: XCTestCase {

    func testLocalizedDescriptionInvalidRequest() {
        let networkError = NetworkError.invalidRequest
        XCTAssertEqual(networkError.localizedDescription, "The request is invalid.")
    }
    
    func testLocalizedDescriptionInvalidData() {
        let networkError = NetworkError.invalidData
        XCTAssertEqual(networkError.localizedDescription, "The data is invalid.")
    }
    
    func testLocalizedDescriptionInvalidResponse() {
        let networkError = NetworkError.invalidResponse
        XCTAssertEqual(networkError.localizedDescription, "The response is invalid.")
    }
    
    func testLocalizedDescriptionUrlError() {
        let error = NSError(domain: "TestDomain", code: 123, userInfo: [NSLocalizedDescriptionKey: "Test Error"])
        let networkError = NetworkError.urlError(error)
        XCTAssertEqual(networkError.localizedDescription, "Test Error")
    }
}
