//
//  TableViewCell.swift
//  MVVMSample
//
//  Created by Khan on 02/03/2023.
//

import Foundation
import UIKit


class TableViewCell: UITableViewCell{
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabels: UILabel!
    
    private var imageTask: Task<UIImage, Error>?
    func configureImage(movie: Movie, viewmodel: MovieViewModel) {

        
        imageTask = Task {
            do {
                let image = try await viewmodel.downloadImage(movie: movie)
                DispatchQueue.main.async {
                    self.movieImageView.image = image
                }
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
            return {
                UIImage()
            }()
        }
        self.titleLabels.text = movie.title
        self.releaseDateLabel.text = movie.releaseDate
        
    }
}
