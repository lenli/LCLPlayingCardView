LCLPlayingCardView
===============

LCLPlayingCardView is a simple, but beautiful playing card implemented as a UIView.  Available as a [CocoaPod](http://cocoapods.org).

See [CocoaDocs documentation](http://cocoadocs.org/docsets/LCLPlayingCardView/1.0.1/Classes/LCLPlayingCardView.html) for more details.


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
LCLPlayingCardView *card1 = [LCLPlayingCardView cardWithPoint:CGPointMake(60, 100)
                                                    withRank:1
                                                    withSuit:LCLPlayingCardClub
                                                   isVisible:YES];
[self.view addSubview:card1];

LCLPlayingCardView *card2 = [LCLPlayingCardView cardWithPoint:CGPointMake(160, 100)
                                                    withRank:2
                                                    withSuit:LCLPlayingCardDiamond
                                                   withColor:[UIColor redColor]
                                                    withText:@"RE"
                                                   isVisible:NO];
[self.view addSubview:card2];
```

Initialization with Frame (custom width and height):
```ios
LCLPlayingCardView *card3 = [LCLPlayingCardView cardWithFrame:CGRectMake(60, 250, 80, 112)
                                                     withRank:3
                                                     withSuit:LCLPlayingCardHeart
                                                    isVisible:YES];
[self.view addSubview:card3];

LCLPlayingCardView *card4 = [LCLPlayingCardView cardWithFrame:CGRectMake(160, 250, 80, 112)
                                                     withRank:4
                                                     withSuit:LCLPlayingCardSpade
                                                    withColor:[UIColor brownColor]
                                                     withText:@"BR"
                                                    isVisible:NO];
[self.view addSubview:card4];
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
- Allow initialization of cardback color and text

##Future Improvements
- Provide animation method
- Provide presets for different sized cards (small, medium, large)
- Allow for card fonts to automatically scale just by specifying card width and height
- Externally manage back of card image vs solid color

