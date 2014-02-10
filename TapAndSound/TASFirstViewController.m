//
//  TASFirstViewController.m
//  TapAndSound
//
//  Created by Laercio Wadie on 2/4/14.
//  Copyright (c) 2014 Laercio Wadie. All rights reserved.
//

#import "TASFirstViewController.h"


@interface TASFirstViewController ()

@end

@implementation TASFirstViewController


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


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    NSString *buttonName = [sender currentTitle];
    
    if ([buttonName isEqualToString:@"back"]) {
        [self.originalQueue removeLastObject];
        if(self.originalQueue.count >= 2){
            
            NSLog(@"Segue Blocked");
            return NO;
        }
        
    }
    
    return YES;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    NSLog(@"play %@",[sender currentTitle]);
    
    SystemSoundID soundId;
    
    NSString *buttonName = [sender currentTitle];
    
    if(self.originalQueue.count == 0){
        self.queue = [[soundQueue alloc] init];
        self.originalQueue = [[NSMutableArray alloc] init];
    }
    
    if(![buttonName isEqual:@"home"] && ![buttonName isEqual:@"animacao"] && ![buttonName isEqual:@"back"]){
        
        [self.originalQueue addObject:buttonName];
        NSLog(@"%lu",self.originalQueue.count);
        
        NSString *soundFile = [[NSBundle mainBundle] pathForResource:buttonName ofType:@"mp3"];
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundId);
        
        AudioServicesPlaySystemSound(soundId);
    }else if ([buttonName isEqual:@"home"]){
        [self.originalQueue removeAllObjects];
    }
   
    
        NSLog(@"%lu", self.originalQueue.count);
        TASFirstViewController * vc = segue.destinationViewController;
        vc.queue = self.queue;
        vc.originalQueue = self.originalQueue;
        NSLog(@"%lu", self.originalQueue.count);
        NSLog(@"%lu", vc.originalQueue.count);
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.queue = [[soundQueue alloc] init];
    //self.originalQueue = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
