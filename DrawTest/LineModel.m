//
//  LineModel.m
//  DrawTest
//
//  Created by DingDing on 16/1/82.
//  Copyright © 2016年 奶豆. All rights reserved.
//

#import "LineModel.h"

@implementation LineModel

- (NSMutableArray *)linePoints
{
    if (!_linePoints) {
        _linePoints = [[NSMutableArray alloc] init];
    }
    
    return _linePoints;
}

@end
