//
//  PodProgramDetailRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramDetailRouter: PodProgramDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(data: PodProgram) -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PodProgramDetailViewController")
        if let view = mainView as? PodProgramDetailViewController {
            let router = PodProgramDetailRouter()
            let presenter = PodProgramDetailPresenter(interface: view, router: router)
            
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
