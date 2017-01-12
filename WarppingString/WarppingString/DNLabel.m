//
//  DNLabel.m
//  DyonicsV2
//
//  Created by Dato on 10/16/13.
//  © 2010-2015 Smith & Nephew Inc - All Rights Reserved
//

#import "DNLabel.h"
#import "NSString+Wrapping.h"
@implementation DNLabel

- (void)setFontName:(NSString *)fontName{
    _fontName = fontName;
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    
}

- (void)setFontSize:(float)fontsize{
    _fontSize = fontsize;
    self.font = [UIFont fontWithName:self.font.fontName size:fontsize];
}
- (void)setText:(NSString *)text
{
    
    [super setText:[text stringToShow:self.frame.size isDefault:false andFont:self.font].content];
}
@end
