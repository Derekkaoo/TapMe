//
//  ViewController.h
//  TapMe
//
//  Created by 高士傑 on 2019/12/19.
//  Copyright © 2019 高士傑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *timer;
    int timeInt;
    int tapInt;
    int gameInt;
}

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *btn;


- (IBAction)startGame:(id)sender;


@end

