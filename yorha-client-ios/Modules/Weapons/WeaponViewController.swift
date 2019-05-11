//
//  WeaponViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import AlamofireImage

class WeaponViewController: UITableViewController {
    
    var presenter: WeaponPresenterProtocol?
    var dataList: [Weapon] = []
    
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

extension WeaponViewController: WeaponViewProtocol {
    func showData(with data: [Weapon]){
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

extension WeaponViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeaponCell", for: indexPath) as! WeaponCell
        let Weapons = dataList[indexPath.row]
        cell.name.text = Weapons.Name
        cell.ability.text = Weapons.Ability
        let placeholderImage = UIImage(named: "placeholder")!
        cell.photo?.af_setImage(withURL: URL(string: Weapons.Photo)!, placeholderImage: placeholderImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailScreen(data: dataList[indexPath.row])
    }
}

class WeaponCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ability: UILabel!
}
