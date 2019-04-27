//
//  BossProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/27/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol BossWireframeProtocol: class {

}
//MARK: Presenter -
protocol BossPresenterProtocol: class {

    var interactor: BossInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol BossInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol BossInteractorInputProtocol: class {

    var presenter: BossInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol BossViewProtocol: class {

    var presenter: BossPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
