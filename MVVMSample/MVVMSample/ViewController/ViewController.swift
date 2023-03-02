//
//  ViewController.swift
//  MVVMSample
//
//  Created by Khan on 02/03/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }


}

extension MainViewController:UITableViewDelegate {
    
}
extension MainViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        cell.titleLabel.text = "sdfsdf"
        return cell
    }
    
    numberof
}
