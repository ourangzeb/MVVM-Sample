//
//  Resource.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation
import Combine
import Network


extension Resource {

    static func movies(query: String) -> Resource<MoviesList> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/search/movie")
        let parameters: [String : CustomStringConvertible] = [
            "api_key": ApiConstants.apiKey,
            "query": query,
            "language": Locale.preferredLanguages[0]
            ]
        return Resource<MoviesList>.init(url: url, parameters: parameters, httpMethod: .get)
    }

    static func details(movieId: Int) -> Resource<Movie> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/movie/\(movieId)")
        let parameters: [String : CustomStringConvertible] = [
            "api_key": ApiConstants.apiKey,
            "language": Locale.preferredLanguages[0]
            ]
        return Resource<Movie>(url: url, parameters: parameters, httpMethod: .get)
    }
}

