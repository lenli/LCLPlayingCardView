//
//  PlayingCardView.m
//  BlackjackWithViews
//
//  Created by Leonard Li on 2/20/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (id)initWithFrame:(CGRect)frame withRank:(NSString *)rank withSuit:(NSString *)suit isVisible:(BOOL)isVisible
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawCard];
        
        // Define Card Label properties
        _fontFamily = @"TimesNewRomanPS-BoldMT";
        _rankFontSize = 12;
        _suitFontSize = 16;
        _labelColor = [UIColor blackColor];
        _suit = suit;
        _rank = rank;
        _isVisible = isVisible;
        
        if (isVisible) {
            [self updateSuitAndRank];
        } else {
            UIGraphicsBeginImageContext(self.frame.size);
            [[UIImage imageNamed:@"cardBack.jpg"] drawInRect:self.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.backgroundColor = [UIColor colorWithPatternImage:image];
        }


    }
    return self;
}

- (void)createLabelForCardWithFrame:(CGRect)frame withText:(NSString *)text withFontSize:(NSInteger)fontSize withTransformation:(CGFloat)angleAsRadians
{
    UILabel *newLabel = [[UILabel alloc] initWithFrame:frame];
    newLabel.text = text;
    newLabel.textAlignment = NSTextAlignmentCenter;
    newLabel.textColor = self.labelColor;
    newLabel.font = [UIFont fontWithName:self.fontFamily size:fontSize];
    if (angleAsRadians != 0) {
        [newLabel setTransform:CGAffineTransformMakeRotation(angleAsRadians)];
    }
    [self addSubview:newLabel];
}

- (void)drawCard
{
    // Create Rounded Borders on Card
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
    self.backgroundColor = [UIColor whiteColor];
}

- (void)updateSuitAndRank
{
    // Customize Label Alignment on Card
    NSInteger cardHeight = self.bounds.size.height;
    NSInteger cardWidth = self.bounds.size.width;
    NSInteger cardLabelWidth = 20;
    NSInteger cardLabelHeight = 20;
    
    NSInteger xOffset = 0;
    NSInteger yOffset = 0;
    NSInteger yPadding = 10;
    
    CGRect topRankFrame = CGRectMake(xOffset, yOffset, cardLabelWidth, cardLabelHeight);
    CGRect topSuitFrame = CGRectMake(xOffset, yOffset + yPadding, cardLabelWidth, cardLabelHeight);
    CGRect bottomRankFrame = CGRectMake(cardWidth-cardLabelWidth-xOffset, cardHeight-yOffset-cardLabelHeight, cardLabelWidth, cardLabelHeight);
    CGRect bottomSuitFrame = CGRectMake(cardWidth-cardLabelWidth-xOffset, cardHeight-yOffset-yPadding-cardLabelHeight, cardLabelWidth, cardLabelHeight);
    
    [self createLabelForCardWithFrame:topRankFrame withText:self.rank withFontSize:self.rankFontSize withTransformation:0];
    [self createLabelForCardWithFrame:topSuitFrame withText:self.suit withFontSize:self.suitFontSize withTransformation:0];
    [self createLabelForCardWithFrame:bottomRankFrame withText:self.rank withFontSize:self.rankFontSize withTransformation:M_PI];
    [self createLabelForCardWithFrame:bottomSuitFrame withText:self.suit withFontSize:self.suitFontSize withTransformation:M_PI];
}

- (void)revealCard
{
    self.isVisible = YES;
    self.backgroundColor = [UIColor whiteColor];
    [self updateSuitAndRank];
}

@end
