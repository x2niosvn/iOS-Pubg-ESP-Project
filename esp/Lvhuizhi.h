//emo
//QQ97184668

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern UIBezierPath *Draw_Line_Red;
extern UIBezierPath *Draw_Line_Green;

@interface Lvllhuizhi : UIView

+ (instancetype)lvllhzff;

- (void)show;
- (void)hide;


- (void)clearData;
- (void)configWithData:(NSArray *)rects hpData:(NSArray *)hpData disData:(NSArray *)disData nameData:(NSArray *)nameData aiData:(NSArray *)aiData;
- (void)closeMenu;
- (void)expand;
- (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event;
@end

NS_ASSUME_NONNULL_END


