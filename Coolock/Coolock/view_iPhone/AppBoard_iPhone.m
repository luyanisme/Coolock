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

@interface AppBoard_iPhone ()

@end

#pragma mark -
@implementation AppBoard_iPhone

DEF_SINGLETON( AppBoard_iPhone )

- (void)load
{
}

- (void)unload
{
}

#pragma mark Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bee.ui.router.view];
    [self.view addSubview:bee.ui.navigationBar];
    [self.view addSubview:bee.ui.tabbar];
    
    [bee.ui.router map:@"alarmList" toClass:[AlarmListBoard_iPhone class]];
    [bee.ui.router map:@"schedule" toBoard:[ScheduleBoard_iPhone board]];
    [bee.ui.router open:@"alarmList" animated:YES];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    CGRect vb = self.viewBound;
    bee.ui.tabbar.frame = CGRectMake( 0, vb.size.height-BAR_HEIGHT, vb.size.width, BAR_HEIGHT );
    bee.ui.navigationBar.frame = CGRectMake( 0, 0, vb.size.width, NAVIGATION_HEIGHT );
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

@end
