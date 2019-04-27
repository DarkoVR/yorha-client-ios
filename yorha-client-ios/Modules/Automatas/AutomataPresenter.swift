//
//  AutomataPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/27/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataPresenter: AutomataPresenterProtocol, AutomataInteractorOutputProtocol {

    weak private var view: AutomataViewProtocol?
    var interactor: AutomataInteractorInputProtocol?
    private let router: AutomataWireframeProtocol

    init(interface: AutomataViewProtocol, interactor: AutomataInteractorInputProtocol?, router: AutomataWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
