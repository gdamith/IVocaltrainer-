//
//  WarmsUpsView.m
//  Ivocal-trainer
//
//  Created by Gayanath Damith Amarasinghe on 8/21/17.
//  Copyright © 2017 Gayanath Damith Amarasinghe. All rights reserved.
//

#import "WarmsUpsView.h"

@interface WarmsUpsView (){
    NSMutableArray *WarmsUpsArray;
    NSMutableDictionary *WarmsUpsDict;
}

@end

@implementation WarmsUpsView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationController];
    WarmsUpsArray = [[NSMutableArray alloc]init];
    WarmsUpsDict = [[NSMutableDictionary alloc]init];
    // Do any additional setup after loading the view.
}


-(void)initNavigationBar{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#FE4E71"]}];
    
    self.title = @"Warm Ups";
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"warmupscell"];
    //    cell.titleLbl.text = ;
    //    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[]
    //                         placeholderImage:[UIImage imageNamed:@"user_cover"]
    //                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {}];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WarmsUpsDict = [[NSMutableDictionary alloc]initWithDictionary:[WarmsUpsArray objectAtIndex:indexPath.row]];
    [self performSegueWithIdentifier:@"toprofile" sender:nil];
}




-(void)getWarmUps{
    [SVProgressHUD show];
    NSString *apiUrl = [NSString stringWithFormat:@"%@%@",BASE_URL,SONG_PLAYLIST];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = NO;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:apiUrl parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              // NSLog(@"getAllSongs  : %@", responseObject);
              WarmsUpsArray = [[responseObject valueForKey:@"Warmups"] mutableCopy];
              NSLog(@"WarmsUps  : %@", WarmsUpsArray);
              [self.warmsTbl reloadData];
              
              
              [SVProgressHUD dismiss];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: response%@", operation.response);
              [Alerts showAlertWithTitle:@"Camera" message:@"It seems that your device doesn't support camera. " controller: self];
              
              [SVProgressHUD dismiss];
          }
     ];
    [manager self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toprofile"]) {
        WarmsUpsProfileView *vc = [segue destinationViewController];
        vc.warmsUpsDict = [WarmsUpsDict mutableCopy];
        
    }
}
@end
