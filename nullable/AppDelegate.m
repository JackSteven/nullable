//
//  AppDelegate.m
//  nullable
//
//  Created by vincent on 16/3/7.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)testDictionaryNullable {
    id nilObj  = nil;
    
    // 1. 此处会引起崩溃
    NSDictionary *dict = @{@"aa": nilObj, @"bb": @"bb"};
    NSLog(@"dict: %@", dict);
    
    NSMutableDictionary *mDict = [NSMutableDictionary new];
    mDict[@"aaa"] = nilObj; // 此处不会有问题
    [mDict setObject:@"bbb" forKey:@"bbb"];
    
    // 2. 此处会引起崩溃
    [mDict setObject:nilObj forKey:@"ccc"];
    
    NSLog(@"mDict: %@", mDict);
}

- (void)testArrayNullable {
    id nilObj  = nil;
    
    // 3. 此处会引起崩溃
    NSArray *array = @[@"aa", nilObj];
    NSLog(@"array: %@", array);
    
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:2];
    
    // 4. 此处会引起崩溃
    mArray[0] = nilObj;
    
    // 5. 此处会引起崩溃
    [mArray addObject:nilObj];
    [mArray addObject:@"bbb"];
    NSLog(@"mArray: %@", mArray);
}

- (void)testNSNull {
    NSString *nilObj = (NSString *)[NSNull null];
    
    NSLog(@"null:%d", [nilObj length]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self testDictionaryNullable];
    [self testArrayNullable];
    [self testNSNull];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
