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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
