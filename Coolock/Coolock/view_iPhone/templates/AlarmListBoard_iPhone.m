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
//  AlarmListBoard_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 2/24/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "AlarmListBoard_iPhone.h"
#import "AlarmListBoardCell_iPhone.h"
#import "AppNavigationBar_iPhone.h"

#pragma mark -

@interface AlarmListBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation AlarmListBoard_iPhone

DEF_OUTLET(BeeUIScrollView, alarmList)
SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

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
    
    bee.ui.navigationBar.tagImage = @"clock.png";
    bee.ui.navigationBar.title = @"闹钟";
    
    self.alarmList.animationDuration = 0.25f;
    self.alarmList.lineCount = 1;
    self.alarmList.baseInsets = bee.ui.config.baseInsets;;
    
    self.alarmList.whenReloading = ^{
        self.alarmList.total = 3;
        for (int i = 0; i < self.alarmList.total; i++) {
            BeeUIScrollItem *item = self.alarmList.items[i];
            item.clazz = [AlarmListBoardCell_iPhone class];
            item.size = CGSizeMake(375, 100);
        }

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
