//
//  QGSideRefreshCell.m
//  SideRefreshView
//
//  Created by cdc on 2019/4/1.
//  Copyright © 2019 QG. All rights reserved.
//

#import "QGSideRefreshCell.h"
#import "SideRefreshView.h"

@interface QGSideRefreshView()
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UIImageView *headImg;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UIButton *likeBtn;

@end

@implementation QGSideRefreshView
-(id)init
{
    self = [super init];
    if(self) {
        [self initControls];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self initControls];
    }
    return self;
}
-(void)initControls
{

    UILabel *nameLab=[[UILabel alloc]initWithFrame:self.bounds];
    [nameLab setBackgroundColor:TEXTCOLOR51];
    [nameLab setTextAlignment:NSTextAlignmentCenter];
    [nameLab setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:nameLab];
    self.nameLab=nameLab;
   
    
}
-(void)setViewDataWithStr:(NSString *)str
{
    [self.nameLab setText:str];
}
@end
@interface QGSideRefreshCell()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UILabel *rightView;
@property(nonatomic,strong)SideRefreshView *sideView;
@property(nonatomic,copy)NSArray *dataArr;

@end
@implementation QGSideRefreshCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCustomView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)initCustomView
{
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, BXScreenW, 205+40)];
    [self.contentView addSubview:scrollView];
    scrollView.delegate=self;
    self.scrollView=scrollView;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    
    self.dataArr=nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point=scrollView.contentOffset;
    self.sideView.offsetY = point.x-(QGViewX(self.sideView)-BXScreenW);
    [self.sideView setNeedsDisplay];
    NSLog(@"%f,%f",point.x,BXScreenW);
    if (point.x>(QGViewX(self.sideView)-BXScreenW+50)) {
        if (self.rightView!=nil) {
            [self.rightView setText:@"松\n开\n查\n看"];
        }
    }else{
        if (self.rightView!=nil) {
            [self.rightView setText:@"查\n看\n更\n多"];
        }
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGPoint point=scrollView.contentOffset;
    NSLog(@"%f,%f",point.x,point.y);
    if (point.x>(QGViewX(self.sideView)-BXScreenW+50)) {
        if (self.obtainMoreDataBlock) {
            self.obtainMoreDataBlock();
        }
    }
}
-(void)setCelldataWithArr:(NSArray*)arr
{
    self.dataArr=[arr copy];
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i=0; i<arr.count; i++) {
        QGSideRefreshView *view=[[QGSideRefreshView alloc]initWithFrame:CGRectMake(15+(BXScreenHP(164)+8)*i, 0, BXScreenHP(164), BXScreenHP(205)+40)];
        [self.scrollView addSubview:view];
        [view setViewDataWithStr:[arr objectAtIndex:i]];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i;
        [btn setFrame:CGRectMake(QGViewX(view), QGViewY(view), QGViewW(view), QGViewH(view))];
        [btn addTarget:self action:@selector(seeDetail:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
    }
    
    
    [self.scrollView setContentSize:CGSizeMake((BXScreenHP(164)+8)*arr.count+15, BXScreenHP(205)+40)];
    
    SideRefreshView *sideView=[[SideRefreshView alloc]init];
    [sideView setBackgroundColor:[UIColor clearColor]];
    if (15+(BXScreenHP(164)+8)*arr.count<BXScreenW) {
        [sideView setFrame:CGRectMake(BXScreenW, 0, BXScreenW, BXScreenHP(205))];
    }else{
        [sideView setFrame:CGRectMake(15+(BXScreenHP(164)+8)*arr.count, 0, BXScreenW, BXScreenHP(205))];
    }
    [self.scrollView addSubview:sideView];
    self.sideView=sideView;
    
    UILabel *rightView=[[UILabel alloc]initWithFrame:CGRectMake(25+(BXScreenHP(164)+8)*arr.count, 0, 20, BXScreenHP(205))];
    if (15+(BXScreenHP(164)+8)*arr.count<(BXScreenW+10)) {
        [rightView setFrame:CGRectMake(BXScreenW+10, 0, 20, BXScreenHP(205))];
    }
    [rightView setBackgroundColor:[UIColor clearColor]];
    [rightView setText:@"查\n看\n更\n多"];
    [rightView setFont:[UIFont systemFontOfSize:11]];
    [rightView setTextColor:TEXTCOLOR];
    [rightView setTextAlignment:NSTextAlignmentCenter];
    rightView.numberOfLines=0;
    [self.scrollView addSubview:rightView];
    self.rightView=rightView;
}
-(void)seeDetail:(UIButton*)btn
{
    if (self.indexDetail) {
        self.indexDetail(btn.tag);
    }
}
@end
