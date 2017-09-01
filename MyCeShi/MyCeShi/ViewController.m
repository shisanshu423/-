//
//  ViewController.m
//  MyCeShi
//
//  Created by ml on 2017/4/6.
//  Copyright © 2017年 MingLi. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITextField *greenTextView;
@property(nonatomic,strong)UIButton *blueBtn;
@property(nonatomic,strong)UIView *sv;

@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //键盘弹出监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
//    [self test01];
    
//    [self test02];
    
//    [self test03];
//        [self test06];
//    
//    [self test99];
    
    
    [self removeArr];
}



-(void)withMyBlock:(void (^)())block{
    
}


-(void)test01{
    
    //1
    UIView *sv = [UIView new];
    sv.backgroundColor = [ UIColor blackColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    
    
    //2
//    UIView *sv1 = [UIView new];
//    sv1.backgroundColor = [UIColor redColor];
//    [sv addSubview:sv1];
//    
//    
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    
    //3
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor orangeColor];
    [sv addSubview:sv2];
    
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor orangeColor];
    [sv addSubview:sv3];
    int padding1 = 10;
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(padding1);
        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
        
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(padding1);
        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
    
    
    
    
    //4
    
    
    
    
    //5

    
    
    
}



-(void)test02{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i= 0; i<4; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor greenColor];
        [self.view addSubview:view];
        [arr addObject:view];//保存添加的控件
    }
    
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:15 leadSpacing:100 tailSpacing:10];
    
    
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view.mas_centerX);
        
        make.width.mas_equalTo(100);
    }];
    
    
    
    
    
    

    
}



-(void)test03{
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.text = @"有的人，没事时喜欢在朋友圈里到处点赞，东评论一句西评论一句，比谁都有存在感。等你有事找他了，他就立刻变得很忙，让你再也找不着。真正的朋友，平常很少联系。可一旦你遇上了难处，他会立刻回复你的消息，第一时间站出来帮你。所谓的存在感，不是你有没有出现，而是你的出现有没有价值。存在感，不是刷出来的，也不是说出来的。有存在感，未必是要个性锋芒毕露、甚至锋利扎人。翩翩君子，温润如玉，真正有存在感的人，反而不会刻意去强调他的存在感。他的出现，永远都恰到好处。我所欣赏的存在感，不是长袖善舞巧言令色，而是对他人的真心关照；不是锋芒毕露计较胜负，而是让人相处得舒服；不是时时刻刻聒噪不休，而是关键时刻能挺身而出。别总急着出风头，希望你能有恰到好处的存在感。";
    [self.view addSubview: label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    

    
    [self.view layoutSubviews];
    
    //2. 设置preferredMaxLayoutWidth: 多行label约束的完美解决
    label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
    //3. 设置preferredLayoutWidth后，需要再次执行 [super layoutSubviews];
    //其实在实际中这步不写，也不会出错，官方解释是说设置preferredLayoutWidth后需要重新计算并布局界面，所以这步最好执行
    [self.view layoutSubviews];
}


-(void)test04{
    self.scrollView = [[UIScrollView alloc] init];
    
     self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];

    
    [self generateContent]; //添加内容视图
    
    
    [self.view setNeedsUpdateConstraints];
    
    
    [self.view layoutIfNeeded];
}


- (void)generateContent {
    UIView* contentView = [UIView new];
    [self.scrollView addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    UIView *lastView = [UIView new];
    CGFloat height = 25;
    
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [UIColor redColor];
        [contentView addSubview:view];

        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {

            
            if (lastView) {
               make.top.mas_equalTo(CGRectGetMaxY(lastView.frame));
            }else{
                make.top.mas_equalTo(0);
            }
            
            make.left.equalTo(@0);
            make.width.mas_equalTo(contentView.frame.size.width);
            make.height.equalTo(@(height));
        }];
        
        height += 25;
        lastView = view;
    }
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(CGRectGetMaxY(lastView.frame));
    }];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}



-(void)test05{
    
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv2];
    
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(sv.mas_height).dividedBy(3);
        make.width.and.height.lessThanOrEqualTo(sv);
        make.width.mas_equalTo(200).with.priorityHigh(1000);
        make.center.equalTo(sv);
    }];

    
}

-(void)test06{
    
    
    self.sv = [UIView new];
    self.sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.sv];
    
    [self.sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
//    self.sv.frame = CGRectMake(100, 100, 200, 200);
    
    
    //文本框textview
    UITextField *greenTextView=[[UITextField alloc]init];
    greenTextView.backgroundColor = [UIColor greenColor];
    greenTextView.placeholder = @"点我更新约束啦...";
    self.greenTextView = greenTextView;
    [self.view addSubview:greenTextView];
    
    //设置初始时的约束
    //左边距离self.view左边10
    //底部距离self.view 20
    //高度为50
    //宽度自适应
    [greenTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.mas_equalTo(50);
    }];
    
    //按钮
    UIButton *blueBtn = [[UIButton alloc]init];
    blueBtn.backgroundColor = [UIColor blueColor];
    self.blueBtn = blueBtn;
    [self.view addSubview:blueBtn];
    
    //设置初始时的约束
    //右边距离self.view右边10
    //左边距离self.greenTextView右边 10
    //宽高和self.greenTextView一样
    [blueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view.mas_trailing).offset(-10);
        make.leading.equalTo(self.greenTextView.mas_trailing).offset(10);
        make.bottom.equalTo(self.greenTextView.mas_bottom);
        make.size.equalTo(self.greenTextView);
    }];
}


//键盘弹出时会调用
-(void)keyboardWillShow:(NSNotification *)notification
{
    //获取键盘的基本信息
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGFloat keyboardHeight = CGRectGetHeight(rect);
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //修改下边距约束
    [self.greenTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyboardHeight-20);
    }];
    
    //更新约束
    [UIView animateWithDuration:duration animations:^{
        
        [self.greenTextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-keyboardHeight-20);
        }];
        
//        [self.view layoutIfNeeded];
    }];
}

//键盘收回时会调用
-(void)keyboardWillHidden:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //修改下边距约束
    [self.greenTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
    }];
    
    

    //更新约束
    
//    [self.view.superview layoutIfNeeded];
    
    [UIView animateWithDuration:14 animations:^{
    

        [self.sv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view).mas_offset(50);
        }];
        
        
            [self.view.superview layoutIfNeeded];
    
        
        
 
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //结束编辑
    [self.view endEditing:YES];
}




-(void)test99{
    
    
    
    for (int i =  1; i<=9; i++) {
        for (int  j =  1; j<=i; j++ ) {
            
           int sum = i*j;
            
            NSLog(@" %zd * %zd = %zd  ",j,i,sum);
        }
        NSLog(@"\n");
        
        
        
        
        
    }
}


-(void)removeArr{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 70, 30);
    
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(refreshArr) forControlEvents:UIControlEventTouchUpInside];
 
}

-(void)refreshArr{
    for (int i = 0; i<20; i++) {
        NSString *str = @"12132";
        [self.dataArr addObject:str];
    }
    
    if (self.dataArr.count > 100) {
        
        NSRange range = {100,20};
        
        [self.dataArr removeObjectsInRange:range];
    }
    
    NSLog(@"%zd",self.dataArr.count);
    
}


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}


-(void)updateViewConstraints{
    [super updateViewConstraints];
}



-(void)main{
    
}

@end
