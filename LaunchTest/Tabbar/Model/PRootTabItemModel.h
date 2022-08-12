//
//  PRootTabItemModel.h
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//
#import "PTabbarItem.h"

#ifndef PRootTabItemModel_h
#define PRootTabItemModel_h

@interface PRootTabItemModel : NSObject<PTabbarItem>

@property (nonatomic, copy) NSString *title;
@property (nonatomic) UIImage *image;
@property (nonatomic) UIImage *selectedImage;

@end

#endif /* PRootTabItemModel_h */
