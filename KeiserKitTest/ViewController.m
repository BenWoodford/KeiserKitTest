//
//  ViewController.m
//  KeiserKitTest
//
//  Created by Ben Woodford on 24/10/2014.
//  Copyright (c) 2014 Ben Woodford. All rights reserved.
//

#import "ViewController.h"
#import <KKBike.h>
#import <KKManager.h>

@interface ViewController () {
    KKManager *kkManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    kkManager = [[KKManager alloc] initWithDelegate:self];
    
    self.scanButton.enabled = NO;
    
    self.lblStatus.text = @"Waiting...";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bluetoothStateDidChange:(CBCentralManagerState)state withManager:(KKManager *)manager {
    if(state == CBCentralManagerStatePoweredOn) {
        self.scanButton.enabled = YES;
    } else {
        self.scanButton.enabled = NO;
    }
}

- (void)didPressScan:(id)sender {
    self.lblStatus.text = @"Scanning for Bikes...";
    [kkManager startScanningForBikes];
}

- (void)didPressSimulate:(id)sender {
    self.lblStatus.text = @"Simulating Bikes...";
    [kkManager startSimulationWithBikes:5];
}

- (void)bikeListUpdated:(NSArray *)bikeList {
    if(bikeList.count > 0) {
        [kkManager followBike:[bikeList firstObject]];
        
        if(kkManager.isSimulating)
            self.lblStatus.text = @"Simulating a Followed Bike.";
        else
            self.lblStatus.text = @"Following Bike.";
        
        [self followedBikeDidUpdate:[bikeList firstObject]];
    }
}

- (void)followedBikeDidUpdate:(KKBike *)bike {
    self.lblBikeId.text = [NSString stringWithFormat:@"%d",bike.bikeId];
    self.lblGear.text = [NSString stringWithFormat:@"%d",bike.gear];
    self.lblPower.text = [NSString stringWithFormat:@"%d",bike.power];
    self.lblKcal.text = [NSString stringWithFormat:@"%d",bike.kCal];
    self.lblRPM.text = [NSString stringWithFormat:@"%f",bike.RPM];
    self.lblTime.text = [bike timeInMinutesAndSeconds];
    self.lblTrip.text = [NSString stringWithFormat:@"%f",bike.trip];
    self.lblHeart.text = [NSString stringWithFormat:@"%f",bike.heartRate];
    self.lblDeltaTime.text = [NSString stringWithFormat:@"%f", bike.updateDelta];
}

@end
