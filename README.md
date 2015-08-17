# HexColor
[![Build Status](https://travis-ci.org/artman/HexColor.svg)](https://travis-ci.org/artman/HexColor)

HexColor is a simple extension that lets you initialize UIColors the way they were meant to be initialized: With hex integer values.

## Requirements

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 6.3 (Swift 1.2)

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

## Installation

To manually install, copy the HexColor.swift file over to your project.

### Carthage

To integrate Signals into your project using Carthage, add the following to your `Cartfile`:

```ruby
github "artman/HexColor" ~> 1.0
```

## Contribute

To contribute, just fork, branch & send a pull request. To get in touch, hit me up on Twitter [@artman](http://twitter.com/artman)

## License

HexColor is released under an MIT license. See the LICENSE file for more information
