//
//  AutomataPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataPresenter: AutomataPresenterProtocol {
    var wireFrame: AutomataWireframeProtocol?
    weak internal var view: AutomataViewProtocol?
    var interactor: AutomataInteractorProtocol?

    init(interface: AutomataViewProtocol, interactor: AutomataInteractorProtocol?, router: AutomataWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireFrame = router
    }
    
    func viewDidLoad(){
        view?.showLoading()
        interactor?.retrieveData()
    }
    
    func viewDidRefresh(){
        interactor?.retrieveData()
    }
    
    func showDetailScreen(_ data: Automata) {
        print("Send to the detail screen")
    }
    
    func didRetrieveData(_ data: [Automata]){
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
