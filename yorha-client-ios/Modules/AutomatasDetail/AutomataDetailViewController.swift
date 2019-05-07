//
//  AutomataDetailViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/6/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import AlamofireImage

class AutomataDetailViewController: UIViewController {

	var presenter: AutomataDetailPresenterProtocol?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var race: UILabel!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}

extension AutomataDetailViewController: AutomataDetailViewProtocol {
    func showDetail(data: Automata) {
        name?.text = data.Name
        occupation?.text = data.Occupation
        race?.text = data.Race.Name
        let placeholderImage = UIImage(named: "placeholder")!
        imageView?.af_setImage(withURL: URL(string: data.Photo)!, placeholderImage: placeholderImage)
    }
}
