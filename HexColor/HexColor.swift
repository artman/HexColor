//
//  HexColor.swift
//  HexColor
//
//  Created by Tuomas Artman on 1.9.2014.
//  Copyright (c) 2014 Tuomas Artman. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    /// A UIColor representing the color values defined by the Integer. The lowest three bytes of the Int are used to
    /// represent the individual RGB values for the color, where the least significant byte defines blue.
    ///
    /// For example, (0xFF0000).UIColor is red and (0x0000FF).UIColor is blue.
    public var UIColor: UIKit.UIColor {
        let components = getColorComponents(self)
        return UIKit.UIColor(red: components.red, green: components.green, blue: components.blue, alpha: 1.0)
    }
    
    /// A CGColor representing the color values defined by the Integer. The lowest three bytes of the Int are used to
    /// represent the individual RGB values for the color, where the least significant byte defines blue.
    ///
    /// For example, (0xFF0000).CGColor is red and (0x0000FF).CGColor is blue.
    public var CGColor: CGColorRef {
        return self.UIColor.CGColor
    }
    
    /// A UIColor representing the color values defined by the Integer with the given alpha. The lowest three bytes 
    /// of the Int are used to represent the individual RGB values for the color, where the least significant 
    /// byte defines blue.
    ///
    /// For example, (0xFF0000).alpha(0.5) defines a red color with 50% opacity.
    ///
    /// :returns: A UIColor representation of the Int with the given alpha value
    public func alpha(value:CGFloat) -> UIKit.UIColor {
        return self.UIColor.alpha(value)
    }
    
    /// A UIColor representing the color values defined by the Integer mixed with another UIColor. The lowest three bytes
    /// of the Int are used to represent the individual RGB values for the color, where the least significant
    /// byte defines blue.
    ///
    /// :param: color The color to mix with
    /// :param: amount The amount (0-1) to mix the new color in.
    /// :returns: A new UIColor instance representing the resulting color
    public func mixWithColor(color:UIKit.UIColor, amount:Float) -> UIKit.UIColor {
        return self.UIColor.mixWithColor(color, amount: amount)
    }
}

extension UIColor : IntegerLiteralConvertible {
    
    /// Lets you use Integer literals in UIColor assigments without the need to convert it explicitly.
    ///
    /// For example, use myView.backgroundColor = 0xFF0000 instead of myView.backgroundColor = (0xFF0000).UIColor
    public class func convertFromIntegerLiteral(value: IntegerLiteralType) -> Self {
        let components = getColorComponents(value)

        return self(red: components.red, green: components.green, blue: components.blue, alpha: 1.0)
    }
    
    /// Creates a new color with the given alpha value
    ///
    /// For example, (0xFF0000).alpha(0.5) defines a red color with 50% opacity.
    ///
    /// :returns: A UIColor representation of the Int with the given alpha value
    public func alpha(value:CGFloat) -> UIKit.UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIKit.UIColor(red: red, green: green, blue: blue, alpha: value)
    }
    
    /// Mixes the color with another color
    ///
    /// :param: color The color to mix with
    /// :param: amount The amount (0-1) to mix the new color in.
    /// :returns: A new UIColor instance representing the resulting color
    public func mixWithColor(color:UIColor, amount:Float) -> UIColor {
        var comp1: [CGFloat] = Array(count: 4, repeatedValue: 0);
        self.getRed(&comp1[0], green: &comp1[1], blue: &comp1[2], alpha: &comp1[3])
        
        var comp2: [CGFloat] = Array(count: 4, repeatedValue: 0);
        color.getRed(&comp2[0], green: &comp2[1], blue: &comp2[2], alpha: &comp2[3])
        
        var comp: [CGFloat] = Array(count: 4, repeatedValue: 0);
        for i in 0...3 {
            comp[i] = comp1[i] + (comp2[i] - comp1[i]) * CGFloat(amount)
        }
        
        return UIColor(red:comp[0], green: comp[1], blue: comp[2], alpha: comp[3])
    }
}

private func getColorComponents(value: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
    let r = CGFloat(value >> 16 & 0xFF) / 255.0
    let g = CGFloat(value >> 8 & 0xFF) / 255.0
    let b = CGFloat(value & 0xFF) / 255.0
    
    return (r, g, b)
}
