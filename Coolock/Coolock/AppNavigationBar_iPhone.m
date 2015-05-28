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
//  AppNavigationBar_iPhone.m
//  Coolock
//
//  Created by 卢棪 on 2/28/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "AppNavigationBar_iPhone.h"

DEF_UI(AppNavigationBar_iPhone, navigationBar)
#pragma mark -

@implementation AppNavigationBar_iPhone

DEF_SINGLETON(AppNavigationBar_iPhone)

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

- (void)setTagImage:(NSString *)tagImage{
    $(@"#tagImage").IMAGE(tagImage);
}

- (void)setTitle:(NSString *)title{
    $(@"#title").TEXT(title);
}

- (void)setFrontBtn:(BeeUIButton *)frontBtn{

}

- (void)setBehindBtn:(BeeUIButton *)behindBtn{

}

@end
