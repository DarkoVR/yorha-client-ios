//
//  PodProgramRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramRouter: PodProgramRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PodProgramNavController")
        if let view = mainView.children.first as? PodProgramViewController {
            let interactor = PodProgramInteractor()
            let router = PodProgramRouter()
            let presenter = PodProgramPresenter(interface: view, interactor: interactor, router: router)
            let localData = PodProgramStore()
            let remoteData = PodProgramSession()
            
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
    
    func showDetailScreen(view: PodProgramViewProtocol, data: PodProgram) {
        let detailViewController = PodProgramDetailRouter.createModule(data: data)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
