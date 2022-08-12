//
//  PTabbarItem.h
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PTabbarItem <NSObject>

@property (nonatomic, copy) NSString *title;
@property (nonatomic) UIImage *image;
@property (nonatomic) UIImage *selectedImage;

@end

NS_ASSUME_NONNULL_END
