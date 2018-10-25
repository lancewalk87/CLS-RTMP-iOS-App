//
//  ShopCaster-Definitions.h
//  ShopCaster
//
//  Created by Lance T. Walker on 8/29/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UserDefaults        [NSUserDefaults standardUserDefaults]
#define SharedApplication   [UIApplication sharedApplication]
#define MainBundle          [NSBundle mainBundle]
#define MainScreen          [UIScreen mainScreen]

#pragma mark - Device Frame
#define ScreenWidth         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight        [[UIScreen mainScreen] bounds].size.height

#pragma mark - Device
#define SystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define IsRetina ([[UIScreen mainScreen] scale]==2)
#define IsiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsAfterIOS4 ([[[UIDevice currentDevice] systemVersion] intValue]>4)
#define IsAfterIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]>5)
#define IsAfterIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]>6)

#define AppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];


#define SetX(v, x)               v.frame = CGRectMake(x, v.frame.origin.y, v.frame.size.width, v.frame.size.height)
#define SetY(v, y)               v.frame = CGRectMake(v.frame.origin.x, y, v.frame.size.width, v.frame.size.height)
#define SetWidth(v, w)           v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, w, v.frame.size.height)
#define SetHeight(v, h)          v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, v.frame.size.width, h)
#define SetOrigin(v, x, y)       v.frame = CGRectMake(x, y, v.frame.size.width, v.frame.size.height)
#define SetSize(v, w, h)         v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, w, h)
#define SetFrame(v, x, y, w, h)  v.frame = CGRectMake(x, y, w, h)
#define AddX(v, offset)          v.frame = CGRectMake(v.frame.origin.x + offset, v.frame.origin.y, v.frame.size.width, v.frame.size.height)
#define AddY(v, offset)          v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y + offset, v.frame.size.width, v.frame.size.height)

#define X(v)                     v.frame.origin.x
#define Y(v)                     v.frame.origin.y
#define Width(v)                 v.frame.size.width
#define Height(v)                v.frame.size.height
#define Origin(v)                v.frame.origin
#define Size(v)                  v.frame.size
