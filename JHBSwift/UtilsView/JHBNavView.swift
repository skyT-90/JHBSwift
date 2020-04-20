//
//  JHBNavView.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/1/10.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit
import SnapKit
class JHBNavView: UIView {

    var navTitle: String? {
        didSet{
            titleLabel.text = navTitle ?? "hahaha"
        }
    }

    fileprivate lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.red
        titleLabel.font = UIFont.systemFont(ofSize: 20);
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = NSTextAlignment.center
        return titleLabel
        
    }()
    
    fileprivate lazy var backBtn: UIButton = {
        let backBtn = UIButton()
        backBtn.setImage(UIImage(named: "nav_btn_back_white"), for: .normal)
        backBtn.sizeToFit()
        backBtn.addTarget(self, action: #selector(backAction(bt:)), for: .touchUpInside)
        return backBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        addChildView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
//            make.top.equalToSuperview().offset(35)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(backBtn.snp_left).offset(10)
            make.width.equalTo(300)
            make.height.equalTo(44)
            make.center.equalToSuperview()
        }
    }
    
    @objc func backAction(bt:UIButton) -> Void {
        NSLog("123")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JHBNavView {
    fileprivate func addChildView(){
        addSubview(titleLabel)
        addSubview(backBtn)
    }
}

