//
//  NSObjectExtension.swift
//  EasyNote
//
//  Created by beequick on 2017/7/20.
//  Copyright © 2017年 beequick. All rights reserved.
//

import Foundation
extension NSObject {
//    func getPropertyNames() {
//        var outCount:UInt32 = 0
//        let propers:UnsafeMutablePointer<objc_property_t>! = class_copyPropertyList(self.classForCoder, &outCount)
//        
//        let count:Int = Int(outCount)
//        print(outCount)
//        for i in 0...(count-1) {
//            let apro:objc_property_t = propers[i]
//            let proName:String! = String(UTF8: property_getName(apro))
//            
//        }
//        
//        
//    }
    class func getPropertyNames() -> [String] {
        var count: UInt32 = 0
        //获取类的属性列表,返回属性列表的数组,可选项
        let list = class_copyPropertyList(self, &count)
        print("属性个数:\(count)")
        //遍历数组
        for i in 0..<Int(count) {
            //根据下标获取属性
            let pty = list?[i]
            //获取属性的名称<C语言字符串>
            //转换过程:Int8 -> Byte -> Char -> C语言字符串
            let cName = property_getName(pty!)
            let cAttribute = property_getAttributes(pty!)
            //转换成String的字符串
            let name = String(utf8String: cName!)
            let att = String(utf8String: cAttribute!)
            
            print(name!)
            print(att!)
        }
        free(list) //释放list
        
        let lvarList = class_copyIvarList(self, &count);
        print("属性个数:\(count)")
        for i in 0..<Int(count) {
            let ivar = lvarList?[i]
            
            let cName = ivar_getName(ivar)
            let name = String(utf8String: cName!)
            print(name!)
            
            let cType = ivar_getTypeEncoding(ivar)
            let type = String(utf8String: cType!)
            print(type!)
            
        }
        free(lvarList)
        
        return []
    }
   
    
}
