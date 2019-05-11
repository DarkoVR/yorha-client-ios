//
//  WeaponRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponRouter: WeaponRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WeaponNavController")
        if let view = mainView.children.first as? WeaponViewController {
            let interactor = WeaponInteractor()
            let router = WeaponRouter()
            let presenter = WeaponPresenter(interface: view, interactor: interactor, router: router)
            let localData = WeaponStore()
            let remoteData = WeaponSession()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            interactor.remoteData = remoteData
            interactor.localData = localData
            remoteData.interactor = interactor
            remoteData.presenter = presenter
            router.viewController = view
            
            return mainView
        }
        
        return UIViewController()
    }
    
    func showDetailScreen(view: WeaponViewProtocol, data: Weapon) {
        let detailViewController = WeaponDetailRouter.createModule(data: data)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
