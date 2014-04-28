LCLPlayingCardView
===============

LCLPlayingCardView is a simple, but beautiful playing card implemented as a UIView.

![image](LCLPlayingCardViewScreenshot.png)

###Features:

- Lightweight:  No images for the cards -- 100% code.
- Flexible: Since the cards are code, you can tweak anything about them to fit your needs.
- Realistic Feel:  The included customizations make the cards feel more real.


##Getting Started
###Install with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects.  In your Podfile, add the following:
```ios
platform :ios, '7.0'
pod "LCLPlayingCardView", "~> 1.0"
```

###Or Manually Import Headers
```ios
#import "LCLPlayingCardView.h"
```


##Usage
###Example Usage

Initialization with Point (default width and height):
```ios
LCLPlayingCardView *card = [LCLPlayingCardView cardWithPoint:CGPointMake(20, 280)
                                                    withRank:@"2"
                                                    withSuit:@"♠"
                                                   isVisible:YES];
[self.view addSubview:card];
```

Initialization with Frame (custom width and height):
```ios
LCLPlayingCardView *card = [LCLPlayingCardView cardWithFrame:CGRectMake(20, 280, 80, 112)
                                                    withRank:@"2"
                                                    withSuit:@"♠"
                                                   isVisible:YES];
[self.view addSubview:card];
```

####Methods
```ios
- (void)flipCard;
- (void)tiltCardWithDegrees:(float)degrees
- (void)tiltCardRandomly
```

##License
LCLPlayingCardView is available under the MIT license.  See the LICENSE file for more information.  

If you like this or use this, please star/fork/watch/tweet the repo, raise issues/ideas, send me pull requests, etc. so I know to keep improving it.


##Change Log
####v1.0.2
- Add example project
- Add LCLPlayingCardSuit enum
- Allow customization of cardbacks (In progress)

##Future Improvements
- Provide animation method
- Provide presets for different sized cards (small, medium, large)
- Allow for card fonts to automatically scale just by specifying card width and height
- Externally manage back of card image vs solid color

