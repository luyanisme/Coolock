//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  PlanListBoard_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 5/30/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "PlanListBoard_iPhone.h"
#import "AppNavigationBar_iPhone.h"

#pragma mark -

@interface PlanCell : UITableViewCell

@property (strong, nonatomic) BeeUIImageView *circle;
@property (strong, nonatomic) BeeUIImageView *verticalLine;
@property (strong, nonatomic) BeeUIImageView *horizontalLine;
@property (strong, nonatomic) BeeUILabel     *timeLabel;

@end

@implementation PlanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.circle = [[BeeUIImageView alloc] init];
        self.verticalLine = [[BeeUIImageView alloc] init];
        self.horizontalLine = [[BeeUIImageView alloc] init];
        self.timeLabel = [[BeeUILabel alloc] init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
}

- (void)prepareForReuse{

}

- (void)layoutSubviews{
    self.verticalLine.frame = CGRectMake(11, 0, 2, self.bounds.size.height);
    self.verticalLine.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0.38 alpha:1.0f];
    [self.contentView addSubview:self.verticalLine];
    
    self.horizontalLine.frame = CGRectMake(33, 11, self.bounds.size.width-66, 1);
    self.horizontalLine.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0.38 alpha:1.0f];
//    [self.contentView addSubview:self.horizontalLine];
    
    self.circle.frame = CGRectMake(0, 0, 23.0f, 23.0f);
    self.circle.contentMode = UIViewContentModeScaleAspectFit;
    self.circle.image = [UIImage imageNamed:@"break_point.png"];
    [self.contentView addSubview:self.circle];
    
    self.timeLabel.frame = CGRectMake(33, 21, 70, 20);
    self.timeLabel.text = @"8:47 pm";
    self.timeLabel.font = [UIFont fontWithName:@"HYXiYuanJ" size:15.0f];
    [self.contentView addSubview:self.timeLabel];
    

}

- (void)drawRect:(CGRect)rect{
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    CGContextSetLineWidth(context,1);//线宽度
    
    CGContextSetStrokeColorWithColor(context,[UIColor colorWithRed:1 green:0.5 blue:0.38 alpha:1.0f].CGColor);
    
    CGFloat lengths[] = {10,5};//先绘制10个像素点，再跳过5个像素点
    
    CGContextSetLineDash(context,0, lengths,2);//注意2(count)的值等于lengths数组的长度
    
    CGContextMoveToPoint(context,33, 11);
    
    CGContextAddLineToPoint(context,self.bounds.size.width-33, 11);
    
    CGContextStrokePath(context);
    
    CGContextClosePath(context);
}
@end

@interface PlanListBoard_iPhone()<UITableViewDataSource, UITableViewDelegate>
{
	//<#@private var#>
}

@property (strong, nonatomic) UITableView *planList;
@end

@implementation PlanListBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.planList = [[UITableView alloc] init];
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.planList.delegate = self;
    self.planList.dataSource = self;
    self.planList.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.planList.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.planList];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    self.planList.frame = CGRectMake(20, NAVIGATION_HEIGHT, SCREEN_WIDTH-40, SCREEN_HEIGHT-NAVIGATION_HEIGHT-BAR_HEIGHT);
}

ON_WILL_APPEAR( signal )
{
    bee.ui.navigationBar.tagImage = @"plan_list_icon.png";
    bee.ui.navigationBar.title = @"事项";
}

ON_DID_APPEAR( signal )
{
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170.0f;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.planList.size.width, 20)];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* id = @"PlanCell";
    //cell只会初始化一次
    PlanCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (!cell) {
        cell = [[PlanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
@end
