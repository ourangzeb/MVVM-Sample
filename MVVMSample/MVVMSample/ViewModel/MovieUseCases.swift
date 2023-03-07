//
//  MovieUseCases.swift
//  MVVMSample
//
//  Created by Khan on 05/03/2023.
//

import Foundation
import Combine
import UIKit

protocol MovieUsecaseType {
    func fetchData  (with name: String)  async throws -> Movies
    func loadImage(from movie: Movie) async throws -> UIImage
}


final class MovieUseCase : MovieUsecaseType{
    private let networkService: NetworkServiceTypes
        private let imageDownloadService: ImagedownloadServiceType
    init(networkService: NetworkServiceTypes = NetworkService(),
             imageDownloadService: ImagedownloadServiceType = ImagedownloadService()) {
            self.networkService = networkService
            self.imageDownloadService = imageDownloadService
        }
    func fetchData (with name: String)  async throws -> Movies {
        return try await self.networkService.load(Resource<Movies>.movies(query: name))
    }
    
    func loadImage(from movie: Movie) async throws -> UIImage {
            guard let poster = movie.poster else { return UIImage() }
            let urls = ImageSize.small.url.appendingPathComponent(poster)
                let image = try await imageDownloadService.downloadImage(from: urls)
                return image
    }
    
    
}
