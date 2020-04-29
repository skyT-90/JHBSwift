//
//  JHBNavTitleBar.swift
//  JHBSwift
//
//  Created by jianghongbo on 2020/4/26.
//  Copyright © 2020 jianghongbo. All rights reserved.
//

import UIKit
import SnapKit
@objc protocol JHBNavTitleBarDelegate:NSObjectProtocol{
    func shouldInterceptBackEvent(str:NSString) -> Bool
}

class JHBNavTitleBar: UIViewController {

    weak var delegate : JHBNavTitleBarDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view .addSubview(leftBackButton)
        self.view .addSubview(titleLabel)
        leftBackButton.snp_makeConstraints { (make) in
            make.leading.bottom.equalTo(self.view)
            make.width.equalTo(Scale(84))
            make.height.equalTo(Scale(88))
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view)
            make.height.equalTo(Scale(88))
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let safeAreaInset = self.view.jhb_safeAreaInsets
        self.view.snp_updateConstraints { (make) in
            make.height.equalTo(Scale(88) + safeAreaInset().top)
        }
    }
    
    public lazy var leftBackButton:UIButton = {
       let leftBackButton = UIButton()
        
        leftBackButton.imageView?.contentMode = .scaleAspectFit
        leftBackButton.setImage(UIImage(named: "dk_back_black_icon"), for: .normal)
        leftBackButton.addTarget(self, action: #selector(onBackBtnClick(bt:)), for: .touchUpInside)
        
        return leftBackButton
    }()
    
    public lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.citic_fontWithName(name: JHBFontName_PFSC_Regular as NSString, size: 18.0)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        return titleLabel;
    }()
    
    
    
    @objc func onBackBtnClick(bt:UIButton) -> Void {
        var shouldIntercept : Bool = false
        let selector = #selector(JHBNavTitleBarDelegate.shouldInterceptBackEvent(str:)) //NSSelectorFromString("shouldInterceptBackEvent:")
        if self.delegate != nil && ((self.delegate?.responds(to:selector))!)  {
            shouldIntercept = self.delegate?.shouldInterceptBackEvent(str:"1111") ?? false
        }
        if shouldIntercept == false {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}

