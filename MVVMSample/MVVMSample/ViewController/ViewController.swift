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
    private let viewModel = MoviesViewModel()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchbar.delegate = self
                
    }
    private func loadData(name: String) {
            Task {

                await viewModel.fetchData(with:name)
                viewModel.observeMyData()
                self.tableView.reloadData()
            }
        }
}

extension MainViewController:UITableViewDelegate {
    
}
extension MainViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.configureImage(movie: (viewModel.myData?.items[indexPath.row])!, viewmodel: viewModel)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = viewModel.myData else {
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
