//
//  RequestManager.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

import Combine

protocol NetworkServiceTypes: AnyObject {

    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error>
}
class NetworkService: NetworkServiceTypes {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }
    @discardableResult
    func load<T:Decodable> (_ resource: Resource<T>) -> AnyPublisher<T, Error> {
        
        guard let request = resource.request else {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.invalidRequest }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
                }
                
                guard 200..<300 ~= response.statusCode else {
                    return Fail(error: NetworkError.invalidData).eraseToAnyPublisher()
                }
                return .just(data)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
}

