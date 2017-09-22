//
//  Copyright (c) 2014-2017 Tuomas Artman. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Initializes UIColor with an integer.
    ///
    /// - parameter value: The integer value of the color. E.g. `0xFF0000` is red, `0x0000FF` is blue.
    public convenience init(_ value: Int) {
        let components = UIColor.getColorComponents(value)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: 1.0)
    }
    
    /// Initializes UIColor with an integer and alpha value.
    ///
    /// - parameter value: The integer value of the color. E.g. `0xFF0000` is red, `0x0000FF` is blue.
    /// - parameter alpha: The alpha value.
    public convenience init(_ value: Int, alpha: CGFloat) {
        let components = UIColor.getColorComponents(value)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }
    
    /// Creates a new color with the given alpha value.
    ///
    /// For example, `UIColor(0xFF0000).alpha(0.5)` defines a red color with 50% opacity.
    ///
    /// - returns: A UIColor representation of the Int with the given alpha value.
    public func alpha(_ value: CGFloat) -> UIKit.UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIKit.UIColor(red: red, green: green, blue: blue, alpha: value)
    }
    
    /// Mixes the color with another color.
    ///
    /// - parameter color: The color to mix with.
    /// - parameter amount: The amount (0-1) to mix the new color in.
    /// - returns: A new UIColor instance representing the resulting color.
    public func mix(with color: UIColor, amount: Float) -> UIColor {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    
        r1 = r1 + (r2 - r1) * CGFloat(amount)
        g1 = g1 + (g2 - g1) * CGFloat(amount)
        b1 = b1 + (b2 - b1) * CGFloat(amount)
        a1 = a1 + (a2 - a1) * CGFloat(amount)
            
        return UIColor(red: r1, green: g1, blue: b1, alpha: a1)
    }

    // MARK: - Private interface
    
    private static func getColorComponents(_ value: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        let r = CGFloat(value >> 16 & 0xFF) / 255.0
        let g = CGFloat(value >> 8 & 0xFF) / 255.0
        let b = CGFloat(value & 0xFF) / 255.0
        
        return (r, g, b)
    }
}
