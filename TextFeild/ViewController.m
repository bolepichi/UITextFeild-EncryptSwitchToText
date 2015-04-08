//
//  ViewController.m
//  TextFeild
//
//  Created by LeslieHan on 15/3/27.
//  Copyright (c) 2015年 LeslieHan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFeild;
@property (strong,nonatomic) NSMutableString *string_password;
@property (weak, nonatomic) IBOutlet UIButton *button_Secure;

@property (assign,nonatomic,readonly) BOOL secureText;

@end

@implementation ViewController


-(NSMutableString *)string_password {
    if (_string_password==nil) {
        _string_password = [NSMutableString string];
    }
    return _string_password;
}

-(BOOL)secureText {
    
    return self.button_Secure.selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)miming:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    
    [self.textFeild setFont:[UIFont systemFontOfSize:self.secureText?24.0f:14.0f]];
    self.textFeild.text = self.secureText?[self textFormartToSecure:self.string_password]:self.string_password;
}

- (IBAction)editingPassword:(UITextField *)sender {
    
    sender.text = self.secureText?[self textFormartToSecure:self.string_password]:self.string_password;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    [self replaceTextWith:string WithRange:range];
    
    return YES;
}


-(void)replaceTextWith:(NSString*)string WithRange:(NSRange)range {
    
    [self.string_password replaceCharactersInRange:range withString:string];
    
}


-(NSString*)textFormartToSecure:(NSString*)text {
    
    NSInteger count = text.length;
    
    NSMutableString * string_secure = [NSMutableString string];
    
    for (NSInteger index = 0; index<count; index++) {
        
        [string_secure appendString:@"•"];
    }
    return string_secure;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
