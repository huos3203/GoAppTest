//
//  SoundViewController.h
//  GoAppTest
//
//  Created by pengyucheng on 14-2-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface SoundViewController : UIViewController<AVAudioPlayerDelegate,AVAudioSessionDelegate>
{
    AVAudioSession *session;
    
    NSURL *recordedFile;
    AVAudioPlayer *player;
    AVAudioRecorder *recorder;
}
@property (weak, nonatomic) IBOutlet UIButton *recorderBtn;
@property (weak, nonatomic) IBOutlet UIButton *convertBtn;

@property (weak, nonatomic) IBOutlet UIButton *playerBtn;

- (IBAction)recordBtn:(UIButton *)sender;

- (IBAction)playerBtn:(UIButton *)sender;

- (IBAction)ConvertBtn:(UIButton *)sender;

@end
