//
//  TableViewController.m
//  LGViewsDemo
//
//  Created by Grigory Lutkov on 18.02.15.
//  Copyright (c) 2015 Grigory Lutkov. All rights reserved.
//

#import "TableViewController.h"
#import "ButtonViewController.h"
#import "LabelViewController.h"
#import "TextFieldViewController.h"
#import "TextViewViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *titlesArray;

@end

@implementation TableViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        self.title = @"LGRefreshView";
        
        _titlesArray = @[@"LGButton",
                         @"LGLabel",
                         @"LGTextField",
                         @"LGTextView"];
                
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titlesArray.count;
}

#pragma mark - UITableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.font = [UIFont systemFontOfSize:16.f];
    cell.textLabel.text = _titlesArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        ButtonViewController *viewController = [[ButtonViewController alloc] initWithTitle:_titlesArray[indexPath.row]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (indexPath.row == 1)
    {
        LabelViewController *viewController = [[LabelViewController alloc] initWithTitle:_titlesArray[indexPath.row]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (indexPath.row == 2)
    {
        TextFieldViewController *viewController = [[TextFieldViewController alloc] initWithTitle:_titlesArray[indexPath.row]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (indexPath.row == 3)
    {
        TextViewViewController *viewController = [[TextViewViewController alloc] initWithTitle:_titlesArray[indexPath.row]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
