//
//  PPUITabBarController.m
//  PPLibTest
//
//  Created by 王鹏 on 13-1-18.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPUITabBarController.h"

@interface PPUITabBarController ()

@end

@implementation PPUITabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithViewControllers:(NSArray *)ctrls tabImageArray:(NSArray *)imgArr tabTitleArray:(NSArray *)titleArr
{
	return [self initWithViewControllers:ctrls tabImageArray:imgArr tabTitleArray:titleArr tabBackgroundImage:nil];
}

- (id)initWithViewControllers:(NSArray *)ctrls tabImageArray:(NSArray *)imgArr tabTitleArray:(NSArray *)titleArr tabBackgroundImage:(UIImage *)backgroundImage
{
	self = [super init];
	if(self)
	{
		self.viewControllers = ctrls;
		
		self.mImageArray = imgArr;
		self.tabBar.alpha = 0.0f;
		[self.tabBar addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
        [self.tabBar addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:nil];

		_mTabBar = [[PPTabBar alloc]initWithFrame:self.tabBar.frame buttonImages:self.mImageArray buttonTitles:titleArr backgroundImage:backgroundImage];
		_mTabBar.delegate = self;
		_mTabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
		[self.view addSubview:_mTabBar];
		[self.view bringSubviewToFront:_mTabBar];
	}
	return self;
}

- (void)refreshTabBarTitles:(NSArray *)titleArray {
    [_mTabBar refreshTabTitles:titleArray];
}

- (void)dealloc
{
	[self.tabBar removeObserver:self forKeyPath:@"frame"];
    [self.tabBar removeObserver:self forKeyPath:@"hidden"];
//    [_mImageArray release];
//	[_mTabBar release];
//	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	if([keyPath isEqualToString:@"frame"])
	{
		CGRect r;
		[[change valueForKey:NSKeyValueChangeNewKey] getValue:&r];
		self.mTabBar.frame = r;
        [self.view bringSubviewToFront:self.mTabBar];
	}else if ([keyPath isEqualToString:@"hidden"]) {
        self.mTabBar.hidden = self.tabBar.hidden;
        
	}
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
	[super setSelectedIndex:selectedIndex];
	[self.mTabBar selectTabAtIndex:selectedIndex];
	if(selectedIndex != self.mTabBar.curIndex)
	{
        if(self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
        {
            [self.delegate tabBarController:self didSelectViewController:[self.viewControllers objectAtIndex:selectedIndex]];
        }
    }
}

- (void)tabBar:(PPTabBar *)tabBar didSelectIndex:(NSInteger)index
{
    [self setSelectedIndex:index];
    if(self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
    {
        [self.delegate tabBarController:self didSelectViewController:[self.viewControllers objectAtIndex:index]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
