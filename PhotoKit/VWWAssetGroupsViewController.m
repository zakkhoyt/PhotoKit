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
#import "PhotosController.h"

//#define VWW_USE_PHOTOS 1
static NSString *VWWSegueAssetGroupsToAssetGroup = @"VWWSegueAssetGroupsToAssetGroup";

@interface VWWAssetGroupsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) AssetController *assetController;
@property (nonatomic, strong) NSArray *assetGroups;
@property (nonatomic, strong) NSArray *collectionGroups;
@property (nonatomic, strong) PhotosController *photosController;
@end

@implementation VWWAssetGroupsViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.assetController = [AssetController sharedInstance];
    self.photosController = [PhotosController sharedInstance];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
#if defined(VWW_USE_PHOTOS)
    [self.photosController getCollectionsOfCollectionsWithCompletionBlock:^(NSArray *array) {
        
    } errorBlock:^(NSError *error) {
        
    }];

#else
    [self.assetController getAssetGroupsWithCompletionBlock:^(NSArray *assetGroups) {
        self.assetGroups = [assetGroups copy];
        [self.tableView reloadData];
    } errorBlock:^(NSError *error) {
        self.assetGroups = nil;
        [self.tableView reloadData];
    }];

#endif
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
#if defined(VWW_USE_PHOTOS)
    return self.collectionGroups.count;
#else
    return self.assetGroups.count;
#endif
    
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
