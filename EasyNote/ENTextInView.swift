//
//  ENTextInView.swift
//  EasyNote
//
//  Created by beequick on 2017/7/12.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ENTextInView: UIView,UITextViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let textview = UITextView()
    
    func setUp() {
        self.backgroundColor = UIColor.white
        textview.textAlignment = .left
        textview.autocorrectionType = .no//
        textview.font = UIFont.systemFont(ofSize: 17)
        textview.delegate = self
        textview.tintColor = UIColor(red:0.35, green:0.80, blue:0.99, alpha:1.00)
        self.addSubview(textview)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textview.frame = self.bounds
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        print("locaton：",range.location)
//        print("text.length", textview.text.characters.count)
        // if range.length = 0,添加字符 range.length = 1,减字符
        var count = 0
        if range.length==0 {
            if text.characters.count > 0 {
                count = textview.text.characters.count + 1
            }
        }else{
            count = textview.text.characters.count - 1
        }
//        let str = textview.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        print("字符：", count)
        return true
    }

}
