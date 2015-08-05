//
//  ViewController.m
//  gestures
//
//  Created by Anton Minin on 25/07/15.
//  Copyright (c) 2015 Anton Minin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConst;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *labelTop;

@property (weak, nonatomic) IBOutlet UILabel *labelOffset;

@property (nonatomic, assign) CGFloat offset;

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView addGestureRecognizer:self.panGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIPanGestureRecognizer *)panGesture {
    
    if (_panGesture == nil) {
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        _panGesture = panGesture;
    }
    
    return _panGesture;
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.labelTop.text = [NSString stringWithFormat:@"top = %f", self.topConst.constant];

    
    CGPoint point = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.offset = self.topConst.constant;
        NSLog(@"o %f", self.offset);
    } else {
        [self.tableView removeGestureRecognizer:self.panGesture];
    }
    
    CGFloat scale = point.y - self.offset;
    
    self.labelOffset.text = [NSString stringWithFormat:@"offset = %f", scale];
    /*if (sender.state == UIGestureRecognizerStateChanged) {
        if (self.topConst.constant <= 0.f) {
            self.topConst.constant = 0.f;
            return;
        }
        
        if (self.topConst.constant >= 400.f) {
            self.topConst.constant = 400.f;
            return;
        }

    }*/
    
    
    self.topConst.constant = scale;
    
    //NSLog(@"s %f, o %f", scale, self.offset);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row #%ld", (long)indexPath.row];
    
    return cell;
    
}


@end
