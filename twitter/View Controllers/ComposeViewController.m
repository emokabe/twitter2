//
//  ComposeViewController.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/20/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *postText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    [[APIManager shared] postStatusWithText:^(NSArray *tweets, NSError *error) {
        //- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;
        //- (void)postStatusWithText:(NSString *)text completion:(void (^)(Tweet *, NSError *))completion;
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            NSLog(@"%@", tweets);
            
            //self.arrayOfTweets = [NSMutableArray arrayWithArray:tweets];
            //[self.tableView reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
     */
}

- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tweetPressed:(id)sender {
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
