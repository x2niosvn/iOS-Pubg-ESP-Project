#import <UIKit/UIKit.h>

@interface InfoView : UIView

@property(nonatomic,retain)UILabel *teamLb;
@property(nonatomic,retain)UILabel *nameLb;
@property(nonatomic,retain)UILabel *disLb;
@property(nonatomic,retain)UIView *xueBar1;
@property(nonatomic,retain)UIView *xueBar;

@property(nonatomic,retain)UIView *infoBar;



-(void)setDis:(CGFloat)dis;
-(void)setName:(NSString *)name;
-(void)setTeam:(UInt8)team;
-(void)setPoint:(CGPoint)point;
-(void)setXue:(CGFloat)xue;
-(void)setAi:(Boolean)ai;


+(instancetype)infoViewWithName:(NSString *)name
                isAI:(Boolean *)isAI
                team:(UInt8) team
                xue:(CGFloat) xue
                dis:(CGFloat) dis
               point:(CGPoint) point;

-(UIColor *)colorWithHex:(NSUInteger)hex
                     alpha:(CGFloat)alpha;

@end
