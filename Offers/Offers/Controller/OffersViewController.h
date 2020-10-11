//
//  OffersViewController.h
//  Offers
//
//  Created by Sharmin Khan on 11.10.20.
//

#import <UIKit/UIKit.h>
#import "Offer.h"

@interface OffersViewController : UITableViewController
@property (strong, nonatomic) NSArray<Offer *> *offers;
@end
