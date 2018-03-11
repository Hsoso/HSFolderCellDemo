//
//  HSFolderCell.h
//  HSFolderCellDemo
//
//  Created by He Shun on 2018/3/6.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSRotatedView.h"
#import "UIView+SnapShot.h"

typedef NS_ENUM(NSInteger, AnimationType){
    AnimationTypeOpen = 0,
    AnimationTypeClose
};

@interface HSFolderCell : UITableViewCell

@property (nonatomic, strong) UIView * containerView;//当cell展开时显示
@property (nonatomic, strong) NSLayoutConstraint * containerViewTop;


@property (nonatomic, strong) HSRotatedView * foregroundView;//当cell收起时显示
@property (nonatomic, strong) NSLayoutConstraint * foregroundViewTop;

@property (nonatomic, assign) NSInteger itemCount;//折叠元素的个数，默认为2

//初始化，在创建cell时调用
- (void)commonInit;

- (NSTimeInterval)animationDuration:(NSInteger)itemIndex type:(AnimationType)type;

//折叠动画 YES：打开折叠。 NO：折叠
- (void)unfold:(BOOL)value animated:(BOOL)animated completion:(void (^)(void))completion;

- (BOOL)isAnimating;

@end
