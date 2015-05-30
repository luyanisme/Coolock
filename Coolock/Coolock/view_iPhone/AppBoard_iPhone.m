//
//   ______    ______    ______    
//  /\  __ \  /\  ___\  /\  ___\   
//  \ \  __<  \ \  __\_ \ \  __\_ 
//   \ \_____\ \ \_____\ \ \_____\ 
//    \/_____/  \/_____/  \/_____/ 
//
//  Powered by BeeFramework
//
//
//  AppBoard_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 2/24/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "AppBoard_iPhone.h"
#import "AlarmListBoard_iPhone.h"
#import "AppTabbar_iPhone.h"
#import "AppNavigationBar_iPhone.h"
#import "ScheduleBoard_iPhone.h"

#define BAR_HEIGHT  (50.0f)
#define NAVIGATION_HEIGHT (64.0f)
#define COOL_FONT_WIDTH (120.0f)
#define CLOCK_FONT_WIDTH (150.0f)
#define COOLOCK_FONT_WIDTH (200.0f)

@interface AppBoard_iPhone ()

@property (strong, nonatomic) UIView *splashView;//启动动画

@end

#pragma mark -
@implementation AppBoard_iPhone

DEF_SINGLETON( AppBoard_iPhone )

- (void)load
{
    self.splashView = [[UIView alloc] init];
}

- (void)unload
{
}

#pragma mark Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundImage = [UIImage imageNamed:@"bg.png"];
    
    [self.view addSubview:bee.ui.router.view];
    [self.view addSubview:bee.ui.navigationBar];
    [self.view addSubview:bee.ui.tabbar];
    
    /*
     *添加启动动画页面
     */
    {
        self.splashView.backgroundImage = [UIImage imageNamed:@"LaunchImage.png"];
        [self.view addSubview:self.splashView];
        [self.view bringSubviewToFront:self.splashView];
        [self showAnimation];
    }
    
    [bee.ui.router map:@"alarmList" toClass:[AlarmListBoard_iPhone class]];
    [bee.ui.router map:@"schedule" toBoard:[ScheduleBoard_iPhone board]];
    
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    CGRect vb = self.viewBound;
    bee.ui.tabbar.frame = CGRectMake( 0, vb.size.height-BAR_HEIGHT, vb.size.width, BAR_HEIGHT );
    bee.ui.navigationBar.frame = CGRectMake( 0, 0, vb.size.width, NAVIGATION_HEIGHT );
    
    self.splashView.frame = self.view.frame;
}

ON_WILL_APPEAR( signal )
{
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

#pragma mark -

ON_SIGNAL3(AppTabbar_iPhone, alarm_clock_btn, signal)
{
    [bee.ui.tabbar selectAlarmClock];
    [bee.ui.router open:@"alarmList" animated:YES];
}

ON_SIGNAL3(AppTabbar_iPhone, notice_btn, signal)
{
    [bee.ui.tabbar selectNotice];
}

ON_SIGNAL3(AppTabbar_iPhone, schedule_btn, signal)
{
    [bee.ui.tabbar selectSchedule];
    [bee.ui.router open:@"schedule" animated:YES];
}

ON_SIGNAL3(AppTabbar_iPhone, manager_btn, signal)
{
    [bee.ui.tabbar selectManager];
}

- (void)showAnimation{
    BeeUILabel *coolLabel = [[BeeUILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.14, COOL_FONT_WIDTH, 100)];
    coolLabel.text = @"Cool";
    coolLabel.font = [UIFont fontWithName:@"256 Bytes" size:SCREEN_WIDTH*0.145];
    coolLabel.textAlignment = NSTextAlignmentRight;
    coolLabel.alpha = 1;
    [self.splashView addSubview:coolLabel];
    
    BeeUILabel *clockLabel = [[BeeUILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-CLOCK_FONT_WIDTH, SCREEN_HEIGHT*0.14, CLOCK_FONT_WIDTH, 100)];
    clockLabel.text = @"Clock";
    clockLabel.font = [UIFont fontWithName:@"256 Bytes" size:SCREEN_WIDTH*0.145];
    clockLabel.textAlignment = NSTextAlignmentLeft;
    clockLabel.alpha = 1;
    [self.splashView addSubview:clockLabel];
    
    BeeUILabel *coolockLabel = [[BeeUILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-COOLOCK_FONT_WIDTH)/2, SCREEN_HEIGHT*0.14, COOLOCK_FONT_WIDTH, 100)];
    coolockLabel.text = @"CooLock";
    coolockLabel.font = [UIFont fontWithName:@"256 Bytes" size:SCREEN_WIDTH*0.145];
    coolockLabel.alpha = 0;
    [self.splashView addSubview:coolockLabel];
    
    BeeUILabel *wordLabel = [[BeeUILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.27+30, SCREEN_WIDTH, 100)];
    wordLabel.text = @"用心规划每一天";
    wordLabel.font = [UIFont fontWithName:@"HYXiYuanJ" size:SCREEN_WIDTH*0.12];
    wordLabel.alpha = 0;
    [self.splashView addSubview:wordLabel];
    
    [UIView animateWithDuration:2 animations:^{
        coolLabel.alpha = 0;
        coolLabel.frame = CGRectMake((SCREEN_WIDTH-COOL_FONT_WIDTH)/2, SCREEN_HEIGHT*0.14, COOL_FONT_WIDTH, 100);
        clockLabel.alpha = 0;
        clockLabel.frame = CGRectMake((SCREEN_WIDTH-CLOCK_FONT_WIDTH)/2, SCREEN_HEIGHT*0.14, CLOCK_FONT_WIDTH, 100);
    } completion:^(BOOL finish){
        [UIView animateWithDuration:2 animations:^{
            coolockLabel.alpha = 1;
        } completion:^(BOOL finish){
            [UIView animateWithDuration:2 animations:^{
                wordLabel.frame = CGRectMake(0, SCREEN_HEIGHT*0.27, SCREEN_WIDTH, 100);
                wordLabel.alpha = 1;
            } completion:^(BOOL finish){
                [self performSelector:@selector(removeSplashView) withObject:nil afterDelay:0.5];
            }];
        }];
    }];
}

- (void)removeSplashView{
    [self.splashView removeFromSuperview];
    [bee.ui.router open:@"alarmList" animated:YES];
}
@end
