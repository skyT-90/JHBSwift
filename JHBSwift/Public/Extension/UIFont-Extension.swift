//
//  UIFont-Extension.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/4/27.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit

let JHBFontName_PFSC_Regular = "PingFangSC-Regular"  /**<苹方-简 常规体*/
let JHBFontName_PFSC_Medium = "PingFangSC-Medium"; /**<苹方-简 中黑体*/
let JHBFontName_PFSC_Semibold = "PingFangSC-Semibold"; /**<苹方-简 中粗体*/
extension UIFont {
    static func citic_fontWithSize(size:CGFloat) ->UIFont{
        return self.citic_fontWithName(name: JHBFontName_PFSC_Regular as NSString, size:size)
    }
    
    static func citic_fontWithName(name:NSString,size:CGFloat) ->UIFont{
        var font = UIFont.init(name: name as String, size: size)
        if font == nil {
            font = UIFont.systemFont(ofSize: size)
        }
        return font!;
    }
}
