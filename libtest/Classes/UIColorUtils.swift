//
//  UIColorHelper.swift
//  TopsProSys
//
//  Created by topscommmac01 on 2018/10/26.
//  Copyright © 2018年 com.topscommmac01. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    //  把hex颜色转为UIColor
    class func colorWithHexString(hex:String,alpha: CGFloat = 1) ->UIColor {
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) //去掉空格及换行
        if cString.count < 6 {
            return UIColor.black
        }
        if cString.hasPrefix("0x") {
            cString = cString.replacingOccurrences(of: "0x", with: "")
        }
        if cString.hasPrefix("#") {
            cString = cString.replacingOccurrences(of: "#", with: "")
        }
        if cString.count != 6 {
            return UIColor.black
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
   //颜色转换为图片
   class func imageFromColor(color: UIColor, viewSize: CGSize) -> UIImage{
        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
    
}

extension CGColor{
    class func CGColorFromRGB(rgbValue: UInt) -> CGColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
            ).cgColor
    }
}

