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
    
    func fetchData<T: Decodable>(with resource: Resource<T>) -> AnyPublisher<T, Error> {
        return networkService.load(resource)
    }
}
