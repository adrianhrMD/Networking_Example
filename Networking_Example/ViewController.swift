//
//  ViewController.swift
//  Networking_Example
//
//  Created by Adrian Hristov on 20/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblAuthToken: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasksWay()
        //callbackWay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callbackWay() {
        var sc = MDBServiceCommunicator()
        //sc.simpleDummyGet()
        
        var completionHandler = {(token: JSON) -> Void in
            println(token["AuthToken"])
        }
        
        sc.login("adrian.hristov@moneydashboard.com", password: "Test1234", attempts: 0, browserDetails: "iOS", completionHandler)
    }
    
    func tasksWay() {
        var sc = MDBServiceCommunicator()
        self.lblAuthToken.text = "Loading..."
        
        for index in 1...5 {
        
            sc.loginAsync("adrian.hristov@moneydashboard.com", password: "Test1234", attempts: 0, browserDetails: "iOS")
                .continueWithExecutor(BFExecutor.mainThreadExecutor(), withBlock: { (loginTask) -> AnyObject! in
                    
                    println("Call: \(index)")
                    var authToken = loginTask.result as String
                    
                    self.lblAuthToken.text = " Call: \(index) token: \(authToken)"
                    return nil
                    
                })
        }
        
        /* 
        .continueWithBlock { (loginTask) -> AnyObject! in
        println("I am ViewController")
        var authToken = loginTask.result as String
        println("I am ViewController 2")
        
        self.lblAuthToken.text = authToken
        println("I am ViewController 3")
        
        return nil
        
        }
        */

    }
}

