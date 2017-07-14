//
//  ViewController.swift
//  EasyNote
//
//  Created by beequick on 2017/7/14.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = mainColor

    }

    @IBAction func goToNote(_ sender: Any) {
        self.present(ENNoteWriteViewController(), animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

