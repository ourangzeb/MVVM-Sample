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
     
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        networkService  = Network
        self.searchMovies(with: "name")
    }
        // Do any additional setup after loading the view.
    

func searchMovies(with name: String) -> AnyPublisher<Result<Movies, Error>, Never> {
    let networkService: NetworkServiceTypes
    networkService = NetworkService.init()
    return networkService.load(Resource<Movies>.movies(query: name)).map{
        .success($0)
    }.catch{error -> AnyPublisher<Result<Movies, Error>, Never> in .just(.failure(error))}.eraseToAnyPublisher()
//    return networkService
//        .load(Resource<Movies>.movies(query: name))
//        .map { .success($0)
////            print(<#T##Any...#>)
//        }
//        .catch { error -> AnyPublisher<Result<Movies, Error>, Never> in .just(.failure(error)) }
//        .subscribe(on: Scheduler.backgroundWorkScheduler)
//        .receive(on: Scheduler.mainScheduler)
//        .eraseToAnyPublisher()

}
}

extension MainViewController:UITableViewDelegate {
    
}
extension MainViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        cell.titleLabels.text = "sdfsdf"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
  
}
