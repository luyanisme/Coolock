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
//  ScheduleBoard_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 5/29/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "ScheduleBoard_iPhone.h"
#import "AppNavigationBar_iPhone.h"
#import "CalendarBoardCell_iPhone.h"

#pragma mark -

@interface ScheduleBoard_iPhone()<CKCalendarDelegate>
{
	//<#@private var#>
}
@end

@implementation ScheduleBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

DEF_OUTLET(BeeUIScrollView, calendarList)

- (void)load
{
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0f];
    
        
    self.calendarList.lineCount = 1;
    self.calendarList.animationDuration = 0.25f;
    
    self.calendarList.whenReloading = ^{
        self.calendarList.total = 1;
        
        BeeUIScrollItem *item = self.calendarList.items[0];
        item.clazz = [CalendarBoardCell_iPhone class];
        item.size = self.calendarList.size;
    };
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
}

ON_WILL_APPEAR( signal )
{
    bee.ui.navigationBar.tagImage = @"schedule_icon.png";
    bee.ui.navigationBar.title = @"安排";
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

@end
