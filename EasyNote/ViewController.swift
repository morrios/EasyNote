//
//  ViewController.swift
//  EasyNote
//
//  Created by beequick on 2017/7/14.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MianView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = mainColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadSQLDatas), name: NSNotification.Name(rawValue: LoadSqlDatasNotification), object: nil)
        self.loadSQLDatas()
        mainView.frame = self.view.frame
        self.view.addSubview(mainView)
    }

    func loadSQLDatas() {
        let sqltool = sqlTool.sharedInstance
        let models = sqltool.seachAllSQL()
        mainView.notes = models

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

