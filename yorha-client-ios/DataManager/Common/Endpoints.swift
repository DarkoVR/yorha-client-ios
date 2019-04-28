//
//  Endpoints.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/27/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
}

enum Endpoints {
    case automatas
    case bosses
    case podPrograms
    case weapons
    
    public var path: String {
        switch self {
            case .automatas: return "/automatas"
            case .bosses: return "/bosses"
            case .podPrograms: return "/podprograms"
            case .weapons: return "/weapons"
        }
    }
}

public func componentUrl(endpoint: String, id: Int? = 0) -> URL {
    var components = URLComponents()
    components.scheme = "http"
    components.host = "67.205.175.203"
    components.port = 8080
    components.path = "\(endpoint)"+( id != 0 ? "/\(id ?? 0)" : "" )
    
    guard let url = components.url else {
        preconditionFailure("Failed to construct URL")
    }
    
    return url
}
