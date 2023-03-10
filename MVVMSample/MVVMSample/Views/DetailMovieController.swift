//
//  DetailMovieController.swift
//  MVVMSample
//
//  Created by Khan on 08/03/2023.
//

import UIKit



class DetailMovieViewController:UIViewController {    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var moviedetailLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    var viewModel  : MovieDetailViewModel?
    private var imageTask: Task<UIImage, Error>?
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = MovieDetailViewModel()
        super.init(coder: aDecoder)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
    }
    private func loadData() {
        Task {
            guard let movieId = self.viewModel?.movie?.id else {
                return
            }
                    try await viewModel?.fetchMovieDetail(id: movieId)
            viewModel?.observeMyData()
            self.configureImage()
            
        }
    }
    func configureImage() {
        guard let movieData = self.viewModel?.movie else {
            return
        }
        imageTask = Task {
            do {
                let image = try await viewModel?.downloadImage()
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
        DispatchQueue.main.async {
            self.movieTitleLabel.text = movieData.title
            self.moviedetailLabel.text = movieData.overview
            self.moviedetailLabel.numberOfLines = 5
            self.releaseDateLabel.text = movieData.releaseDate
            self.movieRatingLabel.text = String(movieData.voteAverage)
        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    deinit {
        imageTask?.cancel()
    }
    
    
}
