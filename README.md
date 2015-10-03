# HexColor
[![Build Status](https://travis-ci.org/artman/HexColor.svg)](https://travis-ci.org/artman/HexColor)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/HxColor.svg)](https://cocoapods.org/pods/HxColor)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![License](https://img.shields.io/cocoapods/l/HxColor.svg?style=flat&color=gray)
![Platform](https://img.shields.io/cocoapods/p/HxColor.svg?style=flat)
[![Twitter](https://img.shields.io/badge/twitter-@artman-blue.svg?style=flat)](http://twitter.com/artman)

HexColor is a simple extension that lets you initialize UIColors the way they were meant to be initialized: With hex integer values.

## Requirements

- iOS 7.0
- Xcode 7.0 (Swift 2.0)

## Installation

To use HexColor with a project targeting iOS 7, simply copy `HexColor.swift` into your project.

### CocoaPods

CocoaPods 0.36 adds supports for Swift and embedded frameworks. To integrate HexColor into your project add the following to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'HxColor', '~> 2.0'
```

### Carthage

To integrate Signals into your project using Carthage add the following to your `Cartfile`:

```ruby
github "artman/HexColor" ~> 2.0
```

## Quick start

```
myLabel.textColor = UIColor(0xFFFFFF) // Let there be white
myView.backgroundColor = UIColor(0x0f126f) // Deep blue

// Yay, finally you can stop to use this crap:
// UIColor.colorWithRed(0x0f/255.0, green: 0x12/255.0, blue: 0x65/255.0, 1.0)
```

Need colors with alpha? No worries:

```
myLabel.textColor = UIColor(0xFF0000).alpha(0.5) // Red with 50% opacity
myLabel.textColor = UIColor(0xFF0000, alpha: 0.5) // Another way to do this
```

You can also mix two colors together easily:

```
myLabel.textColor = UIColor(0x3377FF).mixWithColor(0xFF2222, amount: 0.25)
```

## Contribute

To contribute, just fork, branch & send a pull request. To get in touch, hit me up on Twitter [@artman](http://twitter.com/artman)

## License

HexColor is released under an MIT license. See the LICENSE file for more information
