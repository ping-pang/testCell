//
//  TestViewController.m
//  testCollectionViewCell
//
//  Created by zt on 16/9/2.
//  Copyright © 2016年 zt. All rights reserved.
//

#import "TestViewController.h"
#import "TestCollectionViewCell.h"

@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UIView *collectionHead;
@property(nonatomic,strong)UILabel *lab;

@end

@implementation TestViewController
{
    UITableView *table;
    UICollectionView *collection;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    table = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview: table];
    
    //collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor orangeColor];
    collection.delegate = self;
    collection.dataSource = self;
    
    flowLayout.headerReferenceSize = CGSizeMake(100, 20);//头部

    //注册
    [collection registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    //注册 header
     [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
}

//collection-->headView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    _lab= [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 100, 20)];
    _lab.text = @"产品价格";

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

  UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        
        [headerView addSubview:_lab];
        return headerView;

    }
    return nil;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
//    cell.textLabel.text = @"test";
    [cell.contentView addSubview:collection];
    
    return cell;
    
}

#pragma mark --UICollectionViewCell---
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  500;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //TestCollectionViewCell.h
    static NSString *identifier = @"collectionCell";
    
    TestCollectionViewCell *cell = [collection dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell sizeToFit];
    
           cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        lab.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        cell.backgroundColor = [UIColor blueColor];
        [cell addSubview:lab];
    
    
   
    
    return cell;
    
}

/////////
//collectionView大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width-50)/4, 20);
}

//collecitonView间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(20, 10, 10, 10);
}

////每个collectionview横向的间距
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//    return 50;
//}
////
////纵间距
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    
//    return 20;
//}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
