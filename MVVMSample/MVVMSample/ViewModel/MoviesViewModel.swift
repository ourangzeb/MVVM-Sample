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
     var movies: MoviesList?
    private let movieUsecasetype: MovieUsecaseType
    var selectedIndex : Int = 0
     var cancellables = Set<AnyCancellable>()
    private let dataSubject = PassthroughSubject<MoviesList?, Never>()
    
    var dataPublisher: AnyPublisher<MoviesList?, Never> {
        dataSubject.eraseToAnyPublisher()
    }
    
    
    
    
    
    
    
    func fetchMovieid() -> Movie? {
        
        guard let movie = self.movies?.items[self.selectedIndex] else {
            return nil
        }
        return movie
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
        dataPublisher
            .sink { [unowned self] movies in
                self.movies = movies
            }
            .store(in: &cancellables)
    }
    
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
}

