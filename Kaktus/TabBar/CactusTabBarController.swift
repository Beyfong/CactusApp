//
//  CactusTabBarController.swift
//  Kaktus
//
//  Created by ablai erzhanov on 8/3/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class CactusTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor(named: "secondaryColor")
        tabBar.unselectedItemTintColor = UIColor(named : "lightGrey")

         
    }
    
 

}
