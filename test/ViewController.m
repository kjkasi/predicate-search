//
//  ViewController.m
//  test
//
//  Created by Anton Minin on 05/08/15.
//  Copyright (c) 2015 Anton Minin. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"
#import <EventKit/EventKit.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *events;

@end

@implementation ViewController

- (NSDate *)dateAtDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components.day = day;
    components.month = month;
    components.year = year;
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    //[calendar setTimeZone:timeZone];
    
    NSDate *date = [calendar dateFromComponents:components];
    
    return date;
}

- (NSDate *)dateAtDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year hour:(NSInteger)hour minutes:(NSInteger)minutes second:(NSInteger)second {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components.day = day;
    components.month = month;
    components.year = year;
    components.hour = hour;
    components.minute = minutes;
    components.second = second;
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    //[calendar setTimeZone:timeZone];
    
    NSDate *date = [calendar dateFromComponents:components];
    
    return date;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    Event *event1 = [[Event alloc] init];
    event1.start = [self dateAtDay:1 month:8 year:2015];
    event1.end = [self dateAtDay:2 month:8 year:2015];
    event1.title = @"1";
    
    Event *event2 = [[Event alloc] init];
    event2.start = [self dateAtDay:8 month:8 year:2015];
    event2.end = [self dateAtDay:8 month:8 year:2015];
    event2.title = @"2";

    Event *event3 = [[Event alloc] init];
    event3.start = [self dateAtDay:8 month:8 year:2015];
    event3.end = [self dateAtDay:9 month:8 year:2015];
    event3.title = @"3";
    
    Event *event4 = [[Event alloc] init];
    event4.start = [self dateAtDay:8 month:8 year:2015 hour:10 minutes:0 second:0];
    event4.end = [self dateAtDay:8 month:8 year:2015 hour:19 minutes:0 second:0];
    event4.title = @"4";
    
    Event *event5 = [[Event alloc] init];
    event5.start = [self dateAtDay:7 month:8 year:2015 hour:10 minutes:0 second:0];
    event5.end = [self dateAtDay:9 month:8 year:2015 hour:19 minutes:0 second:0];
    event5.title = @"5";
    
    Event *event6 = [[Event alloc] init];
    event6.start = [self dateAtDay:7 month:8 year:2015 hour:10 minutes:0 second:0];
    event6.end = [self dateAtDay:8 month:8 year:2015 hour:19 minutes:0 second:0];
    event6.title = @"6";
    
    Event *event7 = [[Event alloc] init];
    event7.start = [self dateAtDay:7 month:8 year:2015 hour:10 minutes:0 second:0];
    event7.end = [self dateAtDay:8 month:8 year:2015 hour:23 minutes:59 second:59];
    event7.title = @"7";
    
    Event *event8 = [[Event alloc] init];
    event8.start = [self dateAtDay:8 month:8 year:2015 hour:0 minutes:0 second:0];
    event8.end = [self dateAtDay:9 month:8 year:2015 hour:19 minutes:0 second:0];
    event8.title = @"8";
    
    
    NSDate *startDate = [self dateAtDay:8 month:8 year:2015];
    NSDate *endDate = [self dateAtDay:8 month:8 year:2015 hour:23 minutes:59 second:59];
    
    NSPredicate *prStart = [NSPredicate predicateWithFormat:@"start <= %@ AND end >= %@", startDate, startDate];
    NSPredicate *prEnd = [NSPredicate predicateWithFormat:@"start <= %@ AND end >= %@", endDate, endDate];
    NSPredicate *prMiddle = [NSPredicate predicateWithFormat:@"start <= %@ AND end >= %@", startDate, endDate];
    NSPredicate *prOther = [NSPredicate predicateWithFormat:@"start >= %@ AND end <= %@", startDate, endDate];
    
    NSCompoundPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[prStart, prEnd, prMiddle, prOther]];
    
    NSArray *array = @[event1, event2, event3, event4, event5, event6, event7, event8];
    
    
    
    NSArray *sort = [array filteredArrayUsingPredicate:predicate];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
