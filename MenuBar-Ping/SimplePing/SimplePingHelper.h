//
//  SimplePingHelper.h
//  PingTester
//
//  Created by Chris Hulbert on 18/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimplePing.h"

@interface SimplePingHelper : NSObject <SimplePingDelegate>

@property(nonatomic, copy) void (^callback)(NSNumber *);

+ (void)ping:(NSString*)address target:(id)target sel:(SEL)sel;

+ (void)ping:(NSString *)string callback:(void (^)(NSNumber *))callback;

@end
