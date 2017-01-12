//
//  NSString+Wrapping.h
//  Dyonics Pulse V3
//
//  Created by Tuuu on 1/9/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringToView.h"
@interface NSString (Wrapping)
- (StringToView *)stringToShow:(CGSize)size isDefault:(BOOL)isDefault andFont:(UIFont *)font;
- (CGSize)getSizeOfString:(CGFloat)width andFont:(UIFont *)font;
@end
