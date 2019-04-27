//
//  AutomataProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/27/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol AutomataWireframeProtocol: class {

}
//MARK: Presenter -
protocol AutomataPresenterProtocol: class {

    var interactor: AutomataInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol AutomataInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol AutomataInteractorInputProtocol: class {

    var presenter: AutomataInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol AutomataViewProtocol: class {

    var presenter: AutomataPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
