//
//  ViewController.m
//  MapKitTests
//
//  Created by 杨振 on 15/11/3.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "YYAnnotation.h"

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addAnnotationInMapView:)];
    
    self.mapView.delegate = self;
    [self.mapView addGestureRecognizer:tap];
}
- (void)addAnnotationInMapView:(UITapGestureRecognizer *)tap {
    
    //1.获取位置
    CGPoint point = [tap locationInView:tap.view];
    YYAnnotation *annotation = [[YYAnnotation alloc] init];
   
    //把点坐标转换成经纬度坐标
    annotation.coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    annotation.title = @"天朝";
    annotation.subtitle = @"万民共享";
    annotation.imageName = @"category_3";
    
    [self.mapView addAnnotation:annotation];
}
#pragma mark - MKMapViewDelegate
/**
 *  每添加一个大头针 模型  就会调用的代理方法  返回一个大头针视图
 *
 *  @param mapView    mapView
 *  @param annotation 大头针模型
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    static NSString *ID = @"annotation";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (!view) {
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ID];
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
        view.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    YYAnnotation *anno = (YYAnnotation *)annotation;
    view.image = [UIImage imageNamed:anno.imageName];
    return view;
}

@end
