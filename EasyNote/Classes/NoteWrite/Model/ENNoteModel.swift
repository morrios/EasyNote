//
//  ENNoteModel.swift
//  EasyNote
//
//  Created by beequick on 2017/7/13.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

enum ENNoteType {
    case ENNoteText
    case ENNoteImage
    case ENNoteVoice
    case ENNoteVideo
}

class ENNoteModel: NSObject {
    
    var notetype = ENNoteType.ENNoteText
    var content: String?
    var createdDate: NSDate?
    var changedDate: NSDate?
    var image: UIImage?
    var imageCount:Int = 0
    
    var address:String = ""
    var city:String = ""
    var time:String = ""
    var wordCount:Int = 0
    var characterCount:Int = 0
    
    
    
    override init() {
        super.init()
    }
    
    
}
