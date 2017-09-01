//
//  ViewController2.m
//  MyCeShi
//
//  Created by ml on 2017/4/10.
//  Copyright © 2017年 MingLi. All rights reserved.
//


#import "ViewController2.h"
#import "TableModel.h"
#import "TableViewCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isLoadMore;
    NSInteger _pageNum;
}

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    
}

#pragma mark -协议方法-
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *reuseID = @"reuseID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.tableModel = self.dataArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



#pragma mark -懒加载-

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.view addSubview:_tableView];
    }
    
    
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
        
        for (int i = 0; i<20; i++) {
            
            TableModel *model = [TableModel new];
            if (i%2 == 0) {
                model.descStr = @"我听见雨滴落在青青草地我听见远方下课钟声响起可是我没有听见你的声音认真 呼唤我姓名爱上你的时候还不懂感情离别了才觉得刻骨 铭心为什么没有发现遇见了你是生命最好的事情";
                
                model.nameStr = @"龙鱼之巅";
                model.ret = YES;
            }else{
                model.descStr = @"我听见雨滴落在青青草地我听见远方下课钟声";
                model.nameStr = @"龙鱼之巅我听见雨滴落在青青草地我听见远方下课钟声响起";
                model.ret = NO;
            }
            
            [_dataArr addObject:model];
        }
    }
    return _dataArr;
}


@end
