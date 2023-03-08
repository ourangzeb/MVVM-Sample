//
//  ViewController.swift
//  MVVMSample
//
//  Created by Khan on 02/03/2023.
//

import UIKit
import Combine
class MainViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = MovieViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchbar.delegate = self
                
    }
    private func loadData(name: String) {
            Task {

                try await viewModel.fetchData(name:name)
                viewModel.observeMyData()
                self.tableView.reloadData()
            }
        }
}

extension MainViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = self.viewModel.movies?.items[indexPath.row]
//        let viewmodels = MovieDetailViewModel()
        
        
//        let movie = viewModel.fetchMovieid(index: indexPath.row)
    }
    
}
extension MainViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.configureImage(movie: (viewModel.movies?.items[indexPath.row])!, viewmodel: viewModel)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = viewModel.movies else {
            return 0
        }
                
        return data.items.count
    }
    
  
}


extension MainViewController: UISearchBarDelegate {
    
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 5 {
            self.loadData(name: searchText)
        }
    }
    
    
    
    
}


extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailMovieViewController {
            let detailmovieModel = MovieDetailViewModel()
            detailmovieModel.movie = viewModel.fetchMovieid()
            destinationVC.viewModel = detailmovieModel
        }
    }
}

