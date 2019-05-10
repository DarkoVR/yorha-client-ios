//
//  PodProgramDetailProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol PodProgramDetailRouterProtocol: class {
    static func createModule(data: PodProgram) -> UIViewController
}
//MARK: Presenter -
protocol PodProgramDetailPresenterProtocol: class {
    var view: PodProgramDetailViewProtocol? { get set }
    var router: PodProgramDetailRouterProtocol? { get set }
    var data: PodProgram? { get set }
    func viewDidLoad()
}

//MARK: View -
protocol PodProgramDetailViewProtocol: class {
    var presenter: PodProgramDetailPresenterProtocol?  { get set }
    func showDetail(data: PodProgram)
}
