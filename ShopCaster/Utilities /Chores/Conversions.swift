//
//  Conversions.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/25/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

extension UIColor {
    static func FromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red:    CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:   CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha:  CGFloat(1.0)
        );
    }
}

extension CGFloat {
    public func degreesToRadians(degrees: CGFloat) -> CGFloat { return degrees * CGFloat.pi / 180; }
    public func radiansToDegress(radians: CGFloat) -> CGFloat { return radians * 180 / CGFloat.pi; }
}

extension String {
    public func sizeOfString(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(attributes: [NSFontAttributeName: font]);
    }
}


