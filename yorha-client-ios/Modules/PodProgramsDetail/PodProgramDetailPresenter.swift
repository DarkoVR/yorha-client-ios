//
//  PodProgramDetailPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramDetailPresenter: PodProgramDetailPresenterProtocol {
    
    weak internal var view: PodProgramDetailViewProtocol?
    var router: PodProgramDetailRouterProtocol?
    var data: PodProgram?
    
    init(interface: PodProgramDetailViewProtocol, router: PodProgramDetailRouterProtocol) {
        self.view = interface
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showDetail(data: data!)
    }
}
