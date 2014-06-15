//
//  VWWAssetGroupViewController.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWAssetGroupViewController.h"
#import "AssetController.h"
#import "VWWAssetTableViewCell.h"
#import "VWWMetaViewController.h"
#import "VWWGeoViewController.h"

static NSString *VWWSegueAssetsGroupToMeta = @"VWWSegueAssetsGroupToMeta";
static NSString *VWWSegueAssetsGroupToGeo = @"VWWSegueAssetsGroupToGeo";

@interface VWWAssetGroupViewController () <VWWAssetTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *assets;
@end

@implementation VWWAssetGroupViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     NSString *title = [self.assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    self.title = title;
    self.navigationController.navigationBarHidden = NO;
    [[AssetController sharedInstance] getAssetsForGroup:self.assetsGroup completionBlock:^(NSArray *assets) {
        self.assets = [assets copy];
        [self.tableView reloadData];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:VWWSegueAssetsGroupToMeta]){
        VWWMetaViewController *vc = segue.destinationViewController;
        vc.asset = sender;
    } else if([segue.identifier isEqualToString:VWWSegueAssetsGroupToGeo]){
        VWWGeoViewController *vc = segue.destinationViewController;
        vc.asset = sender;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.assetsGroup.numberOfAssets;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VWWAssetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWAssetTableViewCell" forIndexPath:indexPath];
    cell.asset = self.assets[indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark VWWAssetTableViewCellDelegate
-(void)VWWAssetTableViewCellMetaButtonTouchUpInside:(VWWAssetTableViewCell*)sender{
    [self performSegueWithIdentifier:VWWSegueAssetsGroupToMeta sender:sender.asset];
}
-(void)VWWAssetTableViewCellGeoButtonTouchUpInside:(VWWAssetTableViewCell*)sender{
    [self performSegueWithIdentifier:VWWSegueAssetsGroupToGeo sender:sender.asset];
}


@end
