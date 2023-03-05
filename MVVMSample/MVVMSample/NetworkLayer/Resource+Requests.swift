//
//  Resource.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation
import Combine
import Network

public struct ApiConstants {
    static let apiKey = "181af7fcab50e40fabe2d10cc8b90e37"
    static let baseUrl = URL(string: "api.themoviedb.org/3")!
    static let originalImageUrl = URL(string: "https://image.tmdb.org/t/p/original")!
    static let smallImageUrl = URL(string: "https://image.tmdb.org/t/p/w154")!
}

extension Resource {

    static func movies(query: String) -> Resource<Movies> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/search/movie")
        let parameters: [String : CustomStringConvertible] = [
            "api_key": ApiConstants.apiKey,
            "query": query,
            "language": Locale.preferredLanguages[0]
            ]
        return Resource<Movies>.init(url: url, parameters: parameters, httpMethod: .get)
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
