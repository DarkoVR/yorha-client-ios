//
//  BossPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/27/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossPresenter: BossPresenterProtocol, BossInteractorOutputProtocol {

    weak private var view: BossViewProtocol?
    var interactor: BossInteractorInputProtocol?
    private let router: BossWireframeProtocol

    init(interface: BossViewProtocol, interactor: BossInteractorInputProtocol?, router: BossWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
