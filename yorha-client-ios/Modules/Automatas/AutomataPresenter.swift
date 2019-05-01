//
//  AutomataPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataPresenter: AutomataPresenterProtocol {

    weak private var view: AutomataViewProtocol?
    var interactor: AutomataInteractorProtocol?
    private let router: AutomataWireframeProtocol

    init(interface: AutomataViewProtocol, interactor: AutomataInteractorProtocol?, router: AutomataWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
