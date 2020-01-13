//
//  JHBTabBarViewController.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/1/8.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit
fileprivate let TabBarItemInfo = "TabBarItemConfig.plist"
class JHBTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        let lable = UILabel()
//        lable.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        lable.text = "我的lable"
//        lable.textColor = UIColor.red
//        lable.numberOfLines = 0
//        lable.textAlignment = .center
//        self.view.addSubview(lable)
        //1、获取tanbarItem数据
        let itemUrl:String? = Bundle.main.path(forResource: TabBarItemInfo, ofType: nil)
        if itemUrl == nil {
            return
        }
        let itemArr = NSArray(contentsOfFile: itemUrl!)
        if itemArr == nil {
            return
        }
        itemArr?.enumerateObjects({ (obj, idx, stop) in
            guard let itemDict = obj as? [String : NSObject] else {return}
            let clsN : String = itemDict["vc"] as! String
            let cls : AnyClass? = classFromCls(clsN)
            if cls == nil {return}
            let vcCls = cls as! UIViewController.Type
            let vc = vcCls.init()
            //2、设置tabbar
            addChildVC(vc ,itemTitle: itemDict["title"] as! NSString, imageN: itemDict["normalImgeName"] as! NSString, selImageN: (itemDict["selImgeName"] as! NSString) as String)
        })
        
        
    }

}

extension JHBTabBarViewController {
    func addChildVC(_ vc: UIViewController , itemTitle:NSString ,imageN: NSString , selImageN: String) {
        var image : UIImage =  UIImage(named: imageN as String)!
        var selImage : UIImage =  UIImage(named: selImageN)!
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        selImage = selImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc.tabBarItem = UITabBarItem.init(title: itemTitle as String, image: image, selectedImage: selImage)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(red: 255/255, green: 211/255, blue: 59/255, alpha: 1)],for: .selected)
        let nav = JHBNavgationViewController(rootViewController: vc)
        addChild(nav)
        
    }
}
