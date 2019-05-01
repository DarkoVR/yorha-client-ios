//
//  WeaponProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol WeaponWireframeProtocol: class {

}
//MARK: Presenter -
protocol WeaponPresenterProtocol: class {

}

//MARK: Interactor -
protocol WeaponInteractorProtocol: class {

  var presenter: WeaponPresenterProtocol?  { get set }
}

//MARK: View -
protocol WeaponViewProtocol: class {

  var presenter: WeaponPresenterProtocol?  { get set }
}
