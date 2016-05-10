//
//  PPBaseNavViewController.m
//  PPLibTest
//
//  Created by 王鹏 on 13-1-17.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPBaseNavViewController.h"
#import "PPCore.h"
@interface PPBaseNavViewController ()

@end

@implementation PPBaseNavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.navHeight = 0.0f;
    }
    return self;
}

- (id)initWithNavImageName:(NSString *)imageName Title:(NSString *)title
{
	self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
		self.navHeight = 0.0f;
		self.tabBarHeight = 0.0f;
		self.navBarImageName = imageName;
		self.navTitle = title;
    }
    return self;
}

- (void)dealloc
{
	[_navBarImageName release];
	[_navTitle release];
	[_navBar release];
	
	[super dealloc];
}

- (void)loadView
{
	self.view = [[[UIView alloc]initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self initNavBar];
	
	if(self.tabBarController.hidesBottomBarWhenPushed == NO)
		self.tabBarHeight = self.tabBarController.tabBar.height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.view bringSubviewToFront:self.navBar];
}

- (UIButton *)leftNavBarButton
{
	
	return nil;
}

- (UIButton *)rightNavBarButton
{
	return nil;
}

- (void)leftNavBarButtonClick:(id)sender
{
//    [self.view endEditing:YES];
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)rightNavBarButtonClick:(id)sender
{

}
//

- (void)customNavLabel
{
	self.navLabel = [[[UILabel alloc]initWithFrame:CGRectMake(40, 0, self.view.width - 80, _navHeight)] autorelease];
	self.navLabel.backgroundColor = [UIColor clearColor];
	self.navLabel.textAlignment = UITextAlignmentCenter;
	self.navLabel.textColor = [UIColor whiteColor];
	self.navLabel.font = [UIFont systemFontOfSize:20.0f];
	self.navLabel.minimumFontSize = 10.0f;
	self.navLabel.adjustsFontSizeToFitWidth = YES;
    self.navLabel.shadowColor = UICOLOR_RGB(73, 107, 0);
    self.navLabel.shadowOffset = CGSizeMake(0, -1);
	self.navLabel.text = self.navTitle;
	[self.navBar addSubview:self.navLabel];
}

- (void)initNavBar
{
	if(self.navBarImageName == nil)
		return;
	UIImage *navBackgroundImage = [UIImage imageNamed:self.navBarImageName];
	_navHeight = navBackgroundImage.size.height;
	
	self.navBar = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, _navHeight)] autorelease];
	[self.navBar setBackgroundImage:navBackgroundImage];
	[self.view addSubview:self.navBar];
	
	[self customNavLabel];
	
	UIButton *leftBtn = [self leftNavBarButton];
	if(leftBtn)
	{
		[leftBtn addTarget:self action:@selector(leftNavBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[self.navBar addSubview:leftBtn];
	}
	
	UIButton *rightBtn = [self rightNavBarButton];
	if(rightBtn)
	{
		[rightBtn addTarget:self action:@selector(rightNavBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[self.navBar addSubview:rightBtn];
	}
	
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
