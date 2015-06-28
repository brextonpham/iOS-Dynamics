//
//  ViewController.m
//  Dynamics
//
//  Created by Brexton Pham on 6/28/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIDynamicAnimator *_animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.square]];
    //gravity.gravityDirection = CGVectorMake(1, 0);
    //gravity.angle = 0.45;
    
    [_animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.square]];
    
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [_animator addBehavior:collision];
    
    UIDynamicItemBehavior *dynamicItem = [[UIDynamicItemBehavior alloc] initWithItems:@[self.square]];
    dynamicItem.elasticity = 0.5;
    [_animator addBehavior:dynamicItem];
    
    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.square attachedToAnchor:self.square2.center];
    attachment.frequency = 1.0;
    attachment.damping = 0.1;
    
    [_animator addBehavior:attachment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
