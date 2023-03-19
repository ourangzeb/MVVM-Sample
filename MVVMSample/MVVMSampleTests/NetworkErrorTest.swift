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
    
    func testInvalidRequest() {
        let error = NetworkError.invalidRequest
        XCTAssertEqual(error.localizedDescription, "The request is invalid.")
    }
    
    func testInvalidData() {
        let error = NetworkError.invalidData
        XCTAssertEqual(error.localizedDescription, "The data is invalid.")
    }
    
    func testInvalidResponse() {
        let error = NetworkError.invalidResponse
        XCTAssertEqual(error.localizedDescription, "The response is invalid.")
    }
    
//    func testURLError() {
//            let urlError = URLError(.notConnectedToInternet)
//            let error = NetworkError.urlError(urlError)
//            XCTAssertEqual(error.localizedDescription, "The Internet connection appears to be offline.")
//        }
}
