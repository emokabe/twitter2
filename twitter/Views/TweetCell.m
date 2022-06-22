//
//  TweetCell.m
//  twitter
//
//  Created by Emily Ito Okabe on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

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


@end
