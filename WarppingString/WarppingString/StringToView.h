//
//  StringToView.h
//  Dyonics Pulse V3
//
//  Created by Tuuu on 1/4/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface StringToView : NSObject
@property(strong, nonatomic) NSString *content;
@property(assign) CGSize size;
-(instancetype)init:(NSString *)content andSize:(CGSize)size;
@end
