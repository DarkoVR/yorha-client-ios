//
//  BossDetailProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol BossDetailRouterProtocol: class {
    static func createModule(data: Boss) -> UIViewController
}

//MARK: Presenter -
protocol BossDetailPresenterProtocol: class {
    var view: BossDetailViewProtocol? { get set }
    var router: BossDetailRouterProtocol? { get set }
    var data: Boss? { get set }
    func viewDidLoad()
}

//MARK: View -
protocol BossDetailViewProtocol: class {
    var presenter: BossDetailPresenterProtocol?  { get set }
    func showDetail(data: Boss)
}
