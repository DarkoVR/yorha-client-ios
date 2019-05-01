//
//  PodProgramProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol PodProgramWireframeProtocol: class {

}
//MARK: Presenter -
protocol PodProgramPresenterProtocol: class {

}

//MARK: Interactor -
protocol PodProgramInteractorProtocol: class {

  var presenter: PodProgramPresenterProtocol?  { get set }
}

//MARK: View -
protocol PodProgramViewProtocol: class {

  var presenter: PodProgramPresenterProtocol?  { get set }
}
