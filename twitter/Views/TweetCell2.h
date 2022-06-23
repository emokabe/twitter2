//
//  TweetCell2.h
//  twitter
//
//  Created by Emily Ito Okabe on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
NS_ASSUME_NONNULL_BEGIN

@interface TweetCell2 : UITableViewCell

@property (nonatomic, strong) Tweet *tweet;
- (void)setTweet:(Tweet *)tweet;


@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritedCount;
@property (weak, nonatomic) IBOutlet UILabel *retweetedCount;
@property (weak, nonatomic) IBOutlet UIButton *didTapReply;
@property (weak, nonatomic) IBOutlet UIButton *didTapSendMessage;

@end

NS_ASSUME_NONNULL_END
