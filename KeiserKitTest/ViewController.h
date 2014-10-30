//
//  ViewController.h
//  KeiserKitTest
//
//  Created by Ben Woodford on 24/10/2014.
//  Copyright (c) 2014 Ben Woodford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KKManagerDelegate.h>

@interface ViewController : UIViewController<KKManagerDelegate>

@property (nonatomic, strong) IBOutlet UILabel *lblBikeId;
@property (nonatomic, strong) IBOutlet UILabel *lblRPM;
@property (nonatomic, strong) IBOutlet UILabel *lblStatus;
@property (nonatomic, strong) IBOutlet UILabel *lblGear;
@property (nonatomic, strong) IBOutlet UILabel *lblPower;
@property (nonatomic, strong) IBOutlet UILabel *lblKcal;
@property (nonatomic, strong) IBOutlet UILabel *lblTime;
@property (nonatomic, strong) IBOutlet UILabel *lblTrip;
@property (nonatomic, strong) IBOutlet UILabel *lblHeart;
@property (nonatomic, strong) IBOutlet UILabel *lblDeltaTime;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *scanButton;

-(IBAction)didPressScan:(id)sender;
-(IBAction)didPressSimulate:(id)sender;

@end

