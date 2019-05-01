//
//  BossPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossPresenter: BossPresenterProtocol {

    weak private var view: BossViewProtocol?
    var interactor: BossInteractorProtocol?
    private let router: BossWireframeProtocol

    init(interface: BossViewProtocol, interactor: BossInteractorProtocol?, router: BossWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
