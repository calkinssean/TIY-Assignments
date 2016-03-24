//
//  ViewController.m
//  ObjectiveCColorWheel
//
//  Created by Sean Calkins on 3/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//
#import "ViewController.h"
#import "ISColorWheel.h"

@interface ViewController () 


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize size = self.view.bounds.size;
    
    CGSize wheelSize = CGSizeMake(size.width * .9, size.width * .9);
    
    self.colorWheel = [[ISColorWheel alloc] initWithFrame:CGRectMake(size.width / 2 - wheelSize.width / 2,
                                                                 size.height * .1,
                                                                 wheelSize.width,
                                                                 wheelSize.height)];
    self.colorWheel.delegate = self;
    self.colorWheel.continuous = true;
    [self.view addSubview:self.colorWheel];
    
    self.brightnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(size.width * .4,
                                                                   size.height * .8,
                                                                   size.width * .5,
                                                                   size.height * .1)];
    self.brightnessSlider.minimumValue = 0.0;
    self.brightnessSlider.maximumValue = 1.0;
    self.brightnessSlider.value = 1.0;
    self.brightnessSlider.continuous = true;
    [self.brightnessSlider addTarget:self action:@selector(changeBrightness:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.brightnessSlider];
    
    self.wellView = [[UIView alloc] initWithFrame:CGRectMake(size.width * .1,
                                                         size.height * .8,
                                                         size.width * .2,
                                                         size.height * .1)];
    
    self.wellView.layer.borderColor = [UIColor blackColor].CGColor;
    self.wellView.layer.borderWidth = 2.0;
    [self.view addSubview:self.wellView];
}



- (void)changeBrightness:(UISlider*)sender
{
    [self.colorWheel setBrightness:self.brightnessSlider.value];
    [self.wellView setBackgroundColor:self.colorWheel.currentColor];
}

- (void)colorWheelDidChangeColor:(ISColorWheel *)colorWheel
{
    [self.wellView setBackgroundColor:self.colorWheel.currentColor];
}


@end
