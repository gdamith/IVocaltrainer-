//
//  RecordView.h
//  Ivocal-trainer
//
//  Created by Gayanath Damith Amarasinghe on 8/2/17.
//  Copyright © 2017 Gayanath Damith Amarasinghe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZAudio.h"


@interface RecordView : UIViewController <EZAudioPlayerDelegate, EZMicrophoneDelegate, EZRecorderDelegate>

@property (weak, nonatomic) IBOutlet EZAudioPlotGL *audiographView;
@property (weak, nonatomic) IBOutlet UITextView *lyricView;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (nonatomic, strong) EZAudioFFTRolling *fft;
@property (nonatomic, strong) EZMicrophone *microphone;
@property (nonatomic, strong) EZRecorder *recorder;
@property (nonatomic, strong) EZAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UILabel *microphoneStateLabel;

@property (weak, nonatomic) IBOutlet UIButton *recrdstpBtn;
@property (weak, nonatomic) IBOutlet UIButton *recrdStartPauseBtn;

@property (nonatomic, assign) BOOL isRecording;


@end