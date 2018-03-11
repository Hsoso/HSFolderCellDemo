//
//  HSRotatedView.h
//  HSFolderCellDemo
//
//  Created by He Shun on 2018/3/6.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSRotatedView : UIView

@property (nonatomic, assign) BOOL hiddenAfterAnimation;
@property (nonatomic, strong) HSRotatedView * backView;

- (CATransform3D)transform3d;

- (void)addBackView:(CGFloat)height color:(UIColor *)color;

- (void)foldingAnimation:(NSString *)timing from:(CGFloat)from to:(CGFloat)to duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay hidden:(BOOL)hidden;

@end
