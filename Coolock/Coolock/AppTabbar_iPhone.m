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
//  AppTabbar_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 2/27/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "AppTabbar_iPhone.h"

#pragma mark -

DEF_UI( AppTabbar_iPhone, tabbar )

@implementation AppTabbar_iPhone

DEF_SINGLETON( AppTabbar_iPhone )

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

- (void)selectAlarmClock{
    [UIView animateWithDuration:0.3f animations:^{
        $(@"#under_line").ATTR(@"left", @"6%");
        $(@"#under_line").RELAYOUT();
    }];
}

- (void)selectPlanList{
    [UIView animateWithDuration:0.3f animations:^{
        $(@"#under_line").ATTR(@"left", @"31%");
        $(@"#under_line").RELAYOUT();
    }];
}

- (void)selectSchedule{
    [UIView animateWithDuration:0.3f animations:^{
        $(@"#under_line").ATTR(@"left", @"56%");
        $(@"#under_line").RELAYOUT();
    }];
}

- (void)selectManager{
    [UIView animateWithDuration:0.3f animations:^{
        $(@"#under_line").ATTR(@"left", @"81%");
        $(@"#under_line").RELAYOUT();
    }];
}

@end
