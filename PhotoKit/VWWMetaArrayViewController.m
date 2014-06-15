//
//  VWWMetaArrayViewController.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWMetaArrayViewController.h"
#import "VWWDictionaryTableViewCell.h"
#import "VWWArrayTableViewCell.h"
#import "VWWStringTableViewCell.h"
#import "VWWNumberTableViewCell.h"

#import "VWWMetaDictionaryViewController.h"
#import "VWWMetaArrayViewController.h"


@interface VWWMetaArrayViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation VWWMetaArrayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.key;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSString *key = self.dictionary.allKeys[indexPath.row];
    NSObject *obj = self.array[indexPath.row];
    if([obj isKindOfClass:[NSDictionary class]]){
        VWWDictionaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWDictionaryTableViewCell"];
        cell.title = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    } else if([obj isKindOfClass:[NSArray class]]){
        VWWArrayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWArrayTableViewCell"];
        cell.title = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    } else if([obj isKindOfClass:[NSString class]]){
        VWWStringTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWStringTableViewCell"];
        cell.title = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        NSString *value = (NSString*)obj;
        cell.value = value;
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        return cell;
    } else if([obj isKindOfClass:[NSNumber class]]){
        VWWNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VWWNumberTableViewCell"];
        cell.title = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        NSNumber *value = (NSNumber*)obj;
        cell.value = value;
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        return cell;
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}


#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    if([cell isKindOfClass:[VWWDictionaryTableViewCell class]]){
//        VWWMetaDictionaryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"VWWMetaDictionaryViewController"];
//        NSString *key = self.dictionary.allKeys[indexPath.row];
//        NSDictionary *dictionary = self.dictionary[key];
//        vc.dictionary = dictionary;
//        [self.navigationController pushViewController:vc animated:YES];
//    } else if([cell isKindOfClass:[VWWArrayTableViewCell class]]){
//        VWWMetaArrayViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"VWWMetaArrayViewController"];
//        NSString *key = self.dictionary.allKeys[indexPath.row];
//        NSArray *array = self.dictionary[key];
//        vc.array = array;
//        [self.navigationController pushViewController:vc animated:YES];
//        
//    } else {
//        [cell setSelected:NO];
//    }
}

@end
