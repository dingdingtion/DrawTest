//
//  DrawView.m
//  DrawTest
//
//  Created by DingDing on 16/1/82.
//  Copyright © 2016年 奶豆. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation DrawView

+ (Class)layerClass
{
    return [CAShapeLayer class];
}

- (void)awakeFromNib
{
    [self configView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self configView];
        
    }
    
    return self;
}

- (void)configView
{
    self.path = [[UIBezierPath alloc] init];
    
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    shapeLayer.strokeColor   = [UIColor redColor].CGColor;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.lineJoin      = kCALineJoinRound;
    shapeLayer.lineCap       = kCALineCapRound;
    shapeLayer.lineWidth     = 5;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //move the path drawing cursor to the starting point
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //get the current point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add a new line segment to our path
    [self.path addLineToPoint:point];
    
    //update the layer with a copy of the path
    ((CAShapeLayer *)self.layer).path = self.path.CGPath;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}


@end
