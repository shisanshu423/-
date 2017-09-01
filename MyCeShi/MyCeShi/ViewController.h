//
//  ViewController.h
//  MyCeShi
//
//  Created by ml on 2017/4/6.
//  Copyright © 2017年 MingLi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TableModel.h"

@interface ViewController : UIViewController



-(void)withMyBlock:(void(^)(TableModel *))block;


@end

