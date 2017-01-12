//
//  DNButton.m
//  DyonicsV2
//
//  Created by Dato on 10/23/13.
//  © 2010-2015 Smith & Nephew Inc - All Rights Reserved
//

#import "DNButton.h"
#import "NSString+Wrapping.h"
@implementation DNButton

- (void)setFontName:(NSString *)fontName{
    _fontName = fontName;
    self.titleLabel.font = [UIFont fontWithName:fontName size:self.titleLabel.font.pointSize];
}

- (void)setFontSize:(float)fontsize{
    _fontSize = fontsize;
    self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.fontName size:fontsize];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.fontName = @"SmithNephew-Regular";
        [self setTitleColor:[UIColor colorWithWhite:0.81f alpha:1.0f] forState:UIControlStateNormal];
    }
    return self;
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [super setTitle:title forState:state];
}
@end
