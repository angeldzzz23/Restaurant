//
//  ViewController.swift
//  Ordering
//
//  Created by Angel Zambrano on 2/14/22.
//

import UIKit

class ViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            createTabBarController()
            view.backgroundColor = .white
    }
    
    func createTabBarController() {
   
        let firstViewController = VC2()
        firstViewController.title = "first"
        firstViewController.tabBarItem.image = UIImage(systemName: "list.bullet")
        
        let second = Order()
        second.title = "order"
        second.tabBarItem.image = UIImage(systemName: "bag")
        
        self.setViewControllers([firstViewController, second], animated: true)

        
        
        
    }
    
    


}

