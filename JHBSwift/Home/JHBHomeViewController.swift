//
//  JHBHomeViewController.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/1/10.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit

class JHBHomeViewController: JHBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        JHBNavView.self *navView = JHBNavView.init(frame: CGRect.init(x: 0, y: 100, width: KscreenWidth, height: 80))
        // Do any additional setup after loading the view.
        view.addSubview(navView)
    }
    
    fileprivate lazy var navView:JHBNavView = {
        let navView = JHBNavView.init(frame: CGRect.init(x: 0, y: 100, width: KscreenWidth, height: 80))
        navView.navTitle = "导航栏"
        return navView
    }()

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
