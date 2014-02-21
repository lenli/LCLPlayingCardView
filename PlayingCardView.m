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
        NSInteger cardHeight = cardView.bounds.size.height;
        NSInteger cardWidth = cardView.bounds.size.width;
        NSInteger cardLabelWidth = 20;
        NSInteger cardLabelHeight = 20;

        NSInteger xOffset = 0;
        NSInteger yOffset = 0;
        NSInteger yPadding = 10;

        NSString *cardFontFamily = @"TimesNewRomanPS-BoldMT";
        CGFloat cardRankFontSize = 12;
        CGFloat cardSuitFontSize = 16;
        
        // Rounded Borders
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        
        // Set Borders
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        
        // Set Background Color of Card
        self.backgroundColor = [UIColor whiteColor];
        
        // Create Label for Top Left Rank
        UILabel *topRankLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, yOffset, cardLabelWidth, cardLabelHeight)];
//      topRankLabel.layer.borderWidth = 1;
//      topRankLabel.layer.borderColor = [UIColor redColor].CGColor;
        topRankLabel.text = @"10";
        topRankLabel.textAlignment = NSTextAlignmentCenter;
        [topRankLabel setFont:[UIFont fontWithName:cardFontFamily size:cardRankFontSize]];
        topRankLabel.textColor = [UIColor blackColor];
        [cardView addSubview:topRankLabel];
        
        // Create Label for Top Left Suit
        UILabel *topSuitLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, yOffset + yPadding, cardLabelWidth, cardLabelHeight)];
//      topSuitLabel.layer.borderWidth = 1;
//      topSuitLabel.layer.borderColor = [UIColor redColor].CGColor;
        topSuitLabel.text = @"♠";
        topSuitLabel.textAlignment = NSTextAlignmentCenter;
        topSuitLabel.textColor = [UIColor blackColor];
        topSuitLabel.font = [UIFont fontWithName:cardFontFamily size:cardSuitFontSize];
        [cardView addSubview:topSuitLabel];
        
        // Create Label for Bottom Right Rank
        UILabel *bottomRankLabel = [[UILabel alloc] initWithFrame:CGRectMake(cardWidth-cardLabelWidth-xOffset, cardHeight-yOffset-cardLabelHeight, cardLabelWidth, cardLabelHeight)];
//      bottomRankLabel.layer.borderWidth = 1;
//      bottomRankLabel.layer.borderColor = [UIColor redColor].CGColor;
        bottomRankLabel.text = @"10";
        bottomRankLabel.textAlignment = NSTextAlignmentCenter;
        bottomRankLabel.textColor = [UIColor blackColor];
        [bottomRankLabel setFont:[UIFont fontWithName:cardFontFamily size:cardRankFontSize]];
        [bottomRankLabel setTransform:CGAffineTransformMakeRotation(M_PI)];
        [cardView addSubview:bottomRankLabel];
        
        // Create Label for Bottom Right Suit
        UILabel *bottomSuitLabel = [[UILabel alloc] initWithFrame:CGRectMake(cardWidth-cardLabelWidth-xOffset, cardHeight-yOffset-yPadding-cardLabelHeight, cardLabelWidth, cardLabelHeight)];
//      bottomSuitLabel.layer.borderWidth = 1;
//      bottomSuitLabel.layer.borderColor = [UIColor redColor].CGColor;
        bottomSuitLabel.text = @"♠";
        bottomSuitLabel.textAlignment = NSTextAlignmentCenter;
        bottomSuitLabel.textColor = [UIColor blackColor];
        [bottomSuitLabel setFont:[UIFont fontWithName:cardFontFamily size:cardSuitFontSize]];
        [bottomSuitLabel setTransform:CGAffineTransformMakeRotation(M_PI)];
        [cardView addSubview:bottomSuitLabel];
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
