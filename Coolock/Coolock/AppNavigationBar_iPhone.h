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
//  AppNavigationBar_iPhone.h
//  Coolock
//
//  Created by 卢棪 on 2/28/15.
//  Copyright (c) 2015 _Luyan. All rights reserved.
//

#import "Bee.h"

AS_UI(AppNavigationBar_iPhone, navigationBar)

#pragma mark -

@interface AppNavigationBar_iPhone : BeeUICell

AS_SINGLETON(AppNavigationBar_iPhone)
@property (nonatomic, strong) NSString        *tagImage;//标识当前页的主题图片
@property (nonatomic, strong) NSString        *title;//当前页的主要内容
@property (nonatomic, strong) BeeUIButton     *frontBtn;//导航栏后面的两个按钮的前者
@property (nonatomic, strong) BeeUIButton     *behindBtn;//导航栏后面的两个按钮的后者

@end
