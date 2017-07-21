//
//  ENConfig.swift
//  EasyNote
//
//  Created by beequick on 2017/7/14.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

let screenWidth: CGFloat = UIScreen.main.bounds.width
let screenHeight: CGFloat = UIScreen.main.bounds.height
let minorColor: UIColor = UIColor(red:0.35, green:0.80, blue:0.99, alpha:1.00)
let mainColor = UIColor(red:0.20, green:0.23, blue:0.26, alpha:1.00)

let c2 = UIColor(red:0.19, green:0.19, blue:0.19, alpha:1.00)
let c3 = UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.00)

let LoadSqlDatasNotification = "LoadSqlDatasNotification"


func getCurrentVC()->UIViewController{
    
    var window = UIApplication.shared.keyWindow
    if window?.windowLevel != UIWindowLevelNormal{
        let windows = UIApplication.shared.windows
        for  tempwin in windows{
            if tempwin.windowLevel == UIWindowLevelNormal{
                window = tempwin
                break
            }
        }
    }
    let frontView = (window?.subviews)![0]
    let nextResponder = frontView.next
    //        print("getCurrentVC    XX \(frontView.classForCoder)")// iOS8 9 window  ios7 UIView
    //        print("getCurrentVC    XX \((window?.subviews)!.count)")
    //        print("getCurrentVC    XX \(nextResponder?.classForCoder)")
    if nextResponder?.isKind(of: UIViewController.classForCoder()) == true{
        
        return nextResponder as! UIViewController
    }else if nextResponder?.isKind(of: UINavigationController.classForCoder()) == true{
        
        return (nextResponder as! UINavigationController).visibleViewController!
    }
    else {
        
        if (window?.rootViewController) is UINavigationController{
            return ((window?.rootViewController) as! UINavigationController).visibleViewController!//只有这个是显示的controller 是可以的必须有nav才行
        }
        
        return (window?.rootViewController)!
        
    }
    
}
