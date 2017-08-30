//
//  UIView+AddFunc.swift
//  Unity
//
//  Created by mgfjx on 2017/8/29.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

extension UIView {
    
    // frame cneter
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set{
            var frame = self.frame;
            frame.origin.x = CGFloat(newValue);
            self.frame = frame;
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set{
            var frame = self.frame;
            frame.origin.y = CGFloat(newValue);
            self.frame = frame;
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width;
        }
        set{
            var frame = self.frame;
            frame.size.width = CGFloat(newValue);
            self.frame = frame;
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height;
        }
        set{
            var frame = self.frame;
            frame.size.height = CGFloat(newValue);
            self.frame = frame;
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin;
        }
        set{
            var frame = self.frame;
            frame.origin = newValue;
            self.frame = frame;
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size;
        }
        set{
            var frame = self.frame;
            frame.size = newValue;
            self.frame = frame;
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x;
        }
        set{
            var center = self.center;
            center.x = CGFloat(newValue);
            self.center = center;
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y;
        }
        set{
            var center = self.center;
            center.y = CGFloat(newValue);
            self.center = center;
        }
    }
    
    // screenshot
    func snapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0);
        self.layer.render(in: UIGraphicsGetCurrentContext()!);
        let snap = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snap!;
    }
    
    // shadow
    func setLayerShadow(color: UIColor, offset: CGSize, radius: CGFloat, opacity: CGFloat) -> Void {
        self.layer.shadowColor = color.cgColor;
        self.layer.shadowOffset = offset;
        self.layer.shadowRadius = radius;
        self.layer.shadowOpacity = Float(opacity);
        self.layer.shouldRasterize = true;
        self.layer.rasterizationScale = UIScreen.main.scale;
    }
    
    func removeAllSubViews() -> Void {
        while self.subviews.count != 0 {
            self.subviews.last?.removeFromSuperview();
        }
    }
    
}
