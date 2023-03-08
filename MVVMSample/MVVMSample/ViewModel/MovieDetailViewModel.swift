//
//  MovieDetailViewModel.swift
//  MVVMSample
//
//  Created by Khan on 08/03/2023.
//

import Foundation
import Combine
import UIKit
class MovieDetailViewModel : ObservableObject {
     var movie: Movie?
    private var cancellables = Set<AnyCancellable>()
    private let myDataSubject = PassthroughSubject<Movie?, Never>()
    private var imageTask: Task<UIImage, Error>?
    var myDataPublisher: AnyPublisher<Movie?, Never> {
        myDataSubject.eraseToAnyPublisher()
    }
    private let movieUsecasetype: MovieUsecaseType
    init(movieUsecasetype: MovieUsecaseType =  MovieUseCase()) {
       
        self.movieUsecasetype = movieUsecasetype
    }
    func fetchMovieDetail(id: Int ) async throws {
//        guard let movieId = self.movie?.id else {
//            return
//        }
        self.movie =  try! await movieUsecasetype.fetchMovieDetails(with: id)
    }
    
    func downloadImage() async throws -> UIImage {
        guard let moviedata = self.movie else {
            return UIImage()
        }
        return try! await movieUsecasetype.loadImage(from: moviedata)
    }
    func observeMyData() {
        myDataPublisher
            .sink { [unowned self] movie in
                self.movie = movie
            }
            .store(in: &cancellables)
    }
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}

