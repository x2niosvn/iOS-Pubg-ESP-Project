#import "InfoView.h"







@interface InfoView()

@end

@implementation InfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {



        
        _disLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 27, 100, 10)]; 
        _disLb.textAlignment=NSTextAlignmentCenter;
        _disLb.textColor = [UIColor greenColor];
  _disLb.backgroundColor = [UIColor clearColor];
        _disLb.font = [UIFont boldSystemFontOfSize:9];


        [self addSubview:_disLb];

        



        _infoBar = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 100, 15)];
        _infoBar.backgroundColor = [UIColor clearColor];
        _infoBar.layer.masksToBounds=YES;
        _infoBar.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.6];
        [self addSubview:_infoBar];
        


        [self addSubview:_infoBar];




        _teamLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 15)];
        _teamLb.textAlignment=NSTextAlignmentCenter;
        _teamLb.textColor = [UIColor whiteColor];
        _teamLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        _teamLb.font = [UIFont boldSystemFontOfSize:9];
        [_infoBar addSubview:_teamLb];
        
        _nameLb = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 80, 15)];
        _nameLb.textColor = [UIColor whiteColor];
        _nameLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        _nameLb.font = [UIFont boldSystemFontOfSize:9];
        [_infoBar addSubview:_nameLb];
        
        _xueBar = [[UIView alloc] initWithFrame:CGRectMake(0, 25, 100, 2)];
        _xueBar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];

        [self addSubview:_xueBar];


    }
    return self;
}
#pragma mark--功能性方法
-(UIColor*)colorWithHex:(NSUInteger)hex
                  alpha:(CGFloat)alpha
{
    float r, g, b, a;
    a = alpha;
    b = hex & 0x0000FF;
    hex = hex >> 8;
    g = hex & 0x0000FF;
    hex = hex >> 8;
    r = hex;

    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                           blue:b/255.0f
                           alpha:a];
}

#pragma mark----实现类方法
+(instancetype)infoViewWithName:(NSString *)name
                           isAI:(Boolean *)isAI
                           team:(UInt8) team
                            xue:(CGFloat) xue
                            dis:(CGFloat) dis
                          point:(CGPoint) point

{
    InfoView *infoView=[[InfoView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    infoView.backgroundColor=[UIColor clearColor];
    infoView.center=point;
    infoView.layer.masksToBounds=YES;
    infoView.dis=dis;
    infoView.xue = xue;
    infoView.team=team;
    infoView.name=name;
    return infoView;
}
#pragma mark--给属性重新赋值
-(void)setDis:(CGFloat)dis
{
    _disLb.text=[NSString stringWithFormat:@"%d M",(int)dis];
}

-(void)setName:(NSString *)name
{
    _nameLb.text=[NSString stringWithFormat:@" %@",name];
}

-(void)setTeam:(UInt8)team
{
    NSUInteger colorArray[] = {0x333333,0x333366,0x336633,0x336633,0x339999,0x33CCCC,0x663333,0x663366,0x663366,0x999933,0xCC3366,0xCC6666,0xCC6633,0xFF9966,0x660066};

    UIColor *color = [self colorWithHex:colorArray[team % (sizeof(colorArray)/8)] alpha:0.6];
    _infoBar.backgroundColor = color;
    
    _teamLb.text=[NSString stringWithFormat:@"%d",team];
}

-(void)setPoint:(CGPoint)point
{
    CGPoint centerPoint = CGPointMake(UIScreen.mainScreen.bounds.size.width * 0.5, UIScreen.mainScreen.bounds.size.height * 0.5);
    float xDis,yDis,centerDis;
    xDis = point.x + 50 - centerPoint.x;
    yDis = point.y + 32 - centerPoint.y;
    centerDis = sqrt(xDis*xDis+yDis*yDis);
    if(centerDis <= 50) {
        _disLb.hidden = YES;
        _infoBar.hidden = YES;
    } else {
        _disLb.hidden = NO;
        _infoBar.hidden = NO;
    }
    self.center=point;
}

-(void)setXue:(CGFloat)xue
{
    if(xue > 100) xue = 100;
    _xueBar.frame = CGRectMake(0, 25, xue, 2);
}

-(void)setAi:(Boolean)ai
{
    //if(ai) {
        //_xueBar.backgroundColor = [self colorWithHex:0x19CAAD alpha:0.6];
   // } else {
    //    _xueBar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
  //  }
}
@end
