//
//  HexColorTests.swift
//  HexColorTests
//
//  Created by Tuomas Artman on 1.9.2014.
//  Copyright (c) 2014 Tuomas Artman. All rights reserved.
//

import UIKit
import XCTest

class HexColorTests: XCTestCase {
    
    func testConversion() {
        var color: UIColor = 0xFFEEDD

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 0xFF / 255.0, "Red component")
        XCTAssertEqual(green, 0xEE / 255.0, "Green component")
        XCTAssertEqual(blue, 0xDD / 255.0, "Blue component")
    }
    
    func testAssignment() {
        let label = UILabel()
        label.textColor = 0xFFEEDD
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        label.textColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 0xFF / 255.0, "Red component")
        XCTAssertEqual(green, 0xEE / 255.0, "Green component")
        XCTAssertEqual(blue, 0xDD / 255.0, "Blue component")
    }
    
    func testAlpha() {
        var color: UIColor = (0xFFEEDD).alpha(0.1)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 0xFF / 255.0, "Red component")
        XCTAssertEqual(green, 0xEE / 255.0, "Green component")
        XCTAssertEqual(blue, 0xDD / 255.0, "Blue component")
        XCTAssertEqual(alpha, 0.1, "Alpha component")
    }
    
    func testCGColor() {
        var layer = CALayer()
        layer.shadowColor = (0xFFEEDD).CGColor

        let components = CGColorGetComponents(layer.shadowColor)
        XCTAssertEqual(components[0], 0xFF / 255.0, "Red component")
        XCTAssertEqual(components[1], 0xEE / 255.0, "Green component")
        XCTAssertEqual(components[2], 0xDD / 255.0, "Blue component")
        XCTAssertEqual(components[3], 0xFF / 255.0, "Alpha component")
        
        layer.backgroundColor = (0x223344).alpha(0.5).CGColor
        
        let components2 = CGColorGetComponents(layer.backgroundColor)
        XCTAssertEqual(components2[0], 0x22 / 255.0, "Red component")
        XCTAssertEqual(components2[1], 0x33 / 255.0, "Green component")
        XCTAssertEqual(components2[2], 0x44 / 255.0, "Blue component")
        XCTAssertEqual(components2[3], 0.5, "Alpha component")
    }
}
