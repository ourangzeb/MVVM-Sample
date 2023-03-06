//
//  MoviesViewModel.swift
//  MVVMSample
//
//  Created by Khan on 05/03/2023.
//

import Foundation
import Combine

class MoviesViewModel {
    
    
    
    private let networkService: NetworkService
        private var cancellables = Set<AnyCancellable>()
        
        var myData: Movies? {
            didSet {
                myDataSubject.send(myData)
            }
        }
    private let myDataSubject = PassthroughSubject<Movies?, Never>()
        var myDataPublisher: AnyPublisher<Movies?, Never> {
            myDataSubject.eraseToAnyPublisher()
        }
    init(networkService: NetworkService = NetworkService()) {
            self.networkService = networkService
        }
        
        func fetchData() async {
            do {
                let resource = Resource<Movies>.movies(query: "name")
                let data = try await networkService.load(resource)
                self.myData = data
            } catch {
                // Handle error here
            }
        }
        
        func observeMyData() {
            myDataPublisher
                .sink { [weak self] myData in
                    // Update UI here
                    self?.myData = myData
                }
                .store(in: &cancellables)
        }
        
        deinit {
            cancellables.forEach { $0.cancel() }
        }
}
