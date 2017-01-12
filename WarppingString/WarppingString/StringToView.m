//
//  StringToView.m
//  Dyonics Pulse V3
//
//  Created by Tuuu on 1/4/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

#import "StringToView.h"

@implementation StringToView
-(instancetype)init:(NSString *)content andSize:(CGSize)size
{
    self.content = content;
    self.size = size;
    return self;
}
@end
