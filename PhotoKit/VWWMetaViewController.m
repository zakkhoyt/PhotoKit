//
//  VWWMetaViewController.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWMetaViewController.h"
#import "AssetController.h"

#import "VWWDictionaryTableViewCell.h"
#import "VWWArrayTableViewCell.h"
#import "VWWStringTableViewCell.h"
#import "VWWNumberTableViewCell.h"


#import "VWWMetaDictionaryViewController.h"
#import "VWWMetaArrayViewController.h"

@interface VWWMetaViewController () 
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation VWWMetaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.alpha = 0.0;
    self.textView.hidden = YES;
    
    self.tableView.contentInset = UIEdgeInsetsMake([UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height, 0, 0, 0);
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *metadata = self.asset.defaultRepresentation.metadata;
    if(metadata){
        self.textView.text = metadata.description;
        VWW_LOG_INFO(@"Metadata: %@", metadata.description);
    } else {
        self.textView.text = @"n/a";
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)segmentValueChanged:(UISegmentedControl*)sender {
    if(sender.selectedSegmentIndex == 0){
        self.tableView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.textView.alpha = 0.0;
            self.tableView.alpha = 1.0;
        } completion:^(BOOL finished) {
            self.textView.hidden = YES;
        }];
        
    } else if(sender.selectedSegmentIndex == 1){
        self.textView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.alpha = 0.0;
            self.textView.alpha = 1.0;
        } completion:^(BOOL finished) {
            self.tableView.hidden = YES;
        }];

    }
}


#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.asset.defaultRepresentation.metadata.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *key = self.asset.defaultRepresentation.metadata.allKeys[indexPath.row];
    NSObject *obj = self.asset.defaultRepresentation.metadata[key];
    if([obj isKindOfClass:[NSDictionary class]]){
        VWWDictionaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWDictionaryTableViewCell"];
        cell.title = key;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    } else if([obj isKindOfClass:[NSArray class]]){
        VWWArrayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWArrayTableViewCell"];
        cell.title = key;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    } else if([obj isKindOfClass:[NSString class]]){
        VWWStringTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWStringTableViewCell"];
        cell.title = key;
        NSString *value = self.asset.defaultRepresentation.metadata[key];
        cell.value = value;
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        return cell;
    } else if([obj isKindOfClass:[NSNumber class]]){
        VWWNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWNumberTableViewCell"];
        cell.title = key;
        NSNumber *value = self.asset.defaultRepresentation.metadata[key];
        cell.value = value;
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        return cell;
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if([cell isKindOfClass:[VWWDictionaryTableViewCell class]]){
        VWWMetaDictionaryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"VWWMetaDictionaryViewController"];
        NSString *key = self.asset.defaultRepresentation.metadata.allKeys[indexPath.row];
        NSDictionary *dictionary = self.asset.defaultRepresentation.metadata[key];
        vc.key = ((VWWDictionaryTableViewCell*)cell).title;
        vc.dictionary = dictionary;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([cell isKindOfClass:[VWWArrayTableViewCell class]]){
        VWWMetaArrayViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"VWWMetaArrayViewController"];
        NSString *key = self.asset.defaultRepresentation.metadata.allKeys[indexPath.row];
        NSArray *array = self.asset.defaultRepresentation.metadata[key];
        vc.array = array;
        vc.key = ((VWWArrayTableViewCell*)cell).title;
        [self.navigationController pushViewController:vc animated:YES];

    } else {
        [cell setSelected:NO];
    }
}


@end
