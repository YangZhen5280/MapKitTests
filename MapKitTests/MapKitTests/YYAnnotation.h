//
//  YYAnnotation.h
//  MapKitTests
//
//  Created by 杨振 on 15/11/3.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface YYAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *imageName;
@end
