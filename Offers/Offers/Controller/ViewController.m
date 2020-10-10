//
//  ViewController.m
//  Offers
//
//  Created by Sharmin Khan on 10.10.20.
//

#import "ViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()

@end

@implementation ViewController

    NSString *baseUrl = @"http://api.fyber.com/feed/v1/offers.json?";



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)getOffersButtonTap:(id)sender {
    
    NSString *appId = [NSString stringWithFormat:@"%s%@", "appid=", self.appIdTextField.text];
    NSString *userId = [NSString stringWithFormat:@"%s%@", "&uid=", self.userIdTextField.text];
    NSString *securityToken = self.securityTokenTextField.text;
    
    NSString *ip = [NSString stringWithFormat:@"%s%s", "&ip=", "109.235.143.113"];
   
    NSString *locale = [NSString stringWithFormat:@"%s%s", "&locale=", "DE"];
    
    NSDate *date = [NSDate date];
    NSTimeInterval timeStampInterval = [date timeIntervalSince1970];
    NSString *timestamp = [NSString stringWithFormat:@"%s%f", "&timestamp=", timeStampInterval];
    
    NSString *offerTypes = [NSString stringWithFormat:@"%s%s", "&offer_types=", "112"];
    
    
//    NSString *device_id = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? @"tablet" : @"phone");
    
    NSString *version = [NSString stringWithFormat:@"%s%@", "&phone_version=", [[UIDevice currentDevice] systemVersion]];
    
    NSString *apple_idfa = [NSString stringWithFormat:@"%s%@", "&apple_idfa=", [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]];
    
    NSString *idfaEnabled = [NSString stringWithFormat:@"%s%s", "&apple_idfa_tracking_enabled=", "true"];
    
    NSString *googleParameters = [NSString stringWithFormat:@"%s", "&google_ad_id=a0b0c0d0-a0b0-c0d0-e0f0-a0b0c0d0e0f0&google_ad_id_limited_tracking_enabled=true"];
    
    NSString *apiKey = [NSString stringWithFormat:@"%@", securityToken];
    
    
    NSString *gatheredParameters = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@", appId, userId, ip, locale, timestamp, offerTypes, version, apple_idfa, idfaEnabled, googleParameters, apiKey ];
    
    NSLog(@"gathered: %@",gatheredParameters);
    
    NSString *hashKey = [NSString stringWithFormat:@"%s%@", "&hashkey=", [self digest:gatheredParameters]];
    
    NSLog(@"hashkey: %@",hashKey);
    
    NSString *urlParameters = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@", baseUrl, appId, userId, ip, locale, timestamp, offerTypes, version, apple_idfa, idfaEnabled, googleParameters, hashKey ];
    
    NSLog(@"url: %@",urlParameters);

}

-(NSString*) digest:(NSString*)input {
  NSData *data = [input dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
  uint8_t digest[CC_SHA1_DIGEST_LENGTH];
  CC_SHA1(data.bytes, data.length, digest);
  NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
  for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    [output appendFormat:@"02x", digest[i]];
  return output;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.appIdTextField.resignFirstResponder;
    self.userIdTextField.resignFirstResponder;
    self.securityTokenTextField.resignFirstResponder;
}
@end
