//
//  BCLSportsDietaryRecordView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordView.h"
#import "BCLSportsDietaryRecordSportsTableViewCell.h"
#import "BCLSportsDietaryRecordSportsHeadView.h"
#import "BCLSportsDietaryRecordSportsBottomView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kSegmentedControlHeight = 30;
static const NSInteger kTitleHeight = 30;
static const NSInteger kCellHeight = 75;
static const NSInteger kAddHeight = 45;

static const NSInteger kTitleInterval = 30;
static const NSInteger kCellInterval = 15;
static const NSInteger kAddInterval = 45;
static const NSInteger kBottomInterval = 60;

static NSString *kSportsCellIdentifier = @"sportsCell";

@interface BCLSportsDietaryRecordView()<UITableViewDataSource>

//饮食与健康分段控制器
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
//背景板
@property (nonatomic, strong) UIScrollView *backgroundScrollView;
//运动tableView
@property (nonatomic, strong) UITableView *sportsTableView;
//运动tableViewHeadView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsHeadView *sportsDietaryRecordSportsHeadView;
//运动tableViewBottomView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsBottomView *sportsDietaryRecordSportsBottomView;

//运动数目
@property (nonatomic, assign) NSInteger sportsNumber;
//背景画布即运动列表高度
@property (nonatomic, assign) NSInteger backgroundScrollViewHeight;

@end

@implementation BCLSportsDietaryRecordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self programmingTest];
        [self calculateUpdateBackgroundScrollViewHeight];
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    [self setupSegmentedControl];
    [self setupBackgroundScrollView];
    [self setupSportsTableView];
}

#pragma mark - 分栏设置
- (void)setupSegmentedControl {
    NSArray *segmentedControlArray = @[@"运动", @"饮食"];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedControlArray];
    _segmentedControl.frame = CGRectMake(0, 0, kDeviceWidth, kSegmentedControlHeight);
    _segmentedControl.selectedSegmentIndex = 0;
    
    // 设置文字样式
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]} forState:UIControlStateNormal]; //正常
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateHighlighted]; //按下
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.95f green:0.38f blue:0.22f alpha:1.00f]} forState:UIControlStateSelected]; //选中
    
    // 设置背景图
    [_segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 设置分割线图
    [_segmentedControl setDividerImage:[UIImage new] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];//
    [_segmentedControl setDividerImage:[UIImage new] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
//    _segmentedControl.tintColor = [UIColor clearColor];
//    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
//                                     forState:UIControlStateNormal];
//    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
//                                     forState:UIControlStateSelected];
//    [_segmentedControl setBackgroundColor:[UIColor whiteColor]];
//    [_segmentedControl setBackgroundImage:[UIImage imageNamed:@"bcl_ic_soprts_segmentedControl_bottomSelected"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [self addSubview:_segmentedControl];
}

#pragma mark - 计算背景画布即运动tableView高度并更新View的高度
- (void)calculateUpdateBackgroundScrollViewHeight {
    NSInteger backgroundScrollViewHeight = kTitleHeight + kTitleInterval + kAddHeight + kAddInterval + (kCellHeight + kCellInterval) * _sportsNumber + kBottomInterval;
    _backgroundScrollViewHeight = backgroundScrollViewHeight;
    [self setFrame:CGRectMake(0, 64, kDeviceWidth, _backgroundScrollViewHeight)];
}

#pragma mark - 背景画布设置
- (void)setupBackgroundScrollView {
    _backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kSegmentedControlHeight, kDeviceWidth, _backgroundScrollViewHeight)];
    [self addSubview:_backgroundScrollView];
    
    _backgroundScrollView.contentSize = CGSizeMake(kDeviceWidth * 2, _backgroundScrollViewHeight);
    _backgroundScrollView.bounces = NO;
    _backgroundScrollView.pagingEnabled = YES;
    _backgroundScrollView.bouncesZoom = NO;
    _backgroundScrollView.showsHorizontalScrollIndicator = NO;
    _backgroundScrollView.showsVerticalScrollIndicator = NO;
    
}

#pragma mark - 传出背景scrollView
- (UIScrollView *)getBackgroundScrollView {
    return _backgroundScrollView;
}

#pragma mark - 运动tableViewHeadView设置
- (void)setupSportsDietaryRecordSportsHeadView {
    
}

#pragma mark - 运动tableViewBottomView设置
- (void)setupSportsDietaryRecordSportsBottomView {
    
}

#pragma mark - 运动tableView设置
- (void)setupSportsTableView {
    _sportsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, _backgroundScrollViewHeight) style:UITableViewStyleGrouped];
    [self.backgroundScrollView addSubview:_sportsTableView];
    
    [_sportsTableView registerClass:[BCLSportsDietaryRecordSportsTableViewCell class] forCellReuseIdentifier:kSportsCellIdentifier];
    _sportsTableView.backgroundColor = [UIColor colorWithRed:0.95f green:0.35f blue:0.20f alpha:1.00f];
    _sportsTableView.showsVerticalScrollIndicator = NO;
    _sportsTableView.showsHorizontalScrollIndicator = NO;
    _sportsTableView.bounces = NO;
    _sportsTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}

#pragma mark - 传出运动tableView
- (UITableView *)getSportsTableView {
    return _sportsTableView;
}

#pragma mark - 测试数据填充
- (void)programmingTest {
    _sportsNumber = 2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
