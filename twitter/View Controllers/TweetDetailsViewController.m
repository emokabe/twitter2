//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "Tweet.h"
#import "DateTools.h"
#import "NSDate+DateTools.h"
#import "APIManager.h"

@interface TweetDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
@property (weak, nonatomic) IBOutlet UIButton *messageButton;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;


@end

@implementation TweetDetailsViewController

// gets hyperlink from url and full tweet text
- (NSAttributedString *)makeHyperlink:(NSString *)path fullString:(NSString *)str {
    NSRange range = [str rangeOfString:path];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString: str];
    [attributedString addAttribute:NSLinkAttributeName value:path range:range];
    return attributedString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshData];
    
    NSString *URLString = self.tweetInfo.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.profileImage.image = [UIImage imageWithData:urlData];
    self.nameLabel.text = self.tweetInfo.user.name;
    self.screenNameLabel.text = self.tweetInfo.user.screenName;
    self.tweetText.text = self.tweetInfo.text;
    self.dateLabel.text = self.tweetInfo.createdAtString;
    self.timestampLabel.text = self.tweetInfo.tweetDate.shortTimeAgoSinceNow;
    self.retweetCount.text = [NSString stringWithFormat:@"%d", self.tweetInfo.retweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%d", self.tweetInfo.favoriteCount];
    
    NSString *path = self.tweetInfo.tweetURL;
    
    if (path == nil) {
        self.tweetTextView.text = self.tweetInfo.text;
    } else {
        self.tweetTextView.text = self.tweetInfo.text;
        NSAttributedString *attributedString = [self makeHyperlink:path fullString:self.tweetInfo.text];
        self.tweetTextView.attributedText = attributedString;
    }
}


- (IBAction)didTapRetweet:(id)sender {
    if (self.tweetInfo.retweeted) {
        // Put code to unfavorite this tweet here
        self.tweetInfo.retweeted = NO;
        self.tweetInfo.retweetCount -= 1;
        
        [[APIManager shared] unretweet:self.tweetInfo completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
             }
         }];
    } else {
        self.tweetInfo.retweeted = YES;
        self.tweetInfo.retweetCount += 1;
        
        [[APIManager shared] retweet:self.tweetInfo completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             }
         }];

    }
    
    // Update cell UI
    [self refreshData];
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweetInfo.favorited) {
        // Put code to unfavorite this tweet here
        self.tweetInfo.favorited = NO;
        self.tweetInfo.favoriteCount -= 1;
        
        [[APIManager shared] unfavorite:self.tweetInfo completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
             }
         }];
    } else {
        self.tweetInfo.favorited = YES;
        self.tweetInfo.favoriteCount += 1;
        
        [[APIManager shared] favorite:self.tweetInfo completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];

    }
    
    // Update cell UI
    [self refreshData];
}

-(void)refreshData {
    self.favoriteCount.text = [NSString stringWithFormat:@"%d", self.tweetInfo.favoriteCount];
    self.retweetCount.text =
    [NSString stringWithFormat:@"%d", self.tweetInfo.retweetCount];
    
    if (self.tweetInfo.favorited) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    
    if (self.tweetInfo.retweeted) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    } else {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }

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
