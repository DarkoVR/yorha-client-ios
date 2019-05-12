//
//  PodProgramViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import AlamofireImage

class PodProgramViewController: UITableViewController {
    
    var presenter: PodProgramPresenterProtocol?
    var dataList: [PodProgram] = []
    
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

extension PodProgramViewController: PodProgramViewProtocol {
    func showData(with data: [PodProgram]){
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

extension PodProgramViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodProgramCell", for: indexPath) as! PodProgramCell
        let PodPrograms = dataList[indexPath.row]
        cell.name.text = PodPrograms.Name
        cell.cooldown.text = "\(PodPrograms.Cooldown)"
        let placeholderImage = UIImage(named: "placeholder")!
        cell.photo?.af_setImage(withURL: URL(string: PodPrograms.Photo)!, placeholderImage: placeholderImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailScreen(data: dataList[indexPath.row])
    }
}

class PodProgramCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cooldown: UILabel!
    @IBOutlet weak var photo: UIImageView!
}
