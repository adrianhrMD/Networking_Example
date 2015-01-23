//
//  ViewController.swift
//  Networking_Example
//
//  Created by Adrian Hristov on 20/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //request(.GET, "http://httpbin.org/get")
//        Manager.sharedInstance.request(.GET, "http://httpbin.org/get")
//            .responseJSON { (_, _, json, _) -> Void in
//            println(json!)
//        }
        
        var sc = MDBServiceCommunicator()
        //sc.simpleDummyGet()
        
        var completionHandler = {(token: JSON) -> Void in
            println(token["AuthToken"])
        }
        
        sc.login("adrian.hristov@moneydashboard.com", password: "Test1234", attempts: 0, browserDetails: "iOS", completionHandler)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

