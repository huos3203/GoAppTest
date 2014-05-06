//
//  SoundViewController.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "SoundViewController.h"
#import "lame.h"

@interface SoundViewController ()

@end

@implementation SoundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/downloadFile.caf"];
    NSLog(@"%@",path);
    recordedFile = [[NSURL alloc]initFileURLWithPath:path];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordBtn:(UIButton *)sender {
    
    [_playerBtn setEnabled:NO];
    NSLog(@"===%@====",recordedFile);
    session = [AVAudioSession sharedInstance];
    session.delegate = self;
    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    if (session == nil)
        NSLog(@"Error creating session :%@",[sessionError description]);
    else
        [session setActive:YES error:nil];
    
    //录音设置
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] init];
    //录音格式无法使用
    [settings setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    //采样率
    [settings setValue:[NSNumber numberWithFloat:11025.0] forKey:AVSampleRateKey];
    //通道数
    [settings setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    //线性采样位数
//    [recordedFile];
    //音频质量，采用质量
    [settings setValue:[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
    
    recorder = [[AVAudioRecorder alloc] initWithURL:recordedFile settings:settings error:nil];
    [recorder prepareToRecord];
    [recorder record];
}

- (IBAction)playerBtn:(UIButton *)sender {
    
    if ([player isPlaying]) {
        [player pause];
        [sender setTitle:@"播放" forState:UIControlStateNormal];
    }else {
        [player play];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    
    }
}

- (IBAction)ConvertBtn:(UIButton *)sender {
    
    NSString *cafFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/downloadFile.caf"];
    NSString *mp3FilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/downloadFile.mp3"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager removeItemAtPath:mp3FilePath error:nil]) {
        NSLog(@"mp3删除");
    }
    
    @try {
        int read, write;
        
        FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb"); //source 被转换的音频文件位置
        fseek(pcm, 4*1024, SEEK_CUR);   //skip file header
        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb"); //output 输出生成的MP3文件位置
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 11025.0);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read==0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"%@",[exception description]);
    }
    @finally {
        [_playerBtn setEnabled:YES];
        NSError *playerError;
        NSURL *mp3URL = [[NSURL alloc] initFileURLWithPath:mp3FilePath];
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error:&playerError];
        player = audioPlayer;
        player.volume = 1.0f;
        if (player == nil) {
            NSLog(@"Error creating player : %@",[playerError description]);
        }
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
        player.delegate = self;
    }
}
@end
