//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Moser, Wesley on 2/18/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

const float CORNER_FONT_STANDARD_HEIGHT = 180.0;
const float CORNER_RADIUS = 12.0;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (CGFloat)cornerScaleFactor
{
    return [self bounds].size.height / CORNER_FONT_STANDARD_HEIGHT;
}

- (CGFloat)cornerRadius
{
    return CORNER_RADIUS * [self cornerScaleFactor];
}

- (CGFloat)cornerOffset
{
    return [self cornerRadius] / 3.0;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect =
        [UIBezierPath bezierPathWithRoundedRect:[self bounds]
                                   cornerRadius:[self cornerRadius]];
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill([self bounds]);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    [self drawCorners];
}

- (void)setup
{
    [self setBackgroundColor:nil];
    [self setOpaque:NO];
    [self setContentMode:UIViewContentModeRedraw];
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSString *cornerString =
        [NSString stringWithFormat:@"%@\n%@", [self rankAsString:self.rank], self.suit];
    NSAttributedString *cornerText =
        [[NSAttributedString alloc] initWithString:cornerString
                                        attributes:[[NSDictionary alloc]
                                                    initWithObjectsAndKeys:
                                                    cornerFont,
                                                    NSFontAttributeName,
                                                    paragraphStyle,
                                                    NSParagraphStyleAttributeName, nil]];
    
    CGRect textBounds;
    textBounds.origin.x = textBounds.origin.y = [self cornerOffset];
    textBounds.size = cornerText.size;
    [cornerText drawInRect:textBounds];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, [self bounds].size.width, [self bounds].size.height);
    CGContextRotateCTM(ctx, -3.14);
    [cornerText drawInRect:textBounds];
    
}

- (NSString *)rankAsString:(NSUInteger)rank
{
    if (rank == 1)
        return @"A";
    else if (rank > 1 && rank <= 10)
        return [NSString stringWithFormat:@"%c", '0' + rank];
    else if (rank == 11)
        return @"J";
    else if (rank == 12)
        return @"Q";
    else if (rank == 13)
        return @"K";
    else  // 0 or anything else
        return @"?";
}

@end
