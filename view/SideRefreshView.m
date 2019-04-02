//
//  SideRefreshView.m
//  SideRefreshView
//
//  Created by cdc on 2019/4/1.
//  Copyright © 2019 QG. All rights reserved.
//

#import "SideRefreshView.h"

@implementation SideRefreshView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 创建一个贝塞尔曲线句柄
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 初始化该path到一个初始点
    
    [path moveToPoint:CGPointMake(_offsetY, 0)];
    
    //    // 添加一条直线
    
    //    [path addLineToPoint:CGPointMake(0, 0)];
    
    // 画二元曲线，一般和moveToPoint配合使用
    
    [path addQuadCurveToPoint:CGPointMake(_offsetY, rect.size.height) controlPoint:CGPointMake( -_offsetY,rect.size.height/2)];
    
    // 关闭该path
    
    [path closePath];
    
    // 创建描边（Quartz）上下文
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 将此path添加到Quartz上下文中
    
    CGContextAddPath(context, path.CGPath);
    
    // 设置本身颜色
    
    [[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0] set];
    
    // 设置填充的路径
    
    CGContextFillPath(context);
    
}


@end
