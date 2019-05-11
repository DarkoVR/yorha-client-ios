//
//  WeaponPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponPresenter: WeaponPresenterProtocol {
    var router: WeaponRouterProtocol?
    weak internal var view: WeaponViewProtocol?
    var interactor: WeaponInteractorProtocol?
    
    init(interface: WeaponViewProtocol, interactor: WeaponInteractorProtocol?, router: WeaponRouterProtocol) {
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
    
    func showDetailScreen(data: Weapon) {
        router?.showDetailScreen(view: view!, data: data)
    }
    
    func didRetrieveData(data: [Weapon]){
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
