//
//  TimelineViewController2.h
//  twitter
//
//  Created by Emily Ito Okabe on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TimelineViewController2 : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrayOfTweets;

@end

