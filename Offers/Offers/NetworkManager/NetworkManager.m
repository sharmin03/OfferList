////
////  NetworkManager.m
////  Offers
////
////  Created by Sharmin Khan on 11.10.20.
////
//
//#import "NetworkManager.h"
//#import "ViewController.h"
//#import "Offer.h"
//#import <AdSupport/ASIdentifierManager.h>
//#import <NSHash/NSString+NSHash.h>
//#import <NSHash/NSData+NSHash.h>
//
//@implementation NetworkManager
//
//NSString *baseUrl = @"https://api.fyber.com/feed/v1/offers.json?";
//NSString *appId;
//NSString *userId;
//NSString *securityToken;
//NSString *ip;
//NSString *locale;
//NSString *timestamp;
//NSString *offerTypes;
//NSString *version;
//NSString *apple_idfa;
//NSString *idfaEnabled;
//NSString *apiKey;
//NSString *gatheredParameters;
//NSString *hashKey;
//NSString *url;
//
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}
//
//
//-(void) loadData:(NSString *)aID userID:(NSString *) uId token:(NSString *) token completionHandler: (void (^)(NSArray<Offer *> * offers)) completionHandler {
//    ip = [NSString stringWithFormat:@"%s%s", "&ip=", "109.235.143.113"];
//    locale = [NSString stringWithFormat:@"%s%s", "&locale=", "de"];
//    timestamp = [NSString stringWithFormat:@"%s%@", "&timestamp=", [NSString stringWithFormat:@"%lu", (long)[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] integerValue]]];
//    offerTypes = [NSString stringWithFormat:@"%s%s", "&offer_types=", "112"];
//    version = [NSString stringWithFormat:@"%s%@", "&phone_version=", [[UIDevice currentDevice] systemVersion]];
//    apple_idfa = [NSString stringWithFormat:@"%s%@", "&apple_idfa=", [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]];
//    idfaEnabled = [NSString stringWithFormat:@"%s%s", "&apple_idfa_tracking_enabled=", "true"];
//    NSMutableArray<Offer *> *offers = NSMutableArray.new;
//    NSString *appId = [NSString stringWithFormat:@"%s%@", "appid=", aID];
//    NSString *userId = [NSString stringWithFormat:@"%s%@", "&uid=", uId];
//    apiKey = [NSString stringWithFormat:@"%@", securityToken]; //"&1c915e3b5d42d05136185030892fbb846c278927"
//    gatheredParameters = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@", appId, apple_idfa, idfaEnabled, ip, locale, offerTypes, version, timestamp, userId, apiKey ];
//    hashKey = [NSString stringWithFormat:@"%s%@", "&hashkey=", [gatheredParameters SHA1]];
//    url = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@", baseUrl, appId, userId, ip, locale, timestamp, offerTypes, version, apple_idfa, idfaEnabled, hashKey ];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setHTTPMethod:@"GET"];
//    [request setURL:[NSURL URLWithString:url]];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
//      ^(NSData * _Nullable data,
//        NSURLResponse * _Nullable response,
//        NSError * _Nullable error) {
//
//        NSError *err;
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
//        NSLog(@"%@", json);
//        if (err) {
//            NSLog(@"Failed to serialoze JSON: %@",err);
//            NSArray<Offer *> *empty = [NSArray new];
//            completionHandler(empty);
//            return;
//        }
//        
//        NSDictionary *offersJSON = json[@"offers"];
//        
//        for (NSDictionary *offer in offersJSON) {
//            Offer *o = Offer.new;
//            o.title = offer[@"title"];
//            o.imageUrl = offer[@"thumbnail"][@"lowres"];
//            [offers addObject:o];
//        }
//        NSLog(@"%@", offers);
//        completionHandler(offers);
//    }] resume];
//    
//}
//
//@end
