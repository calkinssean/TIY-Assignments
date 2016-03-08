//
//  ViewController.h
//  OutaTimeObjC
//
//  Created by Sean Calkins on 3/7/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
    int count;
    NSString *newStr;
}
@property (weak, nonatomic) IBOutlet UILabel *destinationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *presentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDepartedLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
- (IBAction)travelBack:(UIButton *)sender;
- (void)updateSpeed;






@end

