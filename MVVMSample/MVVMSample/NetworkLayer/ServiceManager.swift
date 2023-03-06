//
//  ServiceManager.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

import Foundation
import Combine

class ServiceManager {
    private let networkService: NetworkServiceTypes
    
    init(networkService: NetworkServiceTypes =  NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchData<T: Decodable>(with resource: Resource<T>) async throws -> T {
        return try await networkService.load(resource)
    }
}
