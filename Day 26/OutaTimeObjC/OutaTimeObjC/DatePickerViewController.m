//
//  DatePickerViewController.m
//  OutaTimeObjC
//
//  Created by Sean Calkins on 3/7/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}




- (IBAction)datePickerAction:(UIDatePicker *)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
    NSString *dateFromPicker = [dateFormatter stringFromDate:self.datePicker.date];
    destinationDate = [dateFromPicker uppercaseString];
    NSLog(@"%@", destinationDate);
    
    
}
@end
