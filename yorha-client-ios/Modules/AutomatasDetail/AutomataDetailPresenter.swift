//
//  AutomataDetailPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/6/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataDetailPresenter: AutomataDetailPresenterProtocol {
    
    weak internal var view: AutomataDetailViewProtocol?
    var router: AutomataDetailWireframeProtocol?
    var data: Automata?

    init(interface: AutomataDetailViewProtocol, router: AutomataDetailWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showDetail(data: data!)
    }

}
