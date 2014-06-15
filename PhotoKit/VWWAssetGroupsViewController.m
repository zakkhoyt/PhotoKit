//
//  VWWAssetGroupsViewController.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/10/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWAssetGroupsViewController.h"
#import "AssetController.h"
#import "AssetGroupTableViewCell.h"
#import "VWWAssetGroupViewController.h"

static NSString *VWWSegueAssetGroupsToAssetGroup = @"VWWSegueAssetGroupsToAssetGroup";

@interface VWWAssetGroupsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) AssetController *assetController;
@property (nonatomic, strong) NSArray *assetGroups;
@end

@implementation VWWAssetGroupsViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.assetController = [AssetController sharedInstance];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self.assetController getAssetGroupsWithCompletionBlock:^(NSArray *assetGroups) {
        self.assetGroups = [assetGroups copy];
        [self.tableView reloadData];
    } errorBlock:^(NSError *error) {
        self.assetGroups = nil;
        [self.tableView reloadData];
    }];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:VWWSegueAssetGroupsToAssetGroup]){
        VWWAssetGroupViewController *vc = segue.destinationViewController;
        vc.assetsGroup = sender;
    }
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.assetGroups.count;
//    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AssetGroupTableViewCell *cell = (AssetGroupTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"AssetGroupTableViewCell" forIndexPath:indexPath];
    ALAssetsGroup *assetGroup = self.assetGroups[indexPath.row];
    cell.assetsGroup = assetGroup;
    return cell;
}


#pragma mark UITableViewDelegate
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return nil;
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AssetGroupTableViewCell *cell = (AssetGroupTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:VWWSegueAssetGroupsToAssetGroup sender:cell.assetsGroup];
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




@end
