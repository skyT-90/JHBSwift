//
//  UIViewController-JHBNav.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/4/28.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit

//var jhb_titleBar_key_temp = "jhb_titleBar_key_temp"
extension UIViewController {
      private static var jhb_titleBar_key = "jhb_titleBar_key"
    struct RuntimeKey {
           
           static let kProgressHud = UnsafeRawPointer.init(bitPattern: "kProgressHud".hashValue)
           
       }
     var jhb_titleBar:JHBNavTitleBar?{
        get{
//            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "jhb_titleBar_key_temp".hashValue)
            var obj = objc_getAssociatedObject(self, UIViewController.RuntimeKey.kProgressHud!) as? JHBNavTitleBar
            if (obj == nil)  {
                let bar = JHBNavTitleBar()
//                let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "jhb_titleBar_key_temp".hashValue)
                objc_setAssociatedObject(self, UIViewController.RuntimeKey.kProgressHud!, bar, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                self.addChild(bar)
                self.view.addSubview(bar.view)
                let safeAreaInset = self.view.jhb_safeAreaInsets
                bar.view.snp_makeConstraints { (make) in
                    make.leading.top.trailing.equalTo(self.view)
                    make.height.equalTo(Scale(88) + safeAreaInset().top)
                }
                obj = bar
            }
            return obj
        }
        set{

//            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "jhb_titleBar_key_temp".hashValue)
            objc_setAssociatedObject(self, UIViewController.RuntimeKey.kProgressHud!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
//    public lazy var jhb_titleBar:JHBNavTitleBar = {
//
//       return JHBNavTitleBar()
//    }()
    
    func jhb_showTitle(nav:JHBNavTitleBar ,title:NSString) -> Void {
        nav.titleLabel.text = title as String
//        self.view .bringSubviewToFront(self.jhb_titleBar?.view ?? UIView())
    }
}
