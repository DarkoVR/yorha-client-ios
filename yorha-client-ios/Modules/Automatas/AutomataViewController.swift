//
//  AutomataViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataViewController: UITableViewController, AutomataViewProtocol {
    
    var presenter: AutomataPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        print("refreshing done!")
        sender.endRefreshing()
    }
    
}
