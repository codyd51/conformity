#import <QuartzCore/QuartzCore.h>
#import <AddressBook/AddressBook.h>
#import <libobjcipc/objcipc.h>
#import "substrate.h"

#define CC_LENIENCY 0.1
#define PERSONAL_COLOR [UIColor colorWithRed:46/255.0 green:204/255.0 blue:64/255.0 alpha:1.0]
#define IVE_COLOR [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0]
#define NEON_COLOR [UIColor colorWithRed:0.0862745 green:0.94902 blue:0.0862745 alpha:1]
#define NEW_NEON [UIColor colorWithRed:0.298039 green:0.85098 blue:0.392157 alpha:1]
#define kSettingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.phillipt.conformity.plist"]
#ifdef DEBUG
	#define kIsTesting YES
#else
	#define kIsTesting NO
#endif

@interface _UIBackdropViewSettings : NSObject
@property(nonatomic) double colorTintMaskAlpha;
@property(nonatomic) double colorTintAlpha;
@property(retain, nonatomic) UIColor *colorTint;
+ (id)settingsForPrivateStyle:(int)arg1;
@end
@interface _UIBackdropView : UIView
- (id)initWithFrame:(CGRect)arg1 autosizesToFitSuperview:(BOOL)arg2 settings:(id)arg3;
- (void)setBlurQuality:(id)arg1;
-(void)transitionToColor:(UIColor*)color;
-(void)setColorMatrixColorTintAlpha:(float)arg1;
- (void)transitionToSettings:(_UIBackdropViewSettings *)settings;
- (void)transitionToPrivateStyle:(int)style;
@end

@interface CKConversationList : NSObject
+(id)sharedConversationList;
-(id)conversationForExistingChatWithAddresses:(id)arg1;
-(id)conversations;
-(id)conversationForRecipients:(id)arg1 create:(BOOL)arg2;
@end
@interface CKConversation : NSObject
- (void)sendMessage:(id)arg1 newComposition:(_Bool)arg2;
- (id)newMessageWithComposition:(id)arg1 addToConversation:(_Bool)arg2;
@end
@interface CKComposition : NSObject
- (id)initWithText:(id)arg1 subject:(id)arg2;
@end
@interface CKMessage : NSObject
@end

@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (id)notificationCenterForType:(id)arg1;
+ (id)defaultCenter;
- (BOOL)suspended;
- (void)setSuspended:(BOOL)arg1;
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3;
- (void)postNotificationName:(id)arg1 object:(id)arg2;
- (void)postNotification:(id)arg1;
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3 deliverImmediately:(BOOL)arg4;
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3 options:(unsigned int)arg4;
- (void)removeObserver:(id)arg1 name:(id)arg2 object:(id)arg3;
- (id)addObserverForName:(id)arg1 object:(id)arg2 queue:(id)arg3 usingBlock:(id)arg4;
- (id)addObserverForName:(id)arg1 object:(id)arg2 suspensionBehavior:(unsigned int)arg3 queue:(id)arg4 usingBlock:(id)arg5;
- (void)addObserver:(id)arg1 selector:(SEL)arg2 name:(id)arg3 object:(id)arg4;
- (void)addObserver:(id)arg1 selector:(SEL)arg2 name:(id)arg3 object:(id)arg4 suspensionBehavior:(unsigned int)arg5;
- (id)init;
@end

@interface UIColor (Private)
- (BOOL)_isSimilarToColor:(UIColor *)color withinPercentage:(CGFloat)percentage;
@end
@interface UIApplication (Private)
@property (assign) UIStatusBar* statusBar;
@end
@interface UIStatusBar : UIView {}
@property (assign) UIStatusBarWindow* statusBarWindow;
+ (float)heightForStyle:(int)arg1 orientation:(int)arg2;
- (id)initWithFrame:(CGRect)arg1 showForegroundView:(BOOL)arg2 inProcessStateProvider:(id)arg3;
- (void)requestStyle:(int)arg1;
- (void)setOrientation:(int)arg1;
@end

@class MPIncomingPhoneCallControllerLCDView, TUTelephonyCall, TUWallpaperView, TPLCDView, InCallLCDView;

@interface MPIncomingCallController : UIViewController
-(id)incomingCallName;
-(id)incomingCallNumber;
-(id)incomingCallABUID;
-(id)urlForIncomingCallNumber:(id)arg1;
@end

@interface TPLCDSubImageView : UIImage
@end

@interface TUCall : NSObject
-(void)disconnect;
-(void)disconnectWithReason:(int)arg1;
-(id)callDurationString;
@end

@interface TUCallCenter : NSObject {
	NSMutableArray* _displayedCalls; 
	NSMutableArray* _conferenceParticipantCalls; 
}
@property (nonatomic) TUCall* incomingCall; 
@property (nonatomic) NSArray* incomingCalls; 
@property (nonatomic) NSMutableArray* displayedCalls; 				//@synthesize displayedCalls=_displayedCalls - In the implementation block
@property (nonatomic) NSMutableArray* conferenceParticipantCalls; 				//@synthesize conferenceParticipantCalls=_conferenceParticipantCalls - In the implementation block
//@property (nonatomic,retain) TUCallCenterCallsCache* callsCache; 				//@synthesize callsCache=_callsCache - In the implementation block
//@property (nonatomic,retain) TUCallModelState* callModelState; 				//@synthesize callModelState=_callModelState - In the implementation block
@property unsigned long long hash; 
@property (copy) Class superclass; 
@property (copy,copy) NSString* description; 
@property (copy,copy) NSString* debugDescription; 
+(id)sharedInstance;
+(void*)sharedAddressBook;
+(id)_sharedInstanceWithDaemonDelegate:(id)arg1;
+(_Bool)shouldDisableAppFeatures;
+(_Bool)isIMAVChatHostProcess;
+(_Bool)isInCallServiceProcess;
+(_Bool)emergencyCallBackModeIsActive;
-(unsigned long long)currentVideoCallCount;
-(id)currentVideoCalls;
-(id)incomingVideoCall;
-(id)activeVideoCall;
-(id)allNonFinalVideoCalls;
-(id)currentVideoCall;
-(id)videoCallWithStatus:(int)arg1;
-(_Bool)inCall;
-(void)_resetState;
-(void)_postDisplayedCallsChanged;
-(void)_postConferenceParticipantsChanged;
-(void)_setIncomingCall:(id)arg1;
-(void)suspendCallChangeNotifications;
-(void)_setActiveCalls:(id)arg1;
-(void)_setConferenceParticipants:(id)arg1;
-(void)resumeCallChangeNotifications;
-(void)_updateActiveCalls:(id)arg1;
-(void)_addActiveCall:(id)arg1;
-(void)_removeActiveCall:(id)arg1;
-(id)conferenceCall;
-(void)_updateCallCount:(id)arg1 force:(_Bool)arg2;
-(id)_callControlFailureUserInfoForUserInfo:(id)arg1;
-(_Bool)inOutgoingCall;
-(_Bool)justAnIncomingCallExists;
-(_Bool)canMergeCalls;
-(id)displayedCallsNotIncludingIncomingCall;
-(void)forceCallActive:(id)arg1;
-(void)forceCallIntoConference:(id)arg1;
-(void)forceCallOutOfConference:(id)arg1;
-(void)forceDisconnectOfCall:(id)arg1;
-(void)forceUpdateOfCallList;
-(void)_handleCallControlFailure:(id)arg1;
-(void)dealloc;
-(id)currentCalls;
-(_Bool)isAmbiguous;
-(void)invitedToIMAVChat:(id)arg1;
-(void)filteredIncomingIMAVChat:(id)arg1;
-(void)createdOutgoingIMAVChat:(id)arg1;
-(id)displayedCallFromCalls:(id)arg1;
-(void)handleCallModelStateChanged:(id)arg1;
-(_Bool)isSwappable;
-(_Bool)isMergeable;
-(_Bool)isHoldAllowed;
-(_Bool)isAddCallAllowed;
-(int)ambiguityState;
-(_Bool)isTakingCallsPrivateAllowed;
-(_Bool)isHardPauseAvailable;
-(_Bool)isEndAndAnswerAllowed;
-(_Bool)isHoldAndAnswerAllowed;
-(_Bool)isSendToVoicemailAllowed;
-(id)callWithStatus:(int)arg1;
-(int)currentCallCount;
-(void)disconnectCall:(id)arg1;
-(void)answerCall:(id)arg1;
-(void)setDisplayedCalls:(id)arg1;
-(void)setConferenceParticipantCalls:(id)arg1;
-(id)_currentCalls:(_Bool)arg1;
-(_Bool)allCallsAreOfService:(int)arg1;
-(void)handleCallStatusChanged:(id)arg1;
-(id)_allCalls;
-(void)disconnectCall:(id)arg1 withReason:(int)arg2;
-(void)requestHandoffForAllCalls;
-(id)proxyCallWithDestinationID:(id)arg1 service:(int)arg2 status:(int)arg3 sourceIdentifier:(id)arg4 outgoing:(_Bool)arg5 conferenceIdentifier:(id)arg6 voicemail:(_Bool)arg7 callerNameFromNetwork:(id)arg8;
-(void)swapCalls;
-(void)endActiveAndAnswerCall:(id)arg1;
-(void)endHeldAndAnswerCall:(id)arg1;
-(void)disconnectCurrentCallAndActivateHeld;
-(void)disconnectAllCalls;
-(id)callWithCallUUID:(id)arg1;
-(void)handleCallConnected:(id)arg1;
-(void)handleCallStatusOnDefaultPairedDeviceChanged:(id)arg1;
-(id)dial:(id)arg1 callID:(int)arg2 service:(int)arg3 sourceIdentifier:(id)arg4;
-(void)setCallsCache:(id)arg1;
-(id)initWithDaemonDelegate:(id)arg1;
-(void)handleChatStateChanged:(id)arg1;
-(void)handleChatConferenceMetadataUpdated:(id)arg1;
-(void)handleChatSendingAudioChangedNotification:(id)arg1;
-(void)handleChatInvitationSent:(id)arg1;
-(void)daemonConnected:(id)arg1;
-(void)handleChatFirstPreviewFrameArrived:(id)arg1;
-(void)handleChatFirstRemoteFrameArrived:(id)arg1;
-(void)handleChatRemoteVideoDidChange:(id)arg1;
-(void)handleChatRemoteScreenDidChange:(id)arg1;
-(void)handleChatRemotePauseDidChange:(id)arg1;
-(void)handleChatVideoQualityDidChange:(id)arg1;
-(void)handleChatVideoStalledDidChange:(id)arg1;
-(void)_callStatusChangedInternal:(id)arg1;
-(id)_callGroupsFromCalls:(id)arg1;
-(id)callsOnDefaultPairedDevice;
-(id)currentCallGroups;
-(id)currentAudioAndVideoCalls;
-(id)callsHostedElsewhere;
-(id)callsWithAnEndpointElsewhere;
-(id)sourceAccount:(_Bool)arg1;
-(id)dial:(id)arg1 callID:(int)arg2 service:(int)arg3;
-(id)dial:(id)arg1 callID:(int)arg2 service:(int)arg3 sourceIdentifier:(id)arg4 isRelayCall:(_Bool)arg5;
-(_Bool)canInitiateCalls;
-(_Bool)canInitiateCallForService:(int)arg1;
-(id)_dialFaceTimeCall:(id)arg1 isVideo:(_Bool)arg2 callID:(int)arg3 sourceIdentifier:(id)arg4;
-(id)_dialTelephonyCall:(id)arg1 callID:(int)arg2 sourceIdentifier:(id)arg3 callType:(struct __CFString*)arg4 isRelayCall:(_Bool)arg5;
-(void)disconnectRelayingCalls;
-(void)disconnectNonRelayingCalls;
-(void)answerCall:(id)arg1 withSourceIdentifier:(id)arg2;
-(void)answerCall:(id)arg1 withSourceIdentifier:(id)arg2 wantsHoldMusic:(_Bool)arg3;
-(_Bool)anyCallIsHostedOnCurrentDevice;
-(void)handleCallStatusChanged:(id)arg1 userInfo:(id)arg2;
-(id)_callStatusUserInfoForUserInfo:(id)arg1;
-(void)handleFilteredCall:(id)arg1 userInfo:(id)arg2;
-(id)_callerUnavailableUserInfoForCall:(id)arg1 reason:(unsigned)arg2 error:(int)arg3;
-(void)handleCallerUnavailableForCall:(id)arg1 reason:(unsigned)arg2 error:(int)arg3;
-(void)handleCallFailed:(id)arg1;
-(void)_handleCallEnded:(id)arg1 withReason:(unsigned)arg2 error:(int)arg3;
-(id)_videoCallUserInfoForUserInfo:(id)arg1;
-(void)handleFilteredCall:(id)arg1;
-(id)callWithUniqueProxyIdentifier:(id)arg1;
-(id)callGroupsOnDefaultPairedDevice;
-(unsigned long long)callCountOnDefaultPairedDevice;
-(_Bool)anyCallIsEndpointOnCurrentDevice;
-(id)callsHostedOrAnEndpointElsewhere;
-(id)dial:(id)arg1 service:(int)arg2;
-(id)dialEmergency:(id)arg1;
-(id)dialVoicemail;
-(void)sendFieldModeDigits:(id)arg1;
-(void)answerCallWithHoldMusic:(id)arg1;
-(void)holdActiveAndAnswerCall:(id)arg1;
-(void)resumeCall:(id)arg1;
-(_Bool)canTakeCallsPrivate;
-(void)handleCallAudioUpdatedForCall:(id)arg1 userInfo:(id)arg2;
-(void)handleCallSubTypeChanged:(id)arg1;
-(void)handleCallerIDChanged:(id)arg1;
-(void)endEmergencyCallBackMode;
-(void)setCallModelState:(id)arg1;
@end
@interface MPTelephonyManager : NSObject
+(id)sharedInstance;
-(id)activeCall;
-(BOOL)activeCallExists;
@end
@interface InCallController : UIViewController
-(int)speakerButtonPosition;
-(void)sixSquareButtonClicked:(int)arg1;
-(void)_performDisconnectOfCurrentCall;
-(void)_endCallLongPress:(id)press;
-(void)_endCallExited:(id)exited;
-(void)_endCallDown:(id)down;
@end
@interface UIApplication (Conformity)
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end
@interface MPIncomingPhoneCallController : MPIncomingCallController
@property (retain) MPIncomingPhoneCallControllerLCDView * topLCDView;
@property (nonatomic,retain) NSNumber * incomingCallerABUID;
@property (nonatomic,retain) NSString * callerName;
@property (nonatomic,retain) NSString * companyName;
@property (nonatomic,retain) NSString * incomingCallNumber;
@property (nonatomic,retain) NSString * incomingCallerLabel;
@property (nonatomic,retain) NSNumber * callerNameBreakPoint; 
-(void)answerCall:(id)arg1;  
-(void)dismiss;
-(void)dismiss:(BOOL)arg1;
-(void)ignore;
@end

BOOL canQuickReply;
id call;
MPIncomingPhoneCallController* callController;
int screenWidth = [[UIScreen mainScreen] bounds].size.width;
int screenHeight = [[UIScreen mainScreen] bounds].size.height;
CGFloat oldX, oldY;
BOOL draggingCFView;
BOOL hasAnsweredCall;
InCallController* inCallController;
UIColor* greenAnswer = [UIColor colorWithRed:40/255.0f green:220/255.0f blue:80/255.0f alpha:1.0f];
UIColor* redDecline = [UIColor colorWithRed:220/255.0f green:40/255.0f blue:80/255.0f alpha:1.0f];
BOOL isQuickMessaging;
static UIWindow* oldKey;
TPLCDSubImageView* tpImage;
InCallLCDView* inCallLCD;
static NSMutableDictionary* prefs;
static BOOL shouldUseIcon = NO;
static BOOL enabled = YES;

@interface CFBlurredCalllWidgetWindow : UIWindow
@property (nonatomic) MPIncomingPhoneCallController* callController;
@property (nonatomic) id call;
@property (nonatomic) BOOL canQuickReply;
@property (nonatomic) UITextField* replyTextField;
@property (nonatomic) UIPanGestureRecognizer* answerRightRecognizer;
@property (nonatomic) _UIBackdropView* blurView;
@property (nonatomic) _UIBackdropViewSettings* settings;
@property (nonatomic) _UIBackdropView* qmBackBlur;
@property (nonatomic) _UIBackdropViewSettings* qmBackBlurSettings;
@property (nonatomic) CGPoint suggestedCenter;
@property (nonatomic) TUCall* tuCall;
@property (nonatomic) UIButton* callEndButton;
@property (nonatomic) UIButton* speakerButton;
@property (nonatomic) UISegmentedControl* segmentControl;
@property (nonatomic) UISegmentedControl* unansweredSegmentControl;
@property (nonatomic) UIButton* sendButton;
@property (nonatomic) UIImageView* contactImageView;
@property (nonatomic) UIImage* contactImage;
@property (nonatomic) UILabel* callDuration;
-(id)initWithCallController:(MPIncomingPhoneCallController*)controller andCall:(id)call withFrame:(CGRect)frame;
-(void)attemptCFAddToSuperview;
-(void)viewMoved:(UIPanGestureRecognizer *)pan;
-(void)hangUpCall;
-(void)removeForDisconnect;
-(void)speakerMode;
-(void)buttonClicked:(UISegmentedControl*)segment;
-(void)showQuickMessage;
-(void)updateTime;
@end
//30: dark, 70: light, 1: grayish
@implementation CFBlurredCalllWidgetWindow
-(id)initWithCallController:(MPIncomingPhoneCallController*)controller andCall:(id)call withFrame:(CGRect)frame {
	self = [super init];
	if (self) {
		//self.callController = controller;
		self.callController = [%c(TUCallCenter) sharedInstance];
		self.call = call;
		self.layer.cornerRadius = 7.5;
		self.layer.masksToBounds = YES;
		self.frame = frame;

		self.replyTextField = [[UITextField alloc] init];
		self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];

		//TUCall* incomingTUCall = MSHookIvar<TUCall*>(controller, "_incomingCall");
		TUCallCenter* sharedCallCenter = [%c(TUCallCenter) sharedInstance];
		TUCall* incomingTUCall = sharedCallCenter.incomingCall;
		self.tuCall = incomingTUCall;

		self.settings = [_UIBackdropViewSettings settingsForPrivateStyle:2070];
		self.blurView = [[_UIBackdropView alloc] initWithFrame:self.frame autosizesToFitSuperview:YES settings:self.settings];
		[self.blurView setBlurQuality:@"default"];

		self.qmBackBlurSettings = [_UIBackdropViewSettings settingsForPrivateStyle:1];
		self.qmBackBlur = [[_UIBackdropView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) autosizesToFitSuperview:NO settings:self.qmBackBlurSettings];
		[self.qmBackBlur setBlurQuality:@"default"];

		self.contactImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5, 22.5, 35, 35)];

		if (MSHookIvar<TPLCDSubImageView*>(inCallLCD, "_imageView") == nil) {
			NSLog(@"[Conformity] Contact image not found, using default image");
			self.contactImage = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Conformity/emptyContactImage.png"];
		}
		else {
			tpImage = MSHookIvar<TPLCDSubImageView*>(inCallLCD, "_imageView");
			self.contactImage = MSHookIvar<UIImage*>(tpImage, "_image");
			self.contactImageView.layer.cornerRadius = self.contactImageView.frame.size.height/2;
			self.contactImageView.layer.masksToBounds = YES;
			self.contactImageView.layer.borderWidth = 0;
		}

		self.contactImageView.image = self.contactImage;

		UILabel* callerID = [[UILabel alloc] initWithFrame:CGRectMake(55, 15, 200, 35)];
		callerID.backgroundColor = [UIColor clearColor];
		callerID.textAlignment = UITextAlignmentLeft;
		callerID.textColor=[UIColor whiteColor];
		//callerID.text = callController.callerName;

		UILabel* callerLocation = [[UILabel alloc] initWithFrame:CGRectMake(55, 30, 200, 35)];
		callerLocation.font = [UIFont systemFontOfSize:14];
		callerLocation.backgroundColor = [UIColor clearColor];
		callerLocation.textAlignment = UITextAlignmentLeft;
		callerLocation.textColor = [UIColor whiteColor];
		callerLocation.text = callController.incomingCallerLabel;

		self.answerRightRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewMoved:)];
		self.answerRightRecognizer.minimumNumberOfTouches = 1;

		self.callEndButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[self.callEndButton addTarget:self action:@selector(hangUpCall) forControlEvents:UIControlEventTouchUpInside];
		self.callEndButton.frame = CGRectMake(215, 20, 35, 35);
		[self.callEndButton setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Conformity/callEndButton.png"] forState:UIControlStateNormal];

		self.speakerButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[self.speakerButton addTarget:self action:@selector(speakerMode) forControlEvents:UIControlEventTouchUpInside];
		self.speakerButton.frame = CGRectMake(250, 20, 40, 35);
		[self.speakerButton setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Conformity/speakerButton.png"] forState:UIControlStateNormal];

		self.callDuration = [[UILabel alloc] initWithFrame:CGRectMake(180, 50, 100, 35)];
		self.callDuration.font = [UIFont systemFontOfSize:14];
		self.callDuration.backgroundColor = [UIColor clearColor];
		self.callDuration.textAlignment = UITextAlignmentLeft;
		self.callDuration.textColor=[UIColor whiteColor];
		[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];

		//Rotate segments to be sideways
		NSArray *itemArray = [NSArray arrayWithObjects: @"End Call", @"Speaker", nil];
		self.segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
		self.segmentControl.frame = CGRectMake(215, 0, 100, self.frame.size.height);
		self.segmentControl.segmentedControlStyle = UISegmentedControlStylePlain;
		[self.segmentControl addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventValueChanged];
		self.segmentControl.tintColor = [UIColor whiteColor];
		self.segmentControl.alpha = 0.75;
		self.segmentControl.momentary = YES;
		self.segmentControl.transform = CGAffineTransformMakeRotation(M_PI / 2.0);
		NSArray *arr = [self.segmentControl subviews];
		for (int i = 0; i < [arr count]; i++) {
			UIView *v = (UIView*) [arr objectAtIndex:i];
			NSArray *subarr = [v subviews];
				for (int j = 0; j < [subarr count]; j++) {
					if ([[subarr objectAtIndex:j] isKindOfClass:[UILabel class]]) {
					UILabel *l = (UILabel*)[subarr objectAtIndex:j];
					l.transform = CGAffineTransformMakeRotation(- M_PI / 2.0);
				}
			}
		}

		NSArray *unansweredItemArray = [NSArray arrayWithObjects: @"Silent", @"Message", nil];
		self.unansweredSegmentControl = [[UISegmentedControl alloc] initWithItems:unansweredItemArray];
		self.unansweredSegmentControl.frame = CGRectMake(215, 0, 100, self.frame.size.height);
		self.unansweredSegmentControl.segmentedControlStyle = UISegmentedControlStylePlain;
		[self.unansweredSegmentControl addTarget:self action:@selector(unansweredButtonClicked:) forControlEvents:UIControlEventValueChanged];
		self.unansweredSegmentControl.tintColor = [UIColor whiteColor];
		self.unansweredSegmentControl.alpha = 0.75;
		self.unansweredSegmentControl.momentary = YES;
		self.unansweredSegmentControl.transform = CGAffineTransformMakeRotation(M_PI / 2.0);
		NSArray *unansweredArr = [self.unansweredSegmentControl subviews];
		for (int i = 0; i < [unansweredArr count]; i++) {
			UIView *v = (UIView*) [unansweredArr objectAtIndex:i];
			NSArray *subarr = [v subviews];
				for (int j = 0; j < [subarr count]; j++) {
					if ([[subarr objectAtIndex:j] isKindOfClass:[UILabel class]]) {
					UILabel *l = (UILabel*)[subarr objectAtIndex:j];
					l.transform = CGAffineTransformMakeRotation(- M_PI / 2.0);
				}
			}
		}

		[self addSubview:self.blurView];
		[self addSubview:callerID];
		[self addSubview:callerLocation];
		[self addSubview:self.callDuration];
		[self addSubview:self.unansweredSegmentControl];
		[self addSubview:self.contactImageView];
		[self addGestureRecognizer:self.answerRightRecognizer];

	}
	return self;
}
-(void)attemptCFAddToSuperview {
	self.windowLevel = 1500;
	if (oldKey == nil) oldKey = [[UIApplication sharedApplication] keyWindow];
	CGPoint oldCenter = self.center;
	self.center = CGPointMake(self.center.x, -self.center.y);
	[self makeKeyAndVisible];
	[UIView animateWithDuration:0.4 delay:nil options:UIViewAnimationCurveLinear animations:^{
		self.center = oldCenter;
	} completion:nil];
}
-(void)viewMoved:(UIPanGestureRecognizer*)pan {
	CGPoint translation = [pan translationInView:self];
	CGPoint velocity = [pan velocityInView:self];
	if (pan.state == UIGestureRecognizerStateBegan) {
		oldY = self.center.y;
		oldX = self.center.x;
	}

	if (pan.state == UIGestureRecognizerStateChanged) {
		if (!hasAnsweredCall) {
			self.center = CGPointMake(oldX+translation.x, oldY);

			if (velocity.x > 0) {
				greenAnswer = [UIColor colorWithRed:40/255.0f green:220/255.0f blue:80/255.0f alpha:translation.x/200];
				[self.blurView setBackgroundColor:greenAnswer];

			}
			else {
				redDecline = [UIColor colorWithRed:220/255.0f green:40/255.0f blue:80/255.0f alpha:-translation.x/200];
				[self.blurView setBackgroundColor:redDecline];
			}

		}
		else {
			self.center = CGPointMake(oldX+translation.x, oldY+translation.y);
		}
	}

	//NSData* imageHolderData = [NSData dataFromURL:[NSURL URLFromPath:@"/Library/Application Support/Confero/"]];
	//UIImage* imageHolder = [UIImage imageWithData:imageHolderData];
	//UIImageView* imageHolderView = [[UIImageView alloc] initWithImage:imageHolder];

	if (pan.state == UIGestureRecognizerStateEnded) {
		if (!hasAnsweredCall) {
			if (velocity.x <= 200 && velocity.x >= -200) {
				NSLog(@"[Conformity] Did not answer or decline, returning to center");
				[UIView animateWithDuration:0.3 delay:nil options:UIViewAnimationCurveEaseOut animations:^{
					self.center = self.suggestedCenter;
					[self.blurView setBackgroundColor:nil];
				} completion:nil];
			}
			else if (velocity.x > 0) {
				NSLog(@"[Conformity] Answered call");
				[self.replyTextField resignFirstResponder];
				[self.replyTextField removeFromSuperview];
				[self.sendButton removeFromSuperview];
				[self.unansweredSegmentControl removeFromSuperview];
				[self addSubview:self.segmentControl];
				[UIView animateWithDuration:0.5 delay:nil options:UIViewAnimationCurveLinear animations:^{
					self.center = CGPointMake(screenWidth*2, oldY);
				} completion:^(BOOL finished){
					[self.blurView transitionToPrivateStyle:2070];
					[UIView animateWithDuration:0.5 delay:nil options:UIViewAnimationCurveEaseOut animations:^{
						self.center = self.suggestedCenter;
						for (int i = 0; i <= 100; i++) {
							greenAnswer = [UIColor colorWithRed:220/255.0f green:40/255.0f blue:80/255.0f alpha:-i/100];
							[self.blurView setBackgroundColor:greenAnswer];
						}
					} completion:nil];
				}];
				[self.callController answerCall:self.call];
				hasAnsweredCall = YES;
			}
			else {
				NSLog(@"[Conformity] Declined call");
				[UIView animateWithDuration:0.5 delay:nil options:UIViewAnimationCurveLinear animations:^{
					self.center = CGPointMake(-screenWidth, oldY);
					redDecline = [UIColor colorWithRed:220/255.0f green:40/255.0f blue:80/255.0f alpha:-translation.x/200];
					[self.blurView setBackgroundColor:redDecline];
				} completion:^(BOOL finished){
					[self removeFromSuperview];
				}];
				[self.callController ignore];
				[self removeForDisconnect];
			}
		}
	}
}
-(void)hangUpCall {
	[self.replyTextField resignFirstResponder];
	[self.tuCall disconnect];
	hasAnsweredCall = NO;
}
-(void)removeForDisconnect {
	[self.replyTextField resignFirstResponder];
	[self hangUpCall];
	hasAnsweredCall = NO;
	[UIView animateWithDuration:0.5 delay:nil options:UIViewAnimationCurveLinear animations:^{
		[self.blurView transitionToPrivateStyle:2070];
		for (int i = 0; i <= 100; i++) {
			redDecline = [UIColor colorWithRed:220/255.0f green:40/255.0f blue:80/255.0f alpha:i/100];
			[self.blurView setBackgroundColor:redDecline];
		}
		self.center = CGPointMake(-screenWidth, self.center.y);
		self.qmBackBlur.alpha = 0;
	} completion:^(BOOL finished){
		[self removeFromSuperview];
		[self.qmBackBlur removeFromSuperview];
	}];
	NSLog(@"[Conformity] Resigning key window...");
	[self resignKeyWindow];
	[oldKey makeKeyAndVisible];
}
-(void)speakerMode {
	NSLog(@"[Conformity] Speaker button pressed");
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"ConformitySpeakerNotification" object:nil userInfo:nil deliverImmediately:YES];
	});
}
-(void)buttonClicked:(UISegmentedControl*)segment {
	if (segment.selectedSegmentIndex == 0) [self removeForDisconnect];
	else [self speakerMode];
}
-(void)unansweredButtonClicked:(UISegmentedControl*)segment {
	if (segment.selectedSegmentIndex == 0) [self.callController dismiss];
	else {
		[UIView animateWithDuration:0.3 delay:nil options:UIViewAnimationCurveLinear animations:^{
			self.unansweredSegmentControl.alpha = 0;
			[self showQuickMessage];
		} completion:^(BOOL finished){
			[self.unansweredSegmentControl removeFromSuperview];
			self.unansweredSegmentControl.alpha = 1;
		}];
	}
}
-(void)showQuickMessage {

	//for dark keyboard
	isQuickMessaging = YES;

	//So they can quick reply
	[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.MobileSMS" suspended:YES];
	CGFloat preY = self.frame.size.height;
	self.replyTextField.frame = CGRectMake(20, preY, self.frame.size.width-75, 30);
	self.replyTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.replyTextField.font = [UIFont systemFontOfSize:15];
	self.replyTextField.placeholder = @"iMessage or SMS - to implement";
	self.replyTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	self.replyTextField.keyboardType = UIKeyboardTypeDefault;
	self.replyTextField.returnKeyType = UIReturnKeyDone;
	self.replyTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;    

	[self.sendButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
	[self.sendButton setTitle:@"Send" forState:UIControlStateNormal];
	self.sendButton.tintColor = [UIColor whiteColor];
	self.sendButton.alpha = 0.75;
	self.sendButton.frame = CGRectMake(255, preY+2.5, 45, 30);

	self.qmBackBlur.alpha = 0;

	[self addSubview:self.replyTextField];
	[self addSubview:self.sendButton];
	[oldKey addSubview:self.qmBackBlur];
	[UIView animateWithDuration:0.3 delay:nil options:UIViewAnimationCurveLinear animations:^{
		[self.blurView transitionToPrivateStyle:2030];
		[self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height+50)];
		[self setCenter:CGPointMake(160, 95)];
		self.suggestedCenter = self.center;
		self.qmBackBlur.alpha = 1.0;
	} completion:^(BOOL finished) {
		[self.replyTextField becomeFirstResponder];
	}];
}
-(void)sendMessage {
	isQuickMessaging = NO;

	NSLog(@"[Conformity] Attempting to send message to MobileSMS...");

	[self.replyTextField resignFirstResponder];
	[self removeForDisconnect];

	NSDictionary* messageDict = [[NSDictionary alloc] initWithObjectsAndKeys:self.callController.incomingCallNumber, @"number", self.replyTextField.text, @"text", nil];
	[OBJCIPC sendMessageToAppWithIdentifier:@"com.apple.MobileSMS" messageName:@"com.phillipt.conformity.send" dictionary:messageDict replyHandler:^(NSDictionary *response) {
			NSLog(@"Received reply from MobileSMS: %@", response);
	}];

}
-(void)updateTime {
	self.callDuration.text = [self.tuCall callDurationString];
}
@end

static CFBlurredCalllWidgetWindow* mainCFView;

void standardCFFullAdd() {
	mainCFView = nil;
	mainCFView = [[CFBlurredCalllWidgetWindow alloc] initWithCallController:callController andCall:call withFrame:CGRectMake(0, 0, screenWidth - 15, 85)];
	[mainCFView attemptCFAddToSuperview];
	[mainCFView setCenter:CGPointMake(screenWidth/2, (screenHeight/2)-215)];
	[mainCFView setSuggestedCenter:CGPointMake(screenWidth/2, (screenHeight/2)-215)];
}

//For testing porpoises
%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application {
	%orig;
	//if (kIsTesting) {
		standardCFFullAdd();
	//}
}
%end

%hook InCallLCDView
-(void)layoutSubviews {
	inCallLCD = self;
	%orig;
}
%end

%hook InCallController
-(id)init {
	id r = %orig;
	inCallController = r;
	return r;
}
-(void)viewDidAppear:(BOOL)arg1 {
	inCallController = self;
	[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(useSpeaker:) name:@"ConformitySpeakerNotification" object:nil];
	%orig(arg1);
}
-(void)viewDidDisappear:(BOOL)arg1 {
	[[NSDistributedNotificationCenter defaultCenter] removeObserver:self name:@"ConformitySpeakerNotification" object:nil];
	%orig(arg1);
}
%new
- (void)useSpeaker:(NSNotification *)notification {
	[self sixSquareButtonClicked:[self speakerButtonPosition]];
}

%end

%hook TUCallCenter
-(void)handleCallStatusChanged:(id)arg1 userInfo:(id)arg2 {
	%orig;
	if (enabled) {
		NSLog(@"[Conformity] handleCallStatusChanged: %@ userInfo: %@", arg1, arg2);
		NSDictionary* dict = arg2;
		if ([dict objectForKey:@"kCTCallStatus"]) {
			if ([[dict objectForKey:@"kCTCallStatus"] intValue] == 3|| [[dict objectForKey:@"kCTCallStatus"] isEqual:@"3"]) {
				NSLog(@"[Conformity] Making a call. Not adding Conformity, causes crashes");
			}
			if ([[dict objectForKey:@"kCTCallStatus"] intValue] == 5 || [[dict objectForKey:@"kCTCallStatus"] isEqual:@"5"]) {
				NSLog(@"[Conformity] Call Ended.");
				[mainCFView removeForDisconnect];
				[mainCFView hangUpCall];
			}
		}
	}
}
-(void)handleCallConnected:(id)arg1 {
	//Let's use this as a starting point to work from in iOS 8
	NSLog(@"[Conformity] handleCallConnected: %@", arg1);
	%orig;

	//if state is call incoming
	TUCall* tucall = self.incomingCall;
	call = tucall;
	standardCFFullAdd();

}
%end

%hook MPIncomingCallController
-(BOOL)canMessage {
	BOOL canMessage = %orig;
	canQuickReply = canMessage;
	return canMessage;
}
%end

%hook MPIncomingPhoneCallController
-(id)initWithCall:(id)arg1 {

	callController = %orig;
	call = arg1;

	if (enabled) {
		self.view.frame = CGRectMake(0, 0, 0, 0);

		standardCFFullAdd();

		return nil;
	}

	return callController;
}
%end

%hook TUCallCenter

-(void)_setIncomingCall:(id)arg1 {
	NSLog(@"[Conformity] _setIncomingCall: %@", arg1);
	call = arg1;
	standardCFFullAdd();
	%orig;
}

%end

%hook CTCallCenter 

- (void)handleNotificationFromConnection:(void *)arg1 ofType:(id)arg2 withInfo:(NSDictionary *)arg3 {
	%log;
	NSLog(@"[Conformity] handleNotificationFromConnection: %@ ofType: %@ withInfo: %@", arg1, arg2, arg3);
	//standardCFFullAdd();
	%orig;
}

%end

%hook MPIncomingCallUtilities 

+(id)imageForPerson:(void*)arg1 {
	id r = %orig;
	NSLog(@"[Conformity] imageForPerson is %@, person is %@", r, arg1);
	return r;
}

%end

%hook UIKBRenderConfig
- (BOOL)lightKeyboard {
	BOOL light = %orig();
	if (enabled) {
		if (isQuickMessaging) {
			light = NO;
		}
	}
	return light;
}
%end

%hook TPStarkPhoneCallView

+(struct CGSize)defaultPhoneCallViewSize {
	if (enabled) return CGSizeMake(0, 0);
	return %orig;
}

-(id)initWithFrame:(CGRect)frame {
	if (enabled) return %orig(CGRectMake(0, 0, 0, 0));
	return %orig;
}

%end

//Remove 'Return to call'
%hook UIStatusBarNewUIDoubleHeightStyleAttributes

- (CGFloat)heightForMetrics:(long long)arg1 {
	CGFloat initial = %orig;
	if (enabled) {
		CGFloat end = initial/1.5;
		return end;
	}
	return initial;
}

%end

%hook UIStatusBarBackgroundView

- (id)initWithFrame:(CGRect)arg1 style:(id)arg2 backgroundColor:(UIColor *)arg3 {
	if (enabled) {
		if ([arg3 _isSimilarToColor:NEON_COLOR withinPercentage:CC_LENIENCY] || [arg3 _isSimilarToColor:NEW_NEON withinPercentage:CC_LENIENCY]) {
			return %orig(UIApplication.sharedApplication.statusBar.bounds, arg2, [UIColor clearColor]);
		}
	}
	return %orig();
}

%end

%hook SMSApplication
- (id)init {
	if (enabled) {
		[OBJCIPC registerIncomingMessageFromSpringBoardHandlerForMessageName:@"com.phillipt.conformity.send" handler:^NSDictionary *(NSDictionary *message) {
			NSLog(@"[Conformity] Sending quick message...");

			CKConversationList* conversationList = [%c(CKConversationList) sharedConversationList];
			CKConversation* conversation = [conversationList conversationForExistingChatWithAddresses:[NSArray arrayWithObjects:message[@"number"], nil]];
			NSAttributedString* text = [[NSAttributedString alloc] initWithString:message[@"text"]];
			CKComposition* composition = [[%c(CKComposition) alloc] initWithText:text subject:nil];
			CKMessage* smsMessage = [conversation newMessageWithComposition:composition addToConversation:YES];
			[conversation sendMessage:smsMessage newComposition:YES];

			NSLog(@"[Conformity] Conversation is %@", conversation);
			NSLog(@"[Conformity] Message is %@", smsMessage);
			NSLog(@"[Conformity] Reply text is %@", text);

			if (conversation == nil) {
				UIAlertView* unknownAlert = [[UIAlertView alloc] initWithTitle:@"Conformity" message:@"This is an unknown number. For security reasons, Conformity can not Quick Message numbers which you have never texted before." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
				[unknownAlert show];
			}

			return 0;
		}];
	}
	return %orig;
}
%end

void loadPreferences() {
	prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:kSettingsPath];

	if ([prefs objectForKey:@"enabled"] != nil) enabled = [[prefs objectForKey:@"enabled"] boolValue];
	if ([prefs objectForKey:@"shouldUseIcon"] != nil) shouldUseIcon = [[prefs objectForKey:@"shouldUseIcon"] boolValue];
}

%ctor {
	if ([[NSBundle bundleWithPath:@"/System/Library/SpringBoardPlugins/IncomingCall.servicebundle"] load]) {
		NSLog(@"[Conformity] bundle loaded succesfully!");
	}
	else {
		NSLog(@"[Conformity] bundle did not load succesfully.");
	}

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
									NULL,
									(CFNotificationCallback)loadPreferences,
									CFSTR("com.phillipt.slideweather~prefs/preferencechanged"),
									NULL,
									CFNotificationSuspensionBehaviorDeliverImmediately);
	
	loadPreferences();
}