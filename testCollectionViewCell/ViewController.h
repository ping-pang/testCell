//
//  ViewController.h
//  testCollectionViewCell
//
//  Created by zt on 16/9/2.
//  Copyright © 2016年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
}
@property (strong, nonatomic)UICollectionView *collectionView;

@end
