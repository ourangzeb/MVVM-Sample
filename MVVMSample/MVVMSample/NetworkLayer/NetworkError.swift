//
//  NetworkError.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation
enum NetworkError: Error {
case invalidRequest
case invalidData
case invalidResponse
case urlError(URLError)
}

