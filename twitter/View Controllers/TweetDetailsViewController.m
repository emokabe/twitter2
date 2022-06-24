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


@end

@implementation TweetDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *URLString = self.tweetInfo.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.profileImage.image = [UIImage imageWithData:urlData];
    self.nameLabel.text = self.tweetInfo.user.name;
    self.screenNameLabel.text = self.tweetInfo.user.screenName;
    self.tweetText.text = self.tweetInfo.text;
    self.dateLabel.text = self.tweetInfo.createdAtString;
    self.timestampLabel.text = self.tweetInfo.tweetDate.shortTimeAgoSinceNow;
    self.retweetCount.text =
    [NSString stringWithFormat:@"%d", self.tweetInfo.retweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%d", self.tweetInfo.favoriteCount];

    /*
     NSString *URLString = tweet.user.profilePicture;
     NSURL *url = [NSURL URLWithString:URLString];
     NSData *urlData = [NSData dataWithContentsOfURL:url];
     self.profileImage.image = [UIImage imageWithData:urlData];
     self.nameLabel.text = self.tweet.user.name;
     self.screenNameLabel.text = self.tweet.user.screenName;
     self.dateLabel.text = self.tweet.createdAtString;
     self.timestampLabel.text = self.tweet.tweetDate.shortTimeAgoSinceNow;
     self.postTextLabel.text = self.tweet.text;
     self.retweetedCount.text =
     [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
     self.favoritedCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
     */
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
