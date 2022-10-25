
//emo
//QQ97184668

#ifndef Gobal_h
#define Gobal_h

#include "defs.h"
#include <arm_neon.h>

static struct Vector3{
    float x;
    float y;
    float z;
}*LPVector3;

static struct Vector4{
    float x;
    float y;
    float z;
    float l;
    float sx;
    float sy;
}*LPVector4;

//Vector3
class CVector3
{
public:
    CVector3() : x(0.f), y(0.f), z(0.f)
    {
        
    }
    
    CVector3(float _x, float _y, float _z) : x(_x), y(_y), z(_z)
    {
        
    }
    ~CVector3()
    {
        
    }
    
    float x;
    float y;
    float z;
    
    CVector3 operator+(CVector3 v)
    {
        return CVector3(x + v.x, y + v.y, z + v.z);
    }
    
    CVector3 operator-(CVector3 v)
    {
        return CVector3(x - v.x, y - v.y, z - v.z);
    }
};


static struct LTMatrix{
    float a1;
    float a2;
    float a3;
    float a4;
    float b1;
    float b2;
    float b3;
    float b4;
    float c1;
    float c2;
    float c3;
    float c4;
    float d1;
    float d2;
    float d3;
    float d4;
}*LPMatrix;

struct FQuat
{
    float x;
    float y;
    float z;
    float w;
};

struct FTransform
{
    FQuat rot;
    CVector3 translation;
    CVector3 scale;
    LTMatrix ToMatrixWithScale()
    {
        LTMatrix m;
        m.d1 = translation.x;
        m.d2 = translation.y;
        m.d3 = translation.z;
        
        float x2 = rot.x + rot.x;
        float y2 = rot.y + rot.y;
        float z2 = rot.z + rot.z;
        
        float xx2 = rot.x * x2;
        float yy2 = rot.y * y2;
        float zz2 = rot.z * z2;
        m.a1 = (1.0f - (yy2 + zz2)) * scale.x;
        m.b2 = (1.0f - (xx2 + zz2)) * scale.y;
        m.c3 = (1.0f - (xx2 + yy2)) * scale.z;
        
        float yz2 = rot.y * z2;
        float wx2 = rot.w * x2;
        m.c2 = (yz2 - wx2) * scale.z;
        m.b3 = (yz2 + wx2) * scale.y;
        
        float xy2 = rot.x * y2;
        float wz2 = rot.w * z2;
        m.b1 = (xy2 - wz2) * scale.y;
        m.a2 = (xy2 + wz2) * scale.x;
        
        float xz2 = rot.x * z2;
        float wy2 = rot.w * y2;
        m.c1 = (xz2 + wy2) * scale.z;
        m.a3 = (xz2 - wy2) * scale.x;
        
        m.a4 = 0.0f;
        m.b4 = 0.0f;
        m.c4 = 0.0f;
        m.d4 = 1.0f;
        
        return m;
    }
};

enum Bones : int
{
    Pelvis = 1,             //骨盆
    Spine = 4,              //脊柱 胸部
    Head = 6,               //头部
    Left_Shoulder = 12,     //左肩膀
    Left_Elbow = 13,        //左手肘
    Left_Hand = 14,         //左手
    Right_Shoulder = 33,    //右肩膀
    Right_Elbow = 34,       //右手肘
    Right_Hand = 35,        //右手
    Left_Pelvis = 53,       //左屁股
    Left_Knee = 54,         //左膝盖
    Left_Foot = 55,         //左脚
    Right_Pelvis = 57,      //右屁股
    Right_Knee = 58,        //右膝盖
    Right_Foot = 59         //右脚
};


#endif


