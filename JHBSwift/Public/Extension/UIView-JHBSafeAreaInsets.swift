//
//  UIView-JHBSafeAreaInsets.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/4/28.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit

extension UIView {
    func jhb_safeAreaInsets() -> UIEdgeInsets {
        var inset = UIEdgeInsets(top: (Scale(40)), left: Scale(0), bottom: Scale(0), right: Scale(0))
        
        if #available(iOS 11.0, *) {
            inset = self.safeAreaInsets
        }
        return inset
    }
}
