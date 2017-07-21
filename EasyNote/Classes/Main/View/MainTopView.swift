//
//  MainTopView.swift
//  EasyNote
//
//  Created by beequick on 2017/7/21.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class MainTopView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func cameraAction(_ sender: Any) {
        
    }

    @IBAction func addAction(_ sender: Any) {
        let vc = getCurrentVC()
        vc.present(ENNoteWriteViewController(), animated: true, completion: nil)
    }
}
