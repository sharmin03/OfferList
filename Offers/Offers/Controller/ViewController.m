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
#import <OfferListSDK/Offer.h>
#import <OfferListSDK/NetworkManager.h>
#import <OfferListSDK/OffersViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // To show when waiting for the data to be loaded
    [self.activityIndicator setHidden:YES];
}

- (IBAction)getOffersButtonTap:(id)sender {
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    // removing white spaces from the texts
    NSString *appId = [self.appIdTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];;
    NSString *userId = [self.userIdTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *token = [NSString stringWithFormat:@"%s%@", "&", [self.securityTokenTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    NetworkManager *nw =  [[NetworkManager alloc] init];
    
    //Loading the data on button tap
    //It is difficult to enter such long api token with keyboard so I passed it as a static string
    [nw loadData:appId userID:userId token:@"&1c915e3b5d42d05136185030892fbb846c278927" completionHandler:^(NSArray<Offer *> * _Nonnull offers) {
        
        //Preventing the UI from freezing
        dispatch_async(dispatch_get_main_queue(), ^{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            OffersViewController *offersVC = [storyboard instantiateViewControllerWithIdentifier:@"OffersViewController"];
            UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:offersVC];
            offersVC.offers = offers;
            offersVC.delegate = self;
            [self.activityIndicator stopAnimating];
            [self.activityIndicator setHidden:YES];
            [self.navigationController presentViewController:navBar animated:YES completion:nil];
        });
    }];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_appIdTextField resignFirstResponder];
    [_userIdTextField resignFirstResponder];
    [_securityTokenTextField resignFirstResponder];
}
- (void)dismissOffersVC {
    NSLog(@"notification of cell tap or close button tap");
}



@end
