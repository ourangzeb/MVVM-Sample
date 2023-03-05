//
//  MovieUseCases.swift
//  MVVMSample
//
//  Created by Khan on 05/03/2023.
//

import Foundation
import Combine
//import UIK
//import Network
//public protocol AutoMockable {}
//
//protocol MovieUseCaseType: AutoMockable {
//    
//    
//    func searchMovies(with name:String) -> AnyPublisher<Result<Movies, Error> , Never> 
//    
//    
//}
//final class MovieUseCase: MovieUseCaseType {
//    
//    private let networkservice = NetworkServiceTypes.self
//    
//    init(networkservice: NetworkServiceTypes){
//        networkservice = networkservice
//    }
//    
//    
//    func searchMovies(with name:String) -> AnyPublisher<Result<Movies, Error> , Never> {
//        return networkservice
//            .load(Resource<Movies>.movies(query: name))
//            .map{ .success($0) }
//            .catch { error -> AnyPublisher<Result<Movies, Error>, Never> in
//                .just(.failure(error))
//                
//            }
//            .eraseToAnyPublisher()
//    }
//    
//}
