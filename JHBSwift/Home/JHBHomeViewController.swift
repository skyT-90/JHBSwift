//
//  JHBHomeViewController.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/1/10.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit
import SnapKit
class JHBHomeViewController: JHBBaseViewController,JHBNavTitleBarDelegate {
 
    var sizeConstraint:Constraint?
    var scale = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
//        JHBNavView.self *navView = JHBNavView.init(frame: CGRect.init(x: 0, y: 100, width: KscreenWidth, height: 80))
        // Do any additional setup after loading the view.
//        self.jhb_titleBar = JHBNavTitleBar()
//        let hh = self.jhb_titleBar! ?? <#default value#>
//        self.jhb_titleBar?.titleLabel.text = "11212"
//        self.jhb_titleBar?.jhb_showTitle(nav: self.jhb_titleBar ?? JHBNavTitleBar(), title: "32432")
        self.jhb_showTitle(nav:self.jhb_titleBar!,title: "首页")
//        self.jhb_showTitle(nav:self.jhb_titleBar!,title: "首页11")
//        self.jhb_titleBar?.jhb_showTitle(title: "首页")
        self.jhb_titleBar?.delegate = self 
        
        navView.navTitle = "导航栏1"
        view.addSubview(navView)

        view.addSubview(boxView)
        boxView.addSubview(boxView2)
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
        tap.numberOfTouchesRequired = 1
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
        
        boxView.snp.makeConstraints { (make) in
            make.size.equalTo(100*scale).priority(250)
//            make.left.equalTo(10)
            make.center.equalToSuperview()
            make.width.height.lessThanOrEqualTo(view.snp.width)
            make.width.height.lessThanOrEqualTo(view.snp.height)
        }
//        boxView2.snp.makeConstraints { (make) in
////            make.size.equalTo(200)
////            make.left.equalTo(boxView.snp_right).offset(20)
////            make.top.equalTo(boxView)
////            make.edges.equalTo(boxView).inset(UIEdgeInsets(top: 10, left: 15, bottom: 20, right: 25))
//            self.sizeConstraint = make.top.equalTo(boxView).offset(10).constraint
//            make.left.equalTo(boxView).offset(15)
//            make.bottom.equalTo(boxView).offset(20)
//            make.right.equalTo(boxView).offset(25)
//        }
    }
    
    
    lazy var boxView : UIView = {
        let boxView = UIView()
        boxView.backgroundColor = UIColor.red
        return boxView
    }()
    
    lazy var boxView2 : UIView = {
         let boxView2 = UIView()
            boxView2.backgroundColor = UIColor.blue
        return boxView2
    }()
    
    
    fileprivate lazy var navView:JHBNavView = {
        let navView = JHBNavView.init(frame: CGRect.init(x: 0, y: 100, width: KscreenWidth, height: 80))
        
        return navView
    }()

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.sizeConstraint?.update(offset: 60)
    }
    
    
    override func updateViewConstraints() {
        boxView.snp.updateConstraints { (make) in
            make.width.height.equalTo(100*scale).priority(250)
        }
        super.updateViewConstraints()
    }
    
    @objc func click() {
        scale += 0.5
        view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func shouldInterceptBackEvent(str:NSString) -> Bool{
        NSLog("22222")
        print("\(str)")
        return true
    }
}
