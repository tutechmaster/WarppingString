//
//  NSString+Wrapping.m
//  Dyonics Pulse V3
//
//  Created by Tuuu on 1/9/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

#import "NSString+Wrapping.h"
@implementation NSString (Wrapping)
- (StringToView *)stringToShow:(CGSize)size isDefault:(BOOL)isDefault andFont:(UIFont *)font {
    if(self == nil || [self isEqualToString:@""])
    {
        return nil;
    }
    
    UIFont *currentFont = font;
    int currentWidthPerLine = size.width;
    int heightPerLine = 0;
    CGFloat padding = 0;
    CGFloat paddingPerLine = 6;
    if (MU_DEVICE_IS_IPAD) {
        if(isDefault)
        {
            currentFont = currentFont == nil ? SMITH_NEPHEW_FONT_REGULAR(16) : currentFont;
            currentWidthPerLine = 280;
            heightPerLine = 30;
            padding = 25;
        }
        
    }
    else
    {
        
        if(isDefault)
        {
            currentFont = currentFont == nil ? SMITH_NEPHEW_FONT_REGULAR(12) : currentFont;
            currentWidthPerLine = 220;
            heightPerLine = 22;
        }
        
    }
    
    NSString *tmpStringToView = [self autoNewLine:currentWidthPerLine andFont:currentFont andPadding:padding];
    NSInteger numberOfLines = [[tmpStringToView componentsSeparatedByCharactersInSet:
                                [NSCharacterSet newlineCharacterSet]] count];
    heightPerLine = ([self getSizeOfString:currentWidthPerLine andFont:currentFont].height/numberOfLines) + paddingPerLine;
    StringToView *stringToView = [[StringToView alloc] init:tmpStringToView andSize:CGSizeMake(currentWidthPerLine, (numberOfLines > 2 ? numberOfLines : 2) * heightPerLine)];
    
    return stringToView;
}
- (CGSize)getSizeOfString:(CGFloat)width andFont:(UIFont *)font
{
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize sizeOfString = rect.size;
    sizeOfString.height = ceilf(sizeOfString.height);
    sizeOfString.width  = ceilf(sizeOfString.width);
    return sizeOfString;
}
- (NSString *)autoNewLine:(CGFloat)width
                  andFont:(UIFont *)font
               andPadding:(CGFloat)padding
{
    NSString *stringToView = @"";
    NSString *stringToCheck = @"";
    for(NSString *currentWord in [self splitWordWithSpecialCharacters])
    {
        stringToCheck = [NSString stringWithFormat:@"%@%@%@",stringToCheck, [stringToCheck isEqualToString:@""] ? @"":@" ", currentWord];
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        CGFloat totalWidth = [[[NSAttributedString alloc] initWithString:stringToCheck attributes:attributes] size].width;
        if (totalWidth > width - padding)
        {
            stringToView = [NSString stringWithFormat:@"%@%@%@", stringToView, [stringToView isEqualToString:@""] == true ? @"":@"\n", [stringToCheck stringByReplacingOccurrencesOfString:currentWord withString:@""]];
            stringToCheck = currentWord;
        }
    }
    if(![stringToView isEqualToString:stringToCheck])
    {
        if ([stringToView isEqualToString:@""] || [stringToView isEqualToString:@" "])
        {
            stringToView = stringToCheck;
        }
        else
        {
            stringToView = [NSString stringWithFormat:@"%@\n%@", stringToView, stringToCheck];
        }
    }
    return stringToView;
}
- (NSArray *)splitWordWithSpecialCharacters
{
    NSArray *strings = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *splitWords = [[NSMutableArray alloc] init];
    for(NSString *currentWord in strings)
    {
        [splitWords addObjectsFromArray:[currentWord componentsSeparatedByString:@"-"]];
    }
    return strings;
}
@end
