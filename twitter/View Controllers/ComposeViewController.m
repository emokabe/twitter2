//
//  ComposeViewController.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/20/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "TimelineViewController.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *postText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postText.layer.borderWidth = 0.5;
}


- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tweetPressed:(id)sender {
    [self composeTweet];
}

- (void)composeTweet {
    [[APIManager shared] postStatusWithText:_postText.text completion:^(Tweet *tweet, NSError *error) {
        if (error) {
            NSLog(@"😫😫😫 Error tweeting: %@", error.localizedDescription);
        } else {
            NSLog(@"😎😎😎 Successfully tweeted");
            [self dismissViewControllerAnimated:YES completion:nil];
            [self.delegate didTweet:tweet];
        }
    }];
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
