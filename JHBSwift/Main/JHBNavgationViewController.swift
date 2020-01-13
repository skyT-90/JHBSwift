//
//  JHBNavgationViewController.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/1/10.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit

class JHBNavgationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
    
        }
        super.pushViewController(viewController, animated: animated)
    }

}
