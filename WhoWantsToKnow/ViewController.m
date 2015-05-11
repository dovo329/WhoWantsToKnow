//
//  ViewController.m
//  WhoWantsToKnow
//
//  Created by Douglas Voss on 5/11/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

#import "ViewController.h"
#import "AppSettings.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"%@ %s", self, __PRETTY_FUNCTION__);
    
    [super viewDidAppear:animated];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:ViewAppearedNotificationName object:self userInfo:nil];

}

@end
