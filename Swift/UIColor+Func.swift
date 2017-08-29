//
//  UIColor+Func.swift
//  Unity
//
//  Created by mgfjx on 2017/8/29.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

extension UIColor {
    // MARK: hex color
    class func color(hexNumber: UInt32, alpha: CGFloat) -> UIColor {
        if (hexNumber > 0xFFFFFF) {return UIColor.black};
        
        let red   = CGFloat(((hexNumber >> 16) & 0xFF)) / 255.0;
        let green = CGFloat(((hexNumber >> 8) & 0xFF)) / 255.0;
        let blue  = CGFloat((hexNumber & 0xFF)) / 255.0;
        
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: alpha);
        return color;
    }
    
    class func color(hexString: String, alpha: CGFloat) -> UIColor {
        let defaultColor = UIColor.clear;
        
        if hexString.isEmpty {
            return defaultColor;
        }
        
        var hexStr = hexString.uppercased();
        
        if hexStr.characters.count < 6 {return defaultColor;}
        if hexStr.hasPrefix("#") {
            hexStr = hexStr.substring(from: "#".endIndex);
        }
        if hexStr.hasPrefix("0X") {
            hexStr = hexStr.substring(from: "0X".endIndex);
        }
        
        guard let regular = try?NSRegularExpression.init(pattern: "[^A-F|^0-9]", options: .caseInsensitive) else {
            return defaultColor;
        }
        let results = regular.matches(in: hexStr, options: .reportCompletion, range: NSMakeRange(0, hexStr.characters.count));
        if results.count > 0 {return defaultColor;}
        
        let scanner = Scanner.init(string: hexStr);
        let hexNumber = UnsafeMutablePointer<UInt32>.allocate(capacity: 0);
        if !scanner.scanHexInt32(hexNumber) {
            return defaultColor;
        }
        let hex = hexNumber.pointee;
        
        return UIColor.color(hexNumber: hex, alpha: alpha);
    }
    
    class func color(hexString: String) -> UIColor {
        return UIColor.color(hexString: hexString, alpha: 1.0);
    }
    
    // MARK: random color
    class func randomColor(alpha: CGFloat) -> UIColor {
        let r = CGFloat(arc4random()%255)/255.0;
        let g = CGFloat(arc4random()%255)/255.0;
        let b = CGFloat(arc4random()%255)/255.0;
        return UIColor.init(red: r, green: g, blue: b, alpha: alpha);
    }
    
    class func randomColor() -> UIColor {
        return UIColor.randomColor(alpha: 1.0);
    }
    
    func string() -> String {
        let cgColor = self.cgColor;
        
        var red = 0, green = 0, blue = 0;
        
        let size = cgColor.numberOfComponents;
        if (size == 4) {
            let components = cgColor.components;
            red = Int(floor(components![0] * 255));
            green = Int(floor(components![1] * 255));
            blue = Int(floor(components![2] * 255));
        }
        
        if(size == 2){
            let components = cgColor.components;
            red = Int(floor(components![0] * 255));
            green = red;
            blue = red;
        }
        
        let hexNumber = (red << 16) | (green << 8) | blue;
        let ch = UnsafeMutablePointer<Int8>.allocate(capacity: 0);
        _ = snprintf(ptr: ch, 7, "%06X", hexNumber);
        
        let str = String.init(cString: ch);
        
        return str;
    }
    
    
}
