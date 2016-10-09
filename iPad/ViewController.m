//
//  ViewController.m
//  iPad
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "Animal.h"
#import "Dog.h"
#import "Eat.h"

@interface ViewController ()

@property (nonatomic, strong)FirstViewController * firstVC;
@property (nonatomic, strong)SecondViewController * secondVC;
@property (nonatomic, strong)ThirdViewController * thirdVC;
@property (nonatomic, strong)UIViewController * currentVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  /*
    Dog *d = [[Dog alloc]init];
    [d eat];
    
    Animal * animal = [[Dog alloc]init];
    [animal eat];
    
    Animal * animal_ = [[Animal alloc]init];
    [animal_ eat];
    
    
    
    NSObject * n = [[Dog alloc]init];
    
    Dog * d_ = (Dog *)n;
    [d_ eat];
   */
    [self eat:[[Eat alloc]init]];
    
    [self aboutNSString];
    
    
    self.firstVC = [[FirstViewController alloc]init];
    [self addChildViewController:self.firstVC];
    
    self.secondVC = [[SecondViewController alloc]init];
    [self addChildViewController:self.secondVC];
    
    self.thirdVC = [[ThirdViewController alloc]init];
    [self addChildViewController:self.thirdVC];
    
    [self.view addSubview:self.firstVC.view];
    self.currentVC = self.firstVC;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /*
    UITableViewController * tableViewVC = [[UITableViewController alloc]init];
    tableViewVC.view.backgroundColor = [UIColor yellowColor];
//    tableViewVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:tableViewVC animated:YES completion:Nil];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:tableViewVC];
//    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:nav animated:YES completion:nil];
     */
    UIViewController * oldVC = self.currentVC;
    [self transitionFromViewController:self.firstVC toViewController:self.thirdVC duration:3.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        NSLog(@"animation");
        
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"finished");
        }else{
            NSLog(@"notFinished");
        }
        
    }];

    
}

- (void)eat:(Animal *)animal{
    [animal eat];
}

- (void)aboutNSString{
    NSString * str = @"你233 323";
    char * str1 = "你23  sd";
    unsigned long  a = strlen(str1);
    int length = str.length;
    NSInteger bytes = [str lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
