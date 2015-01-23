//
//  RestClient.swift
//  RestClient_Example
//
//  Created by Adrian Hristov on 20/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import Foundation

public class MDBRestClient : RestClientProtocol {
    
    typealias CompletionCallback = (JSON) -> Void
    
//    class func loadDataFromURL(url: String, completion: CompletionCallback) {
//        var session = NSURLSession.sharedSession()
//        var nsUrl = NSURL(string: url)!
//        var dataTask = session.dataTaskWithURL(nsUrl, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//            
//            
//            if let responseError = error {
//                // ERROR
//            }
//            
//            if let httpResponse = response as? NSHTTPURLResponse {
//                var result = JSON(data)
//                
//                completion(result)
//            }
//        })
//        
//        dataTask.resume()
//    }
    
    public func request (methodType: Method, url: String, parameters: [String: AnyObject]?, parameterEncoding: ParameterEncoding, headers: [String: String]?, completionHandler: ((JSON) -> Void)) {
        
        var session = NSURLSession.sharedSession()
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        
        request.HTTPMethod = methodType.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters!, options: NSJSONWritingOptions.allZeros, error: nil)
        
        var dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                // ERROR
                println("error")
            }
            
            if let httpResponse = response as? NSHTTPURLResponse {
                println(data)
                var jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil)
                var result = JSON(jsonData!)
                println("success")
                completionHandler(result)
            }

        })
        
        dataTask.resume()
    }
    
    public func requestAsync(methodType: Method, url: String, parameters: [String : AnyObject]?, parameterEncoding: ParameterEncoding, headers: [String : String]?) -> BFTask {
        var requestTaskSource = BFTaskCompletionSource()
        
        var session = NSURLSession.sharedSession()
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        
        request.HTTPMethod = methodType.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters!, options: NSJSONWritingOptions.allZeros, error: nil)
        
        var dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                // ERROR
                println("error")
                requestTaskSource.setError(responseError)
            }
            
            if let httpResponse = response as? NSHTTPURLResponse {
                
                println("success")
                requestTaskSource.setResult(data)
            }
            
        })
        
        // Start the request
        dataTask.resume()
        
        return requestTaskSource.task
    }
    
}