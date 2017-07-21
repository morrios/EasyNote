//
//  MianView.swift
//  EasyNote
//
//  Created by beequick on 2017/7/21.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class MianView: UIView, UITableViewDelegate, UITableViewDataSource {

    //MARK: init
    let tableview = UITableView()
    let topView = Bundle.main.loadNibNamed("MainTopView", owner: nil, options: nil)?.first as? MainTopView
    
    var notes: [ENNoteModel]? {
        didSet{
            tableview.reloadData()
        }
    }
    let mainCellId = "mainCellId"
    let addBtn = UIButton()
    let topViewHeight = CGFloat(250)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initViews() {
        self.backgroundColor = mainColor
        tableview.register(UINib.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: mainCellId)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        self.addSubview(tableview)
        self.addSubview(topView!)
        self.addSubview(addBtn)
        addBtn.setImage(UIImage.init(named: "add"), for: .normal)
        addBtn.addTarget(self, action: #selector(addBtnOnClick), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = CGFloat(36)
        topView?.frame = CGRect(x:0, y:0, width:screenWidth, height:topViewHeight)
        tableview.frame = self.frame
        tableview.y = topViewHeight
        tableview.height = screenHeight - topViewHeight
        addBtn.width = width
        addBtn.height = width
        addBtn.centerX = self.frame.size.width * 0.5
        addBtn.y = screenHeight - width - 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainCellId) as! MainTableViewCell
        cell.model = notes![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    //MARK: method
    func addBtnOnClick() {
        let controller = getCurrentVC()
        controller.present(ENNoteWriteViewController(), animated: true, completion: nil)
        print(controller)
        
    }
  

}
