//
//  ViewController.m
//  drawView
//
//  Created by 刘宏伟 on 2019/10/12.
//  Copyright © 2019 刘宏伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signBtn setTitle:@"签名" forState:UIControlStateNormal];
    [signBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    signBtn.frame = CGRectMake(230, 100, 50, 20);
    signBtn.layer.borderWidth = 1.0;
    signBtn.layer.borderColor = [UIColor magentaColor].CGColor;
    [self.view addSubview:signBtn];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.view.bounds.size.width - 100, 100)];
    view.backgroundColor = [UIColor colorWithRed:20/255.0 green:31/255.0 blue:51/255.0 alpha:0.75];
    [self.view addSubview:view];
    
    //将绘制添加到视图上
    view.layer.mask = [self drawWithView:view withSignBtnFrame:signBtn.frame];
}


- (CAShapeLayer *)drawWithView:(UIView *)view withSignBtnFrame:(CGRect)signBtnFrame
{
    CGFloat viewWidth = CGRectGetWidth(view.frame);
    CGFloat viewHeight = CGRectGetHeight(view.frame);
    
    CGFloat topSpace = 5;
    
    //原点
    CGPoint point1 = CGPointMake(0, topSpace);
    //三角左边的点
    CGPoint point2 = CGPointMake(CGRectGetMinX(signBtnFrame) - 50 + (CGRectGetWidth(signBtnFrame) - 11) / 2, topSpace);
    //三角顶点
    CGPoint point3 = CGPointMake(CGRectGetMidX(signBtnFrame) - 50, 0);
    //三角右边的点
    CGPoint point4 = CGPointMake(CGRectGetMaxX(signBtnFrame) - (CGRectGetWidth(signBtnFrame) - 11) / 2 - 50, topSpace);
    CGPoint point5 = CGPointMake(viewWidth, topSpace);
    CGPoint point6 = CGPointMake(viewWidth, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    return layer;
}


@end
