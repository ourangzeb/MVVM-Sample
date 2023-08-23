
//  NetworkRequestsTest.swift
//  MVVMSampleTests
//
//  Created by Khan on 11/04/2023.
//

import XCTest

@testable import MVVMSample
class NetworkRequestsTest: XCTestCase {
    
    func testGetRequest() {
        let url = URL(string: "https://api.themoviedb.org")!
        let parameters = ["foo": "bar", "baz": "qux"]
        let resource = Resource<String>(url: url, parameters: parameters)
        let request = resource.request
        XCTAssertNotNil(request)
        XCTAssertNotNil(request)
//        XCTAssertEqual(request?.url, resource.url)
//        XCTAssertEqual(request?.httpMethod, "POST")
       
//        XCTAssertEqual(request?.httpBody, "foo=bar&baz=qux".data(using: .utf8))


       
    }
    
    func testPostRequest() {
        let url = URL(string: "https://example.com")!
        let parameters = ["foo": "bar", "baz": "qux"]
        let resource = Resource<String>(url: url, parameters: parameters, httpMethod: .post)
        let request = resource.request
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url, resource.url)
        XCTAssertEqual(request?.httpMethod, "POST")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Content-Type"), "application/x-www-form-urlencoded")
//        XCTAssertEqual(request?.httpBody, "foo=bar&baz=qux".data(using: .utf8))
    }
 
}
