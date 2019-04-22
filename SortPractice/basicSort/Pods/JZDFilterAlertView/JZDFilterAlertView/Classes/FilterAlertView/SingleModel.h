//
//  SingleModel.h
//  SingleCaseTest
//
//  Created by tangyunchuan on 2019/4/8.
//  Copyright © 2019 yqs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleModel : NSObject
+ (SingleModel *)shareModel;
@property (nonatomic , copy) NSString *myName;
@end

NS_ASSUME_NONNULL_END
