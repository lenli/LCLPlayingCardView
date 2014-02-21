//
//  PlayingCardView.h
//  BlackjackWithViews
//
//  Created by Leonard Li on 2/20/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (strong, nonatomic) NSString *suit;
@property (strong, nonatomic) NSString *rank;

// Visual Card Properties
@property (weak, nonatomic) NSString *fontFamily;
@property (weak, nonatomic) NSInteger *suitFontSize;
@property (weak, nonatomic) NSInteger *rankFontSize;
@property (weak, nonatomic) UIColor *labelColor;

@end
