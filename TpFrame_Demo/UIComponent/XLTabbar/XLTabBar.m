//
//  XLTabBar.m
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "XLTabBar.h"

static const CGFloat kMagin = 10.0;

@interface XLTabBar ()
@property (nonatomic, strong) UIButton *plusBtn;
@end

@implementation XLTabBar
#pragma mark - init method -
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
        [self addSubview:self.plusBtn];
    }
    return self;
}
#pragma mark - event method -
- (void)plusBtnClickAction
{
    if (self.xlDelegate && [self.xlDelegate respondsToSelector:@selector(XLTabBarPlusBtnClickAction:)])
        [self.xlDelegate XLTabBarPlusBtnClickAction:self];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    Class class = NSClassFromString(@"UITabBarButton");
    self.plusBtn.size = CGSizeMake(self.plusBtn.currentBackgroundImage.size.width, self.plusBtn.currentBackgroundImage.size.height);
    self.plusBtn.centerX = self.centerX;
    //调整发布按钮的中线点Y值
    self.plusBtn.centerY = self.height * 0.5 - 2 * kMagin ;
    
    
    
    UILabel *label = [UILabel new];
    label.text = @"发布";
    label.font = kFont(11);
    [label sizeToFit];
    label.textColor = [UIColor grayColor];
    [self addSubview:label];
    label.centerX = self.plusBtn.centerX;
    label.centerY = CGRectGetMaxY(self.plusBtn.frame) + kMagin;
    
    int btnIndex = 0;
    
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:class]) {
            btn.width = self.width / 5;
            btn.left = btn.width * btnIndex;
            btnIndex ++;
            
            if (btnIndex == 2) {
                btnIndex ++;
            }
        }
    }
    [self bringSubviewToFront:self.plusBtn];
}
//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    /*这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了*/
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.plusBtn];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.plusBtn pointInside:newP withEvent:event]) {
            return self.plusBtn;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - setter and getter -
- (UIButton *)plusBtn
{
    if (!_plusBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"post_normal@2x.png"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"post_normal@2x.png"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(plusBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        _plusBtn = btn;
    }
    return _plusBtn;
}
@end
