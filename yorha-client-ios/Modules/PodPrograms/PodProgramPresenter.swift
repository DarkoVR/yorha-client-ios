//
//  PodProgramPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/26/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramPresenter: PodProgramPresenterProtocol, PodProgramInteractorOutputProtocol {

    weak private var view: PodProgramViewProtocol?
    var interactor: PodProgramInteractorInputProtocol?
    private let router: PodProgramWireframeProtocol

    init(interface: PodProgramViewProtocol, interactor: PodProgramInteractorInputProtocol?, router: PodProgramWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
