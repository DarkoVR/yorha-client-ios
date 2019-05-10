//
//  PodProgramPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramPresenter: PodProgramPresenterProtocol {
    var router: PodProgramRouterProtocol?
    weak internal var view: PodProgramViewProtocol?
    var interactor: PodProgramInteractorProtocol?
    
    init(interface: PodProgramViewProtocol, interactor: PodProgramInteractorProtocol?, router: PodProgramRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(){
        view?.showLoading()
        interactor?.retrieveData()
    }
    
    func viewDidRefresh(){
        interactor?.retrieveData()
    }
    
    func showDetailScreen(data: PodProgram) {
        router?.showDetailScreen(view: view!, data: data)
    }
    
    func didRetrieveData(data: [PodProgram]){
        view?.hideLoading()
        view?.showData(with: data)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
    func isInternetConnected() -> Bool {
        return (view?.isInternetConnected())!
    }
    
}
