//
//  PlayingCardView.m
//  BlackjackWithViews
//
//  Created by Leonard Li on 2/20/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Customize Card Label Alignment
        NSInteger cardHeight = self.bounds.size.height;
        NSInteger cardWidth = self.bounds.size.width;
        
        NSInteger xPadding = 3;
        NSInteger yPadding = 15;
        
        NSInteger topOriginXOffset = 5;
        NSInteger topOriginYOffset = 5;
        NSInteger bottomOriginYOffset = cardHeight - 25;
        
        NSInteger cardLabelWidth = 50;
        NSInteger cardLabelHeight = 20;
        
        NSString *cardFontFamily = @"TimesNewRomanPS-BoldMT";
        CGFloat cardRankFontSize = 16;
        CGFloat cardSuitFontSize = 20;
        
        // Rounded Borders
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        
        // Set Borders
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        
        // Set Background Color of Card
        self.backgroundColor = [UIColor whiteColor];
        
        // Create Label for Top Left Rank
        UILabel *topRankLabel = [[UILabel alloc] initWithFrame:CGRectMake(topOriginXOffset, topOriginYOffset, cardLabelWidth, cardLabelHeight)];
        topRankLabel.text = self.rank;
        [topRankLabel setFont:[UIFont fontWithName:cardFontFamily size:cardRankFontSize]];
        topRankLabel.textColor = [UIColor blackColor];
        [self addSubview:topRankLabel];
        
        // Create Label for Top Left Suit
        UILabel *topSuitLabel = [[UILabel alloc] initWithFrame:CGRectMake(topOriginXOffset+xPadding, topOriginYOffset + yPadding, cardLabelWidth, cardLabelHeight)];
        topSuitLabel.text = self.suit;
        topSuitLabel.textColor = [UIColor blackColor];
        topSuitLabel.font = [UIFont fontWithName:cardFontFamily size:cardSuitFontSize];
        [self addSubview:topSuitLabel];
        
        // Create Label for Bottom Right Rank
        UILabel *bottomRankLabel = [[UILabel alloc] initWithFrame:CGRectMake(-topOriginXOffset, bottomOriginYOffset, cardLabelWidth, cardLabelHeight)];
        bottomRankLabel.text = self.rank;
        [bottomRankLabel setFont:[UIFont fontWithName:cardFontFamily size:cardRankFontSize]];
        bottomRankLabel.textColor = [UIColor blackColor];
        [bottomRankLabel setTransform:CGAffineTransformMakeRotation(M_PI)];
        [self addSubview:bottomRankLabel];
        
        // Create Label for Bottom Right Suit
        UILabel *bottomSuitLabel = [[UILabel alloc] initWithFrame:CGRectMake(-topOriginXOffset-xPadding, bottomOriginYOffset -yPadding, cardLabelWidth, cardLabelHeight)];
        bottomSuitLabel.text = self.suit;
        [bottomSuitLabel setFont:[UIFont fontWithName:cardFontFamily size:cardSuitFontSize]];
        bottomSuitLabel.textColor = [UIColor blackColor];
        [bottomSuitLabel setTransform:CGAffineTransformMakeRotation(M_PI)];
        [self addSubview:bottomSuitLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
