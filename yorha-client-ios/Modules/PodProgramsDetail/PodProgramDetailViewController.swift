//
//  PodProgramDetailViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import AlamofireImage

class PodProgramDetailViewController: UIViewController {
    
    var presenter: PodProgramDetailPresenterProtocol?
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var program: UILabel!
    @IBOutlet weak var cooldown: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension PodProgramDetailViewController: PodProgramDetailViewProtocol {
    func showDetail(data: PodProgram) {
        name?.text = data.Name
        program?.text = data.Program
        cooldown?.text = "\(data.Cooldown)"
        let placeholderImage = UIImage(named: "placeholder")!
        photo?.af_setImage(withURL: URL(string: data.Photo)!, placeholderImage: placeholderImage)
    }
}
