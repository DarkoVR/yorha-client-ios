//
//  PodProgramPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramPresenter: PodProgramPresenterProtocol {

    weak private var view: PodProgramViewProtocol?
    var interactor: PodProgramInteractorProtocol?
    private let router: PodProgramWireframeProtocol

    init(interface: PodProgramViewProtocol, interactor: PodProgramInteractorProtocol?, router: PodProgramWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
