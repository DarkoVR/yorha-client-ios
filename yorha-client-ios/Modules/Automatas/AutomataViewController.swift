//
//  AutomataViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import AlamofireImage

class AutomataViewController: UITableViewController {
    
    var presenter: AutomataPresenterProtocol?
    var dataList: [Automata] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        print("refreshing done!")
        presenter?.viewDidRefresh()
        sender.endRefreshing()
    }
}

extension AutomataViewController: AutomataViewProtocol {
    func showData(with data: [Automata]){
        dataList = data
        reloadData(onTableViewController: self)
    }
    
    func showError(){
        alertMessage(onViewController: self, title: "Error", message: "Internet not connected")
    }
    
    func showLoading(){
        startLoading(onView: self.view)
    }
    
    func hideLoading(){
        stopLoading()
    }
    
    func isInternetConnected() -> Bool {
        return isConnectedToInternet()
    }
}

extension AutomataViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutomataCell", for: indexPath) as! AutomataCell
        let automatas = dataList[indexPath.row]
        cell.name.text = automatas.Name
        cell.occupation.text = automatas.Occupation
        let placeholderImage = UIImage(named: "placeholder")!
        cell.photo?.af_setImage(withURL: URL(string: automatas.Photo)!, placeholderImage: placeholderImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        alertMessage(onViewController: self, title: "\(indexPath.row)", message: "\(dataList[indexPath.row])")
    }
}

class AutomataCell: UITableViewCell {
    @IBOutlet var photo: UIImageView!
    @IBOutlet var occupation: UILabel!
    @IBOutlet var name: UILabel!
}
