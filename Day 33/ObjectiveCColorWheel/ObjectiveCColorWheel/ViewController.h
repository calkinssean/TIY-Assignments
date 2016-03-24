//
//  ViewController.h
//  ObjectiveCColorWheel
//
//  Created by Sean Calkins on 3/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISColorWheel.h"

@interface ViewController : UIViewController <ISColorWheelDelegate>

@property (nonatomic, strong) ISColorWheel* colorWheel;
@property (nonatomic, strong) UISlider* brightnessSlider;
@property (nonatomic, strong) UIView* wellView;

@end

