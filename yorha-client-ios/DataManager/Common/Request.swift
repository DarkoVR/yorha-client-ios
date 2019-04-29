//
//  Request.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/28/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

public func request(endpoint: String, id: Int? = 0, method: String? = "GET") -> URLRequest {
    let url = id != 0 ? componentUrl(endpoint: endpoint, id: id) : componentUrl(endpoint: endpoint)
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.setValue("Basic YWRtaW46cGFzc3dvcmQ=", forHTTPHeaderField: "Authorization")
    
    return request
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
