//
//  NetworkManager.m
//  Offers
//
//  Created by Sharmin Khan on 11.10.20.
//

#import "NetworkManager.h"
#import "ViewController.h"
#import "Offer.h"
#import <AdSupport/ASIdentifierManager.h>
#import <NSHash/NSString+NSHash.h>
#import <NSHash/NSData+NSHash.h>

@implementation NetworkManager



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseUrl = @"https://api.fyber.com/feed/v1/offers.json?";
        self.ip = [NSString stringWithFormat:@"%s%s", "&ip=", "109.235.143.113"];
        self.locale = [NSString stringWithFormat:@"%s%s", "&locale=", "de"];
        self.timestamp = [NSString stringWithFormat:@"%s%@", "&timestamp=", [NSString stringWithFormat:@"%lu", (long)[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] integerValue]]];
        self.offerTypes = [NSString stringWithFormat:@"%s%s", "&offer_types=", "112"];
        self.version = [NSString stringWithFormat:@"%s%@", "&phone_version=", [[UIDevice currentDevice] systemVersion]];
        self.apple_idfa = [NSString stringWithFormat:@"%s%@", "&apple_idfa=", [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]];
        self.idfaEnabled = [NSString stringWithFormat:@"%s%s", "&apple_idfa_tracking_enabled=", "true"];
    }
    return self;
}


-(void) loadData:(NSString *)aID userID:(NSString *) uId token:(NSString *) token completionHandler: (void (^)(NSArray<Offer *> * offers)) completionHandler {
    NSMutableArray<Offer *> *offers = NSMutableArray.new;
    self.appId = [NSString stringWithFormat:@"%s%@", "appid=", aID];
    self.userId = [NSString stringWithFormat:@"%s%@", "&uid=", uId];
    self.securityToken = [NSString stringWithFormat:@"%@", token];
    self.apiKey = [NSString stringWithFormat:@"%@", token];
    self.gatheredParameters = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@", self.appId, self.apple_idfa, self.idfaEnabled, self.ip, self.locale, self.offerTypes, self.version, self.timestamp, self.userId, self.apiKey ];
    self.hashKey = [NSString stringWithFormat:@"%s%@", "&hashkey=", [self.gatheredParameters SHA1]];
    self.url = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@", self.baseUrl, self.appId, self.userId, self.ip, self.locale, self.timestamp, self.offerTypes, self.version, self.apple_idfa, self.idfaEnabled, self.hashKey ];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:self.url]];

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {

        NSError *err;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];

        if (err) {
            NSLog(@"Failed to serialoze JSON: %@",err);
            NSArray<Offer *> *empty = [NSArray new];
            completionHandler(empty);
            return;
        }

        NSDictionary *offersJSON = json[@"offers"];

        for (NSDictionary *offer in offersJSON) {
            Offer *o = Offer.new;
            o.title = offer[@"title"];
            o.imageUrl = offer[@"thumbnail"][@"lowres"];
            [offers addObject:o];
        }
        
        completionHandler(offers);
    }] resume];

}

@end
