//
//  NSObject-ClassFromStr.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/1/10.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import Foundation
extension NSObject {
    func classFromCls(_ clst: String) -> AnyClass? {
        assert(!clst.isEmpty, "传入的calss字符串为空")
        let clsB = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        let cls: AnyClass? = NSClassFromString(clsB! + "." + clst)
        return cls
    }
}
