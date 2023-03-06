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
        
                loadData()
    }
    private func loadData() {
            Task {

                await viewModel.fetchData()
                viewModel.observeMyData()
                self.tableView.reloadData()
            }
        }
}

extension MainViewController:UITableViewDelegate {
    
}
extension MainViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.titleLabels.text = "sdfsdf"
        guard let dataitem = viewModel.myData?.items[indexPath.row] else {
            return cell
        }
        cell.titleLabels.text = dataitem.title
        cell.releaseDateLabel.text = dataitem.releaseDate
    
        
//        cell.titleLabels.text = "sdfsdf"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = viewModel.myData else {
            return 4
        }
                
        return data.items.count
    }
    
  
}
