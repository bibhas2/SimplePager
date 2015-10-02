//
//  ViewController.swift
//  SimplePager
//
//  Created by Bibhas Bhattacharya on 10/2/15.
//  Copyright © 2015 Bibhas Bhattacharya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pageViewController : FullScreenPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the child view controllers
        let vc1 = storyboard!.instantiateViewControllerWithIdentifier("PageOneViewController")
        let vc2 = storyboard!.instantiateViewControllerWithIdentifier("PageTwoViewController")
        
        //Create the page view controller
        self.pageViewController = FullScreenPageViewController(childControllers: [vc1, vc2])
        
        //Show the page view controller
        self.view.addSubview(self.pageViewController.view)
    }
}

