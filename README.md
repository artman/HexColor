HexColor
========

Requirements: *XCode 6.0 Beta 7*

HexColor is a simple extension that lets you define UIColors the way they were meant to be defined: As hex integer
values.

```
myLabel.textColor = 0xFFFFFF // Let there be white
myView.backgroundColor = 0x0f126f // Deep blue

// Yay, finally you can stop to use this crap:
// UIColor.colorWithRed(0x0f/255.0, green: 0x12/255.0, blue: 0x65/255.0, 1.0)

```

Need colors with alpha? No worries:

```
myLabel.textColor = (0xFF0000).alpha(0.5) // Red with 50% opacity
// Parenthesis around the Int are unfortunately required, 
// otherwise it's interpreted as a float.

```

And yes, it does CGColorRef, too:

```
layer.shadowColor = (0x223344).CGColor
layer.backgroundColor = (0xDDEEFF).alpha(0.5).CGColor

```

As a bonus, you can mix two colors together:

```
myLabel.textColor = (0x3377FF).mixWithColor(0xFF2222, amount: 0.25)

```

Installation
------------
1. Copy the HexColor.swift file over to your project.
2. Done.

