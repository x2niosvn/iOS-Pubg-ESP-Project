//emo
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^Lvliangliangwudifangfeng)(NSArray *data, NSArray *hpData, NSArray *disData,NSArray *nameData,NSArray *aiData);
@interface lvllzuobiao : NSObject

+ (instancetype)data;

- (void)fetchData:(Lvliangliangwudifangfeng)block;

@end

NS_ASSUME_NONNULL_END

