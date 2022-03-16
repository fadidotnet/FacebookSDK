//
//  ViewController.m
//  FacebookSDK
//
//  Created by Hafiz Fahad Hassan on 16/03/2022.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()<FBSDKLoginButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFacebookButton];
}
-(void)addFacebookButton {
    FBSDKLoginButton * fbLoginButton = [[FBSDKLoginButton alloc] init];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"Login with facebook"];
    [fbLoginButton setAttributedTitle:string forState:UIControlStateNormal];
    [fbLoginButton setFrame:CGRectMake(0, 0, 200, 40)];
    fbLoginButton.center = self.view.center;
    fbLoginButton.delegate = self;
    fbLoginButton.permissions = @[@"public_profile", @"email"];
    [self.view addSubview:fbLoginButton];
}

- (void)loginButton:(nonnull FBSDKLoginButton *)loginButton didCompleteWithResult:(nullable FBSDKLoginManagerLoginResult *)result error:(nullable NSError *)error {
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
    if (result && result.isCancelled) {
        NSLog(@"Request Cancelled");
    } else {
        NSLog(@"Successfully Authenticated");
    }
}

- (void)loginButtonDidLogOut:(nonnull FBSDKLoginButton *)loginButton {
    NSLog(@"Successfully Logout");
}

@end
