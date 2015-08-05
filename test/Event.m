//
//  Event.m
//  test
//
//  Created by Anton Minin on 05/08/15.
//  Copyright (c) 2015 Anton Minin. All rights reserved.
//

#import "Event.h"

@implementation Event

- (NSString *)description {
    return [NSString stringWithFormat:@"title = %@, start = %@, end = %@", self.title, self.start, self.end];
}

@end
