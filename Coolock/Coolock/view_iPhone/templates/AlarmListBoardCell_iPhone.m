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
//  AlarmListBoardCell_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 2/24/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "AlarmListBoardCell_iPhone.h"

#pragma mark -

@implementation AlarmListBoardCell_iPhone

DEF_SIGNAL(TOUCHED)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.tapSignal = self.TOUCHED;
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

ON_SIGNAL2(AlarmListBoardCell_iPhone, signal){

}
@end
