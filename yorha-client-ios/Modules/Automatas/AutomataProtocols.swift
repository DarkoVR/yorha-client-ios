//
//  AutomataProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol AutomataWireframeProtocol: class {

}
//MARK: Presenter -
protocol AutomataPresenterProtocol: class {

}

//MARK: Interactor -
protocol AutomataInteractorProtocol: class {

  var presenter: AutomataPresenterProtocol?  { get set }
}

//MARK: View -
protocol AutomataViewProtocol: class {

  var presenter: AutomataPresenterProtocol?  { get set }
}
