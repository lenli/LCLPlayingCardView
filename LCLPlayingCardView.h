//
//  LCLPlayingCardView.h
//
//  Created by Leonard Li on 2/20/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const SUIT_FONT_FAMILY;
extern NSString *const RANK_FONT_FAMILY;
extern NSInteger const RANK_FONT_SIZE;
extern NSInteger const SUIT_FONT_SIZE;
extern NSInteger const RED_COLOR;
extern NSInteger const CARD_COLOR;

@interface LCLPlayingCardView : UIView

// Card Properties
@property (strong, nonatomic) NSString *suit;
@property (strong, nonatomic) NSString *rank;
@property (strong, nonatomic) UIView *cardFrontSubview;
@property (strong, nonatomic) UIView *cardBackSubview;
@property (strong, nonatomic) NSSet *suitSet;
 
// Card Label Properties
@property (weak, nonatomic) NSString *suitFontFamily;
@property (weak, nonatomic) NSString *rankFontFamily;
@property (weak, nonatomic) UIColor *labelColor;
@property (nonatomic) NSInteger suitFontSize;
@property (nonatomic) NSInteger rankFontSize;
@property (nonatomic) BOOL isVisible;

// Card Methods
- (id)initWithFrame:(CGRect)frame withRank:(NSString *)rank withSuit:(NSString *)suit isVisible:(BOOL)isVisible;
- (void)flipCard;
- (void)tiltCardWithDegrees:(float)degreesOptional;
- (void)tiltCardRandomly;

@end

