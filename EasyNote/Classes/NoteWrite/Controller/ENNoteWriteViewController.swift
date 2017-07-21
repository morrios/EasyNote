//
//  ENNoteWriteViewController.swift
//  EasyNote
//
//  Created by beequick on 2017/7/13.
//  Copyright © 2017年 beequick. All rights reserved.
//

import UIKit
import CoreLocation

class ENNoteWriteViewController: UIViewController, CLLocationManagerDelegate, ENTextInViewDelegate {

    let backBtn = UIButton.init(type: UIButtonType.custom)
    let nav = ENTextNavigationView.init(frame: CGRect(x:0, y:20, width:screenWidth, height:44))
    let textview = ENTextInView()
    let textModel = ENNoteModel()
    let footView = Bundle.main.loadNibNamed("ENTextFooterView", owner: nil, options: nil)?.first as? ENTextFooterView
    let locationManager = CLLocationManager()
    
//    let footerView = ENTextFooterView()

    let sqltool = sqlTool.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = mainColor
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }else{
            print("您没有开启定位服务")
        }
        
        
        let textview_y: CGFloat = 64.0
        let footviewHeight = CGFloat(56)
        
        
        initCreateDate()
        
        textview.frame = CGRect(x:0,y:textview_y,width:screenWidth,height:(self.view.bounds.height - textview_y - footviewHeight))
        textview.setUp()
        self.view.addSubview(textview)
        self.view.addSubview(nav)
        textview.dalegate = self
        weak var weakSelf = self
        nav.btnClickBlock = {
            weakSelf!.view.endEditing(true)
            weakSelf!.dismiss(animated: true, completion: {
                print("dismiss")
                if (weakSelf?.textModel.content?.characters.count)! > 0 {
                    weakSelf!.sqltool.insertSQL(model: (weakSelf?.textModel)!)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoadSqlDatasNotification), object: nil)
                }
                
            })
        }
        
        footView?.frame = CGRect(x:0,y:textview.bottom,width:screenWidth,height:footviewHeight)
        self.view.addSubview(footView!)
        footView?.noteModel = textModel
        initNotification()  
    }

    func initNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)

    }
    
    func keyboardWillShow(notification: NSNotification) {
        let dict: Dictionary = notification.userInfo!
        print("keyboardWillShow\(dict)")
        let duration = dict["UIKeyboardAnimationDurationUserInfoKey"] as! Double
        let AnimaotionOptions = dict["UIKeyboardAnimationCurveUserInfoKey"] as! Int
        let rectValue = dict["UIKeyboardBoundsUserInfoKey"] as! NSValue
        let keyBoardRect = rectValue.cgRectValue
        
        print("duration = \(duration)")
        print("keyBoardRect = \(keyBoardRect)")
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: UIViewKeyframeAnimationOptions(rawValue: UInt(AnimaotionOptions)), animations: { 
            self.footView?.bottom = screenHeight - keyBoardRect.size.height

        }) { (Bool) in
            
        }
        
    }
    //MARK:delegate
    func TextInView(textView: UITextView, model: textClass) {
        
        footView?.characterAboveLable.text = "\(model.textLength)"
        footView?.wordCountAboveLable.text = "\(model.count)"
        
        textModel.wordCount = model.count
        textModel.characterCount = model.textLength
        textModel.content = model.content
    }
    
    //MARK: locaction delegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let changeLocation:NSArray = locations as NSArray
        let currentLocation = changeLocation.lastObject as! CLLocation
        
        print(currentLocation.coordinate.latitude)
        
        let geocode = CLGeocoder()
        geocode.reverseGeocodeLocation(currentLocation) { (places, error) in
            if error == nil {
                let placeMark:CLPlacemark = (places?.first)!
                let addressDict = placeMark.addressDictionary!
                var cityStr = addressDict["Country"]!
                if addressDict["administrativeArea"] != nil {
                    cityStr = "\(cityStr) \(addressDict["administrativeArea"]!)"
                }
                cityStr = "\(cityStr) \(addressDict["City"]!)"
                let addressStr = addressDict["Street"] as! String
                
                if self.textModel.creatType == ENCreateType.New {
                    self.textModel.city = cityStr as! String
                    self.textModel.address = addressStr
                    self.footView?.noteModel = self.textModel
                }

            }else{
                print(error!)
            }
            
         
            
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func initCreateDate() {

        let date = Date()
        let formatter = DateFormatter()
        if textModel.creatType == ENCreateType.New {
            formatter.dateFormat = "yyyy年MM月dd日 EEEE"
            textModel.createdDate = formatter.string(from: date)
            formatter.dateFormat = "hh:mm tt"
            textModel.time = formatter.string(from: date)
            nav.dateString = textModel.createdDate
            
            var dateStamp:TimeInterval = date.timeIntervalSince1970
            
            var dateSt:Int = Int(dateStamp)
            print("ssssss")
            print(dateSt)
            
            timeStampToString(timeStamp: String(dateSt))
            
            
        }
    }
    
    func timeStampToString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日 EEEE"
        
        let date = Date(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from: date))
        return dfmatter.string(from: date)
    }
    
    
    deinit {
        print("deinit")
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


