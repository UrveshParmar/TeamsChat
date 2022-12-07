//
//  ViewController.swift
//  TeamsChat
//
//  Created by Ronak Sankhala on 07/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var dataViewModel = DataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel(){
        dataViewModel.reloadTableView = {
            DispatchQueue.main.async { /*self.tableView.reloadData()*/ }
        }
        dataViewModel.showError = {
            DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
        }
        dataViewModel.showLoading = {
            DispatchQueue.main.async { /*self.activityIndicator.startAnimating()*/ }
        }
        dataViewModel.hideLoading = {
            DispatchQueue.main.async { /*self.activityIndicator.stopAnimating()*/ }
        }
        dataViewModel.getData()
    }


}

