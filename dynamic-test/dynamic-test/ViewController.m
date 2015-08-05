//
//  ViewController.m
//  dynamic-test
//
//  Created by Anton Minin on 25/07/15.
//  Copyright (c) 2015 Anton Minin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *massView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIGravityBehavior *g = [[UIGravityBehavior alloc] initWithItems:@[self.massView]];
    
    [self.animator addBehavior:g];
    
    UICollisionBehavior *c = [[UICollisionBehavior alloc] initWithItems:@[self.massView]];
    
    [c addBoundaryWithIdentifier:@"down" fromPoint:CGPointMake(CGRectGetMinX(self.view.frame), CGRectGetMaxY(self.view.frame)) toPoint:CGPointMake(CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame))];
    
    [self.animator addBehavior:c];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIDynamicAnimator *)animator {
    if (_animator == nil) {
        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        _animator = animator;
    }
    return _animator;
}

@end
