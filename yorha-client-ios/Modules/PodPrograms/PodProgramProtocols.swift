//
//  PodProgramProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/26/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol PodProgramWireframeProtocol: class {

}
//MARK: Presenter -
protocol PodProgramPresenterProtocol: class {

    var interactor: PodProgramInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol PodProgramInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol PodProgramInteractorInputProtocol: class {

    var presenter: PodProgramInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol PodProgramViewProtocol: class {

    var presenter: PodProgramPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
