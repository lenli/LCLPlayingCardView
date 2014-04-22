//
//  LCLPlayingCardView.h
//
//  Created by Leonard Li on 2/20/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define degreesToRadian(x) (M_PI * (x) / 180.0)

extern NSString *const SUIT_FONT_FAMILY;
extern NSString *const RANK_FONT_FAMILY;
extern NSInteger const RANK_FONT_SIZE;
extern NSInteger const SUIT_FONT_SIZE;
extern NSInteger const RED_COLOR;
extern NSInteger const CARD_COLOR;
extern NSInteger const CARD_WIDTH;
extern NSInteger const CARD_HEIGHT;

/**
 `LCLPlayingCardView` is a subclass of `UIView` that makes beautiful, but simple playing cards without requiring images -- it's 100% code.
 */

@interface PlayingCardView : UIView

// 
 ///------------------------------------------------
/// @name Card Properties
///------------------------------------------------

/**
 The playing card's suit as text (♠,♣,♥,♦)
 */
@property (strong, nonatomic) NSString *suit;
/**
 The playing card's rank (A,2,3,4,5,6,7,8,9,10,J,Q,K)
 */
@property (strong, nonatomic) NSString *rank;
/**
 The front of the playing card which displays suit and rank.
 */
@property (strong, nonatomic) UIView *cardFrontSubview;
/**
 The back of the playing card which displays the card color and perhaps text or an image.
 */
@property (strong, nonatomic) UIView *cardBackSubview;
/**
 A set containing the legal suits for a playing card (♠,♣,♥,♦)
 */
@property (strong, nonatomic) NSSet *suitSet;
 
// Card Label Properties
/**
 The playing card's suit Font Family
 */
@property (weak, nonatomic) NSString *suitFontFamily;
/**
 The playing card's rank Font Family
 */
@property (weak, nonatomic) NSString *rankFontFamily;
/**
 The playing card's label color
 */
@property (weak, nonatomic) UIColor *labelColor;
/**
 The playing card's suit Font Size
 */
@property (nonatomic) NSInteger suitFontSize;
/**
 The playing card's rank Font Size
 */
@property (nonatomic) NSInteger rankFontSize;
/**
 If playing card is visible, show the front of the card.
 If playing card is not visible, show the back of the card
 */
@property (nonatomic) BOOL isVisible;

///-----------------------------------------------------------
/// @name Initialization
///-----------------------------------------------------------

/**
 Initializes an `LCLPlayingCardView` with just a starting location `point` and use default values for width and height.
 Specify the card's `rank` and `suit`.
 If the card is `isVisible`, then the playing card shows the card's `cardFrontSubview`.
 If not visible, the playing card shows the card's `cardBackSubview`.

 @param point CGPoint of the location of the playing card.
 @param rank The rank of the playing card. (A,2,3,4,5,6,7,8,9,10,J,Q,K)
 @param suit The suit of the playing card. (♠,♣,♥,♦)
 @param isVisible Boolean flag indicating if the playing card's rank and suit are visible.
 */
- (instancetype)initWithPoint:(CGPoint)point
                     withRank:(NSString *)rank
                     withSuit:(NSString *)suit
                    isVisible:(BOOL)isVisible;

/**
 Designated initializer for `LCLPlayingCardView`.
 Specify the card's starting `frame`, `rank` and `suit`.
 If the card is `isVisible`, then the playing card shows the card's `cardFrontSubview`.
 If not visible, the playing card shows the card's `cardBackSubview`.

 @param point CGPoint of the location of the playing card.
 @param rank The rank of the playing card. (A,2,3,4,5,6,7,8,9,10,J,Q,K)
 @param suit The suit of the playing card. (♠,♣,♥,♦)
 @param isVisible Boolean flag indicating if the playing card's rank and suit are visible.
 */
- (instancetype)initWithFrame:(CGRect)frame
                     withRank:(NSString *)rank
                     withSuit:(NSString *)suit
                    isVisible:(BOOL)isVisible;

///-----------------------------------------------------------
/// @name Card Customization Methods
///-----------------------------------------------------------
/**
	Flips the card from `cardFrontSubview` to `cardBackSubview` or vice versa using a UIView animation.
  */
- (void)flipCard;
/**
	Specify the degrees for which the card is tilted
  */
- (void)tiltCardWithDegrees:(float)degrees;
/**
	Randomly tilt the card up to 5 degrees
  */
- (void)tiltCardRandomly;

@end

