//
//  LCLMainViewController.m
//  LCLPlayingCardViewExample
//
//  Created by Leonard Li on 4/27/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "LCLMainViewController.h"
#import "LCLPlayingCardView.h"

@interface LCLMainViewController ()

@end
@implementation LCLMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    // Medium Cards
    LCLPlayingCardView *card = [[LCLPlayingCardView alloc ]init];
    [self.view addSubview:card];

    LCLPlayingCardView *card0 = [LCLPlayingCardView cardWithPoint:CGPointMake(0, 120)
                                                     withCardSize:LCLPlayingCardMedium
                                                         withRank:1
                                                         withSuit:LCLPlayingCardSpade
                                                        isVisible:YES];
    [self.view addSubview:card0];
    
    LCLPlayingCardView *card1 = [LCLPlayingCardView cardWithPoint:CGPointMake(80, 120)
                                                     withCardSize:LCLPlayingCardMedium
                                                         withRank:2
                                                        withSuit:LCLPlayingCardClub
                                                       isVisible:YES];
    [self.view addSubview:card1];
    
    LCLPlayingCardView *card2 = [LCLPlayingCardView cardWithPoint:CGPointMake(160, 120)
                                                     withCardSize:LCLPlayingCardMedium
                                                         withRank:11
                                                         withSuit:LCLPlayingCardDiamond
                                                        isVisible:YES];
    [self.view addSubview:card2];
    
    LCLPlayingCardView *card3 = [LCLPlayingCardView cardWithPoint:CGPointMake(240, 120)
                                                     withCardSize:LCLPlayingCardMedium
                                                         withRank:10
                                                         withSuit:LCLPlayingCardHeart
                                                        isVisible:YES];
    [self.view addSubview:card3];
    
    // Small Cards
    LCLPlayingCardView *card4 = [LCLPlayingCardView cardWithPoint:CGPointMake(0, 250)
                                                     withCardSize:LCLPlayingCardSmall
                                                         withRank:1
                                                         withSuit:LCLPlayingCardClub
                                                        isVisible:YES];
    [self.view addSubview:card4];
    
    LCLPlayingCardView *card5 = [LCLPlayingCardView cardWithPoint:CGPointMake(80, 250)
                                                     withCardSize:LCLPlayingCardSmall
                                                         withRank:2
                                                         withSuit:LCLPlayingCardDiamond
                                                        isVisible:YES];
    [self.view addSubview:card5];
    
    LCLPlayingCardView *card6 = [LCLPlayingCardView cardWithPoint:CGPointMake(160, 250)
                                                     withCardSize:LCLPlayingCardSmall
                                                         withRank:11
                                                         withSuit:LCLPlayingCardHeart
                                                        isVisible:YES];
    [self.view addSubview:card6];
    
    LCLPlayingCardView *card7 = [LCLPlayingCardView cardWithPoint:CGPointMake(240, 250)
                                                     withCardSize:LCLPlayingCardSmall
                                                         withRank:10
                                                         withSuit:LCLPlayingCardSpade
                                                        isVisible:YES];
    [self.view addSubview:card7];
    
    // Large Cards
    LCLPlayingCardView *card8 = [LCLPlayingCardView cardWithPoint:CGPointMake(80, 330)
                                                     withCardSize:LCLPlayingCardLarge
                                                         withRank:2
                                                         withSuit:LCLPlayingCardSpade
                                                        isVisible:YES];
    [self.view addSubview:card8];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
