//
//  DashboardView.m
//  Ivocal-trainer
//
//  Created by Gayanath Damith Amarasinghe on 7/13/17.
//  Copyright © 2017 Gayanath Damith Amarasinghe. All rights reserved.
//

#import "DashboardView.h"

@interface DashboardView ()

@end

@implementation DashboardView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self initNavigationBar];

}

-(void)initNavigationBar{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor colorWithHexString:@"#1D1D1D"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
