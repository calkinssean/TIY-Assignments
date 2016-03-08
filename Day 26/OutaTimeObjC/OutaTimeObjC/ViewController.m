//
//  ViewController.m
//  OutaTimeObjC
//
//  Created by Sean Calkins on 3/7/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self dates];
}




-(void)updateSpeed {
    if (count <= 88) {
        count++;
        NSString *currentCount = [NSString stringWithFormat:@"%d", count];
        self.speedLabel.text = currentCount;
    } else {
        [timer invalidate];
        timer = nil;
        self.speedLabel.text = @"LIGHTNING!";
        [self performSegueWithIdentifier:@"noRoadsSegue" sender:self];
    }
};


- (IBAction)travelBack:(UIButton *)sender {
    count = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(updateSpeed)
                                           userInfo: nil
                                            repeats: YES];

};

-(void) dates {
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
    NSString *todayString = [dateFormatter stringFromDate:today];
    self.presentTimeLabel.text = [todayString uppercaseString];
    NSLog(@"%@", todayString);
    
};
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"getTheDateSegue"]) {
        DatePickerViewController *controller = (DatePickerViewController *) segue.sourceViewController;
        newStr = controller->destinationDate;
        self.destinationTimeLabel.text = newStr;
    };
    

}
-(IBAction)weNeedRoadsAgain:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"onTheRoadAgain"]) {
        self.lastTimeDepartedLabel.text = self.presentTimeLabel.text;
        self.presentTimeLabel.text = self.destinationTimeLabel.text;
        count = 0;
        NSString *currentCount = [NSString stringWithFormat:@"%d", count];
        self.speedLabel.text = currentCount;
        
    }
}

@end
