//
//  ViewController.m
//  CAGradientLayer
//
//  Created by mac on 15/12/9.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic,strong) CAGradientLayer * gradientLayer;

@property (nonatomic,strong) CAShapeLayer * backgroundLayer;

@property (nonatomic,strong) CAShapeLayer * tinterLayer;

@property (nonatomic,strong) CAShapeLayer * blueLayer;

@property (nonatomic,strong) CAShapeLayer * greenLayer;

@property (nonatomic,strong) NSTimer * timer;

@property (nonatomic,strong) NSArray * layers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.gradientLayer = [CAGradientLayer layer];
    
    self.gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    
    [self.view.layer addSublayer:self.gradientLayer];
    
    
    //颜色分配
    self.gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    

    
    //颜色的分割线
    
    /*
     这里不是表示位置  而是表示颜色相对于layer坐标的渐变颜色
     */
    self.gradientLayer.locations = @[@(.25),@(.5),@(.75)];
    
    
    self.gradientLayer.startPoint = CGPointMake(1,1);
    
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    
    
    //背景
    
    self.backgroundLayer = [[CAShapeLayer alloc] init];
    
    //路径
    CGPoint center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    
    
    UIBezierPath * circle = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:M_PI endAngle:-M_PI clockwise:NO];
    
    
    
    self.backgroundLayer.path = circle.CGPath;
    
    self.backgroundLayer.strokeColor = [UIColor grayColor].CGColor;
    
    self.backgroundLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.backgroundLayer.lineWidth = 3;
    
    [self.view.layer addSublayer:self.backgroundLayer];
    self.backgroundLayer.strokeEnd = 1.0f;
    
    
    
   
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //颜色1
        
        self.tinterLayer = [[CAShapeLayer alloc] init];
        
        self.tinterLayer.path = circle.CGPath;
        
        self.tinterLayer.strokeColor = [UIColor redColor].CGColor;
        
        self.tinterLayer.fillColor = [UIColor clearColor].CGColor;
        
        self.tinterLayer.lineWidth = 3;
        

        
        [self.backgroundLayer addSublayer:self.tinterLayer];
        
        
        //基础动画
        
        CABasicAnimation * basicAnimation = [CABasicAnimation animation];
        basicAnimation.keyPath = @"strokeEnd";
        basicAnimation.duration = 2.0f;
        
        basicAnimation.fromValue = @(self.tinterLayer.strokeStart);
        
        basicAnimation.toValue = @(.3f);
        
        basicAnimation.autoreverses = NO;
        
        
        basicAnimation.removedOnCompletion = NO;
        
        basicAnimation.fillMode = kCAFillModeForwards;
        
        
        
        [self.tinterLayer addAnimation:basicAnimation forKey:nil];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //颜色2
        self.blueLayer = [[CAShapeLayer alloc] init];
        
        self.blueLayer.path = circle.CGPath;
        
        self.blueLayer.strokeColor = [UIColor blueColor].CGColor;
        
        self.blueLayer.fillColor = [UIColor clearColor].CGColor;
        
        self.blueLayer.lineWidth = 3;
        
        self.blueLayer.strokeStart = .3f;
        
        [self.backgroundLayer addSublayer:self.blueLayer];
        
        
        //动画
        CABasicAnimation * basicAnimation2 = [CABasicAnimation animation];
        basicAnimation2.keyPath = @"strokeEnd";
        basicAnimation2.duration = 2.0f;
        
        basicAnimation2.fromValue = @(.3f);
        
        basicAnimation2.toValue = @(.6f);
        
        basicAnimation2.autoreverses = NO;
        

        
        basicAnimation2.fillMode = kCAFillModeForwards;
        
        basicAnimation2.removedOnCompletion = NO;
        
        [self.blueLayer addAnimation:basicAnimation2 forKey:nil];
        
    });
    

   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //颜色3
        self.greenLayer = [[CAShapeLayer alloc] init];
        
        self.greenLayer.path = circle.CGPath;
        
        self.greenLayer.strokeColor = [UIColor greenColor].CGColor;
        
        self.greenLayer.fillColor = [UIColor clearColor].CGColor;
        
        self.greenLayer.strokeStart = .6f;
        self.greenLayer.lineWidth = 3;
        
        [self.backgroundLayer addSublayer:self.greenLayer];
        
        CABasicAnimation * basicAnimation3 = [CABasicAnimation animation];
        basicAnimation3.keyPath = @"strokeEnd";
        basicAnimation3.duration = 2.0f;
        
        basicAnimation3.fromValue = @(.6f);
        
        basicAnimation3.toValue = @(1.0f);
        
        basicAnimation3.autoreverses = NO;
        
    
        
        basicAnimation3.fillMode = kCAFillModeForwards;
        
        basicAnimation3.removedOnCompletion = NO;
        
        
        [self.greenLayer addAnimation:basicAnimation3 forKey:nil];
        
        
    });
    

    
    


    
    
   
    
    
    
    
    
    
    
    


    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
