//
//  WeaponPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponPresenter: WeaponPresenterProtocol {

    weak private var view: WeaponViewProtocol?
    var interactor: WeaponInteractorProtocol?
    private let router: WeaponWireframeProtocol

    init(interface: WeaponViewProtocol, interactor: WeaponInteractorProtocol?, router: WeaponWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
