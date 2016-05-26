//
//  ViewController.m
//  ViewLine
//
//  Created by lhy on 16/5/25.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AddLine.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString * const kCellReuseIdentifier = @"kCellReuseIdentifier";

@implementation ViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

#pragma mark - Delegate
#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    NSString *text;
    switch (indexPath.row) {
        case 0: {
            text = @"上下分割线， 左边距10，右边距0";
            [cell addTopLineWithLeftEdge:10 withRightEdge:0];
            [cell addBottomLineWithLeftEdge:10 withRightEdge:0];
            break;
        }
        case 1: {
            text = @"下分割线， 左边距0，右边距10";
            [cell addBottomLineWithLeftEdge:0 withRightEdge:10];
            break;
        }
        case 2: {
            text = @"下分割线， 左边距10，右边距10";
            [cell addBottomLineWithLeftEdge:10 withRightEdge:10];
            break;
        }
        case 3: {
            text = @"下分割线， 左边距20，右边距0";
            [cell addBottomLineWithLeftEdge:20 withRightEdge:0];
            break;
        }
        case 4: {
            text = @"下分割线， 左边距0，右边距20";
            [cell addBottomLineWithLeftEdge:0 withRightEdge:20];
            break;
        }
        case 5: {
            text = @"下分割线， 左边距20，右边距20";
            [cell addBottomLineWithLeftEdge:20 withRightEdge:20];
            break;
        }
        default:
            text = @"下分割线， 左边距0，右边距0";
            [cell addBottomLineWithLeftEdge:0 withRightEdge:0];
            break;
    }
    
    cell.textLabel.text = text;
    return cell;
}

#pragma mark - CreateUI
- (void)createUI {
    [self.view addSubview:self.tableView];
    
    [self layoutUI];
}

#pragma mark - LayoutUI
- (void)layoutUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}

#pragma mark - Init
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
    }
    
    return _tableView;
}

@end