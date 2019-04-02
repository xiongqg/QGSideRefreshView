//
//  QGSideRefreshCell.h
//  SideRefreshView
//
//  Created by cdc on 2019/4/1.
//  Copyright © 2019 QG. All rights reserved.
//

#import <UIKit/UIKit.h>
#define QGViewW(xxxx) xxxx.frame.size.width
#define QGViewH(xxxx) xxxx.frame.size.height
#define QGViewX(xxxx) xxxx.frame.origin.x
#define QGViewY(xxxx) xxxx.frame.origin.y
#define QGViewXW(xxxx) (xxxx.frame.origin.x+xxxx.frame.size.width)
#define QGViewYH(xxxx) (xxxx.frame.origin.y+xxxx.frame.size.height)
#define BXScreenH [UIScreen mainScreen].bounds.size.height
#define BXScreenW [UIScreen mainScreen].bounds.size.width
#define BXScreenHP(h) (BXScreenW/375*h)
// 设置颜色
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define rgba(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define TEXTCOLOR RGB(153, 153, 153)
#define TEXTCOLOR51 RGB(51, 51, 51)
#define TEXTCOLOR102 RGB(102, 102, 102)
#define  TEXTCOLOR_RED  RGB(205, 30, 30)
#define  TEXTCOLOR_BLUE  RGB(30, 84, 205)
NS_ASSUME_NONNULL_BEGIN
@interface QGSideRefreshView :UIView
-(void)setViewDataWithStr:(NSString *)str;
@end
@interface QGSideRefreshCell : UITableViewCell
@property(nonatomic,copy)void(^indexDetail)(NSInteger index);
@property(nonatomic,copy)void(^obtainMoreDataBlock)(void);
-(void)setCelldataWithArr:(NSArray*)arr;
@end

NS_ASSUME_NONNULL_END
