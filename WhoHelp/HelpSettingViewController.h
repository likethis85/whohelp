//
//  HelpSettingViewController.h
//  WhoHelp
//
//  Created by cloud on 11-9-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpSettingViewController : UIViewController <UITableViewDelegate>
{
@private
    NSMutableArray *menu_;
}

@property (nonatomic, retain, readonly) NSMutableArray *menu;

@end
