//
//  HQInfoView.m
//  WhereTF
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "HQInfoView.h"

@implementation HQInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self viewLineColor:RGBA(230, 230, 230, 1) borderWidth:3 cornerRadius:3];
        
        self.backgroundColor = RGBA(240, 240, 240, 1);
        
        _infoLabel = [UILabel allocLabelFrame:self.bounds
                                         text:@""
                                         font:nil
                                    textColor:nil
                                      bgColor:nil
                               textAlignament:NSTextAlignmentLeft
                             autoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
        _infoLabel.numberOfLines = 0;
        [self addSubview:_infoLabel];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
