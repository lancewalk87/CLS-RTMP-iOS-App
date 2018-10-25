//
//  HTTPRouter.h
//  ShopCaster
//
//  Created by Lance T. Walker on 6/21/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CookieStorage.h"

#pragma mark - class defaults
extern NSString    *const kHTTPRootAddress;
extern NSUInteger   const kHTTPRouterCancelationError;
extern NSUInteger   const kHTTPRouterDefaultTimeout;
extern int64_t      const kHTTPRouterDataMax;

@class HTTPRouter;

#pragma mark - session blocks
typedef void (^sendRequestBlock_t)      (HTTPRouter *request);
typedef void (^uploadProgressBlock_t)   (int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite);
typedef void (^downloadProgressBlock_t) (NSData *data, int64_t totalBytesReceived, int64_t totalBytesExpectedToReceive);
typedef void (^completionBlock_t)       (NSDictionary *headers, NSString *body);
typedef void (^completionDataBlock_t)   (NSDictionary *headers, NSData *body);
typedef void (^errorBlock_t)            (NSError *error);

@interface HTTPRouter : NSObject <NSURLSessionDataDelegate>
#pragma mark - initializers
+ (instancetype) requestWithURL:(NSURL *)url;
+ (instancetype) requestWithURLRoute:(NSString *)route;
- (instancetype) init                   UNAVAILABLE_ATTRIBUTE;
+ (instancetype) new                    UNAVAILABLE_ATTRIBUTE;

@property (copy) uploadProgressBlock_t      uploadProgressBlock;
@property (copy) downloadProgressBlock_t    downloadProgressBlock;
@property (copy) completionBlock_t          completionBlock;
@property (copy) errorBlock_t               errorBlock;
@property (copy) completionDataBlock_t      completionDataBlock;

@property (nonatomic, strong) NSString *HTTPMethod;
@property (nonatomic, strong) NSMutableDictionary *requestHeaders;
@property (nonatomic, strong) NSDictionary *POSTDictionary;
@property (nonatomic, strong) NSDictionary *GETDictionary;
@property (nonatomic, strong) NSData *rawPOSTData;
@property (nonatomic) NSStringEncoding POSTDataEncoding;
@property (nonatomic) NSTimeInterval timeoutSeconds;
@property (nonatomic) BOOL addCredentialsToURL;
@property (nonatomic) BOOL encodePOSTDictionary;
@property (nonatomic) BOOL encodeGETDictionary;
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic) BOOL preventRedirections;
@property (nonatomic) BOOL useUploadTaskInBackground;
@property (nonatomic) HTTPRouterCookieStorage cookieStoragePolicyForInstance;
@property (nonatomic) NSString *sharedContainerIdentifier;

+ (void)setBackgroundCompletionHandler:(void(^)(void))completionHandler forSessionIdentifier:(NSString *)sessionIdentifier;

@property (nonatomic) NSStringEncoding forcedResponseEncoding;
@property (nonatomic, readonly) NSInteger responseStatus;
@property (nonatomic, strong, readonly) NSString *responseStringEncodingName;
@property (nonatomic, strong, readonly) NSDictionary *responseHeaders;
@property (nonatomic, strong) NSString *responseString;
@property (nonatomic, strong, readonly) NSMutableData *responseData;
@property (nonatomic, strong, readonly) NSError *error;
@property (nonatomic) long long responseExpectedContentLength;
@property (nonatomic) BOOL ignoreCache;

+ (void)setGlobalIgnoreCache:(BOOL)ignoreCache;
- (NSString *)debugDescription;
- (NSString *)curlDescription;
- (NSString *)startSynchronousWithError:(NSError **)error;
- (void)startAsynchronous;
- (void)cancel;

+ (void)addCookieToSharedCookiesStorage:(NSHTTPCookie *)cookie;
+ (void)addCookieToSharedCookiesStorageWithName:(NSString *)name value:(NSString *)value url:(NSURL *)url;
- (void)addCookieWithName:(NSString *)name value:(NSString *)value url:(NSURL *)url;
- (void)addCookieWithName:(NSString *)name value:(NSString *)value;
- (NSArray *)requestCookies;
- (NSArray *)sessionCookies;
+ (NSArray *)sessionCookiesInSharedCookiesStorage;
+ (void)deleteAllCookiesFromSharedCookieStorage;
+ (void)deleteAllCookiesFromLocalCookieStorage;
- (void)deleteSessionCookies;
+ (void)setGlobalCookiesStoragePolicy:(HTTPRouterCookieStorage)cookieStoragePolicy;

// Credentials
+ (NSURLCredential *)sessionAuthenticationCredentialsForURL:(NSURL *)requestURL;
- (void)setUsername:(NSString *)username password:(NSString *)password;
- (NSString *)username;
- (NSString *)password;
+ (void)deleteAllCredentials;

// Headers
- (void)setHeaderWithName:(NSString *)name value:(NSString *)value;
- (void)removeHeaderWithName:(NSString *)name;
- (NSDictionary *)responseHeaders;

// Upload
- (void)addFileToUpload:(NSString *)path parameterName:(NSString *)param;
- (void)addDataToUpload:(NSData *)data parameterName:(NSString *)param;
- (void)addDataToUpload:(NSData *)data parameterName:(NSString *)param mimeType:(NSString *)mimeType fileName:(NSString *)fileName;

// Session
+ (void)clearSession;

// DEBUG
- (NSURLRequest *)prepareURLRequest;
@end

@interface NSError (HTTPRouter)
- (BOOL)st_isAuthenticationError;
- (BOOL)st_isCancellationError;
@end

@interface NSString (RFC3986)
- (NSString *)st_stringByAddingRFC3986PercentEscapesUsingEncoding:(NSStringEncoding)encoding;
@end

@interface NSString (STUtilities)
- (NSString *)st_stringByAppendingGETParameters:(NSDictionary *)parameters doApplyURLEncoding:(BOOL)doApplyURLEncoding;
@end
