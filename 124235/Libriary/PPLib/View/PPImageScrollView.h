//
//  PPImageScrollView.h
//  PPLibTest
//
//  Created by 王鹏 on 12-9-4.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	PPImageScrollDirectionPortait,
	PPImageScrollDirectionLandscape,
}PPImageScrollDirection;
@protocol PPImageScrollViewDelegate;

@interface PPImageScrollView : UIView <UIScrollViewDelegate>
{
	UIScrollView *_scrollView;
	int totalPage;
	NSMutableArray *_curImageArray;
	
	UIScrollView *_contentScrollView0;
	UIScrollView *_contentScrollView1;
	UIScrollView *_contentScrollView2;
	
	UIImageView *_contentImageView0;
	UIImageView *_contentImageView1;
	UIImageView *_contentImageView2;
	
}
@property (nonatomic, retain) NSArray *imagesArray;
@property (nonatomic, assign) id <PPImageScrollViewDelegate> delegate;
@property (nonatomic) PPImageScrollDirection scrollDirection;
@property (nonatomic) NSInteger curPageIndex;
@end

@protocol PPImageScrollViewDelegate <NSObject>

@optional

- (void)ppImageScrollView:(PPImageScrollView *)scrollView
         didSelectAtIndex:(NSInteger)index;
- (void)ppImageScrollView:(PPImageScrollView *)scrollView didChangeAtIndex:(NSInteger)index;

@end
