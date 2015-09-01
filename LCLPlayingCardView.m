//
//  LCLPlayingCardView.m
//
//  Created by Leonard Li on 2/20/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "LCLPlayingCardView.h"


@interface LCLPlayingCardView ()
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
@property (readonly, nonatomic) NSSet *suitSet;
/**
 The text on the back of the playing card
 */
@property (strong, nonatomic) NSString *cardBackText;
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

@end

@implementation LCLPlayingCardView

// Customizing the Card
NSString *const SUIT_FONT_FAMILY = @"TimesNewRomanPS-BoldMT";
NSString *const RANK_FONT_FAMILY = @"HelveticaNeue-Light";
NSInteger const RED_COLOR = 0xe74c3c;
NSInteger const DEFAULT_CARD_COLOR = 0x45A1CD;

#pragma mark - Initialization Methods

- (instancetype)init {
    
    return [self initWithFrame:[self frameFromPoint:CGPointMake(0, 0) withCardSize:LCLPlayingCardMedium]
                  withCardSize:LCLPlayingCardMedium
              withRankFontSize:[self rankFontSizeForCardSize:LCLPlayingCardMedium]
              withSuitFontSize:[self suitFontSizeForCardSize:LCLPlayingCardMedium]
                      withRank:1
                      withSuit:LCLPlayingCardSpade
                     withColor:UIColorFromRGB(DEFAULT_CARD_COLOR)
                      withText:nil
                     isVisible:YES];
}

- (instancetype)initWithPoint:(CGPoint)point
                 withCardSize:(LCLPlayingCardSize)enumCardSize
                     withRank:(NSInteger)rank
                     withSuit:(LCLPlayingCardSuit)suit
                    withColor:(UIColor *)color
                     withText:(NSString *)text
                    isVisible:(BOOL)isVisible {
    
    return [self initWithFrame:[self frameFromPoint:CGPointMake(point.x, point.y) withCardSize:enumCardSize]
                  withCardSize:enumCardSize
              withRankFontSize:[self rankFontSizeForCardSize:enumCardSize]
              withSuitFontSize:[self suitFontSizeForCardSize:enumCardSize]
                      withRank:rank
                      withSuit:suit
                     withColor:color
                      withText:nil
                     isVisible:isVisible];
}

- (instancetype)initWithFrame:(CGRect)frame
                 withCardSize:(LCLPlayingCardSize)enumCardSize
             withRankFontSize:(NSInteger)rankFontSize
             withSuitFontSize:(NSInteger)suitFontSize
                     withRank:(NSInteger)rank
                     withSuit:(LCLPlayingCardSuit)suit
                    withColor:(UIColor *)color
                     withText:(NSString *)text
                    isVisible:(BOOL)isVisible {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialize Card
        _suit = [self getSuitStringFromLCLPlayingCardSuit:suit];
        _rank = [self convertToCardRankFromNumber:rank];
        _isVisible = isVisible;
        
        // Customize Card Label properties
        _rankFontFamily = RANK_FONT_FAMILY;
        _suitFontFamily = SUIT_FONT_FAMILY;
        _rankFontSize = rankFontSize;
        _suitFontSize = suitFontSize;
        
        NSDictionary *fontColorDictionary = @{@"♠":[UIColor blackColor],
                                              @"♣":[UIColor blackColor],
                                              @"♥": UIColorFromRGB(RED_COLOR),
                                              @"♦": UIColorFromRGB(RED_COLOR)
                                              };
        _labelColor = fontColorDictionary[_suit];
        _suitSet = [NSSet setWithArray:[fontColorDictionary allKeys]];
        
        [self setupCardWrapperViewForCardSize:enumCardSize];
        
        UIColor *backColor = (color) ? color : UIColorFromRGB(DEFAULT_CARD_COLOR);
        [self createBackSubviewWithColor:backColor];
        [self createLabelsWithText:text withCardSize:enumCardSize];
        isVisible ? [self addSubview:_cardFrontSubview] : [self addSubview:_cardBackSubview];
    }
    return self;
}


+ (instancetype)cardWithPoint:(CGPoint)point
                 withCardSize:(LCLPlayingCardSize)enumCardSize
                     withRank:(NSInteger)rank
                     withSuit:(LCLPlayingCardSuit)suit
                    isVisible:(BOOL)isVisible {
    
    return [[self alloc] initWithPoint:point
                          withCardSize:enumCardSize
                              withRank:rank
                              withSuit:suit
                             withColor:nil
                              withText:nil
                             isVisible:isVisible];
}


+ (instancetype)cardWithPoint:(CGPoint)point
                 withCardSize:(LCLPlayingCardSize)enumCardSize
                     withRank:(NSInteger)rank
                     withSuit:(LCLPlayingCardSuit)suit
                    withColor:(UIColor *)color
                     withText:(NSString *)text
                    isVisible:(BOOL)isVisible  {
    
    return [[self alloc] initWithPoint:point
                          withCardSize:enumCardSize
                              withRank:rank
                              withSuit:suit
                             withColor:color
                              withText:nil
                             isVisible:isVisible];
}

#pragma mark - Card Methods

- (void)flipCard {
    
    UIView *fromCardView, *toCardView;
    
    if (self.isVisible) {
        self.isVisible = NO;
        fromCardView = self.cardFrontSubview;
        toCardView = self.cardBackSubview;
        
    } else {
        self.isVisible = YES;
        fromCardView = self.cardBackSubview;
        toCardView = self.cardFrontSubview;
    }
    
    [self addSubview:toCardView];
    [UIView transitionFromView:fromCardView
                        toView:toCardView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:NULL];
    [fromCardView removeFromSuperview];
}

- (void)tiltCardWithDegrees:(float)degrees {
    
    [self setTransform:CGAffineTransformMakeRotation(degreesToRadian(degrees))];
}

- (void)tiltCardRandomly {
    
    srand48(time(0));
    double tilt = (drand48()*10)-5;
    if (tilt < 0) {
        tilt += 360;
    }
    [self tiltCardWithDegrees:tilt];
    
}

#pragma mark - Initialization Helper Methods

- (CGRect)frameFromPoint:(CGPoint)point
            withCardSize:(LCLPlayingCardSize)enumCardSize {
    
    CGRect cardFrame;
    switch (enumCardSize) {
        case LCLPlayingCardSmall:
            cardFrame = CGRectMake(point.x, point.y, 40, 56);
            break;
        case LCLPlayingCardMedium:
            cardFrame = CGRectMake(point.x, point.y, 80, 112);
            break;
        case LCLPlayingCardLarge:
            cardFrame = CGRectMake(point.x, point.y, 160, 224);
            break;
        default:
            cardFrame = CGRectMake(point.x, point.y, 80, 112);
            break;
    }
    return cardFrame;
}

- (NSInteger)rankFontSizeForCardSize:(LCLPlayingCardSize)enumCardSize {
    
    NSInteger rankFontSize;
    switch (enumCardSize) {
        case LCLPlayingCardSmall:
            rankFontSize = 12;
            break;
        case LCLPlayingCardMedium:
            rankFontSize = 24;
            break;
        case LCLPlayingCardLarge:
            rankFontSize = 36;
            break;
        default:
            rankFontSize = 24;
            break;
    }
    return rankFontSize;
}

- (NSInteger)suitFontSizeForCardSize:(LCLPlayingCardSize)enumCardSize {
    
    NSInteger suitFontSize;
    switch (enumCardSize) {
        case LCLPlayingCardSmall:
            suitFontSize = 12;
            break;
        case LCLPlayingCardMedium:
            suitFontSize = 16;
            break;
        case LCLPlayingCardLarge:
            suitFontSize = 36;
            break;
        default:
            suitFontSize = 16;
            break;
    }
    return suitFontSize;
}

- (void)setupCardWrapperViewForCardSize:(LCLPlayingCardSize)enumCardSize {
    
    // Set up card
    switch (enumCardSize) {
        case LCLPlayingCardSmall:
            self.layer.cornerRadius = 5.0;
            break;
        case LCLPlayingCardMedium:
            self.layer.cornerRadius = 10.0;
            break;
        case LCLPlayingCardLarge:
            self.layer.cornerRadius = 15.0;
            break;
        default:
            self.layer.cornerRadius = 10.0;
            break;
    }
    
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0;
    self.backgroundColor = [UIColor whiteColor];
}

- (void)createBackSubviewWithColor:(UIColor *)color {
    
    // Set up back of card subview with solid color
    _cardBackSubview = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width, self.frame.size.height)];
    _cardBackSubview.backgroundColor = color;
    _cardBackSubview.layer.borderColor = [UIColor whiteColor].CGColor;
    _cardBackSubview.layer.borderWidth = 5.0f;
    
    /* Set up back of card subview with an image:
     UIGraphicsBeginImageContext(_cardBackSubview.frame.size);
     [[UIImage imageNamed:@"cardBack.jpg"] drawInRect:self.bounds];
     UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     _cardBackSubview.backgroundColor = [UIColor colorWithPatternImage:image];
     */
}

- (void)createLabelsWithText:(NSString *)cardBackText
                withCardSize:(LCLPlayingCardSize)enumCardSize {
    
    // Set up front of card subview
    _cardFrontSubview = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width, self.frame.size.height)];
    NSInteger cardHeight = _cardFrontSubview.bounds.size.height;
    NSInteger cardWidth = _cardFrontSubview.bounds.size.width;
    
    NSInteger cardLabelWidth;
    NSInteger cardLabelHeight;
    NSInteger xOffset;
    NSInteger yOffset;
    NSInteger yPadding;
    NSInteger centerSuitSize;
    
    switch (enumCardSize) {
        case LCLPlayingCardSmall:
            cardLabelWidth = 15;
            cardLabelHeight = 10;
            xOffset = 0;
            yOffset = 4;
            yPadding = 10;
            centerSuitSize = _suitFontSize*2;
            break;
        case LCLPlayingCardMedium:
            cardLabelWidth = 30;
            cardLabelHeight = 20;
            xOffset = 0;
            yOffset = 8;
            yPadding = 20;
            centerSuitSize = _suitFontSize*3;
            break;
        case LCLPlayingCardLarge:
            cardLabelWidth = 50;
            cardLabelHeight = 40;
            xOffset = 0;
            yOffset = 8;
            yPadding = 32;
            centerSuitSize = _suitFontSize*3;
            break;
        default:
            cardLabelWidth = 30;
            cardLabelHeight = 20;
            xOffset = 0;
            yOffset = 8;
            yPadding = 20;
            centerSuitSize = _suitFontSize*3;
            break;
    }
    
    CGRect topRankFrame = CGRectMake(xOffset, yOffset, cardLabelWidth, cardLabelHeight);
    
    [self createLabelForCardWithFrame:topRankFrame
                             withText:self.rank
                         withFontSize:self.rankFontSize
                   withTransformation:0
                          withSubview:self.cardFrontSubview];
    
    CGRect topSuitFrame = CGRectMake(xOffset,
                                     yOffset + yPadding,
                                     cardLabelWidth,
                                     cardLabelHeight);
    
    [self createLabelForCardWithFrame:topSuitFrame
                             withText:self.suit
                         withFontSize:self.suitFontSize
                   withTransformation:0
                          withSubview:self.cardFrontSubview];
    
    CGRect bottomRankFrame = CGRectMake(cardWidth-cardLabelWidth-xOffset,
                                        cardHeight-yOffset-cardLabelHeight,
                                        cardLabelWidth,
                                        cardLabelHeight);
    
    [self createLabelForCardWithFrame:bottomRankFrame
                             withText:self.rank
                         withFontSize:self.rankFontSize
                   withTransformation:M_PI
                          withSubview:self.cardFrontSubview];
    
    CGRect bottomSuitFrame = CGRectMake(cardWidth-cardLabelWidth-xOffset,
                                        cardHeight-yOffset-yPadding-cardLabelHeight,
                                        cardLabelWidth,
                                        cardLabelHeight);
    
    [self createLabelForCardWithFrame:bottomSuitFrame
                             withText:self.suit
                         withFontSize:self.suitFontSize
                   withTransformation:M_PI
                          withSubview:self.cardFrontSubview];
    
    CGRect cardCenterFrame = CGRectMake(_cardFrontSubview.center.x-cardLabelWidth,
                                        _cardFrontSubview.center.y-(cardLabelHeight*1.1),
                                        cardLabelWidth*2,
                                        cardLabelHeight*2);
    
    [self createLabelForCardWithFrame:cardCenterFrame
                             withText:self.suit
                         withFontSize:centerSuitSize
                   withTransformation:0
                          withSubview:self.cardFrontSubview];
    
    [self createLabelForCardWithFrame:cardCenterFrame
                             withText:[self shortenString:cardBackText ToLength:2] withFontSize:self.suitFontSize*2
                   withTransformation:0
                          withSubview:self.cardBackSubview];
}


#pragma mark - Helper Methods

- (void)createLabelForCardWithFrame:(CGRect)frame
                           withText:(NSString *)text
                       withFontSize:(NSInteger)fontSize
                 withTransformation:(CGFloat)angleAsRadians
                        withSubview:(UIView *)subview {
    
    UILabel *newLabel = [[UILabel alloc] initWithFrame:frame];
    newLabel.text = text;
    newLabel.textAlignment = NSTextAlignmentCenter;
    
    if ([self.suitSet containsObject:text]) {
        newLabel.font = [UIFont fontWithName:self.suitFontFamily size:fontSize];
    } else {
        newLabel.font = [UIFont fontWithName:self.rankFontFamily size:fontSize];
    }
    
    if (angleAsRadians != 0) [newLabel setTransform:CGAffineTransformMakeRotation(angleAsRadians)];
    
    if (subview == self.cardFrontSubview) {
        newLabel.textColor = self.labelColor;
    } else {
        newLabel.textColor = [UIColor whiteColor];
    }
    [subview addSubview:newLabel];
    
}

- (NSString *)getSuitStringFromLCLPlayingCardSuit:(LCLPlayingCardSuit)enumSuit {
    
    NSString *suitString;
    switch (enumSuit) {
        case LCLPlayingCardClub:
            suitString = @"♣";
            break;
        case LCLPlayingCardDiamond:
            suitString = @"♦";
            break;
        case LCLPlayingCardHeart:
            suitString = @"♥";
            break;
        case LCLPlayingCardSpade:
            suitString = @"♠";
            break;
    }
    return suitString;
}

- (NSString *)convertToCardRankFromNumber:(NSInteger)cardNumber {
    
    NSString *rankString;
    switch (cardNumber) {
        case 1:
            rankString = @"A";
            break;
        case 11:
            rankString = @"J";
            break;
        case 12:
            rankString = @"Q";
            break;
        case 13:
            rankString = @"K";
            break;
        default:
            rankString = [NSString stringWithFormat:@"%ld",(long)cardNumber];
            break;
    }
    return rankString;
}

- (NSString *)shortenString:(NSString *)stringToShorten ToLength:(NSInteger)stringLength {
    
    return [stringToShorten substringToIndex: MIN(stringLength, [stringToShorten length])];
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@%@: %@", self.rank, self.suit, NSStringFromCGRect([super convertRect:super.frame fromView:self])];
}

@end