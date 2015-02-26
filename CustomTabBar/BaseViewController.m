//
//  BaseViewController.m
//  CustomTabBar
//
//  Created by Mohit Jain on 5/13/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "BaseViewController.h"
#import "FirstTabController.h"
#import "SecondTabController.h"
#import "ThirdTabController.h"
#import "FourthTabBarController.h"
#import "FifthTabBarController.h"
#import "SixthTabBarController.h"
#import "SeventhTabBarController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize tabBarScroller, storyBoard;
@synthesize firstTab, secondTab, thirdTab, fourthTab, fifthTab, sixthTab, seventhTab;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)setup {
    [tabBarScroller setContentSize:CGSizeMake(448, 40)];
    storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    [self addButtons];
    
    if(IS_IPHONE_5) {
        rect = CGRectMake(0, 0, 320, 499);
    }
    else {
        rect = CGRectMake(0, 0, 320, 412);
    }
    
    // Select which view to be loaded (actually viewed) as base controller or root controller. 0 - BaseController, 1 -
    // FirstTabController, 2 - SecondTabcontroller
    // By default first tab controller is set a rootcontroller
    
    [self tabCall:1];
    
}

-(void)addButtons {
    
    UIImage *img = [UIImage imageNamed:@"clock@2x.png"];
    
    for(int i =1;i<=7;i++) {
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((i-1)*64, 0, 64, 40);
        btn.backgroundColor = [UIColor blackColor];
        btn.titleLabel.font = [UIFont fontWithName:@"Arial" size:12];
        btn.titleLabel.textColor = [UIColor whiteColor];
        btn.tag = i;
        
        switch (btn.tag) {
            case 1:
                [btn setTitle:@"Tab-1" forState:UIControlStateNormal];
                break;
            case 2:
                [btn setTitle:[NSString stringWithFormat:@"Tab-2"] forState:UIControlStateNormal];
                break;
            case 3:
                [btn setTitle:[NSString stringWithFormat:@"Tab-3"] forState:UIControlStateNormal];
                break;
            case 4:
                [btn setTitle:[NSString stringWithFormat:@"Tab-4"] forState:UIControlStateNormal];
                break;
            case 5:
                [btn setTitle:[NSString stringWithFormat:@"Tab-5"] forState:UIControlStateNormal];
                break;
            case 6:
                [btn setTitle:[NSString stringWithFormat:@"Tab-6"] forState:UIControlStateNormal];
                break;
            case 7:
            	[self buttonLayout:btn withImage:img withText:@"Tab-7"];
                break;
                
            default:
                break;
        }
        
        [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [tabBarScroller addSubview:btn];
    }
}

-(void) buttonLayout: (UIButton*)btn withImage:(UIImage *) img withText:(NSString *) buttonText
{
    btn.titleEdgeInsets = UIEdgeInsetsMake(-5.0, -img.size.width+4, -40.0, 0.0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(-10.0, (btn.bounds.size.width-img.size.width)/2, - 0.0, 0.0);

    [btn setImage:img forState:UIControlStateNormal];
    [btn setTitle:buttonText forState:UIControlStateNormal];
}

-(void)tabCall:(NSInteger)tag {
    switch (tag) {
            
        case 1:
            
            [self.view addSubview:self.navFirstTab.view];
            break;
            
        case 2:
            [self.view addSubview:self.navSecondTab.view];
            break;
            
        case 3:
            [self.view addSubview:self.navThirdTab.view];
            break;
            
        case 4:
            [self.view addSubview:self.navFourthTab.view];
            break;
            
        case 5:
            [self.view addSubview:self.navFifthTab.view];
            break;
            
        case 6:
            [self.view addSubview:self.navSixthTab.view];
            break;
            
        case 7:
            [self.view addSubview:self.navSeventhTab.view];
            break;
            
        default:
            break;
    }
}


-(void)buttonTapped:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSLog(@"Tab bar %d is clicked",btn.tag);
    [self tabCall:btn.tag];
    
}



- (UINavigationController*) navFirstTab
{
    if (!_navFirstTab) {
        if (!firstTab) {
            firstTab = [storyBoard instantiateViewControllerWithIdentifier:@"FirstTabController"];
        }
        _navFirstTab = [[UINavigationController alloc] initWithRootViewController:self.firstTab];
        _navFirstTab.navigationBar.tintColor = [UIColor blackColor];
        _navFirstTab.view.frame = rect;
        _navFirstTab.navigationBar.topItem.title = @"First Controller";
    }
    return _navFirstTab;
}


- (UINavigationController*) navSecondTab
{
    if (!_navSecondTab) {
        if (!secondTab) {
            secondTab = [storyBoard instantiateViewControllerWithIdentifier:@"SecondTabController"];
        }
        _navSecondTab = [[UINavigationController alloc] initWithRootViewController:self.secondTab];
        _navSecondTab.navigationBar.tintColor = [UIColor blackColor];
        _navSecondTab.view.frame = rect;
        _navSecondTab.navigationBar.topItem.title = @"Second Controller";
    }
    return _navSecondTab;
}

- (UINavigationController*) navThirdTab
{
    if (!_navThirdTab) {
        if (!thirdTab) {
            thirdTab = [storyBoard instantiateViewControllerWithIdentifier:@"ThirdTabController"];
        }
        _navThirdTab = [[UINavigationController alloc] initWithRootViewController:self.thirdTab];
        _navThirdTab.navigationBar.tintColor = [UIColor blackColor];
        _navThirdTab.navigationBar.topItem.title = @"Third Controller";
        _navThirdTab.view.frame = rect;
    }
    return _navThirdTab;
}

- (UINavigationController*) navFourthTab
{
    if (!_navFourthTab) {
        if (!fourthTab) {
            fourthTab = [storyBoard instantiateViewControllerWithIdentifier:@"FourthTabBarController"];
        }
        _navFourthTab = [[UINavigationController alloc] initWithRootViewController:self.fourthTab];
        _navFourthTab.navigationBar.tintColor = [UIColor blackColor];
        _navFourthTab.view.frame = rect;
        _navFourthTab.navigationBar.topItem.title = @"Fourth Controller";
    }
    return _navFourthTab;
}

- (UINavigationController*) navFifthTab
{
    if (!_navFifthTab) {
        if (!fifthTab) {
            fifthTab = [storyBoard instantiateViewControllerWithIdentifier:@"FifthTabBarController"];
        }
        _navFifthTab = [[UINavigationController alloc] initWithRootViewController:self.fifthTab];
        _navFifthTab.navigationBar.tintColor = [UIColor blackColor];
        _navFifthTab.view.frame = rect;
        _navFifthTab.navigationBar.topItem.title = @"Fifth Controller";
    }
    return _navFifthTab;
}

- (UINavigationController*) navSixthTab
{
    if (!_navSixthTab) {
        if (!sixthTab) {
            sixthTab = [storyBoard instantiateViewControllerWithIdentifier:@"SixthTabBarController"];
        }
        _navSixthTab = [[UINavigationController alloc] initWithRootViewController:self.sixthTab];
        _navSixthTab.navigationBar.tintColor = [UIColor blackColor];
        _navSixthTab.view.frame = rect;
        _navSixthTab.navigationBar.topItem.title = @"Sixth Controller";
    }
    return _navSixthTab;
}

- (UINavigationController*) navSeventhTab
{
    if (!_navSeventhTab) {
        if (!seventhTab) {
            seventhTab = [storyBoard instantiateViewControllerWithIdentifier:@"SeventhTabBarController"];
        }
        _navSeventhTab = [[UINavigationController alloc] initWithRootViewController:self.seventhTab];
        _navSeventhTab.navigationBar.tintColor = [UIColor blackColor];
        _navSeventhTab.view.frame = rect;
        _navSeventhTab.navigationBar.topItem.title = @"Seventh Controller";
    }
    return _navSeventhTab;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
