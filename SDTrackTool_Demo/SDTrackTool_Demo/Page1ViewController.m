//
//  Page1ViewController.m
//  SDTrackTool_Demo
//
//  Created by lisd on 2017/11/23.
//  Copyright © 2017年 lisd. All rights reserved.
//

#import "Page1ViewController.h"
#import "Page2ViewController.h"

@interface Page1ViewController ()

@end

@implementation Page1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)clickPage1Button:(id)sender {
    Page2ViewController *vc = [[Page2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
