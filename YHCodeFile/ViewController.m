//
//  ViewController.m
//  YHCodeFile
//
//  Created by mrlee on 2017/3/28.
//  Copyright © 2017年 mrlee. All rights reserved.
//

#import "ViewController.h"
#import "Text.h"
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
- (IBAction)save:(id)sender {
    Text *t = [[Text alloc]init];
    t.name = @"1";
    t.name2 = @"2";
    t.name3 = @"3";
    [t save:t WithFileName:@"11.11"];
    
}

- (IBAction)read:(id)sender {
    Text *t  = [Text readfileName:@"11.11"];
    NSLog(@"%@,%@,%@",t.name3,t.name1,t.name);
}
- (IBAction)saveTest2:(id)sender {
}
- (IBAction)readTest2Read:(id)sender {
}

@end
