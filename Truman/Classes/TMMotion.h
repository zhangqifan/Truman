//
//  TMMotion.h
//  Pods
//
//  Created by Chipmuck on 2018/2/23.
//

#import <Foundation/Foundation.h>

typedef void(^TMMotionAccelerometerCompletion)(NSError *error);

@interface TMMotion : NSObject

@property (nonatomic) double tm_accelerometerUpdateInterval;

- (void)startAccelerometerWithHandler:(TMMotionAccelerometerCompletion)handler;

@end
