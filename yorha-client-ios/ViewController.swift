//
//  ViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func refresh(_ sender: UIRefreshControl) {
        print("refreshing done!")
        sender.endRefreshing()
    }
    
}

