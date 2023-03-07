//
//  MoviesViewModel.swift
//  MVVMSample
//
//  Created by Khan on 05/03/2023.
//

import Foundation
import Combine
import UIKit

class MovieViewModel : ObservableObject {
     var movies: Movies?
    private let movieUsecasetype: MovieUsecaseType
    
    private var cancellables = Set<AnyCancellable>()
    private let myDataSubject = PassthroughSubject<Movies?, Never>()
    var myDataPublisher: AnyPublisher<Movies?, Never> {
        myDataSubject.eraseToAnyPublisher()
    }
    
    init(movieUsecasetype: MovieUsecaseType =  MovieUseCase()) {
       
        self.movieUsecasetype = movieUsecasetype
    }
    
    func fetchData(name : String) async throws {
        self.movies =  try! await movieUsecasetype.fetchData(with: name)
    }
    
    func downloadImage(movie: Movie) async throws -> UIImage {
        try! await movieUsecasetype.loadImage(from: movie)
    }
    
    
    func observeMyData() {
        myDataPublisher
            .sink { [unowned self] movies in
                self.movies = movies
            }
            .store(in: &cancellables)
    }
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    
    
    
    
    
}
//class MoviesViewModel {
//    
//    
//    
//    private let networkService: NetworkService
//    private let downloadService: ImagedownloadServiceType
//
//        private var cancellables = Set<AnyCancellable>()
//        var myData: Movies?
//        private let myDataSubject = PassthroughSubject<Movies?, Never>()
//        var myDataPublisher: AnyPublisher<Movies?, Never> {
//            myDataSubject.eraseToAnyPublisher()
//        }
//    init(networkService: NetworkService = NetworkService(), downloadService: ImagedownloadServiceType = ImagedownloadService()) {
//            self.networkService = networkService
//        self.downloadService = downloadService
//        }
//    func loadImage(from movie: Movie) async throws -> UIImage {
//        guard let poster = movie.poster else { return UIImage() }
//        let urls = ImageSize.small.url.appendingPathComponent(poster)
//            let image = try await downloadService.downloadImage(from: urls)
//            return image
//        }
//    
//    func fetchData(with name: String) async {
//            do {
//                let resource = Resource<Movies>.movies(query: name)
//                let data = try await networkService.load(resource)
//                self.myData = data
//            } catch {
//            }
//        }
//        
//        func observeMyData() {
//            myDataPublisher
//                .sink { [unowned self] myData in
//                    self.myData = myData
//                }
//                .store(in: &cancellables)
//        }
//        deinit {
//            cancellables.forEach { $0.cancel() }
//        }
//}
//class MoviesViewModel {
//
//
//
//
//}
