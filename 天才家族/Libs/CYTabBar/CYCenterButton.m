//
//  CYCenterButton.m
//  蚁巢
//
//  Created by 张春雨 on 2016/11/17.
//  Copyright © 2016年 张春雨. All rights reserved.
//

#import "CYCenterButton.h"

@implementation CYCenterButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:[CYTabBarConfig shared].textColor forState:UIControlStateNormal];
        [self setTitleColor:[CYTabBarConfig shared].selectedTextColor forState:UIControlStateSelected];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    if (CGRectEqualToRect(self.frame, CGRectZero)) {
        return;
    }
    
    /**
     *  button is bulge
     */
    if (self.is_bulge){
        
        if ([[UIApplication sharedApplication] statusBarFrame].size.height>20) {
        
            self.imageView.frame = CGRectMake(0,-18, self.bounds.size.width,self.bounds.size.height);
            
            //self.imageView.frame = self.bounds;
            if (self.titleLabel.text.length) {
                self.titleLabel.frame = CGRectMake(0 , self.frame.size.height -34,
                                                   self.frame.size.width , 16);
                
                
            }
            
            return;
        }
        
        
        self.imageView.frame = self.bounds;
        if (self.titleLabel.text.length) {
            self.titleLabel.frame = CGRectMake(0, self.frame.size.height +(BULGEH-18),
                                               self.frame.size.width , 16);
            
            
            
            
        }
        return;
        
    }
        
    /**
     *  button is normal and no text
     */
    if (!self.titleLabel.text.length) {
        self.imageView.frame = self.bounds;
        return;
    }
    /**
     *  button is normal and contain text
     */
    CGFloat width = self.frame.size.width;
    CGFloat height = self.superview.frame.size.height;
    self.titleLabel.frame = CGRectMake(0, height-[CYTabBarConfig shared].bulgeHeight , width, [CYTabBarConfig shared].bulgeHeight);
    self.imageView.frame = CGRectMake(0 , 0, width, 35);
}


- (void)setHighlighted:(BOOL)highlighted{
}


@end
