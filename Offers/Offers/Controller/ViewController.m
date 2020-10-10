//
//  ViewController.m
//  Offers
//
//  Created by Sharmin Khan on 10.10.20.
//

#import "ViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <NSHash/NSString+NSHash.h>
#import <NSHash/NSData+NSHash.h>

@interface ViewController ()

@end

@implementation ViewController

    NSString *baseUrl = @"http://api.fyber.com/feed/v1/offers.json?";



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)getOffersButtonTap:(id)sender {
    
    NSString *appId = [NSString stringWithFormat:@"%s%s", "appid=", "2070"];
    NSString *userId = [NSString stringWithFormat:@"%s%s", "&uid=", "superman"];
    NSString *securityToken = [NSString stringWithFormat:@"%s", "1c915e3b5d42d05136185030892fbb846c278927"]; //self.securityTokenTextField.text;
    
    NSString *ip = [NSString stringWithFormat:@"%s%s", "&ip=", "109.235.143.113"];
   
    NSString *locale = [NSString stringWithFormat:@"%s%s", "&locale=", "DE"];
    
    NSDate *date = [NSDate date];
    NSTimeInterval timeStampInterval = [date timeIntervalSince1970];
    
    NSString *timestamp = [NSString stringWithFormat:@"%s%@", "&timestamp=", [NSString stringWithFormat:@"%lu", (long)[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] integerValue]]];
    
    NSString *offerTypes = [NSString stringWithFormat:@"%s%s", "&offer_types=", "112"];
    
    
//    NSString *device_id = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? @"tablet" : @"phone");
    
    NSString *version = [NSString stringWithFormat:@"%s%@", "&phone_version=", [[UIDevice currentDevice] systemVersion]];
    
    NSString *apple_idfa = [NSString stringWithFormat:@"%s%@", "&apple_idfa=", [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]];
    
    NSString *idfaEnabled = [NSString stringWithFormat:@"%s%s", "&apple_idfa_tracking_enabled=", "true"];
    
    NSString *apiKey = [NSString stringWithFormat:@"%@", securityToken];
    
    
    NSString *gatheredParameters = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@", appId, userId, ip, locale, timestamp, offerTypes, version, apple_idfa, idfaEnabled, apiKey ];
    
    NSLog(@"gathered: %@",gatheredParameters);
    
    NSString *hashKey = [NSString stringWithFormat:@"%s%@", "&hashkey=", [gatheredParameters SHA1]];
    
    NSLog(@"hashkey: %@",hashKey);
    
    NSString *urlParameters = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@", baseUrl, appId, userId, ip, locale, timestamp, offerTypes, version, apple_idfa, idfaEnabled, hashKey ];
    
    NSLog(@"url: %@",urlParameters);

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.appIdTextField.resignFirstResponder;
    self.userIdTextField.resignFirstResponder;
    self.securityTokenTextField.resignFirstResponder;
}
@end
