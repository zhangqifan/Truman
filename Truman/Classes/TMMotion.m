//
//  TMMotion.m
//  Pods
//
//  Created by Chipmuck on 2018/2/23.
//

#import "TMMotion.h"
#import <CoreMotion/CoreMotion.h>

static double const TMAccelerometerThreshold = 1.3;

@interface TMMotion ()

@property (nonatomic, strong) CMMotionManager *manager;

@end

@implementation TMMotion

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [[CMMotionManager alloc] init];
    }
    return self;
}

- (void)startAccelerometerWithHandler:(TMMotionAccelerometerCompletion)handler {
    _manager.accelerometerUpdateInterval = _tm_accelerometerUpdateInterval?:0.1;
    [_manager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (accelerometerData) {
            double ax = accelerometerData.acceleration.x;
            double ay = accelerometerData.acceleration.y;
            
            if (fabs(ax)>TMAccelerometerThreshold || fabs(ay)>TMAccelerometerThreshold) {
                if (handler) {
                    handler(error);
                }
            }
        }
    }];
}

@end
