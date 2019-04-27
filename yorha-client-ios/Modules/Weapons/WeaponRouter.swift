//
//  WeaponRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/26/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponRouter: WeaponWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = WeaponViewController(nibName: nil, bundle: nil)
        let interactor = WeaponInteractor()
        let router = WeaponRouter()
        let presenter = WeaponPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
