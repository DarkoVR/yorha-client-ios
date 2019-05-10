//
//  BossDetailRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossDetailRouter: BossDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(data: Boss) -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BossDetailViewController")
        if let view = mainView as? BossDetailViewController {
            let router = BossDetailRouter()
            let presenter = BossDetailPresenter(interface: view, router: router)
            
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

