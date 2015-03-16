//
//  ViewController.m
//  SegueThreadDemo
//
//  Created by Tom Elliott on 16/03/2015.
//  Copyright (c) 2015 The Other Tom Elliott. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doSegueOnMain:(id)sender {
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

- (IBAction)doSegueOnNewQueue:(id)sender {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self performSegueWithIdentifier:@"detailSegue" sender:self];
    });
}

@end
