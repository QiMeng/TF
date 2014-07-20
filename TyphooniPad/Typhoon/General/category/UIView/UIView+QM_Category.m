//
//  UIView+QM_Category.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-3.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "UIView+QM_Category.h"

@implementation UIView (QM_Category)

- (void)setX:(float)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
- (void)setY:(float)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setWidth:(float)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}
- (void)setHeight:(float)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)bottom
{
    return self.top + self.height;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

//描边,圆角
- (void) borderAndRadiusColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth =1.0;
    self.layer.cornerRadius =3.0;
}

- (void)viewLineColor:(UIColor *)color borderWidth:(float)border cornerRadius:(float)radiu {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = border;
    self.layer.cornerRadius = radiu;
    self.layer.masksToBounds = YES;
}

@end
