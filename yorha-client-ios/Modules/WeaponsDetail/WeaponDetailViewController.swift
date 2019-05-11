//
//  WeaponDetailViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import AlamofireImage

class WeaponDetailViewController: UIViewController {
    
    var presenter: WeaponDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ability: UILabel!
    @IBOutlet weak var minAttack: UILabel!
    @IBOutlet weak var maxAttack: UILabel!
    
}

extension WeaponDetailViewController: WeaponDetailViewProtocol {
    func showDetail(data: Weapon) {
        name?.text = data.Name
        ability?.text = data.Ability
        minAttack?.text = "\(data.MinAttack)"
        maxAttack?.text = "\(data.MaxAttack)"
        let placeholderImage = UIImage(named: "placeholder")!
        photo?.af_setImage(withURL: URL(string: data.Photo)!, placeholderImage: placeholderImage)
    }
}
