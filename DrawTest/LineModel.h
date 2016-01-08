//
//  LineModel.h
//  DrawTest
//
//  Created by DingDing on 16/1/82.
//  Copyright © 2016年 奶豆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineModel : NSObject

@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, strong) NSMutableArray *linePoints;

@end
