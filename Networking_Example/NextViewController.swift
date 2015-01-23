//
//  NextViewController.swift
//  Networking_Example
//
//  Created by Adrian Hristov on 23/01/2015.
//  Copyright (c) 2015 Adrian Hristov. All rights reserved.
//

import Foundation

public class NextViewController : UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("===== NEXT VC =====")
        //popOtherController()
    }
    
    func popOtherController() {
        // pop back to the root view
        var navController = UIApplication.sharedApplication().keyWindow?.rootViewController as UINavigationController
        var controllerStack = navController.viewControllers
        
        var newStack: Array<AnyObject> = []
        
        // destroy Home VC
        var homeVC = controllerStack[0] as ViewController
        
        var lastVC = controllerStack[controllerStack.count - 1]
        newStack.append(lastVC)
        
        navController.setViewControllers(newStack, animated: true)
    }

}