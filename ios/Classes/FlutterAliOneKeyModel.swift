//
//  FlutterAliOneKeyModel.swift
//  flutter_ali_onekeylogin
//
//  Created by Mac on 2022/5/10.
//

import UIKit
import ATAuthSDK

class FlutterAliOneKeyModel: NSObject {

    var logoSize:Float?
    var logoTop:Float?
    var logoImg:String?
    var slogan:String?
    var sloganSize:Float?
    var sloganColor:String?
    var loginBtnImgs:String?
    var loginBtnTitle:String?
    var loginBtnTitleSize:Float?
    var loginBtnTextColor:String? //"#666666"
    var otherWayTitle:String?
    var otherWayTitleSize:Float?
    var otherWayTitleColor:String?
    var thirdBtnImgs:String? //",分割的img"
    var vendorPrivacyPrefix:String?
    var vendorPrivacySuffix:String?
    /// 设置开发者隐私条款 1 名称和URL(名称，url) String,String
    var   appPrivacyOne:String?
      /// 设置开发者隐私条款 2 名称和URL(名称，url) String,String
    var appPrivacyTwo:String?
      /// 设置隐私条款名称颜⾊(基础⽂字颜⾊，协议⽂字颜⾊)
    var appPrivacyColor:String?
    
    func covertToAliModel() -> TXCustomModel {
        let model = TXCustomModel()
        model.supportedInterfaceOrientations = .portrait
        model.navColor = UIColor.white
        model.navBackImage = UIImage(named: "close")!
        model.navTitle = NSAttributedString()
        let attStr = NSAttributedString(string: slogan ?? TXCommonUtils.getCurrentCarrierName(), attributes: [.foregroundColor:getColor(hex: sloganColor ?? "#B2B2B2"),.font:UIFont.systemFont(ofSize:CGFloat(sloganSize ?? 14) , weight: .medium)])
        
        model.sloganText = attStr
        model.privacyNavColor = UIColor.white
        model.privacyNavTitleColor = getColor(hex: "#333333")
//        model.navIsHidden = true
        model.navIsHiddenAfterLoginVCDisappear = true
        model.logoIsHidden = true
        model.changeBtnIsHidden = true
        model.checkBoxImages = [UIImage(named: "unselect")!,UIImage(named: "selected")!]
        model.loginBtnText = NSAttributedString(string: loginBtnTitle ?? "一键登录", attributes: [.foregroundColor:getColor(hex: loginBtnTextColor ?? "#ffffff"),.font:UIFont.systemFont(ofSize: CGFloat(loginBtnTitleSize ?? 18), weight: .medium)])
        let arr = loginBtnImgs?.components(separatedBy: ",")
        if arr?.count == 3 {
            model.loginBtnBgImgs = [UIImage(named: arr![0])!,UIImage(named: arr![1])!,UIImage(named: arr![2])!]
        }
        
        let customView = FFOneKeyLoginView(frame: CGRect(x: 0, y: 464.auto(), width: J.SCREEN_WIDTH, height: 160))
        customView.delegate = self
        model.customViewBlock = { superCustomView in
            superCustomView.addSubview(customView)
            superCustomView.addSubview(self.otherNumBtn)
        }
        model.privacyOne = ["《用户协议》","https://feiyu.sanxininfo.cn/wap/agreement/1"]
        model.privacyTwo = ["《隐私政策》","https://feiyu.sanxininfo.cn/wap/agreement/2"]
        model.privacyColors = [UIColor.qd_mainText,UIColor.qd_tint]
        model.privacyOperatorPreText = "《";
        model.privacyOperatorSufText = "》";
        model.privacyPreText = "登录或注册表示同意"
        model.privacySufText = ""
        model.privacyFont = SYSTEMFONT(fontsize: 10)
        
        model.sloganFrameBlock = {
            (screenSize,superViewSize,frame) -> CGRect in
            var tempFrame = frame
            tempFrame.origin.y =  J.NavigationContentTopConstant+10
            return tempFrame
        }
        model.numberFrameBlock = {
            (screenSize,superViewSize,frame) -> CGRect in
            var tempFrame = frame
            tempFrame.origin.y =  J.NavigationContentTopConstant+109
            return tempFrame
        }
        model.privacyFrameBlock = {
            (screenSize,superViewSize,frame) -> CGRect in
            var tempFrame = frame
            tempFrame.origin.y =  J.NavigationContentTopConstant+162
            return tempFrame
        }
        model.loginBtnFrameBlock = {
            (screenSize,superViewSize,frame) -> CGRect in
            var tempFrame = frame
            tempFrame.origin.y =  J.NavigationContentTopConstant+211
            return tempFrame
        }
        model.customViewLayoutBlock = {[weak self] (screenSize, contentViewFrame, navFrame, titleBarFrame, logoFrame, sloganFrame, numberFrame, loginFrame, changeBtnFrame, privacyFrame)  in
            customView.frame = CGRect(x: 0, y: loginFrame.size.height+loginFrame.origin.y+80.auto(), width: J.SCREEN_WIDTH, height: 160)
            self?.otherNumBtn.frame = CGRect(x: loginFrame.origin.x, y: loginFrame.origin.y+loginFrame.size.height + 16, width: loginFrame.size.width, height: 50)
        }
        return model
    }
    class func getRootViewController() -> UIViewController? {
        let window = UIApplication.shared.delegate?.window
        return window??.rootViewController
    }
    class func getCurrent
    fileprivate func getColor(hex: String) -> UIColor? {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0

        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                // Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8
                return nil
            }
        } else {
            // "Scan hex error
            return nil
        }
       
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
    }
}
