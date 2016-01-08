//
//  ViewController.m
//  DrawTest
//
//  Created by DingDing on 16/1/82.
//  Copyright © 2016年 奶豆. All rights reserved.
//

#import "ViewController.h"
#import "LineModel.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray *linePoints;

@property (nonatomic, strong) LineModel *currentLineModel;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.imageView];
}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
   
    UITouch *touch = [touches anyObject];
    
    if (touch) {
        
        touchPoint = [touch locationInView:self.imageView];
        
        NSLog(@"touchesBegan : %f, %f\n", touchPoint.x, touchPoint.y);
        
        self.currentLineModel = [[LineModel alloc] init];
        
        self.currentLineModel.startPoint = touchPoint;
        
        [self.linePoints addObject:_currentLineModel];

    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    
    UITouch *touch = [touches anyObject];
    
    if (touch) {
        
        touchPoint = [touch locationInView:self.imageView];
        
        [self.currentLineModel.linePoints addObject:[NSValue valueWithCGPoint:touchPoint]];
        
        
        NSLog(@"touchesBegan : %f, %f\n", touchPoint.x, touchPoint.y);
        
        self.imageView.image = [self drawLineWithColor:[UIColor blackColor] width:10.0f startPoint:self.currentLineModel.startPoint endPoint:touchPoint];
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}





- (UIImage *)drawLineWithColor:(UIColor *)color width:(CGFloat)width startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    
    UIImage *image = nil;
    
    UIGraphicsBeginImageContext(self.imageView.frame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, width);
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    
    
    
    ///// 需要绘制 linePoints 所有数据
    
    for (LineModel *model in self.linePoints)
    {
        CGContextMoveToPoint(context, model.startPoint.x, model.startPoint.y);
        
        for (NSValue *value in model.linePoints)
        {
            CGPoint point = [value CGPointValue];
            
            CGContextAddLineToPoint(context, point.x, point.y);
            
        }

    }

    CGContextStrokePath(context);
    
    image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    

    return image;
}

#pragma mark - setters and getters
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    }
    
    return _imageView;
}

- (NSMutableArray *)linePoints
{
    if (!_linePoints) {
        _linePoints = [[NSMutableArray alloc] init];
    }
    
    return _linePoints;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
