//
//  BossDetailViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossDetailViewController: UIViewController {
    
    var presenter: BossDetailPresenterProtocol?
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var faction: UILabel!
    @IBOutlet weak var zones: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension BossDetailViewController: BossDetailViewProtocol {
    func showDetail(data: Boss) {
        name?.text = data.Name
        faction?.text = data.Faction
        zones?.text = "\(data.Zones)"
        let placeholderImage = UIImage(named: "placeholder")!
        photo?.af_setImage(withURL: URL(string: data.Photo)!, placeholderImage: placeholderImage)
    }
}
