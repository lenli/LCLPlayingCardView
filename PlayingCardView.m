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

        // Create Rounded Borders on Card
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        self.backgroundColor = [UIColor whiteColor];

        // Define Card Label properties
        self.fontFamily = @"TimesNewRomanPS-BoldMT";
        self.rankFontSize = 12;
        self.suitFontSize = 16;
        self.labelColor = [UIColor blackColor];

        // Customize Label Alignment on Card
        NSInteger cardHeight = cardView.bounds.size.height;
        NSInteger cardWidth = cardView.bounds.size.width;
        NSInteger cardLabelWidth = 20;
        NSInteger cardLabelHeight = 20;

        NSInteger xOffset = 0;
        NSInteger yOffset = 0;
        NSInteger yPadding = 10;
        
        CGRect topRankFrame = CGRectMake(xOffset, yOffset, cardLabelWidth, cardLabelHeight);
        CGRect topSuitFrame = CGRectMake(xOffset, yOffset + yPadding, cardLabelWidth, cardLabelHeight);
        CGRect bottomRankFrame = CGRectMake(cardWidth-cardLabelWidth-xOffset, cardHeight-yOffset-cardLabelHeight, cardLabelWidth, cardLabelHeight);
        CGRect bottomSuitFrame = CGRectMake(cardWidth-cardLabelWidth-xOffset, cardHeight-yOffset-yPadding-cardLabelHeight, cardLabelWidth, cardLabelHeight);

        [self createLabelForCardWithFrame:topRankFrame withText:self.rank withFontSize:cardRankFontSize withTransformation:nil];
        [self createLabelForCardWithFrame:topSuitFrame withText:self.suit withFontSize:cardSuitFontSize withTransformation:nil];
        [self createLabelForCardWithFrame:bottomRankFrame withText:self.rank withFontSize:cardRankFontSize withTransformation:M_PI];
        [self createLabelForCardWithFrame:bottomSuitFrame withText:self.suit withFontSize:cardSuitFontSize withTransformation:M_PI];

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
    if (angleAsRadians) {
        [newLabel setTransform:CGAffineTransformMakeRotation(angleAsRadians)];
    }
    [self addSubview:newLabel];
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
