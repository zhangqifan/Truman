//
//  TMCrewWidget.m
//  Pods
//
//  Created by Chipmuck on 2018/2/19.
//

#import "TMCrewWidget.h"

@interface TMCrewWidget ()

@property (nonatomic, strong) UILabel *cpuLabel;
@property (nonatomic, strong) UILabel *memoryLabel;
@property (nonatomic, strong) UILabel *batteryLabel;
@property (nonatomic, strong) UILabel *launchDurationLabel;

@end

@implementation TMCrewWidget

#pragma mark - Initialization & Layout

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self widget_setupWidgetBasis];
        [self widget_setupGestures];
        self.cpuLabel               = [self widget_buildTemplateLabelProperty];
        self.memoryLabel            = [self widget_buildTemplateLabelProperty];
        self.batteryLabel           = [self widget_buildTemplateLabelProperty];
        self.launchDurationLabel    = [self widget_buildTemplateLabelProperty];
        [self addSubview:self.cpuLabel];
        [self addSubview:self.memoryLabel];
        [self addSubview:self.batteryLabel];
        [self addSubview:self.launchDurationLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.cpuLabel.frame = CGRectMake(5, 5, (self.frame.size.width-15)/2, (self.frame.size.height-15)/2);
    self.memoryLabel.frame = CGRectMake(5+self.cpuLabel.frame.size.width+5, 5, (self.frame.size.width-15)/2, (self.frame.size.height-15)/2);
    self.batteryLabel.frame = CGRectMake(5, 5+self.cpuLabel.frame.size.height+5, (self.frame.size.width-15)/2, (self.frame.size.height-15)/2);
    self.launchDurationLabel.frame = CGRectMake(5+self.batteryLabel.frame.size.width+5, 5+self.memoryLabel.frame.size.height+5, (self.frame.size.width-15)/2, (self.frame.size.height-15)/2);
}

- (UILabel *)widget_buildTemplateLabelProperty {
    UILabel *tmpLabel = [[UILabel alloc] init];
    tmpLabel.adjustsFontSizeToFitWidth = YES;
    tmpLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    tmpLabel.textColor = [UIColor whiteColor];
    tmpLabel.textAlignment = NSTextAlignmentLeft;
    tmpLabel.minimumScaleFactor = 0.8f;
    tmpLabel.text = @"CPU: 15%";
    return tmpLabel;
}

- (void)widget_setupWidgetBasis {
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
}

- (void)widget_setupGestures {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(respondToPanGesture:)];
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(respondToLongPressGesture:)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToLongPressGesture:)];
    [self addGestureRecognizer:panGesture];
    [self addGestureRecognizer:longPressGesture];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - Gestures

- (void)respondToPanGesture:(UIPanGestureRecognizer *)panGesture {
    
}

- (void)respondToLongPressGesture:(UILongPressGestureRecognizer *)longPressGesture {
    
}

- (void)respondToTapGesture:(UITapGestureRecognizer *)tapGesture {
    
}

@end
