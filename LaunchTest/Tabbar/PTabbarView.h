//
//  PTabbarView.h
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//
#import <UIKit/UIKit.h>
#import "PTabbarItem.h"
#import "PTabbarCell.h"

#ifndef PTabbarView_h
#define PTabbarView_h

@class PTabbarView;

@protocol PTabbarDelegate <NSObject>

- (void)tabbarView:(PTabbarView *)tabbar
    didSelectIndex:(NSInteger)index
   lastSelectIndex:(NSInteger)lastIndex;

@end

@interface PTabbarView : UIView

@property (nonatomic, weak) id<PTabbarDelegate> delegate;
@property (nonatomic, copy) NSArray<id<PTabbarItem>> *tabItems;
@property (nonatomic) NSUInteger selectedIndex;
//切换tab，自动进行缩放动画，默认为YES
@property (nonatomic) BOOL autoAnimation;

- (nullable PTabbarCell *)tabItemAtIndex:(NSUInteger)index;
- (void)reloadData;

/// “视频彩铃”发现页，不要换肤
/// @param isRingDiscovery YES tabbar选中了“视频彩铃”且栏目显示的是“发现”页
- (void)updateTabbarIsRemoveImageSkin:(BOOL)isRemoveImageSkin;
@end

#endif /* PTabbarView_h */
