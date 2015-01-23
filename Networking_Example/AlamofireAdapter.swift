//
//  AlamofireAdapter.swift
//  Networking_Example
//
//  Created by Adrian Hristov on 20/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import Foundation

public class AlamofireAdapter : RestClientProtocol {
    public func request (
        methodType: Method,
        url: String, parameters: [String: AnyObject]? = nil,
        parameterEncoding: ParameterEncoding = ParameterEncoding.JSON,
        headers: [String: String]? = nil,
        completionHandler: ((JSON) -> Void)) {
        
        println(headers!)
        var configuraiton = Manager.sharedInstance.session.configuration
        configuraiton.HTTPAdditionalHeaders = headers
        
        var manager = Manager(configuration: configuraiton)
        var result: JSON = JSON("")
        
        manager.request(methodType, url, parameters: parameters, encoding: parameterEncoding)
            .responseJSON { (_, _, data, _) -> Void in
                
                result = JSON(data!)
                completionHandler(result)
        }
    }
    
    public func requestAsync(methodType: Method, url: String, parameters: [String : AnyObject]?, parameterEncoding: ParameterEncoding, headers: [String : String]?) -> BFTask {
        
        return BFTask()
        
    }
    
//    public func request (methodType: Method, url: String, headers: [String: String]?) {
//        request(methodType, url: url, parameters: nil, parameterEncoding: ParameterEncoding.JSON, headers: headers)
//    }
}