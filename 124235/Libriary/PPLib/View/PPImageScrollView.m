//
//  PPImageScrollView.m
//  PPLibTest
//
//  Created by 王鹏 on 12-9-4.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPImageScrollView.h"

@interface UIView (Catagroy)
- (CGFloat)width;
- (CGFloat)height;
@end


@implementation UIView (Catagroy)
- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
@end


@interface PPImageScrollView()
- (void)loadCurImages;
@end

@implementation PPImageScrollView
@synthesize imagesArray = _imagesArray;
@synthesize delegate;
@synthesize scrollDirection, curPageIndex;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		curPageIndex = 0;
		totalPage = 0;
		scrollDirection = PPImageScrollDirectionLandscape;
		_curImageArray = [[NSMutableArray alloc]init];
		_imagesArray = [[NSMutableArray alloc] init];
		
		_scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
		_scrollView.backgroundColor = [UIColor blackColor];
		_scrollView.showsHorizontalScrollIndicator = NO;
		_scrollView.showsVerticalScrollIndicator = NO;
		_scrollView.pagingEnabled = YES;
		_scrollView.delegate = self;
		[self addSubview:_scrollView];
		[_scrollView release];
		
		_scrollView.contentSize = CGSizeMake(_scrollView.width * 3, _scrollView.height);
		
		_contentScrollView0 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
		_contentScrollView0.backgroundColor = [UIColor blackColor];
		_contentScrollView0.showsHorizontalScrollIndicator = NO;
		_contentScrollView0.showsVerticalScrollIndicator = NO;
		_contentScrollView0.pagingEnabled = NO;
		_contentScrollView0.minimumZoomScale = 0.5f;
		_contentScrollView0.maximumZoomScale = 2.0f;
		_contentScrollView0.delegate = self;
		_contentScrollView0.contentSize = CGSizeMake(self.width, self.height);
		[_scrollView addSubview:_contentScrollView0];
		[_contentScrollView0 release];
		
		_contentImageView0 = [[UIImageView alloc]initWithFrame:self.bounds];
		_contentImageView0.contentMode = UIViewContentModeScaleAspectFit;
		_contentImageView0.userInteractionEnabled = YES;
		UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [_contentImageView0 addGestureRecognizer:singleTap];
        [singleTap release];
		
		[_contentScrollView0 addSubview:_contentImageView0];
		[_contentImageView0 release];
		
		_contentScrollView1 = [[UIScrollView alloc]initWithFrame:CGRectMake(self.width, 0, self.width, self.height)];
		_contentScrollView1.backgroundColor = [UIColor blackColor];
		_contentScrollView1.showsHorizontalScrollIndicator = NO;
		_contentScrollView1.showsVerticalScrollIndicator = NO;
		_contentScrollView1.pagingEnabled = NO;
		_contentScrollView1.minimumZoomScale = 0.5f;
		_contentScrollView1.maximumZoomScale = 2.0f;
		_contentScrollView1.delegate = self;
		_contentScrollView1.contentSize = CGSizeMake(self.width, self.height);
		[_scrollView addSubview:_contentScrollView1];
		[_contentScrollView1 release];
		
		_contentImageView1 = [[UIImageView alloc]initWithFrame:self.bounds];
		_contentImageView1.userInteractionEnabled = YES;
		_contentImageView1.contentMode = UIViewContentModeScaleAspectFit;
		singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [_contentImageView1 addGestureRecognizer:singleTap];
        [singleTap release];
		[_contentScrollView1 addSubview:_contentImageView1];
		[_contentImageView1 release];
		
		
		_contentScrollView2 = [[UIScrollView alloc]initWithFrame:CGRectMake(self.width*2, 0, self.width, self.height)];
		_contentScrollView2.backgroundColor = [UIColor blackColor];
		_contentScrollView2.showsHorizontalScrollIndicator = NO;
		_contentScrollView2.showsVerticalScrollIndicator = NO;
		_contentScrollView2.pagingEnabled = NO;
		_contentScrollView2.minimumZoomScale = 0.5f;
		_contentScrollView2.maximumZoomScale = 2.0f;
		_contentScrollView2.delegate = self;
		_contentScrollView2.contentSize = CGSizeMake(self.width, self.height);
		[_scrollView addSubview:_contentScrollView2];
		[_contentScrollView2 release];
		
		_contentImageView2 = [[UIImageView alloc]initWithFrame:self.bounds];
		_contentImageView2.userInteractionEnabled = YES;
		_contentImageView2.contentMode = UIViewContentModeScaleAspectFit;

		singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [_contentImageView2 addGestureRecognizer:singleTap];
        [singleTap release];
		[_contentScrollView2 addSubview:_contentImageView2];
		[_contentImageView2 release];


	}
	return self;
}

- (void)dealloc
{
	[_curImageArray release];
	[_imagesArray release];
	[super dealloc];
}

- (void)layoutSubviews
{
	
	totalPage = [_imagesArray count];
	if(totalPage == 0)
		return;
	
	int showPage;
	showPage = totalPage < 3? totalPage:3;
	
	
	if (scrollDirection == PPImageScrollDirectionLandscape) {
		_scrollView.contentSize = CGSizeMake(self.width * showPage, self.height);
		_contentScrollView0.frame = CGRectMake(0, 0, self.width, self.height);
		_contentScrollView1.frame = CGRectMake(self.width, 0, self.width, self.height);
		_contentScrollView2.frame = CGRectMake(self.width *2, 0, self.width, self.height);

	} else {
		_scrollView.contentSize = CGSizeMake(self.width, self.height * showPage);
		_contentScrollView0.frame = CGRectMake(0, 0, self.width, self.height);
		_contentScrollView1.frame = CGRectMake(0, self.height, self.width, self.height);
		_contentScrollView2.frame = CGRectMake(0, self.height * 2, self.width, self.height);

	}
	_contentScrollView0.zoomScale = 1.0f;
	_contentScrollView1.zoomScale = 1.0f;
	_contentScrollView2.zoomScale = 1.0f;
	
	[self loadCurImages];
	
	for (int i = 0; i < showPage; i++) {
		if (i == 0) {
			_contentImageView0.image = [_curImageArray objectAtIndex:i];
		} else if (i == 1) {
			_contentImageView1.image = [_curImageArray objectAtIndex:i];
		} else if (i == 2) {
			_contentImageView2.image = [_curImageArray objectAtIndex:i];

		}
	}
	
	if (scrollDirection == PPImageScrollDirectionLandscape) {
		if (curPageIndex != 0 && curPageIndex != totalPage - 1) {
			[_scrollView setContentOffset:CGPointMake(self.width, 0)];
		}
			
	} else {
		if (curPageIndex != 0 && curPageIndex != totalPage - 1) {
			[_scrollView setContentOffset:CGPointMake(0, self.height)];
		}
	}
}

- (void)loadCurImages
{
	if ([_curImageArray count] != 0)
		[_curImageArray removeAllObjects];

	if (curPageIndex == 0) {
		[_curImageArray addObject:[_imagesArray objectAtIndex:curPageIndex]];
		if(curPageIndex + 1 < [_imagesArray	count])
			[_curImageArray addObject:[_imagesArray objectAtIndex:curPageIndex + 1]];
		if(curPageIndex + 2 < [_imagesArray	count])
			[_curImageArray addObject:[_imagesArray	objectAtIndex:curPageIndex + 2]];
		return;
	} else if (curPageIndex == [_imagesArray count] - 1) {
		if(curPageIndex -2  >= 0)
			[_curImageArray addObject:[_imagesArray objectAtIndex:curPageIndex - 2]];
		if(curPageIndex -1  >= 0)
		[_curImageArray addObject:[_imagesArray objectAtIndex:curPageIndex - 1]];
		[_curImageArray addObject:[_imagesArray	objectAtIndex:curPageIndex]];
		return;
	}
	
	[_curImageArray addObject:[_imagesArray objectAtIndex:curPageIndex - 1]];
	[_curImageArray addObject:[_imagesArray objectAtIndex:curPageIndex]];
	[_curImageArray addObject:[_imagesArray	objectAtIndex:curPageIndex + 1]];
	return;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)handleTap:(UIGestureRecognizer *)gesture
{
	if([delegate respondsToSelector:@selector(ppImageScrollView:didSelectAtIndex:)])
	{
		[delegate ppImageScrollView:self didSelectAtIndex:curPageIndex];
	}
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	if (scrollView == _contentScrollView0) {
		return _contentImageView0;
	} else if (scrollView == _contentScrollView1) {
		return _contentImageView1;
	} else if (scrollView == _contentScrollView2) {
		return _contentImageView2;
	}
	return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if(scrollView != _scrollView)
		return;
	
	int x = scrollView.contentOffset.x;
	int y = scrollView.contentOffset.y;
//	NSLog(@"%d,%d,%d", x, y, curPageIndex);
	if (scrollDirection == PPImageScrollDirectionLandscape) {
		if ( x >= 2*self.width ) {
			if(curPageIndex == totalPage - 1)
				return;
			curPageIndex ++;
			[self setNeedsLayout];
		}
		
		if (x >= self.width && x < 2*self.width){
			if(curPageIndex == 0)
				curPageIndex = 1;
			if(curPageIndex == totalPage - 1)
				curPageIndex = totalPage - 2;
			_contentScrollView0.zoomScale = 1.0f;
			_contentScrollView2.zoomScale = 1.0f;
		}
		
		if (x <= 0) {
			if(curPageIndex == 0)
				return;
			curPageIndex --;
			[self setNeedsLayout];
		}
		
	} else {
		if (y >= 2*self.height) {
			if(curPageIndex == totalPage - 1)
				return;
			curPageIndex ++;
			[self setNeedsLayout];
		
		}
		if (y >= self.width && y < 2*self.width) {
			if(curPageIndex == 0)
				curPageIndex = 1;
			if(curPageIndex == totalPage - 1)
				curPageIndex = totalPage - 2;
			_contentScrollView0.zoomScale = 1.0f;
			_contentScrollView2.zoomScale = 1.0f;
		}

		if (y <= 0 ) {
			if(curPageIndex == 0)
				return;
			curPageIndex --;
			[self setNeedsLayout];
		}
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	if(scrollView != _scrollView)
		return;
	
//	int x = scrollView.contentOffset.x;
//	int y = scrollView.contentOffset.y;
	
	if (scrollDirection == PPImageScrollDirectionLandscape) {
		if (curPageIndex != 0 && curPageIndex != totalPage - 1) {
			[_scrollView setContentOffset:CGPointMake(self.width, 0) animated:YES];
		}
		
	} else {
		if (curPageIndex != 0 && curPageIndex != totalPage - 1) {
			[_scrollView setContentOffset:CGPointMake(0, self.height) animated:YES];
		}
	}
	
	if ([delegate respondsToSelector:@selector(ppImageScrollView:didChangeAtIndex:)]) {
		[delegate ppImageScrollView:self didChangeAtIndex:curPageIndex];
	}
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
	if(scrollView == _scrollView)
		return;
//	NSLog(@"fff");
	if(scrollView.zoomScale > 1.0f)
		return;
	if (scrollView == _contentScrollView0) {
		_contentImageView0.center = CGPointMake(scrollView.width/2, scrollView.height/2);
	} else if (scrollView == _contentScrollView1) {
		_contentImageView1.center = CGPointMake(scrollView.width/2, scrollView.height/2);

	} else if (scrollView == _contentScrollView2) {
		_contentImageView2.center = CGPointMake(scrollView.width/2, scrollView.height/2);

	}

}

@end
