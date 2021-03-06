//
//  BCLSportsDietaryRecordSportsBottomView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordSportsBottomView.h"
#import <Masonry.h>

static const NSInteger kAddHeight = 45;

static const NSInteger kViewLeftOrRightInterval = 85;

@interface BCLSportsDietaryRecordSportsBottomView ()

//增加运动button
@property (nonatomic, strong) UIButton *addSprotsButton;

@end

@implementation BCLSportsDietaryRecordSportsBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    [self setupAddSprotsButton];
}

#pragma mark - 增加运动button设置
- (void)setupAddSprotsButton {
    self.addSprotsButton = [[UIButton alloc] init];
    [self addSubview:_addSprotsButton];
    
    [_addSprotsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
        make.right.equalTo(self.mas_right).offset(-kViewLeftOrRightInterval);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(kAddHeight);
    }];
    
    _addSprotsButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _addSprotsButton.layer.masksToBounds = YES;
    _addSprotsButton.layer.cornerRadius = 15;
    [_addSprotsButton setBackgroundColor:[UIColor whiteColor]];
    
    [_addSprotsButton setTitle:@"添加运动" forState:UIControlStateNormal];
    [_addSprotsButton setTitleColor:[UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f] forState:UIControlStateNormal];
    [_addSprotsButton setImage:[UIImage imageNamed:@"bcl_ic_soprts_tableView_bottomAddButton"] forState:normal];
    
    [_addSprotsButton addTarget:self action:@selector(clickAddSports) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 增加运动button点击事件
- (void)clickAddSports {
    NSLog(@"QSTSD");
    if ([_sportsDietaryRecordSportsBottomViewDelegate respondsToSelector:@selector(addSportsSkip)]) {
        [_sportsDietaryRecordSportsBottomViewDelegate addSportsSkip];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
