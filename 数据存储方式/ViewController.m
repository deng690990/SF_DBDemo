//
//  ViewController.m
//  数据存储方式
//
//  Created by 首牛 on 2017/7/22.
//  Copyright © 2017年 ShouNew.com. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import <LKDBHelper.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    

    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    [btn setTitle:@"查询所有" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(qureyAll) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
    [btn2 setTitle:@"删除所有" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(deleteAll) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 100, 100)];
    [btn3 setTitle:@"增添商品" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(addOne) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 100, 100)];
    [btn4 setTitle:@"删除商品" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(deleteOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, 100, 100)];
    [btn5 setTitle:@"修改商品" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(changeOneWithStr:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
}
-(void)qureyAll{
    NSMutableArray* array = [Product searchWithWhere:nil];
    for (Product *p in array) {
        NSLog(@"%@",p.name);
    }
}
-(void)deleteAll{
    
    [Product deleteWithWhere:nil];
}
-(void)addOne{
    //插入数据    insert table row
    Product *product = [[Product alloc]init];
    product.name = @"首牛多功";
    product.productId = 10;
    product.price = 10.00;
    product.color = @"蓝色糖果类";
    
    
    //同步 插入第一条 数据   Insert the first
    [product saveToDB];
}
-(void)deleteOne{
    [Product deleteWithWhere:[NSString stringWithFormat:@"name like '老邓'"]];
}
-(void)changeOneWithStr:(NSString *)str{
    str = @"10";
    Product *p = [Product searchSingleWithWhere:[NSString stringWithFormat:@"productId like %@",str] orderBy:nil];
    p.name = @"老邓";
    [Product updateToDB:p where:nil];
}



@end
