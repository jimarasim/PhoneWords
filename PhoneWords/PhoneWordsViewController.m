//
//  PhoneWordsViewController.m
//  PhoneWords
//
//  Created by JAMES K ARASIM on 10/11/13.
//  Copyright (c) 2013 JAMES K ARASIM. All rights reserved.
//

#import "PhoneWordsViewController.h"

@interface PhoneWordsViewController ()
@end

@implementation PhoneWordsViewController
@synthesize phoneNumber;
@synthesize phoneWordsPicker;
@synthesize areacodeWords;
@synthesize prefixWords;
@synthesize suffixWords;


//define arrays of possible characters for each number
NSString* keys[10]={@"0",@"1",@"abc",@"def",@"ghi",@"jkl",@"mno",@"pqrs",@"tuv",@"wxyz"};

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //setup this view controller as the picker's delegate and datasource
    //this can also be done by control dragging from the picker properties in the storyboard view
    //to the yellow view controller object.  Note @interface declarations for this class
    //phoneWordsPicker.delegate = self;
    //phoneWordsPicker.dataSource = self;
    
    //initialize arrays to hold the phonewords
    areacodeWords = [[NSMutableArray alloc] init];
    prefixWords = [[NSMutableArray alloc] init];
    suffixWords = [[NSMutableArray alloc] init];
    
    self.label.text = @"Please enter 10 digits";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//dismiss the keyboard when this is called
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

//as the picker delegate, this is where the viewcontroller tells the picker how many columns to display
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 3;
}

//as the picker delegate, this is where the viewcontroller tells the picker how many rows to display
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if(component==1)
    {
        return [prefixWords count];
    }
    else if(component==2)
    {
        return [suffixWords count];
    }
    else
    {
        return [areacodeWords count];
    }
}

//as the picker delegate, this is where the viewcontroller tells the picker what data to show in the row
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if(component==1)
    {
        return [prefixWords objectAtIndex: row];
    }
    else if(component==2)
    {
        return [suffixWords objectAtIndex: row];
    }
    else
    {
        return [areacodeWords objectAtIndex: row];
    }
}

//this gets called everytime phone number is edited
- (IBAction)phoneNumberChange:(id)sender {
    [self generatePhoneWords];
}

- (void)generatePhoneWords
{
    
    
    //phoneword array, for mapping digits entered to their possible letter strings (keys)
    NSString* phoneWord[10];
    
    //remove all words before generating new ones
    [areacodeWords removeAllObjects];
    [prefixWords removeAllObjects];
    [suffixWords removeAllObjects];
    
    //get the entered number into the model
    self.phoneNumber = self.textField.text;
    
    if ([self.phoneNumber length]==10)
    {
        //holder for the current charater while iterating through the string
        unichar currentChar;
        
        //holder for the unichar integer value of the string character
        int unicharIntValue;
        
        //iterate through the numbers in the string, and assign them to phone word
        for (int i = 0; i < [self.phoneNumber length]; i++)
        {
            //get the string character
            currentChar = [self.phoneNumber characterAtIndex:i];
            
            //get the int value of the character. unichar value of 1 is 49, so subtract 48 to get the desired int value
            unicharIntValue = [[NSNumber numberWithUnsignedChar:currentChar]intValue]-48;
            
            //make sure the value is  within the bounds of the keys array
            if(unicharIntValue>=0 && unicharIntValue <=9)
            {
                //assign each digit of the phone word to the right letter string
                phoneWord[i] = keys[unicharIntValue];
                
            }
            else
            {
                //if this is not a number, just assign the character that it is (someone's using it wrong)
                phoneWord[i] = [NSString stringWithFormat:@"%C",currentChar];
            }
            
            
        }
        
        //create an array to hold possible area code combination sets
        NSArray *areacode = [NSArray arrayWithObjects:phoneWord[0],phoneWord[1],phoneWord[2], nil];
        
        //create an array to hold possible prefix combination sets
        NSArray *prefix = [NSArray arrayWithObjects:phoneWord[3],phoneWord[4],phoneWord[5], nil];
        
        //create an array to hold possible suffix combination sets
        NSArray *suffix = [NSArray arrayWithObjects:phoneWord[6],phoneWord[7],phoneWord[8], phoneWord[9], nil];
        
        
        //generate area code phonewords
        for(int i=0;i < [(NSString*)[areacode objectAtIndex:0] length]; i++)
        {
            for(int j=0; j<[(NSString*)[areacode objectAtIndex:1] length]; j++ )
            {
                for(int k=0; k<[(NSString*)[areacode objectAtIndex:2] length]; k++ )
                {
                    [areacodeWords addObject:[NSString stringWithFormat:@"%@%@%@",
                                              [(NSString*)[areacode objectAtIndex:0]substringWithRange:NSMakeRange(i, 1)],
                                              [(NSString*)[areacode objectAtIndex:1]substringWithRange:NSMakeRange(j, 1)],
                                              [(NSString*)[areacode objectAtIndex:2]substringWithRange:NSMakeRange(k, 1)]]];
                }
            }
            
        }
        
        //generate prefix phonewords
        for(int i=0;i < [(NSString*)[prefix objectAtIndex:0] length]; i++)
        {
            for(int j=0; j<[(NSString*)[prefix objectAtIndex:1] length]; j++ )
            {
                for(int k=0; k<[(NSString*)[prefix objectAtIndex:2] length]; k++ )
                {
                    [prefixWords addObject:[NSString stringWithFormat:@"%@%@%@",
                                            [(NSString*)[prefix objectAtIndex:0]substringWithRange:NSMakeRange(i, 1)],
                                            [(NSString*)[prefix objectAtIndex:1]substringWithRange:NSMakeRange(j, 1)],
                                            [(NSString*)[prefix objectAtIndex:2]substringWithRange:NSMakeRange(k, 1)]]];
                }
            }
            
        }
        
        //generate suffix phonewords
        for(int i=0;i < [(NSString*)[suffix objectAtIndex:0] length]; i++)
        {
            for(int j=0; j<[(NSString*)[suffix objectAtIndex:1] length]; j++ )
            {
                for(int k=0; k<[(NSString*)[suffix objectAtIndex:2] length]; k++ )
                {
                    for(int l=0;l<[(NSString*)[suffix objectAtIndex:3] length]; l++)
                    {
                        //NSLog(@"i:%d j:%d k:%d l:%d",i,j,k,l);
                        [suffixWords addObject:[NSString stringWithFormat:@"%@%@%@%@",
                                                [(NSString*)[suffix objectAtIndex:0]substringWithRange:NSMakeRange(i, 1)],
                                                [(NSString*)[suffix objectAtIndex:1]substringWithRange:NSMakeRange(j, 1)],
                                                [(NSString*)[suffix objectAtIndex:2]substringWithRange:NSMakeRange(k, 1)],
                                                [(NSString*)[suffix objectAtIndex:3]substringWithRange:NSMakeRange(l, 1)]]];
                    }
                }
            }
            
        }
        
        self.label.text = @"";
        
    }
    else
    {
        self.label.text = @"Please enter 10 digits";
    }
    
    //update the picker with the latest selections
    [phoneWordsPicker reloadAllComponents];

}

@end
