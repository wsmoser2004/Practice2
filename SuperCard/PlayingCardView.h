//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Moser, Wesley on 2/18/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
{
//    const float CORNER_FONT_STANDARD_HEIGHT;// = 180.0;
//    const float CORNER_RADIUS;// = 12.0;
}

- (CGFloat)cornerScaleFactor;
- (CGFloat)cornerRadius;
- (CGFloat)cornerOffset;
- (void)setup;

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

@end
