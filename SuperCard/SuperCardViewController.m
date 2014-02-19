//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Moser, Wesley on 2/18/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "SuperCardViewController.h"
#import "PlayingCardView.h"

@interface SuperCardViewController ()

@end

@implementation SuperCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.cardView.suit = @"♥️";
    self.cardView.rank = 13;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
