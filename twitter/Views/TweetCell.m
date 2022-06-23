//
//  TweetCell.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@interface TweetCell ()

@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

@end

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    
    NSString *URLString = tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.profileImage.image = [UIImage imageWithData:urlData];
    self.nameLabel.text = self.tweet.user.name;
    self.screenNameLabel.text = self.tweet.user.screenName;
    self.postTextLabel.text = self.tweet.text;
    self.retweetedCount.text =
    [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoritedCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
}
- (IBAction)didTapFavorite:(id)sender {
    // Update the local tweet model
    if (self.tweet.favorited) {
        // Put code to unfavorite this tweet here
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];

    }
    
    // TODO: Update cell UI
    [self refreshData];
}


/*
- (IBAction)didTapRetweet:(id)sender {
    
}
*/

-(void)refreshData {
    self.favoritedCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.retweetedCount.text =
    [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    
    if (self.tweet.favorited) {
        UIImage *favorited_img = [UIImage imageNamed:@"favor-icon-red"];
        [self.favoriteButton setImage:favorited_img forState:UIControlStateNormal];
    } else {
        UIImage *unfavorited_img = [UIImage imageNamed:@"favor-icon"];
        [self.favoriteButton setImage:unfavorited_img forState:UIControlStateNormal];
    }

}


@end
