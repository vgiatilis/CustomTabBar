//
//  FirstTabController.m
//  CustomTabBar
//
//  Created by Mohit Jain on 5/13/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "FirstTabController.h"
#import "DetailViewController.h"

@interface FirstTabController ()

@end

@implementation FirstTabController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


-(IBAction)goTodetailView :(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil];
    DetailViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detail animated:YES];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
