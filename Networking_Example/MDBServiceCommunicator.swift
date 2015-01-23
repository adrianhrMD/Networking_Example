//
//  MDBServiceCommunicator.swift
//  Networking_Example
//
//  Created by Adrian Hristov on 20/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import Foundation

public class MDBServiceCommunicator {
    private var restClient: RestClientProtocol
    
    init () {
        self.restClient = AlamofireAdapter()
    }
    
    public func simpleDummyGet() {
//        restClient.request(
//            Method.GET,
//            url: "http://10.10.10.120:55995/api/application/simpledummysecureget",
//            //parameters: ["param1": "value1", "param2": "value2"],
//            //parameterEncoding: ParameterEncoding.JSON,
//            headers: ["authenticationToken": "Test"])
    }
    
    public func login(username: String, password: String, attempts: Int, browserDetails: String, completionHandler: ((JSON) -> Void)) {
        
        var requestParams: [String: AnyObject] = ["username": username, "password": password, "attempts": attempts, "browserDetails": browserDetails]
        
        restClient.request(
            Method.POST,
            url: "http://10.10.10.120:55995/api/authentication/login",
            parameters: requestParams,
            parameterEncoding: ParameterEncoding.JSON,
            headers: ["authenticationToken": "Test"],
            completionHandler)
    }
}