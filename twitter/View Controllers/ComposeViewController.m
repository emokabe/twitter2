//
//  ComposeViewController.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/20/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "TimelineViewController2.h"
@import RSKPlaceholderTextView;

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *postText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.postText = RSKPlaceholderTextView();//(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100));
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

@end
