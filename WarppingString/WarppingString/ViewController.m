//
//  ViewController.m
//  WarppingString
//
//  Created by Tuuu on 1/12/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

#import "ViewController.h"
#import "DNButton.h"
#import "DNLabel.h"
@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *input;
    @property (weak, nonatomic) IBOutlet UILabel *btn_DisplayDefault;
    @property (weak, nonatomic) IBOutlet DNLabel *lbl_Display;
    
    @end

@implementation ViewController
    
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setFontSize:24];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)changeFontSize:(UISlider *)sender {
    [self displayContentWith:sender.value];
}
- (void)displayContentWith:(int)size
{
    [self setFontSize:size];
    [self reloadContent];
    
}
    - (void)setFontSize:(int)size
    {
        _btn_DisplayDefault.font = [UIFont systemFontOfSize:size];
        _lbl_Display.font = [UIFont systemFontOfSize:size];
    }
    
    -(void)reloadContent
    {
        _btn_DisplayDefault.text = _input.text;
        _lbl_Display.text = _input.text;
    }
@end
