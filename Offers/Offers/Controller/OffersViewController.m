//
//  OffersViewController.m
//  Offers
//
//  Created by Sharmin Khan on 11.10.20.
//

#import "OffersViewController.h"
#import "Offer.h"

@interface OffersViewController ()

@end

@implementation OffersViewController

NSString *cellIdentifier = @"CellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Offers";
    self.tableView.tableFooterView = UITableView.new;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellIdentifier];
    [self.tableView reloadData];
}

-(UIImage *)getImageFromUrl:(NSString *)link {

    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:link]];
    return [UIImage imageWithData: imageData]; // accountImageView is imageView
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.offers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Offer *offer = self.offers[indexPath.row];
    cell.textLabel.text = offer.title;
    cell.imageView.image = [self getImageFromUrl:offer.imageUrl];
    return cell;
}

@end
