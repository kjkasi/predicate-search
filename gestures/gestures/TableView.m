//
//  TableView.m
//  gestures
//
//  Created by Anton Minin on 26/07/15.
//  Copyright (c) 2015 Anton Minin. All rights reserved.
//

#import "TableView.h"

@implementation TableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //
    return YES;
}

@end
