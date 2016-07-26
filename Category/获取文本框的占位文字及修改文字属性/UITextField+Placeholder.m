//
//  UITextField+Placeholder.m
//  01-BuDeJie
//
//  Created by hqc on 16/1/7.
//  Copyright © 2016年 hqc. All rights reserved.
//

#import "UITextField+Placeholder.h"
#import <objc/message.h>

@implementation UITextField (Placeholder)

+ (void)load
{
    // 获取xmg_setPlaceholder方法
   Method setPlaceholderMehtod =  class_getInstanceMethod(self, @selector(xmg_setPlaceholder:));
    
    // 获取setPlaceholder方法
    Method setPlaceholderMehtod =  class_getInstanceMethod(self, @selector(setPlaceholder:));
    
    // 交互两个方法实现
    method_exchangeImplementations(setPlaceholderMehtod, setPlaceholderMehtod);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
//    _placeholderColor = placeholderColor;
    // 1.导入#import <objc/message.h>
    // 把颜色保存到当前UITextField对象中
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    // 设置文本框占位文字颜色
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    
    placeholderLabel.textColor = placeholderColor;

}

- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, @"placeholderColor");
}

// 设置占位文字,并且设置下占位文字颜色
- (void)setPlaceholder:(NSString *)placeholder
{
    // 1.设置占位文字
    [self setPlaceholder:placeholder];
    
    // 2.设置占位文字颜色
    [self setPlaceholderColor:self.placeholderColor];
}

@end
