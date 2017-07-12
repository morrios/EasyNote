//
//  ViewController.swift
//  EasyNote
//
//  Created by beequick on 2017/7/12.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red:0.35, green:0.80, blue:0.99, alpha:1.00)
        let textview = ENTextInView()
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        textview.frame = CGRect(x:0,y:64,width:screenWidth,height:100)
        textview.setUp()
        self.view.addSubview(textview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

