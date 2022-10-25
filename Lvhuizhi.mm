
#import <UIKit/UIKit.h>
#import "esp/Lvhuizhi.h"
#import "esp/Lvzb.h"
#import "esp/hide.h"
#import "Obfuscate.h"
#import "esp/InfoView.h"
#import "esp/ZXZY.h"
#import "esp/menuButtonConfig.h"
#import "esp/slider.h"
#import "A1Config.h"
#import "A2Config.h"
#include <JRMemory/MemScan.h>

#define kTest   0
#define g 0.86602540378444
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^



@interface Lvllhuizhi()
@property (nonatomic,  strong) UILabel *numberLabel;//人数
@property (nonatomic,  strong) CAShapeLayer *drawLayer;//射线
@property (nonatomic,  strong) CAShapeLayer *hpLayer;//血量
@property (nonatomic,  strong) CAShapeLayer *disLayer;//骨骼
@property (nonatomic,  strong) CAShapeLayer *wjLayer;
@property (nonatomic,  strong) CAShapeLayer *AByuanLayer;//连线
@property (nonatomic,  strong) CAShapeLayer *Line_Red;//掩体
@property (nonatomic,  strong) CAShapeLayer *Line_Green;//掩体
@property (nonatomic,  strong) CAShapeLayer *sheLayer1;//射线
@property (nonatomic,  strong) CAShapeLayer *sheLayer2;
@property (nonatomic,  strong) CAShapeLayer *sheLayer3;
@property (nonatomic,  strong) CAShapeLayer *sheLayer4;
@property (nonatomic,  strong) CAShapeLayer *sheLayer5;

@property (nonatomic,  strong) CAShapeLayer *sheLayer7;
@property (nonatomic,  strong) CAShapeLayer *sheLayer8;
@property (nonatomic,  strong) CAShapeLayer *sheLayer9;




@property (nonatomic,  strong) UILabel *cc;//人数

@property (nonatomic,  strong) NSArray *rects;
@property (nonatomic,  strong) NSArray *hpData;
@property (nonatomic,  strong) NSArray *disData;
@property (nonatomic,  strong) NSArray *aiData;
@property (nonatomic,  strong) NSArray *data1;
@property (nonatomic,  strong) NSArray *data2;
@property (nonatomic,  strong) NSArray *data3;
@property (nonatomic,  strong) NSArray *data4;
@property (nonatomic,  strong) NSArray *data5;
@property (nonatomic,  strong) NSArray *data6;
@property (nonatomic,  strong) NSArray *data7;
@property (nonatomic,  strong) NSArray *data8;
@property (nonatomic,  strong) NSArray *nameData;

@property (nonatomic,  strong) NSArray *vc;

@property (nonatomic,  weak) NSTimer *timer;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic) UIButton *btnConsole;


@end
static CATextLayer *mzLabel[100];
static InfoView *infoView[35];
static CATextLayer *po[100];
//static CAShapeLayer *hpLayer[100];//名字+距离
//static CATextLayer *xue[100]
CGRect rect ;
CGFloat xue;
CGFloat dis ;
CGFloat ci;


BOOL kaiguan = NO;
BOOL kaiguan1 = NO;
BOOL kaiguan2 = NO;
BOOL kaiguan3 = NO;
BOOL kaiguan4 = NO;
BOOL kaiguan5 = NO;
BOOL kaiguan6 = NO;
BOOL kaiguan7 = NO;
BOOL kaiguan8 = NO;
BOOL kaiguan9 = NO;

BOOL nothacker = NO;



BOOL arrow = NO;
UIButton *line;
UIButton *line1;
UIButton *menu1;
UIWindow *mainWindow;
UIButton *closeButton;
UIView *menuView;
UIView *menuView1;



UIButton *kgiat;
UIButton *magic;
UIButton *kgiat1;
UIButton *magic1;
UIButton *movingView;
UIButton *menuButton;
UIWindow *cc;
UIWindow *mainWindow2;
UIImage* A1Image;
UIImage* A2Image;
UIView *show;
UIScrollView *scroll;


UISlider *sliderfov;



UIButton*gn1;
UIButton*gn2;
UIButton*gn3;
UIButton*gn4;
UIButton*gn5;
UIButton*gn6;
UIButton*gn7;
UIButton*gn8;


UIButton*hack1;




hidehack *hide1;

UIView *rsView;

BOOL Gn1=NO;
BOOL Gn2=NO;
BOOL Gn3=NO;
BOOL Gn4=NO;
BOOL Gn5=NO;
BOOL Gn6=NO;
BOOL Gn7=NO;
BOOL Gn8=NO;

BOOL Hack1=NO;





BOOL hack=NO;
BOOL hack2=NO;







@implementation Lvllhuizhi
#pragma mark -------------------------------------视图-------------------------------------------

+ (void)load

{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

mainWindow = [UIApplication sharedApplication].keyWindow;






        Lvllhuizhi *view = [Lvllhuizhi lvllhzff];
        [view initViews];
        [view ios];
        [view show];
        [view status];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:view];





hide1 = [[hidehack alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

UIWindow *ln = [[[UIApplication sharedApplication] delegate] window];

[ln addSubview:hide1];






    });

}








+ (instancetype)lvllhzff
{
    return [[Lvllhuizhi alloc] initWithFrame:[UIScreen mainScreen].bounds];
}




- (instancetype)initWithFrame:(CGRect)frame
{




    self = [super initWithFrame:frame];

//[hide1 addSubview:self];

    if (self) {
        
        




        
        self.userInteractionEnabled = NO;











        [self.layer addSublayer:self.drawLayer];//射线
        //[self.layer addSublayer:self.hpLayer];//血量
        //[self.layer addSublayer:self.disLayer];//骨骼
        [self.layer addSublayer:self.wjLayer];
        [self addSubview:self.numberLabel];//人数
        [self.layer addSublayer:self.sheLayer1];
        [self.layer addSublayer:self.sheLayer2];
        [self.layer  addSublayer:self.sheLayer3];
        [self.layer  addSublayer:self.sheLayer4];
        [self.layer  addSublayer:self.sheLayer5];
        [self.layer addSublayer:self.sheLayer7];
        [self.layer addSublayer:self.sheLayer8];
        [self.layer addSublayer:self.sheLayer9];
        [self addSubview:self.cc];//人数
        
        
        
        
        for (NSInteger i = 0; i < 100; i++) {
            infoView[i] = [[InfoView alloc] init];
            infoView[i].hidden = YES;
            [self addSubview:infoView[i]];
            
            
        }
    }
    return self;
}

#pragma mark -------------------------------------事件-------------------------------------------




- (void)show
{
    self.hidden = NO;
    self.timer.fireDate = [NSDate distantPast];
}


- (void)hide
{
    self.hidden = YES;
    self.timer.fireDate = [NSDate distantFuture];
    
    
}
- (void)clearData
{

    for (NSInteger i = 0; i < 100; i++) {
        infoView[i].hidden = YES;
        //hide1.hidden = YES;
         
}

}

- (void)configWithData:(NSArray *)rects hpData:(NSArray *)hpData disData:(NSArray *)disData nameData:(NSArray *)nameData aiData:(NSArray *)aiData 

{
    
    _rects = rects;
    _hpData = hpData;
    _disData = disData;
    _nameData = nameData;
    _aiData = aiData;
    
    





    [self shange];
    [self clearData];
    [self shange];

    
   // [self clear];
   // [self shange];
    
    
}


- (IBAction)shange
{
    //if(kaiguan1==NO) return;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIBezierPath *hpPath = [UIBezierPath bezierPath];
    UIBezierPath *disPath = [UIBezierPath bezierPath];
    UIBezierPath *wjPath = [UIBezierPath bezierPath];
    UIBezierPath *yuanPath = [UIBezierPath bezierPath];
    
    UIBezierPath *shePath1 = [UIBezierPath bezierPath];
    UIBezierPath *shePath2 = [UIBezierPath bezierPath];
    UIBezierPath *shePath3 = [UIBezierPath bezierPath];
    UIBezierPath *shePath4 = [UIBezierPath bezierPath];
    UIBezierPath *shePath5 = [UIBezierPath bezierPath];
    
    UIBezierPath *shePath7 = [UIBezierPath bezierPath];
    UIBezierPath *shePath8 = [UIBezierPath bezierPath];
    UIBezierPath *shePath9 = [UIBezierPath bezierPath];

    float wanjia =0;
    for (NSInteger i = 0; i < _rects.count; i++) {
        
        NSValue *val0  = _rects[i];
        NSNumber *val1 = _hpData[i];
        NSNumber *val2 = _disData[i];
        NSNumber *val3 = _aiData[i];
        _Name = _nameData[i];
        
        
        CGRect rect = [val0 CGRectValue];
        CGFloat xue = [val1 floatValue];
        CGFloat dis = [val2 floatValue];
        Boolean isAi=[val3 boolValue];

        
        float xd = rect.origin.x+rect.size.width/2;
        float yd = rect.origin.y;
        
        CGFloat w = rect.size.width;
        CGFloat h = rect.size.height;
        CGFloat x = rect.origin.x;
        CGFloat y = rect.origin.y;
        





if(nothacker==YES){
[hide1 addSubview:self];

}



if(arrow){


UIBezierPath *sjx = [UIBezierPath bezierPath];
            [sjx moveToPoint:CGPointMake(xd-5, yd-6)];
            [sjx addLineToPoint:CGPointMake(xd+5, yd-6)];
            [sjx addLineToPoint:CGPointMake(xd, yd-1.75)];
            [sjx closePath];
            [wjPath appendPath:sjx];
} 
        
         
                       
        if(kaiguan6==YES){

                       UIBezierPath *line = [UIBezierPath bezierPath];
        [line moveToPoint:CGPointMake(kWidth*0.5, 15)];
        [line addLineToPoint:CGPointMake(xd, yd-28.5)];
[path appendPath:line];
            
        
            
            
        }
            
        if(kaiguan2==YES){
                //方框
                // 方框


               UIBezierPath *sub = [UIBezierPath bezierPathWithRect:rect];
                [path appendPath:sub];
            
            
        }


    if(kaiguan7==YES){

        
  UIBezierPath *YQCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kWidth/2,kHeight/2) radius:sliderfov.value startAngle:(0) endAngle:M_PI*2 clockwise:true];
            [shePath7 appendPath:YQCircle];



}















    if(kaiguan8==YES){

if(xd>=kWidth/2-sliderfov.value && xd<=kWidth/2+sliderfov.value && yd>=kHeight/2-sliderfov.value && yd<=kHeight/2+sliderfov.value){

        UIBezierPath *line = [UIBezierPath bezierPath];
        [line moveToPoint:CGPointMake(kWidth/2,kHeight/2)];
        [line addLineToPoint:CGPointMake(xd, yd+1)];

[shePath8 appendPath:line];
}


}
    if(kaiguan9==YES){

 if(xd<0){
  UIBezierPath *YQCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0,yd) radius:20 startAngle:(0) endAngle:M_PI*2 clockwise:true];
            [shePath9 appendPath:YQCircle];
}
 if(xd>kWidth && yd>0 && yd<kHeight){
  UIBezierPath *YQCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kWidth-0, yd) radius:20 startAngle:(0) endAngle:M_PI*2 clockwise:true];
            [shePath9 appendPath:YQCircle];
}

}
 
 
        if(kaiguan3==YES){
                
                // 血量
                CGRect hpRect = CGRectMake(xd-20, yd-18, xue*0.4,  3);
                UIBezierPath *hpBz = [UIBezierPath bezierPathWithRect:hpRect];
                [hpPath appendPath:hpBz];

        }
        
        
        if(kaiguan4==YES){
            wanjia+=1;
         
            
        infoView[i].ai = (Boolean)[val3 intValue];
        infoView[i].dis = dis;
        infoView[i].team = wanjia;
        infoView[i].xue = xue;   
        infoView[i].center = CGPointMake(xd-50, yd-47);
infoView[i].hidden = NO;

        if(isAi){
        infoView[i].name = [NSString stringWithFormat:@"BOT"];

       if ((int)xue==0) {

        infoView[i].name = [NSString stringWithFormat:@"  Knocked Down"];

} else {
       if ((int)xue > 0) {

}
}

        }
        else{
        infoView[i].name = [NSString stringWithFormat:NSSENCRYPT("%@"),_nameData[i]];

       if ((int)xue==0) {

        infoView[i].name = [NSString stringWithFormat:@"  KnockedDown"];

} else {

      if ((int)xue > 0) {


}
       
}
        }
        infoView[i].ai = isAi;
        infoView[i].dis = dis;
        infoView[i].team = wanjia;
        infoView[i].xue = xue;
        infoView[i].center = CGPointMake(xd-50, yd-47);
infoView[i].hidden = NO;

            
            
            CGRect wjRect = CGRectMake(xd-0, yd-00, 0, 0);
            UIBezierPath *wjBz = [UIBezierPath bezierPathWithRect:wjRect];
            [wjPath appendPath:wjBz];
            
            
        }
        
       
        
        



    }













        self.sheLayer7.path = shePath7.CGPath;
            self.sheLayer8.path = shePath8.CGPath;
        self.sheLayer9.path = shePath9.CGPath;

    self.drawLayer.path = path.CGPath;//射线
    self.hpLayer.path = hpPath.CGPath;//血量
    self.disLayer.path = disPath.CGPath;//骨骼
    self.wjLayer.path = wjPath.CGPath;
    self.AByuanLayer.path = yuanPath.CGPath;//连线

    self.sheLayer1.path = shePath1.CGPath;
    self.sheLayer2.path = shePath2.CGPath;
    self.sheLayer3.path = shePath3.CGPath;
    self.sheLayer4.path = shePath4.CGPath;
    self.sheLayer5.path = shePath5.CGPath;
    
    
    
    
    
    
    
    
}


-(void)ios{
    
    
    kaiguan = YES;
    kaiguan1 = YES;
    
}






- (void)doTheJob
{

    
    
    [[lvllzuobiao data] fetchData:^(NSArray * _Nonnull data, NSArray * _Nonnull hpData, NSArray * _Nonnull disData,  NSArray * _Nonnull nameData,  NSArray * _Nonnull aiData) {
        [self configWithData:data hpData:hpData disData:disData nameData:nameData aiData:aiData
                       ];
    }];
}

#pragma mark -------------------------------------懒加载-----------------------------------------

//人数
- (UILabel *)numberLabel{
    if (!_numberLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 4 - 5, 25, [UIScreen mainScreen].bounds.size.width / 2  + 10, 20);
        label.text = @"";
        label.textColor = [UIColor redColor];
        label.font = [UIFont boldSystemFontOfSize:10];
        _numberLabel = label;
    }
    return _numberLabel;
}

- (CAShapeLayer *)drawLayer{
    if (!_drawLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor  =[UIColor whiteColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 0.4;
        _drawLayer = shapeLayer;
    }
    return _drawLayer;
}



//连线
- (CAShapeLayer *)AByuanLayer{
    if (!_AByuanLayer) {
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        shapeLayer.fillColor = [UIColor darkGrayColor].CGColor;
        shapeLayer.lineWidth = 0.5;
        _AByuanLayer = shapeLayer;
    }
    return _AByuanLayer;
}
//血量
- (CAShapeLayer *)hpLayer{
    if (!_hpLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];//血量
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.00].CGColor;
        shapeLayer.fillColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.00].CGColor;
        shapeLayer.lineWidth = 0.1;
        _hpLayer = shapeLayer;
    }
    return _hpLayer;
}
//掩体
- (CAShapeLayer *)Line_Red{
    if (!_Line_Red) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor redColor].CGColor;
        shapeLayer.lineWidth = 0.5;
        _Line_Red = shapeLayer;
    }
    return _Line_Red;
}
//掩体
- (CAShapeLayer *)Line_Green{
    if (!_Line_Green) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;
        shapeLayer.fillColor = [UIColor greenColor].CGColor;
        shapeLayer.lineWidth = 0.5;
        _Line_Green = shapeLayer;
    }
    return _Line_Green;
}
- (CAShapeLayer *)wjLayer{
    if (!_wjLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;//射线颜色
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 0.5;//射线宽度
        _wjLayer = shapeLayer;
    }
    return _wjLayer;
}
- (CAShapeLayer *)sheLayer1{
    if (!_sheLayer1) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor; //射线颜色
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 0.3; //射线宽度
        _sheLayer1 = shapeLayer;
    }
    return _sheLayer1;
}

- (CAShapeLayer *)sheLayer2{
    if (!_sheLayer2) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 0.3; // 射线宽度
        _sheLayer2 = shapeLayer;
    }
    return _sheLayer2;
}

- (CAShapeLayer *)sheLayer3{
    if (!_sheLayer3) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 0.5; // 射线宽度
        _sheLayer3 = shapeLayer;
    }
    return _sheLayer3;
}

- (CAShapeLayer *)sheLayer4{
    if (!_sheLayer4) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 0.3; // 射线宽度
        _sheLayer4 = shapeLayer;
    }
    return _sheLayer4;
}

- (CAShapeLayer *)sheLayer5{
    if (!_sheLayer5) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 0.3; // 射线宽度
        _sheLayer5 = shapeLayer;
    }
    return _sheLayer5;
}
- (CAShapeLayer *)sheLayer7{
    if (!_sheLayer7) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 0.4; // 射线宽度
        _sheLayer7 = shapeLayer;
    }
    return _sheLayer7;
}

- (CAShapeLayer *)sheLayer8{
    if (!_sheLayer8) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor redColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 0.7; // 射线宽度
        _sheLayer8 = shapeLayer;
    }
    return _sheLayer8;
}

- (CAShapeLayer *)sheLayer9{
    if (!_sheLayer9) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor redColor].CGColor; // 射线颜色
        shapeLayer.fillColor = [UIColor redColor].CGColor;
        shapeLayer.lineWidth = 0.7; // 射线宽度
        _sheLayer9 = shapeLayer;
    }
    return _sheLayer9;
}

- (UILabel *)cc{
    if (!_cc) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = self.bounds;
        //label.text = @"";
        label.textColor = [UIColor redColor];
        label.font = [UIFont boldSystemFontOfSize:10];
        _cc = label;
    }
    return _cc;
}


- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self doTheJob];
        }];
    }
    return _timer;
}




- (void)expand {

menuButton.hidden= YES;

menuView = [[UIView alloc]initWithFrame:CGRectMake(kWidth/2-140,kHeight/2-120,280,240)];
menuView.backgroundColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 1.00];
      menuView.layer.borderWidth = 1.5f;
      menuView.layer.borderColor =  [UIColor colorWithRed: 0.20 green: 0.60 blue: 1.00 alpha: 0.70].CGColor;
      menuView.alpha=1;
      menuView.hidden=NO;
      [mainWindow addSubview:menuView];
      


      


scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 68, 275, 173)];
    [scroll setBackgroundColor:[UIColor clearColor]];
    scroll.showsVerticalScrollIndicator = YES;
    scroll.scrollEnabled = YES;
    scroll.contentSize = CGSizeMake(0, 250);
    [menuView addSubview:scroll];





  UIButton *   tab = [[UIButton alloc]init];


        tab.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70];

    tab.frame = CGRectMake(10,31,40,20);

CAShapeLayer *headerLayer = [CAShapeLayer layer];
    headerLayer.path = [UIBezierPath bezierPathWithRoundedRect: tab.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){5.0, 10.0}].CGPath;
    tab.layer.mask = headerLayer;


        [menuView addSubview:tab];



 UIButton*  nametab = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nametab.frame = CGRectMake(15,34, 30, 15);
    [nametab setTitle:NSSENCRYPT("ESP") forState:UIControlStateNormal];
[nametab setFont:[UIFont systemFontOfSize:15]];

    
    [nametab setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nametab.hidden = NO;


    [menuView addSubview:nametab];





  UIButton *   tab1 = [[UIButton alloc]init];


        tab1.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.50];

    tab1.frame = CGRectMake(60,31,55,20);

CAShapeLayer *headerLayer1 = [CAShapeLayer layer];
    headerLayer1.path = [UIBezierPath bezierPathWithRoundedRect: tab1.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){5.0, 10.0}].CGPath;
    tab1.layer.mask = headerLayer1;


        [menuView addSubview:tab1];



 UIButton*  nametab1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nametab1.frame = CGRectMake(58,34, 60, 15);
    [nametab1 setTitle:NSSENCRYPT("HACK") forState:UIControlStateNormal];
    [nametab1 addTarget:self action:@selector(tabhack) forControlEvents:UIControlEventTouchUpInside];

[nametab1 setFont:[UIFont systemFontOfSize:15]];

    
    [nametab1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nametab1.hidden = NO;


    [menuView addSubview:nametab1];









 UIButton*  text = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    text.frame = CGRectMake(0,53, 220, 15);
    [text setTitle:NSSENCRYPT("THIS ESP WAS MADE BY X2NIOS") forState:UIControlStateNormal];
[text setFont:[UIFont systemFontOfSize:13]];

    
    [text setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    text.hidden = NO;


    [menuView addSubview:text];



    line = [[UIButton alloc]init];
        line.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70];
    line.frame = CGRectMake(0,0,280,20);
        [menuView addSubview:line];

//Tắt Menu
   closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(259,1, 20, 15);
    [closeButton setTitle:NSSENCRYPT("×") forState:UIControlStateNormal];
[closeButton setFont:[UIFont systemFontOfSize:26]];
  //  [closeButton setBackgroundColor:[UIColor darkGrayColor]];
//closeButton.layer.cornerRadius = 10;
    
    [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeMenu) forControlEvents:UIControlEventTouchUpInside];
    closeButton.hidden = NO;



    [menuView addSubview:closeButton];


 UIButton*  haha = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    haha.frame = CGRectMake(2,3, 20, 15);
    [haha setTitle:NSSENCRYPT("▼") forState:UIControlStateNormal];
[haha setFont:[UIFont systemFontOfSize:18]];

    
    [haha setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    haha.hidden = NO;


    [menuView addSubview:haha];


 UIButton*  foot = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    foot.frame = CGRectMake(263,226, 20, 15);
    [foot setTitle:NSSENCRYPT("◢") forState:UIControlStateNormal];
[foot setFont:[UIFont systemFontOfSize:13]];

    
    [foot setTitleColor:[UIColor colorWithRed: 0.30 green: 0.30 blue: 0.30 alpha: 0.70] forState:UIControlStateNormal];
    foot.hidden = NO;


    [menuView addSubview:foot];





     UIButton*  begin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    begin.frame = CGRectMake(5,3, 180, 15);
    [begin setTitle:NSSENCRYPT("X2NIOS ESP VNG 1.7.0") forState:UIControlStateNormal];
[begin setFont:[UIFont systemFontOfSize:13]];

    
    [begin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    begin.hidden = NO;


    [menuView addSubview:begin];



    line = [[UIButton alloc]init];
        line.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70];
    line.frame = CGRectMake(4,50,272,1);
        [menuView addSubview:line];




                   NSString *A1Base64 = A1Config;
                   NSData* A1data = [[NSData alloc] initWithBase64EncodedString:A1Base64 options:0];
                   A1Image = [UIImage imageWithData:A1data];
                   
                   NSString *A2Base64 = A2Config;
                   NSData* A2data = [[NSData alloc] initWithBase64EncodedString:A2Base64 options:0];
                   A2Image = [UIImage imageWithData:A2data];
















                   gn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn1.frame = CGRectMake(10, 2, 20, 20);
                   [gn1 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn1 addTarget:self action:@selector(GN1) forControlEvents:UIControlEventTouchUpInside];
                   gn1.hidden = NO;
                   if(Gn1==YES){  [gn1 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn1];








   
   UIButton* AL1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL1.frame = CGRectMake(30, 2, 40, 20);

    [AL1 setTitle:@"LINE" forState:UIControlStateNormal];
[AL1 setFont:[UIFont systemFontOfSize:13]];
    [AL1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      [scroll addSubview:AL1];
   








                   gn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn2.frame = CGRectMake(70, 2, 20, 20);
                   [gn2 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn2 addTarget:self action:@selector(GN2) forControlEvents:UIControlEventTouchUpInside];
                   gn2.hidden = NO;
                   if(Gn2==YES){  [gn2 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn2];







   UIButton* AL2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL2.frame = CGRectMake(90, 2, 40, 20);

    [AL2 setTitle:@"BOX" forState:UIControlStateNormal];
[AL2 setFont:[UIFont systemFontOfSize:13]];

    [AL2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];



      [scroll addSubview:AL2];




                                      gn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn3.frame = CGRectMake(135, 2, 20, 20);
                   [gn3 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn3 addTarget:self action:@selector(GN3) forControlEvents:UIControlEventTouchUpInside];
                   gn3.hidden = NO;
                   if(Gn3==YES){  [gn3 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn3];










   UIButton* AL3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL3.frame = CGRectMake(160, 2, 40, 20);

    [AL3 setTitle:@"INFO" forState:UIControlStateNormal];
[AL3 setFont:[UIFont systemFontOfSize:13]];

    
    [AL3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

      [scroll addSubview:AL3];






  gn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn4.frame = CGRectMake(10, 32, 20, 20);
                   [gn4 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn4 addTarget:self action:@selector(GN4) forControlEvents:UIControlEventTouchUpInside];
                   gn4.hidden = NO;
                   if(Gn4==YES){  [gn4 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn4];





      

   UIButton* AL4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL4.frame = CGRectMake(35, 32, 50, 20);

    [AL4 setTitle:@"ARROW" forState:UIControlStateNormal];
[AL4 setFont:[UIFont systemFontOfSize:13]];

    
    [AL4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


      [scroll addSubview:AL4];





  gn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn6.frame = CGRectMake(90, 32, 20, 20);
                   [gn6 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn6 addTarget:self action:@selector(GN6) forControlEvents:UIControlEventTouchUpInside];
                   gn6.hidden = NO;
                   if(Gn6==YES){  [gn6 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn6];





      

   UIButton* AL6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL6.frame = CGRectMake(115, 32, 50, 20);

    [AL6 setTitle:@"CIRCLE" forState:UIControlStateNormal];
[AL6 setFont:[UIFont systemFontOfSize:13]];

    
    [AL6 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


      [scroll addSubview:AL6];


  gn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn7.frame = CGRectMake(170, 32, 20, 20);
                   [gn7 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn7 addTarget:self action:@selector(GN7) forControlEvents:UIControlEventTouchUpInside];
                   gn7.hidden = NO;
                   if(Gn7==YES){  [gn7 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn7];





      

   UIButton* AL7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL7.frame = CGRectMake(195, 32, 50, 20);

    [AL7 setTitle:@"ALERT" forState:UIControlStateNormal];
[AL7 setFont:[UIFont systemFontOfSize:13]];

    
    [AL7 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


      [scroll addSubview:AL7];





  gn8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   gn8.frame = CGRectMake(10, 62, 20, 20);
                   [gn8 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [gn8 addTarget:self action:@selector(GN8) forControlEvents:UIControlEventTouchUpInside];
                   gn8.hidden = NO;
                   if(Gn8==YES){  [gn8 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:gn8];





      

   UIButton* AL8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AL8.frame = CGRectMake(35, 62, 80, 20);

    [AL8 setTitle:@"LINE CIRCLE" forState:UIControlStateNormal];
[AL8 setFont:[UIFont systemFontOfSize:13]];

    
    [AL8 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


      [scroll addSubview:AL8];















    NSString *sliderui = slider;
    mainWindow = [UIApplication sharedApplication].keyWindow;
    NSData* data = [[NSData alloc] initWithBase64EncodedString:sliderui options:0];









sliderfov = [[UISlider alloc] initWithFrame:CGRectMake(10, 92, 170, 20)];
float fov = [[NSUserDefaults standardUserDefaults] floatForKey:NSSENCRYPT("fov")];
[sliderfov setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70]];


sliderfov.minimumTrackTintColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.35];
    sliderfov.maximumTrackTintColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.35];

[sliderfov setThumbImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
[sliderfov setThumbImage:[UIImage imageWithData:data] forState:UIControlStateHighlighted];
sliderfov.minimumValue = 50;
sliderfov.maximumValue = 300;
sliderfov.continuous = YES;
//sliderfov.value = fov;
sliderfov.value = 50;

      [scroll addSubview:sliderfov];













     // [menuView addSubview:AL5];




   UIButton *hidehack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    hidehack.frame = CGRectMake(10, 122, 100, 20);
    [hidehack setTitle:NSSENCRYPT("I'm Not Hacker") forState:UIControlStateNormal];
[hidehack setFont:[UIFont systemFontOfSize:13]];
    [hidehack setBackgroundColor:[UIColor darkGrayColor]];
    
    [hidehack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [hidehack addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
    hidehack.hidden = NO;


    [scroll addSubview:hidehack];








    
}










-(void)expand1{




menuButton.hidden= YES;

menuView1 = [[UIView alloc]initWithFrame:CGRectMake(kWidth/2-140,kHeight/2-120,280,240)];
menuView1.backgroundColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 1.00];
      menuView1.layer.borderWidth = 1.5f;
      menuView1.layer.borderColor =  [UIColor colorWithRed: 0.20 green: 0.60 blue: 1.00 alpha: 0.70].CGColor;
      menuView1.alpha=1;
      menuView1.hidden=NO;
      [mainWindow addSubview:menuView1];
      


      


scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 68, 275, 173)];
    [scroll setBackgroundColor:[UIColor clearColor]];
    scroll.showsVerticalScrollIndicator = YES;
    scroll.scrollEnabled = YES;
    scroll.contentSize = CGSizeMake(0, 250);
    [menuView1 addSubview:scroll];





  UIButton *   tab = [[UIButton alloc]init];


        tab.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.50];

    tab.frame = CGRectMake(10,31,40,20);

CAShapeLayer *headerLayer = [CAShapeLayer layer];
    headerLayer.path = [UIBezierPath bezierPathWithRoundedRect: tab.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){5.0, 10.0}].CGPath;
    tab.layer.mask = headerLayer;


        [menuView1 addSubview:tab];



 UIButton*  nametab = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nametab.frame = CGRectMake(15,34, 30, 15);
    [nametab setTitle:NSSENCRYPT("ESP") forState:UIControlStateNormal];

    [nametab addTarget:self action:@selector(tabesp) forControlEvents:UIControlEventTouchUpInside];

[nametab setFont:[UIFont systemFontOfSize:15]];

    
    [nametab setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nametab.hidden = NO;


    [menuView1 addSubview:nametab];


  UIButton *   tab1 = [[UIButton alloc]init];


        tab1.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70];

    tab1.frame = CGRectMake(60,31,55,20);

CAShapeLayer *headerLayer1 = [CAShapeLayer layer];
    headerLayer1.path = [UIBezierPath bezierPathWithRoundedRect: tab1.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){5.0, 10.0}].CGPath;
    tab1.layer.mask = headerLayer1;


        [menuView1 addSubview:tab1];



 UIButton*  nametab1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nametab1.frame = CGRectMake(58,34, 60, 15);
    [nametab1 setTitle:NSSENCRYPT("HACK") forState:UIControlStateNormal];
    [nametab1 addTarget:self action:@selector(tabhack) forControlEvents:UIControlEventTouchUpInside];

[nametab1 setFont:[UIFont systemFontOfSize:15]];

    
    [nametab1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nametab1.hidden = NO;


    [menuView1 addSubview:nametab1];




 UIButton*  text = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    text.frame = CGRectMake(0,53, 220, 15);
    [text setTitle:NSSENCRYPT("THIS ESP WAS MADE BY X2NIOS") forState:UIControlStateNormal];
[text setFont:[UIFont systemFontOfSize:13]];

    
    [text setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    text.hidden = NO;


    [menuView1 addSubview:text];



    line = [[UIButton alloc]init];
        line.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70];
    line.frame = CGRectMake(0,0,280,20);
        [menuView1 addSubview:line];

//Tắt Menu
   closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(259,1, 20, 15);
    [closeButton setTitle:NSSENCRYPT("×") forState:UIControlStateNormal];
[closeButton setFont:[UIFont systemFontOfSize:26]];
    
    [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeMenu) forControlEvents:UIControlEventTouchUpInside];
    closeButton.hidden = NO;



    [menuView1 addSubview:closeButton];


 UIButton*  haha = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    haha.frame = CGRectMake(2,3, 20, 15);
    [haha setTitle:NSSENCRYPT("▼") forState:UIControlStateNormal];
[haha setFont:[UIFont systemFontOfSize:18]];

    
    [haha setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    haha.hidden = NO;


    [menuView1 addSubview:haha];


 UIButton*  foot = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    foot.frame = CGRectMake(263,226, 20, 15);
    [foot setTitle:NSSENCRYPT("◢") forState:UIControlStateNormal];
[foot setFont:[UIFont systemFontOfSize:13]];

    
    [foot setTitleColor:[UIColor colorWithRed: 0.30 green: 0.30 blue: 0.30 alpha: 0.70] forState:UIControlStateNormal];
    foot.hidden = NO;


    [menuView1 addSubview:foot];





     UIButton*  begin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    begin.frame = CGRectMake(5,3, 180, 15);
    [begin setTitle:NSSENCRYPT("X2NIOS ESP VNG 1.7.0") forState:UIControlStateNormal];
[begin setFont:[UIFont systemFontOfSize:13]];

    
    [begin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    begin.hidden = NO;


    [menuView1 addSubview:begin];



    line = [[UIButton alloc]init];
        line.backgroundColor = [UIColor colorWithRed: 1.00 green: 0.60 blue: 0.20 alpha: 0.70];
    line.frame = CGRectMake(4,50,272,1);
        [menuView1 addSubview:line];




                   NSString *A1Base64 = A1Config;
                   NSData* A1data = [[NSData alloc] initWithBase64EncodedString:A1Base64 options:0];
                   A1Image = [UIImage imageWithData:A1data];
                   
                   NSString *A2Base64 = A2Config;
                   NSData* A2data = [[NSData alloc] initWithBase64EncodedString:A2Base64 options:0];
                   A2Image = [UIImage imageWithData:A2data];




                   hack1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                   hack1.frame = CGRectMake(150, 2, 20, 20);
                   [hack1 setBackgroundImage:A1Image forState:UIControlStateNormal];
                   [hack1 addTarget:self action:@selector(HACK1) forControlEvents:UIControlEventTouchUpInside];
                   hack1.hidden = NO;
                   if(Hack1==YES){  [hack1 setBackgroundImage:A2Image forState:UIControlStateNormal]; }
                   [scroll addSubview:hack1];

   
   UIButton* NAME1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    NAME1.frame = CGRectMake(170, 2, 60, 20);

    [NAME1 setTitle:@"SPEED" forState:UIControlStateNormal];
[NAME1 setFont:[UIFont systemFontOfSize:13]];
    [NAME1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      [scroll addSubview:NAME1];








   kgiat = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    kgiat.frame = CGRectMake(10, 2, 100, 20);
    [kgiat setTitle:NSSENCRYPT("No Recoil: OFF") forState:UIControlStateNormal];
[kgiat setFont:[UIFont systemFontOfSize:13]];
    [kgiat setBackgroundColor:[UIColor darkGrayColor]];
    
    [kgiat setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [kgiat addTarget:self action:@selector(kgiat) forControlEvents:UIControlEventTouchUpInside];
    kgiat.hidden = NO;

if(hack==YES){
    kgiat.hidden = YES;

   kgiat1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    kgiat1.frame = CGRectMake(10, 2, 100, 20);
    [kgiat1 setTitle:NSSENCRYPT("No Recoil: ON") forState:UIControlStateNormal];
[kgiat1 setFont:[UIFont systemFontOfSize:13]];
    [kgiat1 setBackgroundColor:[UIColor darkGrayColor]];
    
    [kgiat1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [kgiat1 addTarget:self action:@selector(kgiat1) forControlEvents:UIControlEventTouchUpInside];
    kgiat1.hidden = NO;

    [scroll addSubview:kgiat1];
}

    [scroll addSubview:kgiat];









   magic = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    magic.frame = CGRectMake(10, 32, 100, 20);
    [magic setTitle:NSSENCRYPT("Magic Gun: OFF") forState:UIControlStateNormal];
[magic setFont:[UIFont systemFontOfSize:13]];
    [magic setBackgroundColor:[UIColor darkGrayColor]];
    
    [magic setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [magic addTarget:self action:@selector(magic) forControlEvents:UIControlEventTouchUpInside];
    magic.hidden = NO;

if(hack2==YES){
    magic.hidden = YES;

   magic1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    magic1.frame = CGRectMake(10, 32, 100, 20);
    [magic1 setTitle:NSSENCRYPT("Magic Gun: ON") forState:UIControlStateNormal];
[magic1 setFont:[UIFont systemFontOfSize:13]];
    [magic1 setBackgroundColor:[UIColor darkGrayColor]];
    
    [magic1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [magic1 addTarget:self action:@selector(magic1) forControlEvents:UIControlEventTouchUpInside];
    magic1.hidden = NO;

    [scroll addSubview:magic1];

}

    [scroll addSubview:magic];






    
}











-(void)HACK1{
       if( Hack1==YES){
           Hack1=NO;
           [hack1 setBackgroundImage:A1Image forState:UIControlStateNormal];

JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
                    AddrRange range = (AddrRange){0x000000000,0x200000000};
        uint64_t search = 4444444444000000000;
                    engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        
                    vector<void*>results = engine.getAllResults();
        uint64_t modify = 4180205148181626880;
                    for(int i =0;i<results.size();i++){
                    if(i <=50&&i>=0)engine.JRWriteMemory((unsigned long long )(results[i]),&modify,JR_Search_Type_ULong);
                        
                    }



       }else{
           Hack1=YES;

           [hack1 setBackgroundImage:A2Image forState:UIControlStateNormal];

JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
                    AddrRange range = (AddrRange){0x000000000,0x200000000};
        uint64_t search = 4180205148181626880;
                    engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        
                    vector<void*>results = engine.getAllResults();
        uint64_t modify = 4444444444000000000;
                    for(int i =0;i<results.size();i++){
                    if(i <=50&&i>=0)engine.JRWriteMemory((unsigned long long )(results[i]),&modify,JR_Search_Type_ULong);
                        
                    }



       }
   }






-(void)magic{
    magic.hidden = YES;

hack2=YES;

timer(1){
 JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
                AddrRange range = (AddrRange){0x000000000,0x999999999};
                float search = -5.17117;
                engine.JRScanMemory(range, &search, JR_Search_Type_Float);
                float search1 = 33;            engine.JRNearBySearch(0x20,&search1,JR_Search_Type_Float);
                float search2 = 33;
                engine.JRScanMemory(range, &search2,JR_Search_Type_Float); //
                float search3 = 40;
engine.JRNearBySearch(0x20,&search3,JR_Search_Type_Float);
                vector<void*>results = engine.getAllResults();
                float modify = 888888;
                for(int i =0;i<results.size();i++){
                    if(i <=50&&i>=0)engine.JRWriteMemory((unsigned long long )(results[i]),&modify,JR_Search_Type_Float);
                }//全改
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{


  JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000,0x160000000};
        uint64_t search = -2874911836351102693;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        vector<void*>results = engine.getAllResults();
        uint64_t modify = -2874911836351102885;
    for(int i =0;i<results.size();i++){
           engine.JRWriteMemory((unsigned long long)(results[i]),&modify,JR_Search_Type_ULong);
        }

});


dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{


  JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000,0x160000000};
        uint64_t search = 2498004355770983102;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        vector<void*>results = engine.getAllResults();
        uint64_t modify = 2498004355773604542;
    for(int i =0;i<results.size();i++){
           engine.JRWriteMemory((unsigned long long)(results[i]),&modify,JR_Search_Type_ULong);
        }

});



});


   magic1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    magic1.frame = CGRectMake(10, 32, 100, 20);
    [magic1 setTitle:NSSENCRYPT("Magic Gun: ON") forState:UIControlStateNormal];
[magic1 setFont:[UIFont systemFontOfSize:13]];
    [magic1 setBackgroundColor:[UIColor darkGrayColor]];
    
    [magic1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [magic1 addTarget:self action:@selector(magic1) forControlEvents:UIControlEventTouchUpInside];
    magic1.hidden = NO;

    [scroll addSubview:magic1];

}



-(void)magic1{
    magic1.hidden = YES;

hack2=NO;

timer(1){

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{


  JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000,0x160000000};
        uint64_t search = 2498004355773604542;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        vector<void*>results = engine.getAllResults();
        uint64_t modify = 2498004355770983102;
    for(int i =0;i<results.size();i++){
           engine.JRWriteMemory((unsigned long long)(results[i]),&modify,JR_Search_Type_ULong);
        }
});
    
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{


 JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000,0x160000000};
        uint64_t search = -2874911836351102885;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        vector<void*>results = engine.getAllResults();
        uint64_t modify = -2874911836351102693;
    for(int i =0;i<results.size();i++){
           engine.JRWriteMemory((unsigned long long)(results[i]),&modify,JR_Search_Type_ULong);
        }

});


});

   magic = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    magic.frame = CGRectMake(10, 32, 100, 20);
    [magic setTitle:NSSENCRYPT("Magic Gun: OFF") forState:UIControlStateNormal];
[magic setFont:[UIFont systemFontOfSize:13]];
    [magic setBackgroundColor:[UIColor darkGrayColor]];
    
    [magic setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [magic addTarget:self action:@selector(magic) forControlEvents:UIControlEventTouchUpInside];
    magic.hidden = NO;
    [scroll addSubview:magic];
}







-(void)GN1{
       if( Gn1==YES){
           Gn1=NO;
        kaiguan6 = NO;
           rsView.hidden=YES;
           [gn1 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn1=YES;
        kaiguan6 = YES;
           rsView.hidden=NO;
           [gn1 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }



-(void)GN2{
       if( Gn2==YES){
           Gn2=NO;
                   kaiguan2 = NO;
           rsView.hidden=YES;
           [gn2 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn2=YES;
                   kaiguan2 = YES;
           rsView.hidden=NO;
           [gn2 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }


-(void)GN3{
       if( Gn3==YES){
           Gn3=NO;
                   kaiguan4 = NO;
           //rsView.hidden=YES;
           [gn3 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn3=YES;
                   kaiguan4 = YES;
           //rsView.hidden=NO;
           [gn3 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }

-(void)GN4{
       if( Gn4==YES){
           Gn4=NO;
                   arrow = NO;

           //rsView.hidden=YES;
           [gn4 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn4=YES;
                   arrow = YES;

           //rsView.hidden=NO;
           [gn4 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }



-(void)set{

                   nothacker = YES;
timer(0.5){
                   nothacker = NO;
});


}

-(void)kgiat{
    kgiat.hidden = YES;

hack=YES;

timer(1){
  JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000,0x160000000};
        uint64_t search = 7815225705762155637;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        vector<void*>results = engine.getAllResults();
        uint64_t modify = 781522570416069018;
        for(int i =0;i<results.size();i++){
           if(i ==results.size()-1)engine.JRWriteMemory((unsigned long long)(results[i]),&modify,JR_Search_Type_ULong);
        }

});
   kgiat1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    kgiat1.frame = CGRectMake(10, 2, 100, 20);
    [kgiat1 setTitle:NSSENCRYPT("No Recoil: ON") forState:UIControlStateNormal];
[kgiat1 setFont:[UIFont systemFontOfSize:13]];
    [kgiat1 setBackgroundColor:[UIColor darkGrayColor]];
    
    [kgiat1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [kgiat1 addTarget:self action:@selector(kgiat1) forControlEvents:UIControlEventTouchUpInside];
    kgiat1.hidden = NO;

    [scroll addSubview:kgiat1];


}

-(void)kgiat1{
    kgiat1.hidden = YES;

hack=NO;

timer(1){
  JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000,0x160000000};
        uint64_t search = 781522570416069018;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        vector<void*>results = engine.getAllResults();
        uint64_t modify = 7815225705762155637;
        for(int i =0;i<results.size();i++){
           if(i ==results.size()-1)engine.JRWriteMemory((unsigned long long)(results[i]),&modify,JR_Search_Type_ULong);
        }

});

   kgiat = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    kgiat.frame = CGRectMake(10, 2, 100, 20);
    [kgiat setTitle:NSSENCRYPT("No Recoil: OFF") forState:UIControlStateNormal];
[kgiat setFont:[UIFont systemFontOfSize:13]];
    [kgiat setBackgroundColor:[UIColor darkGrayColor]];
    
    [kgiat setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [kgiat addTarget:self action:@selector(kgiat) forControlEvents:UIControlEventTouchUpInside];
    kgiat.hidden = NO;
    [scroll addSubview:kgiat];
}






-(void)GN6{
       if( Gn6==YES){
           Gn6=NO;
                   kaiguan7 = NO;

           //rsView.hidden=YES;
           [gn6 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn6=YES;
                   kaiguan7 = YES;

           //rsView.hidden=NO;
           [gn6 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }



-(void)GN7{
       if( Gn7==YES){
           Gn7=NO;
                   kaiguan9 = NO;

           //rsView.hidden=YES;
           [gn7 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn7=YES;
                   kaiguan9 = YES;

           //rsView.hidden=NO;
           [gn7 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }


    
    
-(void)GN8{
       if( Gn8==YES){
           Gn8=NO;
                   kaiguan8 = NO;

           //rsView.hidden=YES;
           [gn8 setBackgroundImage:A1Image forState:UIControlStateNormal];
       }else{
           Gn8=YES;
                   kaiguan8 = YES;

           //rsView.hidden=NO;
           [gn8 setBackgroundImage:A2Image forState:UIControlStateNormal];
       }
   }






- (void)initViews {

    //[self initConsoleButton];
 
}

- (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    
    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
}



- (void)initConsoleButton {

    NSString *menuButtonBase64 = menuButtonConfig;
    mainWindow = [UIApplication sharedApplication].keyWindow;
    NSData* data = [[NSData alloc] initWithBase64EncodedString:menuButtonBase64 options:0];
    UIImage* menuButtonImage = [UIImage imageWithData:data];

    menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    menuButton.frame = CGRectMake((mainWindow.frame.size.width/2+150), 0, 35, 35);
    menuButton.backgroundColor = [UIColor clearColor];
    [menuButton setBackgroundImage:menuButtonImage forState:UIControlStateNormal];


menuButton.hidden= NO;

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(expand)];
    [menuButton addGestureRecognizer:tapGestureRecognizer];

    [menuButton addTarget:self action:@selector(buttonDragged:withEvent:)
         forControlEvents:UIControlEventTouchDragInside];


    [mainWindow addSubview:menuButton];


    self.btnConsole = menuButton;
  
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 20;
    tap.numberOfTouchesRequired = 30;


    [mainWindow addGestureRecognizer:tap];



    [tap addTarget:self action:@selector(hidemenuBtn)];
  






}

-(void)tabhack{

   menuButton.hidden= NO; menuView.hidden = YES; 
menuView1.hidden = YES; 
[self expand1];

}


-(void)tabesp{

   menuButton.hidden= NO; menuView.hidden = YES; 
menuView1.hidden = YES; 
[self expand];

}


    - (void)closeMenu {
   menuButton.hidden= NO; menuView.hidden = YES; 
menuView1.hidden = YES; 

}


-(void)hidemenuBtn {

if (menuButton.hidden==NO) { menuButton.hidden=YES; }
else {   menuButton.hidden=NO; }

}
- (void)doExpand {
    [self expand];
}



-(void)phut:(UISwitch *)ok {
    
    if ([ok isOn]) {


    } else {



}
}








-(void)status
{

NSUserDefaults *check1;
check1 = [NSUserDefaults standardUserDefaults];

                     NSError *errorAgentData1;



                     NSString *uri1 = NSSENCRYPT("https://x2nios.net/free.php");


                     NSData *resp1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:uri1]];
                     NSString* respData1 = [[NSString alloc] initWithData:resp1 encoding:NSUTF8StringEncoding];
                     NSData* DCs1=[respData1 dataUsingEncoding:NSUTF8StringEncoding];
                     NSDictionary *JSON1 = [NSJSONSerialization JSONObjectWithData:DCs1 options:kNilOptions error:&errorAgentData1];

                     NSString *status1 = [JSON1 objectForKey:@"status1"];

                     NSString *version1 = [JSON1 objectForKey:@"version1"];

     [check1 setObject:status1 forKey:@"status1"];



if ([status1 isEqualToString:@"true"] && [version1 isEqualToString:@"1.7.0"]) {


            [self initConsoleButton];



}else {

UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notification"
                                                message:@"THIS HACK WAS CLOSED BY ADMIN\n CONTACT TO DOWNLOAD NEW VERSION"
                                               delegate:self
                                      cancelButtonTitle:nil
                                      otherButtonTitles:nil, nil];
[alert show];



}

}


@end
