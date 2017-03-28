//
//  YHCodeBase.m
//  YHCodeFile
//
//  Created by mrlee on 2017/3/28.
//  Copyright © 2017年 mrlee. All rights reserved.
//

#import "YHCodeBase.h"
#import "objc/runtime.h"
@implementation YHCodeBase
- (void)encodeWithCoder:(NSCoder *)coder
{
   //归档
    //获取类属性个数
    unsigned int count = 0;
    //count 需要改变所以穿入&count c的常识
    //ivars 类似数组 不会越界
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i =0 ; i<count; i++) {
        //获取属性名作为key
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //获取value
        id value = [self valueForKey:key];
        //存入归档文件
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
    
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        //解档
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i =0 ; i<count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
         free(ivars);
    }
    return self;
}
-(void)save:(NSObject *)objc WithFileName:(NSString *)fileName{
    NSString *temp = NSTemporaryDirectory();
    if (fileName==nil) {
        NSLog(@"---------请输入FileName---------------");
//        fileName = [NSString stringWithFormat:@"%@.%@",NSStringFromClass([objc class]),NSStringFromClass([objc class])];
    }
    NSString *filePath = [temp stringByAppendingPathComponent:fileName];
    [NSKeyedArchiver archiveRootObject:objc toFile:filePath];
    NSLog(@"%@",filePath);
}
+(id)readfileName:(NSString *)fileName{
    if (fileName==nil) {
        NSLog(@"---------请输入FileName---------------");
        //        fileName = [NSString stringWithFormat:@"%@.%@",NSStringFromClass([objc class]),NSStringFromClass([objc class])];
    }
    NSString* temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:fileName];
    NSObject * objc = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return objc;
}
@end
