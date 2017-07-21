//
//  ENNoteModel.swift
//  EasyNote
//
//  Created by beequick on 2017/7/13.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

enum ENNoteType {
    case Text
    case Image
    case Voice
    case Video
}

enum ENCreateType {
    case New
    case Old
}

class ENNoteModel: NSObject,NSCopying {
    
    var noteType = ENNoteType.Text
    var creatType = ENCreateType.New
    var content: String? = ""
    
    var createdDate: String? = ""
    var changedDate: String? = ""
    var image: UIImage?
    var imageCount:Int = 0
    
    var address: String = ""
    var city: String = ""
    //下面具体时间
    var time: String = ""
    var wordCount = 0
    var characterCount = 0
    var timeStamp:UInt64 = 0

    
    
    override init() {
        super.init()
        
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let model = ENNoteModel()
        model.noteType = self.noteType
        model.creatType = self.creatType
        model.content = self.content
        
        model.createdDate = self.createdDate
        model.changedDate = self.changedDate
        model.image = self.image
        model.imageCount = self.imageCount
        
        model.address = self.address
        model.city = self.city
        model.time = self.time
        model.wordCount = self.wordCount
        model.characterCount = self.characterCount
        model.timeStamp = self.timeStamp
        
        return model
    }
    
}
