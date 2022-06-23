//
//  TweetCell.h
//  twitter
//
//  Created by Emily Ito Okabe on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritedCount;
@property (weak, nonatomic) IBOutlet UILabel *retweetedCount;
@property (weak, nonatomic) IBOutlet UIButton *didTapReply;
@property (weak, nonatomic) IBOutlet UIButton *didTapRetweet;
@property (weak, nonatomic) IBOutlet UIButton *didTapSendMessage;




@property (nonatomic, strong) Tweet *tweet;


- (void)setTweet:(Tweet *)tweet;

-  (void)refreshData;

@end

NS_ASSUME_NONNULL_END
