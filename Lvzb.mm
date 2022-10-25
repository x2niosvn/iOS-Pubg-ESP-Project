//emo


#import "esp/Lvzb.h"
#import <UIKit/UIKit.h>
#import <stdio.h>
#import <mach-o/dyld.h>
#import <mach/vm_region.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import <mach/mach.h>
#include "esp/Gobal.h"
#import "esp/utf.h"
#include "esp/dobby.h"
//#import "Hook.h"
#import "esp/ZXZY.h"
//#import "dobby.h"
//#import "Hook2.h"
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

#define kLogOpen 0

float juzhenshuju[16];

typedef struct Vector{
    float X;
    float Y;
    float Z;
}Vector;

@interface lvllzuobiao()
@property (nonatomic,  assign) CGFloat  scale;
@property (nonatomic,  assign) CGFloat  theWidth;
@property (nonatomic,  assign) CGFloat  theHeight;
@end

@implementation lvllzuobiao

+ (instancetype)data
{
    static lvllzuobiao *fact;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fact = [[lvllzuobiao alloc] init];
    });
    return fact;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIScreen *screen = [UIScreen mainScreen];
        CGFloat width  = screen.bounds.size.width;
        CGFloat height = screen.bounds.size.height;
        
        _scale = screen.scale;
        _theWidth = width * [UIScreen mainScreen].scale;
        _theHeight = height * [UIScreen mainScreen].scale;
    }
    return self;
}

#pragma mark - private

// 定义vm获取方式
- (BOOL)vmreadData:(void *)buf address:(long)address length:(long)length
{
    vm_size_t size = 0;
    kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)address, length, (vm_address_t)buf, &size);
    if(error != KERN_SUCCESS || size != length){
        return NO;
    }
    return YES;
}


- (Vector)lvllword:(Vector)vector matrix:(float *)matrix
{
    struct Vector outVec = {0,0};
    
    // 矩阵,世界坐标转换屏幕坐标
    float view = matrix[3] * vector.X + matrix[7] * vector.Y + matrix[11] * vector.Z + matrix[15];
    float x,y,z;
    
    if (view < 0.01) {
        z = matrix[8] * vector.X + matrix[9] * vector.Y + matrix[10] * vector.Z + matrix[11];
        x = _theWidth + (matrix[0] * vector.X + matrix[4] * vector.Y + matrix[8] * vector.Z + matrix[12]) / 2 * _theWidth;
        y = _theHeight - (matrix[1] * vector.X + matrix[5] * vector.Y + matrix[9] * vector.Z + matrix[13]) / 2 * _theHeight;
    }else{
        z = matrix[3] * vector.X + matrix[7] * vector.Y + matrix[11] * vector.Z + matrix[15];
        x = _theWidth + (matrix[0] * vector.X + matrix[4] * vector.Y + matrix[8] * vector.Z + matrix[12]) / z * _theWidth;
        y = _theHeight - (matrix[1] * vector.X + matrix[5] * vector.Y + matrix[9] * vector.Z + matrix[13]) / z * _theHeight;
    }
    
    outVec.X = x/2;
    outVec.Y = y/2;
    
    return outVec;
}


#pragma mark - public
bool LineTrace(long Controller, long SelfObject, Vector pos)
{
    return false;
}

void ReadData(void* buff,long Address,int length)
{
    vm_size_t size = 0;
    kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)Address, length, (vm_address_t)buff, &size);
    if(error != KERN_SUCCESS || size != length){
        return;
    }
    return;
}

bool Read_bool(long Address)
{
    bool result=false;
    ReadData(&result,Address,1);
    return result;
}

int Read_Int(long Address)
{
    int result=0;
    ReadData(&result,Address,4);
    return result;
}

float Read_Float(long Address)
{
    float result=0;
    ReadData(&result,Address,4);
    return result;
}

long Read_long(long Address)
{
    long result=0;
    ReadData(&result,Address,8);
    return result;
}

Vector Read_Vector(long Address)
{
    Vector result={0};
    ReadData(&result,Address,12);
    return result;
}


UIBezierPath *Draw_Line_Red;
UIBezierPath *Draw_Line_Green;
long MyObject;

void DrawLine(float X1,float Y1,float X2,float Y2,bool Visible)
{
    float Scale = [UIScreen mainScreen].scale;
    UIBezierPath* Line = [UIBezierPath bezierPath];
    [Line moveToPoint:CGPointMake(X1/Scale, Y1/Scale)];
    [Line addLineToPoint:CGPointMake(X2/Scale,Y2/Scale)];
    if (!Visible)
        [Draw_Line_Green appendPath:Line];
    else
        [Draw_Line_Red appendPath:Line];
}


- (void)fetchData:(Lvliangliangwudifangfeng)block
{
    Draw_Line_Red = [UIBezierPath bezierPath];
    Draw_Line_Green = [UIBezierPath bezierPath];
    
  
    
    long mh_addr = (long)_dyld_get_image_header(0);
    long GWorld = Read_long(mh_addr + 0x0801e708);
    if(!GWorld) return;
    long PLevel = Read_long(GWorld + 0x30);
    if(!PLevel) return;
    int max = Read_Int(PLevel + 0xAC);
    int count = Read_Int(PLevel + 0xA8);
    long Actors = Read_long(PLevel + 0xA0);
    if(!(Actors && count > 0 && count < max)) {
        return;
    }
    
   
    long juzhen = Read_long(mh_addr + 0x07b5a2b8);
    if(!juzhen) return;
    long juzhen2 = Read_long(juzhen+0x98);
    if(!juzhen2) return;
    float* yxjz = (float*)(juzhen2+0x750);
    
    NSMutableArray *data = @[].mutableCopy;
    NSMutableArray *hpData = @[].mutableCopy;
    NSMutableArray *disData = @[].mutableCopy;
    NSMutableArray *nameData = @[].mutableCopy;
    NSMutableArray *aiData = @[].mutableCopy;
    

    
    static int MyT,MyPlayerID;
    
    long Controller = Read_long(Read_long(PLevel + 0xB0)+0x28);
    long Character = Read_long(Controller+0x3D0);
    if (Character > 0x100000000)
    {
        MyObject = Character;
        MyT = Read_Int(Character + 0x8a0);
        MyPlayerID = Read_Int(Character + 0x18);
    }
    
    for (int i = 0; i < count; i++) {

    long ziji = *(long*)(PLevel + 0xB0);
    if(!ziji) {    continue;    }
   
    
    ziji = *(long*)(ziji + 0x48 );
    if(!ziji) {    continue; }

Vector myzb = {0};
    if(ziji){
        [self vmreadData:&myzb address:juzhen2 + 0x740 length:12];
    }
    if(!ziji) {
        return;
    }

        long Object = ((long*)Actors)[i];
        if (Object <= 0x100000000)  continue;
        int ObjID = Read_Int(Object+0x18);
        if (ObjID != MyPlayerID || ObjID == 0)    continue;
        int T = Read_Int(Object+0x8a0);
        if (T == MyT || T == 0) continue;


        long man = ((long*)Actors)[i];
        
        if(!man || man == ziji) {
            continue;
        }
       


long Rc = *(long *)(man + 0x1A8);
        if (!Rc) continue;
     Vector zb = {0};
[self vmreadData:&zb address:(Rc + 0x1d0) length:12];


        // 死亡状态

        long dead = *(long *)(Object+0x1a0);
      if(*(float *)&zb == 0.0) [self vmreadData:&zb address:(Object + 0xF0) length:12];
        
        float xue = Read_Float(Object + 0xC48);
        bool isAI = Read_bool(Object + 0x930);
        
       
        CGFloat distX = (zb.X - myzb.X) / 100;
        CGFloat distY = (zb.Y - myzb.Y) / 100;
        CGFloat distance = (distX * distX) + (distY * distY);
        CGFloat distZ = (zb.Z - myzb.Z)/100;
        distance = sqrt((distZ * distZ) + distance);
        
        Vector zb1 = zb;
        zb1.Z += 80;
        
        Vector zb2 = zb;
        zb2.Z -= 80;
        
        Vector fkzb1 = [self lvllword:zb1 matrix:yxjz];
        Vector fkzb2 = [self lvllword:zb2 matrix:yxjz];
        
        float height = fkzb2.Y - fkzb1.Y;
        float width  = height / 2;
        
        float originX = fkzb1.X - width / 2;
        float originY = fkzb1.Y;
       
        CGRect rect = CGRectMake(originX/_scale, originY/_scale, width/_scale, height/_scale);
        long name = Read_long(Object + 0x868);
        if(!name) {  continue;  }
        UTF8 PlayerName[32] = "";
        UTF16 buf16[16] = {0};
        if(name){
            [self vmreadData:&buf16 address:name length:28];
            Utf16_To_Utf8(buf16, PlayerName, 28, strictConversion);
        }
        NSString *Name = [NSString stringWithUTF8String:(const char *)PlayerName];
        
       
     
        
        long mesh = Read_long(Object + 0x418);
        if (!mesh) {   continue;  };
        
        bool Visible [15];
        int Bones[15] = {6,4,1,12,13,14,33,34,35,53,54,55,57,58,59};
        Vector Bones_Pos[15];
        
        for (int i2=0; i2<15; i2++) {
            Vector pos = GetBoneWithRotation(mesh, Bones[i2]);

            Bones_Pos[i2] = [self lvllword:pos matrix:yxjz];
        }
        
        DrawLine(Bones_Pos[0].X, Bones_Pos[0].Y, Bones_Pos[1].X, Bones_Pos[1].Y, Visible[0] || Visible[1]);
        DrawLine(Bones_Pos[1].X, Bones_Pos[1].Y, Bones_Pos[2].X, Bones_Pos[2].Y, Visible[1] || Visible[2]);
        DrawLine(Bones_Pos[1].X, Bones_Pos[1].Y, Bones_Pos[3].X, Bones_Pos[3].Y, Visible[1] || Visible[3]);
        DrawLine(Bones_Pos[3].X, Bones_Pos[3].Y, Bones_Pos[4].X, Bones_Pos[4].Y, Visible[3] || Visible[4]);
        DrawLine(Bones_Pos[4].X, Bones_Pos[4].Y, Bones_Pos[5].X, Bones_Pos[5].Y, Visible[4] || Visible[5]);
        DrawLine(Bones_Pos[1].X, Bones_Pos[1].Y, Bones_Pos[6].X, Bones_Pos[6].Y, Visible[1] || Visible[6]);
        DrawLine(Bones_Pos[6].X, Bones_Pos[6].Y, Bones_Pos[7].X, Bones_Pos[7].Y, Visible[6] || Visible[7]);
        DrawLine(Bones_Pos[7].X, Bones_Pos[7].Y, Bones_Pos[8].X, Bones_Pos[8].Y, Visible[7] || Visible[8]);
        DrawLine(Bones_Pos[2].X, Bones_Pos[2].Y, Bones_Pos[9].X, Bones_Pos[9].Y, Visible[2] || Visible[9]);
        DrawLine(Bones_Pos[9].X, Bones_Pos[9].Y, Bones_Pos[10].X, Bones_Pos[10].Y, Visible[9] || Visible[10]);
        DrawLine(Bones_Pos[10].X, Bones_Pos[10].Y, Bones_Pos[11].X, Bones_Pos[11].Y, Visible[10] || Visible[11]);
        DrawLine(Bones_Pos[2].X, Bones_Pos[2].Y, Bones_Pos[12].X, Bones_Pos[12].Y, Visible[2] || Visible[12]);
        DrawLine(Bones_Pos[12].X, Bones_Pos[12].Y, Bones_Pos[13].X, Bones_Pos[13].Y, Visible[12] || Visible[13]);
        DrawLine(Bones_Pos[13].X, Bones_Pos[13].Y, Bones_Pos[14].X, Bones_Pos[14].Y, Visible[13] || Visible[14]);
        
        CGFloat w = rect.size.width;
        CGFloat h = rect.size.height;
       
        CGFloat hpY = xue * w / 50;
        CGFloat hpX = xue * h / 100;
        
        [data addObject:[NSValue valueWithCGRect:rect]];
        [hpData addObject:@(xue)];
        [disData addObject:@(distance)];
        [nameData addObject:[NSString stringWithString:Name]];
        [aiData addObject:@(isAI == true ? 1 : 0)];
        
        CGRect rect1 =CGRectMake(0, 0, 0, 0);

    }
    
    
    if (block) {
        block(data, hpData, disData,nameData,aiData);
    }
}

LTMatrix MatrixMultiplication(LTMatrix pM1, LTMatrix pM2);
LTMatrix MatrixMultiplication(LTMatrix pM1, LTMatrix pM2)
{
    LTMatrix pOut;
    pOut.a1 = pM1.a1 * pM2.a1 + pM1.a2 * pM2.b1 + pM1.a3 * pM2.c1 + pM1.a4 * pM2.d1;
    pOut.a2 = pM1.a1 * pM2.a2 + pM1.a2 * pM2.b2 + pM1.a3 * pM2.c2 + pM1.a4 * pM2.d2;
    pOut.a3 = pM1.a1 * pM2.a3 + pM1.a2 * pM2.b3 + pM1.a3 * pM2.c3 + pM1.a4 * pM2.d3;
    pOut.a4 = pM1.a1 * pM2.a4 + pM1.a2 * pM2.b4 + pM1.a3 * pM2.c4 + pM1.a4 * pM2.d4;
    pOut.b1 = pM1.b1 * pM2.a1 + pM1.b2 * pM2.b1 + pM1.b3 * pM2.c1 + pM1.b4 * pM2.d1;
    pOut.b2 = pM1.b1 * pM2.a2 + pM1.b2 * pM2.b2 + pM1.b3 * pM2.c2 + pM1.b4 * pM2.d2;
    pOut.b3 = pM1.b1 * pM2.a3 + pM1.b2 * pM2.b3 + pM1.b3 * pM2.c3 + pM1.b4 * pM2.d3;
    pOut.b4 = pM1.b1 * pM2.a4 + pM1.b2 * pM2.b4 + pM1.b3 * pM2.c4 + pM1.b4 * pM2.d4;
    pOut.c1 = pM1.c1 * pM2.a1 + pM1.c2 * pM2.b1 + pM1.c3 * pM2.c1 + pM1.c4 * pM2.d1;
    pOut.c2 = pM1.c1 * pM2.a2 + pM1.c2 * pM2.b2 + pM1.c3 * pM2.c2 + pM1.c4 * pM2.d2;
    pOut.c3 = pM1.c1 * pM2.a3 + pM1.c2 * pM2.b3 + pM1.c3 * pM2.c3 + pM1.c4 * pM2.d3;
    pOut.c4 = pM1.c1 * pM2.a4 + pM1.c2 * pM2.b4 + pM1.c3 * pM2.c4 + pM1.c4 * pM2.d4;
    pOut.d1 = pM1.d1 * pM2.a1 + pM1.d2 * pM2.b1 + pM1.d3 * pM2.c1 + pM1.d4 * pM2.d1;
    pOut.d2 = pM1.d1 * pM2.a2 + pM1.d2 * pM2.b2 + pM1.d3 * pM2.c2 + pM1.d4 * pM2.d2;
    pOut.d3 = pM1.d1 * pM2.a3 + pM1.d2 * pM2.b3 + pM1.d3 * pM2.c3 + pM1.d4 * pM2.d3;
    pOut.d4 = pM1.d1 * pM2.a4 + pM1.d2 * pM2.b4 + pM1.d3 * pM2.c4 + pM1.d4 * pM2.d4;
    
    return pOut;
}

FTransform GetBoneIndex(const long mesh, int index);
FTransform GetBoneIndex(const long mesh, int index) {
    long v30 = *(long *)(mesh + 1832);
    long boneBase = (v30 + 48LL * index);
    
    FTransform result;
    if(boneBase>0x100000000){
        
        result.rot.x = *(float*)(boneBase + 0x0);
        result.rot.y = *(float*)(boneBase + 0x4);
        result.rot.z = *(float*)(boneBase + 0x8);
        result.rot.w = *(float*)(boneBase + 0xC);
        CVector3 pos;
        
        pos.x = *(float*)(boneBase + 0x10);
        pos.y = *(float*)(boneBase + 0x14);
        pos.z = *(float*)(boneBase + 0x18);
        
        
        if (index == 6)
        {
            if (pos.x <= -25.0f)
            {
                result.translation.x = pos.x + (pos.x / 2);
            }
            else if (pos.x >= 25.0f)
            {
                result.translation.x = pos.x + (pos.x / 3.5);
            }
            else
            {
                result.translation.x = pos.x + (pos.x / 2);
            }
            
            result.translation.y = pos.y + 12.0f;
            result.translation.z = pos.z + 10.0f;
        }
        else if (index == 4)
        {
            result.translation.x = pos.x;
            result.translation.y = pos.y;
            result.translation.z = pos.z + 10.0f;;
        }
        else
        {
            result.translation.x = pos.x;
            result.translation.y = pos.y;
            result.translation.z = pos.z;
        }
        
        if (index == 4)
        {
            result.translation.z += 10;
        }
        
        result.scale.x = *(float*)(boneBase + 0x20);
        result.scale.y = *(float*)(boneBase + 0x24);
        result.scale.z = *(float*)(boneBase + 0x2C);
    }
    
    
    return result;
}

static Vector GetBoneWithRotation(const long mesh, int id)

{
    Vector result;
    
    FTransform bone = GetBoneIndex(mesh, id);
    
    FTransform ComponentToWorld;
    ComponentToWorld.rot.x = Read_Float(mesh + 0x1b0);
    ComponentToWorld.rot.y = Read_Float(mesh + 0x1b4);
    ComponentToWorld.rot.z = Read_Float(mesh + 0x1b8);
    ComponentToWorld.rot.w = Read_Float(mesh + 0x1bc);
    
    ComponentToWorld.translation.x = Read_Float(mesh + 0x1c0);
    ComponentToWorld.translation.y = Read_Float(mesh + 0x1c4);
    ComponentToWorld.translation.z = Read_Float(mesh + 0x1c8);
    
    ComponentToWorld.scale.x = Read_Float(mesh + 0x1d0);
    ComponentToWorld.scale.y = Read_Float(mesh + 0x1d4);
    ComponentToWorld.scale.z = Read_Float(mesh + 0x1d8);
    
    LTMatrix Matrix;
    Matrix = MatrixMultiplication(bone.ToMatrixWithScale(), ComponentToWorld.ToMatrixWithScale());
    
    result.X = Matrix.d1;
    result.Y = Matrix.d2;
    result.Z = Matrix.d3;
    
    return result;
}





@end
