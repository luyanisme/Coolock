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
//  CalendarBoardCell_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 5/29/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "CalendarBoardCell_iPhone.h"

#pragma mark -

@implementation CalendarBoardCell_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    //[UIFont fontWithName:@"HYXiYuanJ" size:15.0f]
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    calendar.frame = CGRectMake(10, 75, SCREEN_WIDTH-20, SCREEN_HEIGHT*0.82);
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor colorWithRed:0.15 green:0.16 blue:0.21 alpha:0.5];
    calendar.dateBackgroundColor = [UIColor clearColor];
    calendar.dateBorderColor = [UIColor clearColor];
    calendar.selectedDateBackgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.16 alpha:0.5f];
    calendar.dateTextColor = [UIColor colorWithRed:1 green:0.5 blue:0.38 alpha:1.0f];
    calendar.selectedDateTextColor = [UIColor colorWithRed:0.62 green:0.62 blue:0.63 alpha:1.0f];
    calendar.currentDateTextColor = [UIColor colorWithRed:0.62 green:0.62 blue:0.63 alpha:1.0f];
    calendar.dayOfWeekTextColor = [UIColor colorWithRed:0.62 green:0.62 blue:0.63 alpha:1.0f];
    calendar.titleFont = [UIFont fontWithName:@"HYXiYuanJ" size:15];
    calendar.dayOfWeekFont = [UIFont fontWithName:@"HYXiYuanJ" size:15];
    calendar.dateFont = [UIFont fontWithName:@"HYXiYuanJ" size:15];
    calendar.layer.cornerRadius = 8.0f;
    [self addSubview:calendar];

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

#pragma mark - Delegate of calendar
- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date
{
    //日历集成的代码，没有设置时区，导致点击某一天比实际差一天，这块代码进行修改
    //源代码中修改，会导致天数乱掉
    //    NSString* clickDate = [self getCurrentDate:date];
    //    NSLog(@"%@",clickDate);
    //    [self postNotification:self.DATE_CHANGE withObject:date];
    //    [self.stack popBoardAnimated:YES];
}
@end
