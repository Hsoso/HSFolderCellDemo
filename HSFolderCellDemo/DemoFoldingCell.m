//
//  DemoFoldingCell.m
//  HSFolderCellDemo
//
//  Created by He Shun on 2018/3/7.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import "DemoFoldingCell.h"

@interface DemoFoldingCell()

@property (nonatomic, strong) UIView * titleView;
@property (nonatomic, strong) UIView * titleView2;
@property (nonatomic, strong) UIView * infoView;

@end

@implementation DemoFoldingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.itemCount = 4;
        self.foregroundView = [self createForegroundView];
        self.containerView = [self createContainerView];
        
        [self commonInit];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleView.frame = self.foregroundView.bounds;
    self.titleView2.frame = CGRectMake(0, 0, self.containerView.bounds.size.width, self.foregroundView.bounds.size.height);
    self.infoView.frame = CGRectMake(0, CGRectGetMaxY(self.titleView2.frame), self.containerView.bounds.size.width, self.containerView.bounds.size.height - self.foregroundView.bounds.size.height);
}

- (NSTimeInterval)animationDuration:(NSInteger)itemIndex type:(AnimationType)type{
    //timing animation for each view
    NSArray * durations = @[@0.33, @0.26, @0.26];
    return [durations[itemIndex] doubleValue];
}

- (HSRotatedView *)createForegroundView{
    HSRotatedView * foregroundView = [[HSRotatedView alloc] initWithFrame:CGRectZero];
    foregroundView.backgroundColor = [UIColor whiteColor];
    foregroundView.translatesAutoresizingMaskIntoConstraints = NO;
    foregroundView.clipsToBounds = YES;
    foregroundView.layer.cornerRadius = 10;
    
    [foregroundView addSubview:self.titleView];
    [self.contentView addSubview:foregroundView];
    
    //layout
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:8];
    self.foregroundViewTop = topConstraint;
    
    [self.contentView addConstraints:@[
                                     [NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:17],
                                     [NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-17],
                                     topConstraint
                                    ]
     ];
    
    [foregroundView addConstraint:[NSLayoutConstraint constraintWithItem:foregroundView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:165]];
    

    [foregroundView layoutIfNeeded];
    
    return foregroundView;
}

- (UIView *)createContainerView{
    UIView * containerView = [[UIView alloc] initWithFrame:CGRectZero];
    containerView.backgroundColor = [UIColor whiteColor];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    containerView.clipsToBounds = YES;
    containerView.layer.cornerRadius = 10;
    
    [containerView addSubview:self.titleView2];
    [containerView addSubview:self.infoView];
    [self.contentView addSubview:containerView];
    
    //layout
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:181];
    self.containerViewTop = topConstraint;
    
    [self.contentView addConstraints:@[
                                     [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:17],
                                     [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-17],
                                     topConstraint
                                     ]
     ];
    
    [containerView addConstraint:[NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:480]];
    

    [containerView layoutIfNeeded];
    
    return containerView;
}

- (UIView *)titleView{
    if(_titleView == nil){
        _titleView = [[UIView alloc] init];
        
        [self titleViewAddSubview:_titleView];
    }
    
    return _titleView;
}

- (UIView *)titleView2{
    if(_titleView2 == nil){
        _titleView2 = [[UIView alloc] init];
        
        [self titleViewAddSubview:_titleView2];
    }
    
    return _titleView2;
}

- (UIView *)infoView{
    if(_infoView == nil){
        _infoView = [[UIView alloc] init];
        
        CGFloat containerWidth = [UIScreen mainScreen].bounds.size.width - 34;
        
        UIView * leftView = [[UIView alloc] init];
        leftView.backgroundColor = [UIColor colorWithRed:93.0 / 255 green:74.0 / 255 blue:153.0 / 255 alpha:1.0];
        leftView.frame = CGRectMake(0, 0, 88, 480);
        
        UILabel * name = [[UILabel alloc] init];
        name.font = [UIFont boldSystemFontOfSize:17];
        name.text = @"Name: Soso";
        name.frame = CGRectMake(CGRectGetMaxX(leftView.frame) + 17, 0, containerWidth - CGRectGetMaxX(leftView.frame) - 34, 82.5);
        
        UIView * line1 = [[UIView alloc] init];
        line1.backgroundColor = [UIColor lightGrayColor];
        line1.frame = CGRectMake(0, name.bounds.size.height - 1, name.bounds.size.width, 1);
        [name addSubview:line1];
        
        UILabel * gender = [[UILabel alloc] init];
        gender.font = [UIFont boldSystemFontOfSize:17];
        gender.text = @"Gender: Male";
        gender.frame = CGRectMake(CGRectGetMaxX(leftView.frame) + 17, CGRectGetMaxY(name.frame), name.bounds.size.width, 82.5);
        
        UIView * line2 = [[UIView alloc] init];
        line2.backgroundColor = [UIColor lightGrayColor];
        line2.frame = CGRectMake(0, gender.bounds.size.height - 1, gender.bounds.size.width, 1);
        [gender addSubview:line2];
        
        UILabel * phone = [[UILabel alloc] init];
        phone.font = [UIFont boldSystemFontOfSize:17];
        phone.text = @"Phone: +86 13500008888";
        phone.frame = CGRectMake(CGRectGetMaxX(leftView.frame) + 17, CGRectGetMaxY(gender.frame), name.bounds.size.width, 75);
        
        UIView * line3 = [[UIView alloc] init];
        line3.backgroundColor = [UIColor lightGrayColor];
        line3.frame = CGRectMake(0, phone.bounds.size.height - 1, phone.bounds.size.width, 1);
        [phone addSubview:line3];
        
        UILabel * address = [[UILabel alloc] init];
        address.font = [UIFont boldSystemFontOfSize:17];
        address.text = @"Home: 020 - 2322123";
        address.frame = CGRectMake(CGRectGetMaxX(leftView.frame) + 17, CGRectGetMaxY(phone.frame), name.bounds.size.width, 75);
        
        UIView * line4 = [[UIView alloc] init];
        line4.backgroundColor = [UIColor lightGrayColor];
        line4.frame = CGRectMake(0, address.bounds.size.height - 1, address.bounds.size.width, 1);
        [address addSubview:line4];
        
        
        [_infoView addSubview:leftView];
        [_infoView addSubview:name];
        [_infoView addSubview:gender];
        [_infoView addSubview:phone];
        [_infoView addSubview:address];
    }
    
    return _infoView;
}

- (void)titleViewAddSubview:(UIView *)titleView{
    UIView * leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor colorWithRed:93.0 / 255 green:74.0 / 255 blue:153.0 / 255 alpha:1.0];
    leftView.frame = CGRectMake(0, 0, 88, 165);
    
    UIImageView * avatarImageView = [[UIImageView alloc] init];
    avatarImageView.image = [UIImage imageNamed:@"photo"];
    avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    CGFloat itemHeight = 100;
    CGFloat foregroundWidth = [UIScreen mainScreen].bounds.size.width - 34;
    avatarImageView.frame = CGRectMake((foregroundWidth - 88 - itemHeight) / 2 + 88, (181 - itemHeight) / 2, itemHeight, itemHeight);
    
    [titleView addSubview:leftView];
    [titleView addSubview:avatarImageView];
}



@end
