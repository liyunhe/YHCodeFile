//
//  YHCodeBase.h
//  YHCodeFile
//
//  Created by mrlee on 2017/3/28.
//  Copyright © 2017年 mrlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHCodeBase : NSObject<NSCoding>
-(void)save:(NSObject *)objc WithFileName:(NSString *)fileName;
+(id)readfileName:(NSString *)fileName;
@end
