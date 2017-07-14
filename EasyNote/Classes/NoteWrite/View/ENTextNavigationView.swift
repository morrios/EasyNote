//
//  ENTextNavigationView.swift
//  EasyNote
//
//  Created by beequick on 2017/7/14.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ENTextNavigationView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let backBtn = UIButton.init(type: UIButtonType.custom)
    let detailLable = UILabel()
    var btnClickBlock:(() -> ())?
    var dateString:String? {
        didSet {
            if dateString != nil {
                detailLable.text = dateString!
            }
        }
    }
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width = CGFloat(32)
        let height:CGFloat = 32
        let backBtnY = (frame.size.height - height) * 0.5
        backBtn.frame = CGRect(x:10, y:backBtnY, width:width, height:height)
        self.addSubview(backBtn)
        backBtn.setImage(UIImage.init(named: "down"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        detailLable.textColor = minorColor
        detailLable.text = ""
        detailLable.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(detailLable)
        detailLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(self)
        }
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func backToHome() {
        if self.btnClickBlock != nil {
            self.btnClickBlock!()
        }
    }

}
