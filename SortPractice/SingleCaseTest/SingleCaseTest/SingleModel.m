//
//  SingleModel.m
//  SingleCaseTest
//
//  Created by tangyunchuan on 2019/4/8.
//  Copyright © 2019 yqs. All rights reserved.
//

#import "SingleModel.h"

@implementation SingleModel

+ (SingleModel *)shareModel{
    static SingleModel *model;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[SingleModel alloc]init];
    });
    return model;
}
@end
