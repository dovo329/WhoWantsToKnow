//
//  AppSettings.m
//  WhoWantsToKnow
//
//  Created by Douglas Voss on 5/11/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

#import "AppSettings.h"

@implementation AppSettings

+ (instancetype) sharedInstance
{
    static AppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppSettings alloc] init];
        [sharedInstance registerForNotifications];
    });
    
    return sharedInstance;
}

- (void)dealloc
{
    [self unregisterForNotifications];
}

- (void)registerForNotifications
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(respondToViewAppeared:)
               name:ViewAppearedNotificationName
             object:nil];
    /*[nc addobserverForName:ViewAppearedNotificationName
                    object:nil
                     queue:[NSOperationQueue mainQueue]
                usingBlock:^(NSNotification *note) {
                    NSLog(@"view appeared block");
                }];*/
}

- (void)unregisterForNotifications
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //[nc removeObserver:self name:@"viewAppearedNotification" object:nil];
    [nc removeObserver:self];
}

- (void)respondToViewAppeared:(NSNotification *)notification {
    NSLog(@"view appeared this time... %@", notification.name);
}

@end
