//
//  CookieStorage.h
//  ShopCaster
//
//  Created by Lance T. Walker on 9/6/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HTTPRouterCookieStorage) {
    HTTPRouterCookiesShared = 0,
    HTTPRouterCookesStorageLocal = 1,
    HTTPRouterCookieStorageNone = 2,
    HTTPRouterCookieStorageUndefined = NSUIntegerMax
};

