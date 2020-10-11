//
//  ViewController.h
//  Offers
//
//  Created by Sharmin Khan on 10.10.20.
//

#import <UIKit/UIKit.h>
#import "Offer.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *appIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *userIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *securityTokenTextField;
@property (weak, nonatomic) IBOutlet UIButton *getOffersButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

