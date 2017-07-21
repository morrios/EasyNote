//
//  MainTableViewCell.swift
//  EasyNote
//
//  Created by beequick on 2017/7/21.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var contentLable: UILabel!
    
    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var noteTimeAddress: UILabel!
    @IBOutlet weak var textCountAboveLable: UILabel!
    
    @IBOutlet weak var textCountDownLable: UILabel!
    @IBOutlet weak var notetitleLeadingConstraint: NSLayoutConstraint!
    var model:ENNoteModel?{
        didSet{
            contentLable.text = model?.content
            noteTimeAddress.text = (model?.createdDate)! + (model?.address)!
            textCountDownLable.text = "\((model?.wordCount)!)"
            if model?.image == nil {
                notetitleLeadingConstraint.constant = 5
            }else{
                notetitleLeadingConstraint.constant = ImgView.right + 5
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        noteTitle.textColor = tintColor
        let smallFont = UIFont.systemFont(ofSize: 9)
        let bigFont = UIFont.systemFont(ofSize: 13)
        contentLable.font = bigFont
        noteTitle.font = smallFont
        noteTimeAddress.font = smallFont
        noteTimeAddress.textColor = c3
        contentLable.textColor = c2
        textCountAboveLable.textColor = c3
        textCountDownLable.textColor = c2
        textCountDownLable.font = UIFont.systemFont(ofSize: 22)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
