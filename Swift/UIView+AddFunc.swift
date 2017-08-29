//
//  UIView+AddFunc.swift
//  Unity
//
//  Created by mgfjx on 2017/8/29.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

extension UIView {
    
    func x() -> CGFloat {
        return self.frame.origin.x;
    }
    
    func setX(x: CFloat) -> Void {
        var frame = self.frame;
        frame.origin.x = CGFloat(x);
        self.frame = frame;
    }
    
    func y() -> CGFloat {
        return self.frame.origin.y;
    }
    
    func setY(y: CFloat) -> Void {
        var frame = self.frame;
        frame.origin.y = CGFloat(y);
        self.frame = frame;
    }
    
    func width() -> CGFloat {
        return self.frame.size.width;
    }
    
    func setWidth(width: CFloat) -> Void {
        var frame = self.frame;
        frame.size.width = CGFloat(width);
        self.frame = frame;
    }
    
    func height() -> CGFloat {
        return self.frame.size.height;
    }
    
    func setHeight(height: CFloat) -> Void {
        var frame = self.frame;
        frame.size.height = CGFloat(height);
        self.frame = frame;
    }
    
    func origin() -> CGPoint {
        return self.frame.origin;
    }
    
    func setOrigin(origin: CGPoint) -> Void {
        var frame = self.frame;
        frame.origin = origin;
        self.frame = frame;
    }
    
    func size() -> CGSize {
        return self.frame.size;
    }
    
    func setSize(size: CGSize) -> Void {
        var frame = self.frame;
        frame.size = size;
        self.frame = frame;
    }
    
    func centerX() -> CGFloat {
        return self.center.x;
    }
    
    func setCenterX(centerX: CGFloat) -> Void {
        var center = self.center;
        center.x = CGFloat(centerX);
        self.center = center;
    }
    
    func centerY() -> CGFloat {
        return self.center.y;
    }
    
    func setCenterY(centerY: CGFloat) -> Void {
        var center = self.center;
        center.x = CGFloat(centerY);
        self.center = center;
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
