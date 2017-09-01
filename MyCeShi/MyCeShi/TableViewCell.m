//
//  TableViewCell.m
//  MyCeShi
//
//  Created by ml on 2017/4/10.
//  Copyright © 2017年 MingLi. All rights reserved.
//

#import "TableViewCell.h"


#import "Masonry.h"

#import "UIView+YYAdd.h"


@interface TableViewCell ()

//头像
@property(nonatomic,strong)UIImageView *iconView;
//用户名
@property(nonatomic,strong)UILabel *nameLabel;
//性别
@property(nonatomic,strong)UIImageView *sexView;

//描述
@property(nonatomic,strong)UILabel *descLabel;

//等级
@property(nonatomic,strong)UIImageView *levelView;
//关注人数
@property(nonatomic,strong)UILabel *GZCountLabel;
//关注按钮
@property(nonatomic,strong)UIImageView *GZView;

@property(nonatomic,assign)CGSize GZViewSize;

@end


@implementation TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    [self initUI];
    
    return self;
}

-(void)initUI{
    self.iconView = [UIImageView new];
    self.iconView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.iconView];
    
    self.nameLabel = [UILabel new];
    [self.contentView addSubview:self.nameLabel];
    
    self.sexView = [UIImageView new];
    self.sexView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.sexView];
    
    self.levelView = [UIImageView new];
    self.levelView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.levelView];
    
    self.descLabel = [UILabel new];
    self.descLabel.numberOfLines = 0;
    [self.contentView addSubview:self.descLabel];
    
    
    self.GZCountLabel = [UILabel new];
    [self.contentView addSubview:self.GZCountLabel];
    
    
    self.GZView = [UIImageView new];
    self.GZView.backgroundColor = [UIColor redColor];
    self.GZView.userInteractionEnabled = YES;
    [self.GZView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickUpView)]];
    
    [self.contentView addSubview:self.GZView];

    
    MASAttachKeys(self.iconView,self.nameLabel);
    
    //控件的适配
    [self myLayoutView];
    
}

//-(void)clickUpView{
//    
//
//    self.GZViewSize = CGSizeMake(90, 30);
//    
//    [self setNeedsUpdateConstraints];
//    
//    [self updateConstraintsIfNeeded];
//    
//    
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
//    
//    [UIView animateWithDuration:0.4 animations:^{
//        [self layoutIfNeeded]; //告知页面立刻刷新，系统立即调用updateConstraints
//    }];
//}


//-(void)updateConstraints{
//    
//    
//    //1.根据不同条件更新约束
//    if (self.tableModel.ret) {
//        [self.descLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_lessThanOrEqualTo(-10);
//        }];
//    }else{
//        [self.descLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_lessThanOrEqualTo(-70);
//        }];
//    }
//
//    [super updateConstraints];
//}

+(BOOL)requiresConstraintBasedLayout{
    return YES;
}


-(void)myLayoutView{
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.bottom.mas_lessThanOrEqualTo(-10);
        self.iconView.layer.cornerRadius = 50/2;
        self.iconView.layer.masksToBounds = YES;
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.topMargin.mas_equalTo(self.iconView.mas_topMargin);
//        make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
        
        make.height.mas_equalTo(20);
        make.width.mas_lessThanOrEqualTo(300);
        make.bottom.mas_lessThanOrEqualTo(-10);
    }];
    
    [self.sexView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.nameLabel.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(self.nameLabel.mas_centerY).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.right.mas_lessThanOrEqualTo(-120);
        make.bottom.mas_lessThanOrEqualTo(-10);
    }];
    
    [self.levelView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.sexView.mas_right).mas_equalTo(15);
        make.centerY.mas_equalTo(self.nameLabel.mas_centerY).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 15));
        make.right.mas_lessThanOrEqualTo(-100);
        make.bottom.mas_lessThanOrEqualTo(-10);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_equalTo(10);
        make.leftMargin.mas_equalTo(self.nameLabel.mas_leftMargin);
        make.right.mas_lessThanOrEqualTo(-70);
        make.bottom.mas_lessThanOrEqualTo(-10);
    }];
    
    
    [self.GZCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descLabel.mas_bottom).mas_equalTo(10);
        make.leftMargin.mas_equalTo(self.nameLabel.mas_leftMargin);
        make.height.mas_equalTo(20);
        make.right.mas_lessThanOrEqualTo(-70);
        make.bottom.mas_lessThanOrEqualTo(-10);
    }];
    
    [self.GZView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(self.nameLabel.mas_topMargin);
        make.right.mas_lessThanOrEqualTo(-10);
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.bottom.mas_lessThanOrEqualTo(-10);
    }];
    
}

-(void)setTableModel:(TableModel *)tableModel{
    _tableModel = tableModel;
    
    self.nameLabel.text = tableModel.nameStr;
    
    self.descLabel.text = tableModel.descStr;
    
    self.GZCountLabel.text = @"关注：100000";
}





@end
