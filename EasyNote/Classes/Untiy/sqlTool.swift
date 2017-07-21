//
//  sqlTool.swift
//  EasyNote
//
//  Created by beequick on 2017/7/19.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit
import Foundation
import SQLite

class sqlTool {
    static var sharedInstance:sqlTool = sqlTool()
    private var db: Connection!
/*
     var content: String? = ""
     
     var createdDate: String? = ""
     var changedDate: NSDate?
     var image: UIImage?
     var imageCount:Int = 0
     
     var address:String = ""
     var city:String = ""
     //下面具体时间
     var time:String = ""
     var wordCount:Int = 0
     var characterCount:Int = 0
     */
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    private let notes = Table("notes")
    private let id = Expression<Int64>("id")
    private let content = Expression<String?>("content")
    private let createdDate = Expression<String?>("createdDate")
    private let changedDate = Expression<String>("changedDate")
    private let address = Expression<String>("address")
    private let city = Expression<String>("city")
    private let time = Expression<String>("time")
    private let wordCount = Expression<Int>("wordCount")
    private let characterCount = Expression<Int>("characterCount")
    init() {
        print(path)
        createSqlite()
    }
    
    func createSqlite() {
        do{
//            ENNoteModel.getPropertyNames()
            db = try Connection("\(path)/db.sqlite3")
            try! db?.run(notes.create(ifNotExists: true, block: { (table) in
                table.column(id, primaryKey: true)
                table.column(content)
                table.column(createdDate)
                table.column(changedDate)
                table.column(address)
                table.column(city)
                table.column(time)
                table.column(wordCount)
                table.column(characterCount)
            }))
        
        }catch{
            print("error:\(error)")
        }
        
    }
    
    func insertSQL(model: ENNoteModel) {
        let insert = notes.insert(content <- model.content!, createdDate <- model.createdDate, changedDate <- model.changedDate!, address <- model.address, city <- model.city, time <- model.time, wordCount <- model.wordCount, characterCount <- model.characterCount)
        try! db?.run(insert)
        
    }
    
    func seachAllSQL() -> [ENNoteModel] {
        var models = [ENNoteModel]()
        for note in (try! db?.prepare(notes))! {
            let model = ENNoteModel()
            
            
            
            if (note[content]?.characters.count)! > 0 {
                model.content = note[content]
                model.createdDate = note[createdDate]
                model.changedDate = note[changedDate]
                model.address = note[address]
                model.city = note[city]
                model.time = note[time]
                model.wordCount = note[wordCount]
                model.characterCount = note[characterCount]
                models.append(model)
            }
        }
        return models
    }
    
    func updateSQL(noteid: Int64) {
        let update = notes.filter(id == noteid)
//        try! db?.run(update.update(content <- content.replace("", with: <#T##String#>)))
    }
    
}
