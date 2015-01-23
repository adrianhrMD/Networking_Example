//
//  RestClientProtocol.swift
//  Networking_Example
//
//  Created by Adrian Hristov on 20/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import Foundation

public protocol RestClientProtocol {
    
    func request (methodType: Method, url: String, parameters: [String: AnyObject]?, parameterEncoding: ParameterEncoding, headers: [String: String]?, completionHandler: ((JSON) -> Void))
    
//    func request (methodType: Method, url: String, headers: [String: String]?) 
    
    }

    