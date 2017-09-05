//
//  Product.h
//  数据存储方式
//
//  Created by 首牛 on 2017/7/22.
//  Copyright © 2017年 ShouNew.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)int productId;
@property (nonatomic,strong)NSString *color;
@property (nonatomic,assign)float price;
@end
