//
//  ViewController.m
//  HSFolderCellDemo
//
//  Created by He Shun on 2018/3/6.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import "ViewController.h"
#import "DemoFoldingCell.h"

static CGFloat closeHeight = 181;
static CGFloat openHeight = 496;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, copy) NSMutableArray * itemHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemHeight.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(![cell isMemberOfClass:[DemoFoldingCell class]]){
        return;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    if([self.itemHeight[indexPath.row] floatValue] == closeHeight){
        [(DemoFoldingCell *)cell unfold:NO animated:NO completion:nil];
    } else {
        [(DemoFoldingCell *)cell unfold:YES animated:NO completion:nil];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoFoldingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[DemoFoldingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.itemHeight[indexPath.row] floatValue];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoFoldingCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSTimeInterval duration = 0.0;
    if([self.itemHeight[indexPath.row] floatValue] == closeHeight){
        //open cell
        self.itemHeight[indexPath.row] = [NSNumber numberWithFloat:openHeight];
        [cell unfold:YES animated:YES completion:nil];
        duration = 0.5;
    }else{
        //close cell
        self.itemHeight[indexPath.row] = [NSNumber numberWithFloat:closeHeight];
        [cell unfold:NO animated:YES completion:nil];
        duration = 1.1;
    }
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [tableView beginUpdates];
        [tableView endUpdates];
    } completion:nil];
}


-(UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

-(NSMutableArray *)itemHeight{
    if(_itemHeight == nil){
        _itemHeight = [NSMutableArray array];
        for(int i = 0; i < 15; i ++){
            [_itemHeight addObject:[NSNumber numberWithFloat:closeHeight]];
        }
    }
    
    return _itemHeight;
}



@end
