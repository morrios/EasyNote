//
//  ENTextFooterView.swift
//  EasyNote
//
//  Created by beequick on 2017/7/14.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ENTextFooterView: UIView {

    @IBOutlet weak var timeAboveLable: UILabel!
    @IBOutlet weak var addressAboveLable: UILabel!
    @IBOutlet weak var wordCountAboveLable: UILabel!
    @IBOutlet weak var characterAboveLable: UILabel!
    @IBOutlet weak var noteDownLable: UILabel!
    @IBOutlet weak var cityDownLable: UILabel!
    @IBOutlet weak var wordDownLable: UILabel!
    @IBOutlet weak var characterDownLable: UILabel!
    

    
    var noteModel:ENNoteModel? {
        didSet{
            if noteModel?.creatType == ENCreateType.New {
                timeAboveLable.text = noteModel?.time
                if noteModel?.address != nil {
                    addressAboveLable.text = noteModel?.address
                }
                if noteModel?.city != nil {
                    cityDownLable.text = noteModel?.city
                }
                
            }else{
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
    }
    
    func initViews() {
        let aboveFont = UIFont.systemFont(ofSize: 18)
        let downFont = UIFont.systemFont(ofSize: 12)
        
        timeAboveLable.font = aboveFont
        addressAboveLable.font = aboveFont
        wordDownLable.font = aboveFont
        characterAboveLable.font = aboveFont
        
        noteDownLable.font = downFont
        cityDownLable.font = downFont
        wordDownLable.font = downFont
        characterDownLable.font = downFont
        
        noteDownLable.textColor = minorColor
        
        
    }
}
