//
//  ENTextInView.swift
//  EasyNote
//
//  Created by beequick on 2017/7/12.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit


protocol ENTextInViewDelegate {
    func TextInView(textView: UITextView, textLength: Int, count: Int)
    
}

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
        let padding = CGFloat(10)
        
        textview.frame = CGRect(x:padding, y:0, width:(self.frame.width-2*padding), height:self.frame.height)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        print("locaton：",range.location)
//        print("text.length", textview.text.characters.count)
        // if range.length = 0,添加字符 range.length = 1,减字符
        var textLength = 0
        var count = 0
        
        var str = textview.text
        if range.length==0 {
            if text.characters.count > 0 {
                count = textview.text.characters.count + 1
                str = textview.text + text
            }
        }else{
            count = textview.text.characters.count - 1
            str = str!.substring(to: (str!.index(before: str!.endIndex)))
        }
        print(str!)
        let replaceString = str?.replacingOccurrences(of: " ", with: "")
        textLength = str!.characters.count
        count = replaceString!.characters.count
//        print("字符：", count)
        return true
    }

}
