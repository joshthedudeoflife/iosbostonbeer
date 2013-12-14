//
//  SIBViewController.m
//  SIBrew
//
//  Created by Joshua Chou on 11/20/13.
//  Copyright (c) 2013 Startup Institute. All rights reserved.
//

#import "SIBViewController.h"
#import "SIBBeer.h"
#import "AfNetworking.h"

static NSString * BrewAPIKey =@"1179977291b94d3087622c65b67c4fd1";
static NSString *BrewAPIBaseURL =@"http://api.brewerydb.com/v2/";

@interface SIBViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
- (IBAction)buttonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SIBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.helloLabel.text = @"";
    [self.textField becomeFirstResponder];
    
    SIBBeer *beer = [[SIBBeer alloc] init];
    beer.name = @"Some Beer";
    beer.organic = YES;
    beer.fullness =@"full";
    NSLog(@"%@",beer);
    [beer takeNumberOfSips:2];
    NSLog(@"\n%@", beer);
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    //methods are called by brackets
    NSMutableArray *beersArray = @[].mutableCopy;
    
    NSString *path =[NSString stringWithFormat:@"%@/search", BrewAPIBaseURL];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{
                             @"key": BrewAPIKey,
                             @"q": self.textField.text
                        
                             };
    
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSDictionary *response = (NSDictionary*)responseObject;
        NSArray *beers = response[@"data"];
        for (NSDictionary *dictionary in beers){
            SIBBeer *beer = [[SIBBeer alloc] initWithDictionary:dictionary];
            [beersArray addObject:beer];
        }
        NSLog(@"%@", beersArray);
    }failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Brew down" message:@"Get Yo shit right"delegate:self cancelButtonTitle: @"ok" otherButtonTitles:nil, nil];
            [alert show];
        }];
    
    
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex){
    case 0:
        self.helloLabel.text =@"clicked ok";
        break;
    case 1:
        self.helloLabel.text = @"clicked got it";
        break;
    default:
        break;
    }
}

@end
