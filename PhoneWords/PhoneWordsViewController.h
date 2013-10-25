//
//  PhoneWordsViewController.h
//  PhoneWords
//
//  Created by JAMES K ARASIM on 10/11/13.
//  Copyright (c) 2013 JAMES K ARASIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneWordsViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (copy, nonatomic) NSString *phoneNumber;

@property (weak, nonatomic) IBOutlet UIPickerView *phoneWordsPicker;

//these are arrays of phone words that will populate the phoneWordsPickerView
@property (nonatomic, strong) NSMutableArray *areacodeWords;
@property (nonatomic, strong) NSMutableArray *prefixWords;
@property (nonatomic, strong) NSMutableArray *suffixWords;
- (IBAction)phoneNumberChange:(id)sender;
- (void)generatePhoneWords;
@end
