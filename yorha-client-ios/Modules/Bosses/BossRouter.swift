//
//  BossRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossRouter: BossRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BossNavController")
        if let view = mainView.children.first as? BossViewController {
            let interactor = BossInteractor()
            let router = BossRouter()
            let presenter = BossPresenter(interface: view, interactor: interactor, router: router)
            let localData = BossStore()
            let remoteData = BossSession()
            
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
        
        return UITableViewController()
    }
    
    func showDetailScreen(view: BossViewProtocol, data: Boss) {
        let detailViewController = BossDetailRouter.createModule(data: data)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }

}
