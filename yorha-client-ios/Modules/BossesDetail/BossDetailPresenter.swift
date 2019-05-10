//
//  BossDetailPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossDetailPresenter: BossDetailPresenterProtocol {
    
    weak internal var view: BossDetailViewProtocol?
    var router: BossDetailRouterProtocol?
    var data: Boss?
    
    init(interface: BossDetailViewProtocol, router: BossDetailRouterProtocol) {
        self.view = interface
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showDetail(data: data!)
    }
}
