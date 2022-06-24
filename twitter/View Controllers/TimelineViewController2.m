//
//  TimelineViewController2.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TimelineViewController2.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TweetCell2.h"
#import "ComposeViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TweetDetailsViewController.h"


@interface TimelineViewController2 () <ComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self fetchTweets];
    
    // Initialize a UIRefreshControl
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
}

- (IBAction)didTapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

-(void)fetchTweets {
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            NSLog(@"%@", tweets);
            
            self.arrayOfTweets = [NSMutableArray arrayWithArray:tweets];
            [self.tableView reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}

/*
 - (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.
 }
 */


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger) section {
    return self.arrayOfTweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell2"];
    
    [cell setTweet:self.arrayOfTweets[indexPath.row]];
    
    return cell;
}


// #pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"composeSegue"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    } else if([segue.identifier isEqualToString:@"detailsSegue"]) {
        // 1 Get indexpath
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        // 2 Get movie dictionary
        Tweet *dataToPass = self.arrayOfTweets[indexPath.row]; // results -> movies
        
        // 3 Get reference to destination controller
        TweetDetailsViewController *detailsVC = [segue destinationViewController];
        
        // 4 Pass the local dictionary to the view controller property
        detailsVC.tweetInfo = dataToPass;
    }
}


- (void)didTweet:(nonnull Tweet *)tweet {
    [self.arrayOfTweets insertObject:tweet atIndex:0];
    [self.tableView reloadData];
}


@end
