//
//  TMCrew.m
//  Pods
//
//  Created by Chipmuck on 2018/2/19.
//

#import "TMCrew.h"
#import "TMCrewWidget.h"
#import "TMMotion.h"

@implementation TMCrew {
    TMCrew *_crew;
    TMCrewWidget *_crewWidget;
    TMMotion *_motion;
}

+ (void)takeAction {
#if DEBUG
    [TMCrew new];
#else
    return;
#endif
}

#pragma mark - Initialization

- (instancetype)init {
#if DEBUG
    self = [super init];
    if (self) {
        _crew = self;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(launchWidget) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
#else
    return nil;
#endif
}

- (void)dealloc {
#if DEBUG
    [[NSNotificationCenter defaultCenter] removeObserver:self];
#endif
}

#pragma mark - Connect to widget

- (void)launchWidget {
    _crewWidget = [[TMCrewWidget alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-150)/2, -[UIApplication sharedApplication].statusBarFrame.size.height-50, 150, [UIApplication sharedApplication].statusBarFrame.size.height+50)];
    _crewWidget.layer.cornerRadius = 10;
    _crewWidget.layer.masksToBounds = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:_crewWidget];

    _motion = [[TMMotion alloc] init];
    _motion.tm_accelerometerUpdateInterval = 0.1;
    [_motion startAccelerometerWithHandler:^(NSError *error) {
        if (!error) {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:50 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect frame = _crewWidget.frame;
                frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
                _crewWidget.frame = frame;
                [_crewWidget.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                
            }];
        }
    }];
}

@end
