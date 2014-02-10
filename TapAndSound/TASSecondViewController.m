//
//  TASSecondViewController.m
//  TapAndSound
//
//  Created by Laercio Wadie on 2/4/14.
//  Copyright (c) 2014 Laercio Wadie. All rights reserved.
//

#import "TASSecondViewController.h"

@interface TASSecondViewController ()

@end

@implementation TASSecondViewController

-(IBAction)playSound:(id)sender{
    NSLog(@"play %@",[sender currentTitle]);
    
    SystemSoundID soundId;
    
    NSString *buttonName = [sender currentTitle];
    
    [self.originalQueue addObject:buttonName];
    
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:buttonName ofType:@"mp3"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundId);
    
    AudioServicesPlaySystemSound(soundId);
}

-(IBAction)playQueueSound:(id)sender{
    NSLog(@"play queue");
    
    soundQueue *result = [self.queue initWithArray:self.originalQueue];
    
    [self.queue playQueue];
    
    NSLog(@"result - %@", result);
    
}

-(IBAction)removeQueue:(id)sender{
    NSLog(@"remove queue");
    
    [self.originalQueue removeAllObjects];
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.queue = [[soundQueue alloc] init];
    self.originalQueue = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end