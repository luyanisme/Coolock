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
//  AppTabbar_iPhone.h
//  Coolock
//
//  Created by 卢棪 on 2/27/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "Bee.h"

#pragma mark -

AS_UI( AppTabbar_iPhone, tabbar )

@interface AppTabbar_iPhone : BeeUICell

AS_SINGLETON( AppTabbar_iPhone )

- (void)selectAlarmClock;
- (void)selectPlanList;
- (void)selectSchedule;
- (void)selectManager;
@end
