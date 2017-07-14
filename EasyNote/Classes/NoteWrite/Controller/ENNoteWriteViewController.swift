//
//  ENNoteWriteViewController.swift
//  EasyNote
//
//  Created by beequick on 2017/7/13.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit

class ENNoteWriteViewController: UIViewController {

    let backBtn = UIButton.init(type: UIButtonType.custom)
    let nav = ENTextNavigationView.init(frame: CGRect(x:0, y:20, width:screenWidth, height:44))
    let textview = ENTextInView()
//    let footerView = ENTextFooterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = mainColor
        
        let textview_y: CGFloat = 64.0
        let footviewHeight = CGFloat(56)
        
        textview.frame = CGRect(x:0,y:textview_y,width:screenWidth,height:(self.view.bounds.height - textview_y - footviewHeight))
        textview.setUp()
        self.view.addSubview(textview)
        self.view.addSubview(nav)
        weak var weakSelf = self
        nav.btnClickBlock = {
            weakSelf!.view.endEditing(true)
            weakSelf!.dismiss(animated: true, completion: {
                
            })
            
        }
        
        nav.dateString = getCurrentDate()
        
        let myView = Bundle.main.loadNibNamed("ENTextFooterView", owner: nil, options: nil)?.first as? ENTextFooterView
        myView?.frame = CGRect(x:0,y:textview.bottom,width:screenWidth,height:footviewHeight)
        self.view.addSubview(myView!)
    }


    func getCurrentDate() -> String {

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 EEEE"
        return formatter.string(from: date)
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIView{
    var x : CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    // y
    var y : CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    // height
    var height : CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var width : CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    // left
    var left : CGFloat {
        
        get {
            
            return x
        }
        
        set(newVal) {
            
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        
        get {
            
            return x + width
        }
        
        set(newVal) {
            
            x = newVal - width
        }
    }
    
    // top
    var top : CGFloat {
        
        get {
            
            return y
        }
        
        set(newVal) {
            
            y = newVal
        }
    }
    
    // bottom
    var bottom : CGFloat {
        
        get {
            
            return y + height
        }
        
        set(newVal) {
            
            y = newVal - height
        }
    }
    
    var centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var centerY : CGFloat {
        
        get {
            
            return center.y
        }
        
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var middleX : CGFloat {
        
        get {
            
            return width / 2
        }
    }
    
    var middleY : CGFloat {
        
        get {
            
            return height / 2
        }
    }
    
    var middlePoint : CGPoint {
        
        get {
            
            return CGPoint(x: middleX, y: middleY)
        }
    }
}
