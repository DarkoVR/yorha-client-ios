//
//  WeaponPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/26/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponPresenter: WeaponPresenterProtocol, WeaponInteractorOutputProtocol {

    weak private var view: WeaponViewProtocol?
    var interactor: WeaponInteractorInputProtocol?
    private let router: WeaponWireframeProtocol

    init(interface: WeaponViewProtocol, interactor: WeaponInteractorInputProtocol?, router: WeaponWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
