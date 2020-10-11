//
//  ViewController.m
//  Offers
//
//  Created by Sharmin Khan on 10.10.20.
//

#import "ViewController.h"
#import "OffersViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <NSHash/NSString+NSHash.h>
#import <NSHash/NSData+NSHash.h>
#import "Offer.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)getOffersButtonTap:(id)sender {

    NetworkManager *nw =  [[NetworkManager alloc] init];
    [nw loadData:@"2070" userID:@"superman" token:@"&1c915e3b5d42d05136185030892fbb846c278927" completionHandler:^(NSArray<Offer *> * _Nonnull offers) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            OffersViewController *offersVC = [storyboard instantiateViewControllerWithIdentifier:@"OffersViewController"];
            offersVC.offers = offers;
            [self showViewController:offersVC sender:nil];
        });
    }];

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_appIdTextField resignFirstResponder];
    [_userIdTextField resignFirstResponder];
    [_securityTokenTextField resignFirstResponder];
}
@end
