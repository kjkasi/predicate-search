//
//  Event.h
//  test
//
//  Created by Anton Minin on 05/08/15.
//  Copyright (c) 2015 Anton Minin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, strong) NSDate *start;

@property (nonatomic, strong) NSDate *end;

@property (nonatomic, strong) NSString *title;

@end
