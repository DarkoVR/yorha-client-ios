//
//  WeaponDetailRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponDetailRouter: WeaponDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(data: Weapon) -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WeaponDetailViewController")
        if let view = mainView as? WeaponDetailViewController {
            let router = WeaponDetailRouter()
            let presenter = WeaponDetailPresenter(interface: view, router: router)
            
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
