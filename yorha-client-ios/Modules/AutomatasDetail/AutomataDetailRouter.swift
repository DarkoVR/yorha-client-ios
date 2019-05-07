//
//  AutomataDetailRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/6/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataDetailRouter: AutomataDetailWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(data: Automata) -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "automataDetailViewController")
        if let view = mainView as? AutomataDetailViewController {
            let router = AutomataDetailRouter()
            let presenter = AutomataDetailPresenter(interface: view, router: router)
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.data = data
            router.viewController = view
            
            return mainView
        }
        return UIViewController()
    }
}
