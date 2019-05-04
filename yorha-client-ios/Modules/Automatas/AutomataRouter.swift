//
//  AutomataRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataRouter: AutomataWireframeProtocol {

    weak var viewController: UITableViewController?

    static func createModule() -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarController")
        if let view = mainView.children[0].children[0] as? AutomataViewController {
            let interactor = AutomataInteractor()
            let router = AutomataRouter()
            let presenter = AutomataPresenter(interface: view, interactor: interactor, router: router)
            let localData = AutomataStore()
            let remoteData = AutomataSession()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = router
            interactor.presenter = presenter
            interactor.remoteData = remoteData
            interactor.localData = localData
            remoteData.interactor = interactor
            remoteData.presenter = presenter
            router.viewController = view
            
            return mainView
        }

        return UITableViewController()
    }
}
