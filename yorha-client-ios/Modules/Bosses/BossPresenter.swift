//
//  BossPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossPresenter: BossPresenterProtocol {
    var router: BossRouterProtocol?
    weak internal var view: BossViewProtocol?
    var interactor: BossInteractorProtocol?
    
    init(interface: BossViewProtocol, interactor: BossInteractorProtocol?, router: BossRouterProtocol) {
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
    
    func showDetailScreen(data: Boss) {
        router?.showDetailScreen(view: view!, data: data)
    }
    
    func didRetrieveData(data: [Boss]){
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
