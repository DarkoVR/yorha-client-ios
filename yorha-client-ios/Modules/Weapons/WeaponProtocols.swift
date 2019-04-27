//
//  WeaponProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/26/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol WeaponWireframeProtocol: class {

}
//MARK: Presenter -
protocol WeaponPresenterProtocol: class {

    var interactor: WeaponInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol WeaponInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol WeaponInteractorInputProtocol: class {

    var presenter: WeaponInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol WeaponViewProtocol: class {

    var presenter: WeaponPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
