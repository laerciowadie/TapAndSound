//
//  TASSecondViewController.h
//  TapAndSound
//
//  Created by Laercio Wadie on 2/4/14.
//  Copyright (c) 2014 Laercio Wadie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "soundQueue.h"

@interface TASSecondViewController : UIViewController

@property soundQueue *queue;

@property NSMutableArray *originalQueue;

-(IBAction)playSound:(id)sender;


@end
