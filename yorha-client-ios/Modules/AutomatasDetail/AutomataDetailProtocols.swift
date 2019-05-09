//
//  AutomataDetailProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/6/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol AutomataDetailRouterProtocol: class {
    static func createModule(data: Automata) -> UIViewController
}
//MARK: Presenter -
protocol AutomataDetailPresenterProtocol: class {
    var view: AutomataDetailViewProtocol? { get set }
    var router: AutomataDetailRouterProtocol? { get set }
    var data: Automata? { get set }
    func viewDidLoad()
}

//MARK: View -
protocol AutomataDetailViewProtocol: class {
  var presenter: AutomataDetailPresenterProtocol?  { get set }
    func showDetail(data: Automata)
}
