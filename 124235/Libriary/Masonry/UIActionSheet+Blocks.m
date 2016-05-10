//
//  UIActionSheet+Blocks.m
//  Shibui
//
//  Created by Jiva DeVoe on 1/5/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

static char RI_BUTTON_ASS_KEY = 'R';
static char RI_DISMISSAL_ACTION_KEY = 'D';
@implementation UIActionSheet (Blocks)

-(id)initWithTitle:(NSString *)inTitle cancelButtonItem:(GALButtonItem *)inCancelButtonItem destructiveButtonItem:(GALButtonItem *)inDestructiveItem otherButtonItems:(GALButtonItem *)inOtherButtonItems, ...
{
    if((self = [self initWithTitle:inTitle delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil]))
    {
        NSMutableArray *buttonsArray = [NSMutableArray array];
        
        GALButtonItem *eachItem;
        va_list argumentList;
        if (inOtherButtonItems)
        {
            [buttonsArray addObject: inOtherButtonItems];
            va_start(argumentList, inOtherButtonItems);
            while((eachItem = va_arg(argumentList, GALButtonItem *)))
            {
                [buttonsArray addObject: eachItem];
            }
            va_end(argumentList);
        }
        
        for(GALButtonItem *item in buttonsArray)
        {
            [self addButtonWithTitle:item.label];
        }
        
        if(inDestructiveItem)
        {
            [buttonsArray addObject:inDestructiveItem];
            NSInteger destIndex = [self addButtonWithTitle:inDestructiveItem.label];
            [self setDestructiveButtonIndex:destIndex];
        }
        if(inCancelButtonItem)
        {
            [buttonsArray addObject:inCancelButtonItem];
            NSInteger cancelIndex = [self addButtonWithTitle:inCancelButtonItem.label];
            [self setCancelButtonIndex:cancelIndex];
        }
        
        objc_setAssociatedObject(self, (const void *)&RI_BUTTON_ASS_KEY, buttonsArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    return self;
}

- (NSInteger)addButtonItem:(GALButtonItem *)item
{	
    NSMutableArray *buttonsArray = objc_getAssociatedObject(self, (const void *)&RI_BUTTON_ASS_KEY);
	
	NSInteger buttonIndex = [self addButtonWithTitle:item.label];
	[buttonsArray addObject:item];
	
	return buttonIndex;
}

- (void)setDismissalAction:(void(^)())dismissalAction
{
    objc_setAssociatedObject(self, (const void *)&RI_DISMISSAL_ACTION_KEY, nil, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, (const void *)&RI_DISMISSAL_ACTION_KEY, dismissalAction, OBJC_ASSOCIATION_COPY);
}

- (void(^)())dismissalAction
{
    return objc_getAssociatedObject(self, (const void *)&RI_DISMISSAL_ACTION_KEY);
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    // Action sheets pass back -1 when they're cleared for some reason other than a button being 
    // pressed.
    if (buttonIndex >= 0)
    {
        NSArray *buttonsArray = objc_getAssociatedObject(self, (const void *)&RI_BUTTON_ASS_KEY);
        GALButtonItem *item = [buttonsArray objectAtIndex:buttonIndex];
        if(item.action)
            item.action();
    }
    
    if (self.dismissalAction) self.dismissalAction();
    
    objc_setAssociatedObject(self, (const void *)&RI_BUTTON_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, (const void *)&RI_DISMISSAL_ACTION_KEY, nil, OBJC_ASSOCIATION_COPY);
}

@end

