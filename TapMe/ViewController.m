//
//  ViewController.m
//  TapMe
//
//  Created by 高士傑 on 2019/12/19.
//  Copyright © 2019 高士傑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timeInt = 10;
    tapInt = 0;
    gameInt = 0;
    
    [self updateUI];
}


- (IBAction)startGame:(id)sender {
    if (timeInt == 10) {
        //Start game
        //開始計時
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        self.btn.enabled = NO;
        self.btn.alpha = 0.5;
    }
    
    if (gameInt == 1) {
        //開始點擊
        tapInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
    } else {
        //回到重玩的畫面
        timeInt = 10;
        tapInt = 0;
        self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
        [self.btn setTitle:@"Start" forState:UIControlStateNormal];
    }
}

- (void)startCounter {
    timeInt -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    gameInt = 1;
    self.btn.enabled = YES;
    self.btn.alpha = 1.0;
    
    //這裡不能使用 self.btn.titleLabel.text = @"Tap"; 不然字會一直跳來跳去
    [self.btn setTitle:@"Tap" forState:UIControlStateNormal];
    
    if (timeInt == 0) {
        [timer invalidate];
        self.btn.enabled = NO;
        self.btn.alpha = 0.5;
        [self.btn setTitle:@"Restart" forState:UIControlStateNormal];
        
        [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(restart) userInfo:nil repeats:NO];
    }
}

- (void)restart {
    gameInt = 0;
    self.btn.enabled = YES;
    self.btn.alpha = 1.0;
}

- (void)updateUI {
    self.backgroundImage.image = [UIImage imageNamed:@"Background"];
    self.titleLabel.text = @"Tap Me Fast";
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.titleLabel setFont:[UIFont fontWithName:@"Moon Flower" size:60]];
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    self.timeLabel.font = [self.timeLabel.font fontWithSize:50];
    self.timeLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
    self.scoreLabel.font = [self.scoreLabel.font fontWithSize:50];
    self.scoreLabel.textColor = [UIColor whiteColor];
    [self.btn setTitle:@"Start" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [self.btn.titleLabel.font fontWithSize:50];
}

@end
