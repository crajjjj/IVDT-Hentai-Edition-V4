Scriptname IVDTSceneTrackerScript extends ActiveMagicEffect  
{Each instance of this script tracks a single SexLab scene (or more colloquially called fuck) and controls/plays the dialogue for it.}
;References
SexLabFramework Property SexLab Auto 
IVDTControllerScript Property MasterScript Auto
SoundCategory Property LowPrioritySounds Auto
SoundCategory Property HighPrioritySounds Auto
SoundCategory Property LowPrioritySoundsMale Auto
SoundCategory Property HighPrioritySoundsMale Auto
Spell Property SceneTrackerSpell Auto
IVDTVoiceFemaleScript Property FakeFemaleVoice Auto ;Actually a guy voice in disguise. Used as a workaround to support male-only scenes. Originally it was assumed there would always be a female

;References for determining if its a stealth scene
Keyword Property PlayerHomeKeyword Auto
Keyword Property CityKeyword Auto
Keyword Property TownKeyword Auto
Keyword Property ClearableKeyword Auto

Actor actorWithSceneTrackerSpell = None ;Important we track this since we have to remove the spell at the end of the scene.
Actor mainFemaleActor = None
Actor mainMaleActor = None
Actor playerCharacter = None

IVDTVoiceFemaleScript mainFemaleVoice = None
IVDTVoiceMaleScript mainMaleVoice = None
IVDTVoiceMaleScript DefaultMaleVoice = None
Int sceneID = -1
sslThreadController sexLabThreadController = None
sslBaseAnimation currentAnimation = None
sslBaseAnimation previousAnimation = None

;Config
Float dialogueSpacingMultiplier = 1.0
Int generalIntensityThreshold = 60
Int analIntensityThreshold = 40
Int femaleCloseToOrgasmThreshold = 80
Int analAnimationFilter = 2 ;Different values indicate different criteria for if an animation is considered anal
Int okWithVaginalCumCode = -1 ;-1 = setting not loaded in yet, 0 = no, 1 = yes

;Main female's personality for the scene
Bool withMaleLover = False
Bool withMaleThane = False
Bool withMaleOfInterest = False
Bool isBootyGirl = False
Float aggressiveness = 0.0 ;from 0.0 (lowest) to 1.0 (highest). controls likeliness female will 'go on the attack'
Int chemistryLevel = -1 ;from 0 (no chemistry) to 10 (great chemistry). this is referring to the sexual chemistry between the partners. controls what voice lines are played
Bool stealthScene = False
Int femaleAnalCommunication = 0 ;-2 = warning to stop now, -1 = baseless reprimanding, 0 = not interested in anal, 1 = previously interested but now satisfied, 2 = interested but nothing has happened, 3 = vocalized interest

;References needed to determine personality traits above
AssociationType Property SpouseAssocation Auto
Faction Property PlayerMarriedFaction Auto
Faction Property PlayerHousecarlFaction Auto

;The voice actors' memory (mostly for the female's dialogue)
Bool foundASoundToPlay = False
Bool maleOnlyScene = False
Float hoursSinceLastSex = 0.0 ;For the main female. In game hours. Doesn't include current scene.
Bool currentlyIntense = False ;I consider the opposite phase "soft". Soft is when gentle voices are used, intense is when combative voices are used
Int mainFemaleEnjoyment = 0
Int mainMaleEnjoyment = 0
Bool femaleCloseToOrgasm = False
Bool socializedNeedToCum = False
Int maleOrgasmCount = 0
Int femaleRecordedOrgasmCount = 0
Int orgasmTalkStage = 0 ;0 - 1st possible hint male is close, 1 - 2nd possible hint, 2 - last hint and female acknowledges, 3 - female teasing male for cum, 4 - male came, 5 - female reacted to orgasm
Int cumLocationDecision = 0 ;0 - no decision (yet), 1 = oral, 2 = vaginal, 3 = anal
Bool socializedCumLocationDecision = False
Bool lastMaleOrgasmWasUnexpected = False
Int locationOfLastMaleOrgasm = 0 ;0 - not set (or other), 1 - oral, 2 - vaginal, 3 = anal
Int currentStage = -1 ;Current stage of the sslBaseAnimation (SexLab animation) that is currently playing

Float timeOfLastStageStart = 0.0
Float timeOfLastMaleOrgasm = -20.0
Float timeOfLastRecordedFemaleOrgasm = -20.0
Float timeOfLastRomanticRemark = 0.0
Float timeOfLastJoke = 0.0
Float penetrativeStreakDuration = 0.0 ;How long the current level of penetration as defined by CurrentPenetrationLvl() has lasted in irl seconds
Float streakTooLongDuration = 0.0 ;When penetrativeStreakDuration gets longer than this, the female will begin asking for a change up. Set when streak resets
Float totalPenetrativeSexDuration = 0.0
Float totalAnalSexDuration = 0.0
Bool acknowledgedAnal = False
Int timesGaped = 0 ;Number of times the female has been gaped for the current scene
Int attackStage = 0 ;0 - not currently attacking, 1 - currently attacking, 2 - currently retreating
Bool inRefractoryPeriod = False ;When satisfied after the male orgasm (not left demanding more), the female actor may be in temporary limbo remarking on the orgasm, unsure if the male wants more
Int currentlyPlayingSoundCount = 0
Int currentlyPlayingSoundCountMale = 0
Sound queuedSound = None ;Sounds attempting to play with a priority of 1 when another sound is playing will be queued up to play afterwards
Float timeSoundWasQueued = 0.0 ;The timestamp at which queuedSound originally attempted to play
Float queuedSoundMaxWait = 0.0 ;The longest the queuedSound can sit in the queue before we give up on trying to play it
bool inserted = false
;for new anim stage label
string stagelabel = ""
string Previousstagelabel = ""
String Stagelabelminusone = ""
bool teasedClosetoorgasm = true
bool ASLpreviouslyintense = False
bool commentedcumlocation = false
bool MaleCommentsonEN = false
bool commentedorgasmremark = false
float ASLStagetimetoadvance = 0.0
Bool ASLCurrentlyintense = false

Bool ASLIsinSpanking = false
int CameInsideCount = 0
Bool ASLDoneLeakingCum = false
Bool Reactedtofemaleorgasm = true
Bool Reactedtomaleorgasm = true
Bool PauseExpressionUpdate = false
int NormalExpressionPath = 1
int NormalExpressionLookleftorRight = 1 ; 1 = left , 2 = right , 3=straight
Float Volume
Bool RunningMFEEAhegao = false
Bool RunningMFEETongueOut = false


Actor ActorOne = none
Actor ActorTwo = none
Actor ActorThree = none
Actor ActorFour = none
Actor ActorFive = none
Float Actor1BaseScale = 0.0
Float Actor2BaseScale = 0.0
Float Actor3BaseScale = 0.0
Float Actor4BaseScale = 0.0
Float Actor5BaseScale = 0.0

float timeOfLastNormalExpressionUpdate = 0.0
float timeOfLastAhegaoExpressionUpdate = 0.0
float timeOfLastKneeJerkReaction = 0.0
Sound PreviousSound = none
	
Actor[] ActorsInPlay
;JSONUtil configs
String ConfigFile  = "IVDTHentai/Config.json"
String VoiceVariationFile  = "IVDTHentai/VoiceVariation.json"
String RaceBaseExpressionFile  = "IVDTHentai/VanillaRaceBaseExpression.json"
String DDGagFile  = "IVDTHentai/DDGagConfig.json"
String ArmorSwappingFile  = "IVDTHentai/ArmorSwapping.json"
String ExpressionsNGFile  = "IVDTHentai/HentaiExpressionsNG.json"
String MFEEFile  = "IVDTHentai/MFEEExpressions.json"
String LactateFile  = "IVDTHentai/Lactate.json"
String EnableErinMFEE  = "IVDTHentai/EnableErinMFEE.json"
int cumleakcount = 0
Bool MaleisCommenting = false
Bool MaintainTongue = false
int cycle = 0
Bool SkiptoAggressiveStage = false
int	EnableAutoAdvanceStage  ;done
int EnableTagScaling ;done
int	EnableHentaiIVDTNormalExpressions  ;done
int	EnableHentaiIVDTAhegaoExpressions  ;done
int	EnableTongue ;done
int	EnableBrokenStatus ;done
int BrokenStatusVictimOnly ;done
int HoursSinceLastSexToResetBrokenStatus  ;done
int MinOrgasmsToBroken ;done
int MaxOrgasmsToBroken ;done
int	EnableHugePPScenario ;done
int	EnableVictimScenario ;done
float   ChanceToStickoutTongueDuringIntense  ;done
float   ChanceToStickOutTongueDuringAttacking ;done
float 	ChanceTohaveSpanking ;done
float	ChanceToCommentUnamused  ;done
int		MinSpankCount ;done
Int		MaxSpankCount ;done
float	ChanceToCommentonLIStage ;done
float	ChanceToCommentonNonIntenseStage  ;done
float	ChanceToCommentononIntenseStage ;done
float	ChanceToCommentononAttackingStage  ;done
float	ChanceToCommentononBlowjobStage ;done
float	ChanceToCommentWhenCloseToOrgasm ;done
float	ChanceToCommentWhenMaleCloseToOrgasm   ;done
float ChanceToOrgasmSquirt ;done
int EnableThickCumLeak ;done
float ChanceToLeakThickCum ;done
float ChanceToLeakOralCum ;done
int FemaleOrgasmHypeEnjoyment ;done
int MaleOrgasmHypeEnjoyment ;done
int EnableSuccubusHeartMilkSperm ; done
int EnableDDGagVoice ;done
Int EnableMaleVoice ;done
float ChanceForMaleToComment ; done
Armor Tongue

int FHUTongueType = 7
int EnableNPCExpressions
String[] ArmorSlotsToSwitch
Int[] ValidSlots
form[] BaseArmorArr 
form[] LewdArmorArr 
Bool SwappedLowerArmor = false
Bool SwappedUpperArmor = false
Int EnableArmorSwapping
String VoiceVariation 
Bool ShouldInitialize = false
Bool Initialized = false
int AggressiveChancetoMoveBackAStage 
int EnjoymentForAggressiveToMoveBackAStage
int UseHentaiExpressionNG
String[] Blowjoboverride
String[] BrokenOverride
String[] TongueOutOverride
String[] MFEEBrokenOverride
String[] MFEETongueOutOverride
string ExpressionGroup = "A"
Int Type = 0
 Int     hentaiexpressionngkneejerkspeed
 Int     hentaiexpressionngspeechspeed
 Int     hentaiexpressionngintensespeed
 Int     hentaiexpressionngnonintensespeed
 Int    hentaiexpressionngnonpenetrationspeed
Faction SchlongFaction
Keyword TNG_XL
Keyword TNG_L
Keyword TNG_Gentlewoman

int HugePPSchlongSize
int EnableGhostActors

	Float nextUpdateInterval = 1.0
;Vanilla Race Expression Values
int Vbigaah
int Veh
int Vsquint
int Vblink
int Vbrowup
int Vbrowin
int Vlookup
int Vlookdown
int Vlookleftright
int Vaah
int Voh
int Vohq
int Veee
int Vmaxexpressionstrength
Armor MilkR
Armor MilkL
EffectShader NippleLeakCBBE
int EnableLactate
int AlwaysLactate
int ChancetoLactateDuringOrgasm
int ChanceToLactateDuringIntense
int ChancetoStopLactate 
Bool HasMFEE = false
String Property NINODE_ROOT = "NPC" AutoReadOnly
String Property RACEMENUHH_KEY = "RaceMenuHH.esp" AutoReadOnly
String Property INTERNAL_KEY = "internal" AutoReadOnly
Bool CommentedClosetoOrgasm = false
;SOS

Form ArmortoSwitch
	
int gender = 0	
Bool NotifiedBrokenstatus = false

	
;Bool ASLshouldplayfemaleorgasm = true ;often enoough SLSO doesnt reset enjoyment before orgasm and orgasm talk can complete, causing near orgasm talk after orgasm

Event OnEffectStart(Actor akTarget, Actor akCaster)

	actorWithSceneTrackerSpell = akTarget
	mainFemaleActor = akTarget ;Temporary default until FindActorsAndVoices is called
	PerformInitialization()

EndEvent

Function InitializeExpressionValues()
Race FemaleActorRace = mainFemaleActor.GetRace()
String FemaleRaceName = FemaleActorRace.GetName()

NormalExpressionPath = Utility.RandomInt(1,3)
NormalExpressionLookleftorRight = Utility.RandomInt(1,3)

if FemaleRaceName =="Elin" || FemaleRaceName =="Erin"
;elin expression config
	RaceBaseExpressionFile = "IVDTHentai/ElinRaceBaseExpression.json"
else
;vanilla race expression config
	RaceBaseExpressionFile = "IVDTHentai/VanillaRaceBaseExpression.json"
endif

Vbigaah = JsonUtil.GetIntValue(RaceBaseExpressionFile, "bigaah"  , 0)
Veh = JsonUtil.GetIntValue(RaceBaseExpressionFile, "eh"  , 0)
Vsquint = JsonUtil.GetIntValue(RaceBaseExpressionFile, "squint"  , 0)
Vblink = JsonUtil.GetIntValue(RaceBaseExpressionFile, "blink"  , 0)
Vbrowup = JsonUtil.GetIntValue(RaceBaseExpressionFile, "browup"  , 0)
Vbrowin = JsonUtil.GetIntValue(RaceBaseExpressionFile, "browin"  , 0)
Vlookup = JsonUtil.GetIntValue(RaceBaseExpressionFile, "lookup"  , 0)
Vlookdown = JsonUtil.GetIntValue(RaceBaseExpressionFile, "lookdown"  , 0)
Vlookleftright = JsonUtil.GetIntValue(RaceBaseExpressionFile, "lookleftright"  , 0)
Vaah = JsonUtil.GetIntValue(RaceBaseExpressionFile, "aah"  , 0)
Voh = JsonUtil.GetIntValue(RaceBaseExpressionFile, "oh"  , 0)
Vohq = JsonUtil.GetIntValue(RaceBaseExpressionFile, "ohq"  , 0)
Veee = JsonUtil.GetIntValue(RaceBaseExpressionFile, "eee"  , 0)
Vmaxexpressionstrength = JsonUtil.GetIntValue(RaceBaseExpressionFile, "maxexpressionstrength"  , 0)


endfunction

Function InitializeConfigValues()

;Store Actor Base Scaling for reset later after animation ends,
ActorsInPlay = sexLabThreadController.Positions

ActorOne = ActorsInPlay[1]
ActorTwo = ActorsInPlay[2]
ActorThree = ActorsInPlay[3]
ActorFour = ActorsInPlay[4]
ActorFive = ActorsInPlay[5]

if ActorOne != none
Actor1BaseScale = ActorOne.getscale()
endif
if ActorTwo != none
Actor2BaseScale = ActorTwo.getscale()
endif
if ActorThree != none
Actor3BaseScale = ActorThree.getscale()
endif
if ActorFour != none
Actor4BaseScale = ActorFour.getscale()
endif
if ActorFive != none
Actor5BaseScale = ActorFive.getscale()
endif

NotificationifFileisBad()

MinOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile, "minorgasmstobroken"  , 9999)
MaxOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile, "maxorgasmstobroken"  , 9999)
HoursSinceLastSexToResetBrokenStatus = JsonUtil.GetIntValue(ConfigFile, "hourssincelastsextoresetbrokenstatus" ,9999)

EnableAutoAdvanceStage = JsonUtil.GetIntValue(ConfigFile,"enableautoadvancestage",0)
EnableTagScaling = JsonUtil.GetIntValue(ConfigFile,"enabletagscaling",0)
EnableHentaiIVDTNormalExpressions = JsonUtil.GetIntValue(ConfigFile,"enablehentaiivdtnormalexpressions",0)
EnableHentaiIVDTAhegaoExpressions = JsonUtil.GetIntValue(ConfigFile,"enablehentaiivdtahegaoexpressions",0)
EnableTongue = JsonUtil.GetIntValue(ConfigFile,"enabletongue",0)
ChanceToOrgasmSquirt = JsonUtil.GetIntValue(ConfigFile,"chancetoorgasmsquirt",0) as float/100
EnableBrokenStatus = JsonUtil.GetIntValue(ConfigFile,"enablebrokenstatus",0)
BrokenStatusVictimOnly = JsonUtil.GetIntValue(ConfigFile,"brokenstatusvictimonly",0)
EnableThickCumLeak = JsonUtil.GetIntValue(ConfigFile,"enablethickcumleak",0)
ChanceToLeakThickCum = JsonUtil.GetIntValue(ConfigFile,"chancetoleakthickcum",0) as float/100
ChanceToLeakOralCum = JsonUtil.GetIntValue(ConfigFile,"chancetoleakoralduringintense",0) as float/100
HoursSinceLastSexToResetBrokenStatus = JsonUtil.GetIntValue(ConfigFile,"hourssincelastsextoresetbrokenstatus",0)
MaxOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile,"maxorgasmstobroken",9999)
MinOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile,"minorgasmstobroken",9999)
EnableHugePPScenario = JsonUtil.GetIntValue(ConfigFile,"enablehugeppscenario",0)
EnableVictimscenario = JsonUtil.GetIntValue(ConfigFile,"enablevictimscenario",0)
ChanceToStickoutTongueDuringIntense = JsonUtil.GetIntValue(ConfigFile,"chancetostickouttongueduringintense",0) as float/100
ChanceToStickOutTongueDuringAttacking = JsonUtil.GetIntValue(ConfigFile,"chancetostickouttongueduringattacking",0) as float/100
ChanceTohaveSpanking = JsonUtil.GetIntValue(ConfigFile,"chancetohavespanking",0) as float/100
MinSpankCount = JsonUtil.GetIntValue(ConfigFile,"minspankcount",0)
MaxSpankCount = JsonUtil.GetIntValue(ConfigFile,"maxspankcount",0)
ChanceToCommentUnamused = JsonUtil.GetIntValue(ConfigFile,"chancetocommentunamused",0) as float/100
ChanceToCommentonLIStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentonlistage",0) as float/100
ChanceToCommentonNonIntenseStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentonnonintensestage",0) as float /100
ChanceToCommentononIntenseStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentononintensestage",0) as float /100
ChanceToCommentononAttackingStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentononattackingstage",0) as float /100
ChanceToCommentononBlowjobStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentononblowjobstage",0) as float /100
ChanceToCommentWhenCloseToOrgasm = JsonUtil.GetIntValue(ConfigFile,"chancetocommentwhenclosetoorgasm",0) as float /100
ChanceToCommentWhenMaleCloseToOrgasm = JsonUtil.GetIntValue(ConfigFile,"chancetocommentwhenmaleclosetoorgasm",0) as float /100
FemaleOrgasmHypeEnjoyment = JsonUtil.GetIntValue(ConfigFile,"femaleorgasmhypeenjoyment",0) 
MaleOrgasmHypeEnjoyment = JsonUtil.GetIntValue(ConfigFile,"maleorgasmhypeenjoyment",0) 
EnableSuccubusHeartMilkSperm  = JsonUtil.GetIntValue(ConfigFile,"enablesuccubusheartmilksperm",0) 
EnableDDGagVoice = JsonUtil.GetIntValue(DDGagFile,"enableddgagvoice",0) 
EnableMaleVoice = JsonUtil.GetIntValue(ConfigFile,"enablemalevoice",0)  
ChanceForMaleToComment = JsonUtil.GetIntValue(ConfigFile,"chanceformaletocomment",0) as float /100
FHUTongueType = JsonUtil.GetIntValue(ConfigFile,"fhutonguetype",7)  
EnableNPCExpressions = JsonUtil.GetIntValue(ConfigFile,"enablenpcexpressions",0)  
ArmorSlotsToSwitch = papyrusutil.stringsplit(JsonUtil.GetStringValue(ArmorSwappingFile,"armorslots","") ,",")

EnableArmorSwapping = JsonUtil.GetIntValue(ConfigFile,"enablearmorswapping",0)  
VoiceVariation = JsonUtil.GetStringValue(VoiceVariationFile,"voicevariation","NA")  
AggressiveChancetoMoveBackAStage =  JsonUtil.GetIntValue(ConfigFile,"aggressivechancetomovebackastage",0)  
EnjoymentForAggressiveToMoveBackAStage = JsonUtil.GetIntValue(ConfigFile,"enjoymentforaggressivetomovebackastage",0)  
UseHentaiExpressionNG = JsonUtil.GetIntValue(ConfigFile,"usehentaiexpressionng",0)  


hentaiexpressionngkneejerkspeed = JsonUtil.GetIntValue(ConfigFile,"hentaiexpressionngkneejerkspeed",0)  
hentaiexpressionngspeechspeed = JsonUtil.GetIntValue(ConfigFile,"hentaiexpressionngspeechspeed",0)  
hentaiexpressionngintensespeed = JsonUtil.GetIntValue(ConfigFile,"hentaiexpressionngintensespeed",0)  
hentaiexpressionngnonintensespeed = JsonUtil.GetIntValue(ConfigFile,"hentaiexpressionngnonintensespeed",0)  
hentaiexpressionngnonpenetrationspeed = JsonUtil.GetIntValue(ConfigFile,"hentaiexpressionngnonpenetrationspeed",0)   

HugePPSchlongSize = JsonUtil.GetIntValue(ConfigFile,"hugeppschlongsize",0)
EnableGhostActors  = JsonUtil.GetIntValue(ConfigFile,"enableghostactors",0)  

EnableLactate = JsonUtil.GetIntValue(LactateFile,"enablelactating",0)
AlwaysLactate = JsonUtil.GetIntValue(LactateFile,"alwayslactate",0)
ChancetoLactateDuringOrgasm = JsonUtil.GetIntValue(LactateFile,"chancetolactateduringorgasm",0)
ChanceToLactateDuringIntense = JsonUtil.GetIntValue(LactateFile,"chancetolactateduringintense",0)
ChancetoStopLactate = JsonUtil.GetIntValue(LactateFile,"chancetostoplactate",0)  
 
endfunction

Function PerformInitialization()

	ShouldInitialize = false

	LowPrioritySounds.UnMute()
	;First, find the scene we're supposed to track
	sceneID = SexLab.FindActorController(actorWithSceneTrackerSpell)
	sexLabThreadController = SexLab.GetController(sceneID)
	
	;Second, get all the information we need on the actors in the scene and their voices
	FindActorsAndVoices()
	
	;Third, announce we are tracking this scene (this needs to come AFTER FindActorsAndVoices(), b/c that function populates the bool maleOnlyScene)
	MasterScript.RegisterThatSceneIsStarting(maleOnlyScene)
	
	;Fourth, pull the MCM settings we need to cache
	PullMCMConfigOptions()
	
	;always run male at full volume
	LowPrioritySoundsMale.setvolume(1.0)
	HighPrioritySoundsMale.setvolume(1.0)
	LowPrioritySounds.setvolume(volume)
	HighPrioritySounds.setvolume(volume)
	
	
	
	;Then, set up some other one-time config on scene start
	hoursSinceLastSex = SexLab.HoursSinceLastSex(mainFemaleActor)
	
	;Then, initialize the variables responsible for the personality of the actors. These can change from scene to scene based on circumstances
	DeterminePersonalityForScene()
	
	;Last item of set up: register for events
	RegisterForTheEventsWeNeed()

	;After set up, greet our partner if applicable
	
	InitializeConfigValues()
	initializeFHUTongueType()
	InitializeExpressionValues()
	
	 ;Make sure everything is up to date before we make our greeting
	
	;check if has MFEE
	if MuFacialExpressionExtended.GetVersion() > 0 && JsonUtil.GetIntValue(EnableErinMFEE,"enablemfee",0) > 0   &&  (mainFemaleActor.GetRace().getname() =="Erin" || mainFemaleActor.GetRace().getname() =="Elin" )
		HasMFEE = true
	endif
	
	;initialize storageutil to set if its orgasming
	StorageUtil.SetIntValue(None, "ASLOrgasm", 0)
	StorageUtil.SetIntValue(None, "ASLMaleOrgasm", 0)
	StorageUtil.SetStringValue(None, "ASLFemaleSpeech", "")
	StorageUtil.SetIntValue(None, "FemaleMakingSound", 1)
	StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 1)
	if 	StorageUtil.GetIntValue(None, "ASLTargetOrgasmtoBroken") == 0
		StorageUtil.SetIntValue(None, "ASLTargetOrgasmtoBroken" , Utility.RandomInt(MinOrgasmsToBroken, MaxOrgasmsToBroken))
	endif

	
	;initialize broken status
	if hoursSinceLastSex >= HoursSinceLastSexToResetBrokenStatus as float
		StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken" , 0)
		StorageUtil.SetIntValue(None, "ASLTargetOrgasmtoBroken" , Utility.RandomInt(MinOrgasmsToBroken, MaxOrgasmsToBroken))
		StorageUtil.SetIntValue(None, "ASLisBroken" , 0)
	else
		ASLRefreshBrokenStatus()
	endif
	
	if EnableHentaiIVDTNormalExpressions == 1 || EnableHentaiIVDTAhegaoExpressions == 1
		StorageUtil.SetIntValue(None, "DisableSLSOExpression" , 1)
	endif
	
	if EnableHentaiIVDTNormalExpressions == 1 && !equippedtongue()
		UpdateNormalExpression()
	endif
	if EnableHentaiIVDTAhegaoExpressions == 1 && equippedtongue()
		UpdateAhegaoExpression()
	endif
	
	ASLUPDATE()
	SetActorScale()
	ResetHentaiExpressionGroup()
	
	Blowjoboverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsNGFile,"blowjobphonemeoverride","") ,",")
	BrokenOverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsNGFile,"brokenmodifieroverride","") ,",")
	TongueOutOverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsNGFile,"tongueoutphonemeoverride","") ,",")
	
	MFEETongueOutOverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(MFEEFile,"tongueoutphonemeoverride","") ,",")
	MFEEBrokenOverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(MFEEFile,"brokenmodifieroverride","") ,",")
	
	;Set Schlong Faction
	schlongfaction = Game.GetFormFromFile(0xAFF8 , "Schlongs of Skyrim.esp") as Faction
	;TNG
	TNG_XL = Game.GetFormFromFile(0xFE5, "TheNewGentleman.esp") as Keyword
	TNG_L = Game.GetFormFromFile(0xFE4, "TheNewGentleman.esp") as Keyword
	TNG_Gentlewoman = Game.GetFormFromFile(0xFF8, "TheNewGentleman.esp") as Keyword

	;Lactate
	MilkR = Game.GetFormFromFile(0x812, "IVDTHentaiLactate.esp") as Armor
	MilkL = Game.GetFormFromFile(0x813, "IVDTHentaiLactate.esp") as Armor
	NippleLeakCBBE  = game.GetFormFromFile(0x814, "IVDTHentaiLactate.esp") as EffectShader
	SetGhostActor()
	Initialized = true


EndFunction

;This only pulls the settings that are polled commonly throughout the sex. Settings used only once or restricted to rare cases are not cached here but instead fetched real-time
Function PullMCMConfigOptions()
	dialogueSpacingMultiplier = MasterScript.ConfigOptions.GetModSettingFloat("fSpacingMultiplier:DialogueOptions")
	generalIntensityThreshold = MasterScript.ConfigOptions.GetModSettingInt("iIntensityThreshold:DialogueOptions")
	analIntensityThreshold = MasterScript.ConfigOptions.GetModSettingInt("iAnalIntensityThreshold:DialogueOptions")
	;generalIntensityThreshold = JsonUtil.GetIntValue("/SLSO/Config.json", "sl_hot_voice_strength", 75) ;This is how SLSO defines the intensity threshold
	femaleCloseToOrgasmThreshold = MasterScript.ConfigOptions.GetModSettingInt("iFemaleCloseThreshold:DialogueOptions")
	analAnimationFilter = MasterScript.ConfigOptions.GetModSettingInt("iAnalAnimationFilter:DialogueOptions")
	Volume = 0.01 * MasterScript.ConfigOptions.GetModSettingInt("iMasterVolume:VoiceSystemManagement")

EndFunction

Function initializeFHUTongueType()

if FHUTongueType == 0
	FHUTongueType = Utility.RandomInt(1, 10)
endif	

if FHUTongueType == 1
	Tongue = Game.GetFormFromFile(0x263B2, "sr_fillherup.esp") as Armor
elseif  FHUTongueType == 2
	Tongue = Game.GetFormFromFile(0x263B3, "sr_fillherup.esp") as Armor
elseif  FHUTongueType == 3
	Tongue = Game.GetFormFromFile(0x263B4, "sr_fillherup.esp") as Armor
elseif  FHUTongueType == 4
	Tongue = Game.GetFormFromFile(0x263B5, "sr_fillherup.esp") as Armor
elseif  FHUTongueType == 5
	Tongue = Game.GetFormFromFile(0x263B6, "sr_fillherup.esp") as Armor	
elseif  FHUTongueType == 6
	Tongue = Game.GetFormFromFile(0x263B7, "sr_fillherup.esp") as Armor	
elseif  FHUTongueType == 7
	Tongue = Game.GetFormFromFile(0x263B8, "sr_fillherup.esp") as Armor	
elseif  FHUTongueType == 8
	Tongue = Game.GetFormFromFile(0x263B9, "sr_fillherup.esp") as Armor	
elseif  FHUTongueType == 9
	Tongue = Game.GetFormFromFile(0x263BA, "sr_fillherup.esp") as Armor	
elseif  FHUTongueType == 10
	Tongue = Game.GetFormFromFile(0x263BB, "sr_fillherup.esp") as Armor	
endif

endfunction

Function FindActorsAndVoices()
	playerCharacter = Game.GetPlayer()

	Actor[] actorList = sexLabThreadController.Positions
	Int actorCount = actorList.Length
	Int actorIndex = 0
	
	mainFemaleActor = playerCharacter
	mainFemaleVoice = MasterScript.GetVoiceForActress(playerCharacter)
	
	;Go through the list of all actors in the scene and get data on their gender and voices
	;PC is always main female
	While actorIndex < actorCount
		Actor actorInQuestion = actorList[actorIndex]
		if DefaultMaleVoice == none
			DefaultMaleVoice = MasterScript.GetDefaultMaleVoice(actorInQuestion)
		endif
		If (MasterScript.IsMale(actorInQuestion) || hasSchlong(actorInQuestion)) && actorInQuestion != playerCharacter
			;If mainMaleVoice == None
				mainMaleVoice = MasterScript.GetVoiceForActor(actorInQuestion)
				
				If mainMaleVoice != None && mainMaleActor == None
					mainMaleActor = actorInQuestion
				EndIf
			;EndIf
			
		EndIf

		actorIndex += 1
	EndWhile

	;If we still don't have a female voice, then this is a male-only scene and we need to make the guy, the girl... and potentially find a new guy (absolute genius)
	;If mainFemaleVoice == None && mainMaleVoice != None
	;	maleOnlyScene = True
	
		;Make the guy the girl...
	;	mainFemaleActor = mainMaleActor
	;	mainFemaleVoice = fakeFemaleVoice
	;	mainFemaleVoice.SetUpVoiceFromMaleVoice(mainMaleVoice)
	;	mainMaleActor = None
	;	mainMaleVoice = None
		
		;And find a new guy--if appplicable. that may be the only guy
	;	actorIndex = 0
	;	While actorIndex < actorCount
	;		Actor actorInQuestion = actorList[actorIndex]
		
	;		If MasterScript.IsMale(actorInQuestion) && actorInQuestion != mainFemaleActor && mainMaleVoice == None
	;			mainMaleVoice = MasterScript.GetVoiceForActor(actorInQuestion)
				
	;			If mainMaleVoice != None
	;				mainMaleActor = actorInQuestion
	;			EndIf
	;		EndIf
		
	;		actorIndex += 1
	;	EndWhile
	;EndIf
	
			
	if mainMaleActor == None
		if mainFemaleActor == actorList[0]
			mainMaleActor = actorList[1]
		else
			mainMaleActor = actorList[0]
		endif
	endif
	if !mainMaleActor.hasspell(SceneTrackerSpell)
		mainMaleActor.AddSpell(SceneTrackerSpell, abVerbose = False)
	endif
EndFunction

Function DeterminePersonalityForScene()
	isBootyGirl = DetermineIfBootyGirl(mainFemaleActor)	

	If mainMaleActor != None
		Bool withMalePlayer = (mainMaleActor == playerCharacter)
	
		withMaleLover = mainFemaleActor.GetRelationshipRank(mainMaleActor) >= 4 || mainFemaleActor.HasAssociation(SpouseAssocation, mainMaleActor)
		withMaleThane = withMalePlayer && mainFemaleActor.IsInFaction(PlayerHousecarlFaction)
		withMaleOfInterest = withMalePlayer && !withMaleLover && !mainMaleActor.IsInFaction(PlayerMarriedFaction) && AreAssumedToBeFrequentPartners(mainFemaleActor, mainMaleActor)

	EndIf
EndFunction

Bool Function DetermineIfBootyGirl(Actor theActor)
	;The below option is controlled in the MCM and has these values: 0 = women with weight >=75, 1 = >=50, 2 = >=25, 3 = all women, 4 = no women
	Int bootyGirlSelectionMethod = MasterScript.ConfigOptions.GetModSettingInt("iBootyGirls:DialogueOptions")
	
	If bootyGirlSelectionMethod == 0
		Return theActor.GetActorBase().GetWeight() >= 75
	ElseIf bootyGirlSelectionMethod == 1
		Return theActor.GetActorBase().GetWeight() >= 50
	ElseIf bootyGirlSelectionMethod == 2
		Return theActor.GetActorBase().GetWeight() >= 25
	Else
		Return bootyGirlSelectionMethod == 3
	EndIf
EndFunction



Int Function GetChemistryLevelForSpeechLevel(Actor theActor)
	Return (theActor.GetActorValue("Speechcraft") * 0.066) as Int ;1 extra point of chemistry for every 15 levels of speech
EndFunction

Function RegisterForTheEventsWeNeed()
	;For clean up after sex is done (important)
	RegisterForModEvent("AnimationEnd", "IVDTSceneEnd")
	
	;For dirty talk while cumming (and new cum sounds!)
	RegisterForModEvent("SexLabOrgasmSeparate", "IVDTOnOrgasm") ; Requires SexLab Separate Orgasm (SLSO)
	
	;For reactions to changing sex positions or holes or starting penetrative sex
	RegisterForModEvent("StageStart", "IVDTOnStageStart")
	
	;For dirty talk on non-event topics like getting close to cumming (most topics don't have an event and fall under here)
	RegisterForSingleUpdate(Utility.RandomFloat(0.5, 1.0))
EndFunction

;When a sexlab scene ends, we want to remove our tracker script (and do some other important shit too)
Event IVDTSceneEnd(string eventName, string argString, float argNum, form sender);
	If argString as Int != sceneID ;If true, this isn't our scene that just ended but another scene. So, ignore it.
		Return
	EndIf
;	miscutil.PrintConsole ("Triggered IVDTSceneEnd ")
	RestoreArmor()
	ResetActorScale()
	ResetGhostActor()
	
	MfgConsoleFuncExt.resetmfg(mainFemaleActor)
	MfgConsoleFuncExt.resetmfg(mainMaleActor)
	MuFacialExpressionExtended.RevertExpression(mainFemaleActor) 
	StorageUtil.unSetIntValue(None, "DisableSLSOExpression")
	StorageUtil.unsetStringValue(None, "ASLFemaleSpeech")
	StorageUtil.unSetIntValue(None, "FemaleMakingSound")
	MasterScript.RegisterThatSceneIsEnding(maleOnlyScene)
	RemoveTracker()
	

	
EndEvent

Function ASLEndScene()	;manually end scene
	;miscutil.PrintConsole ("Triggered ASLEndScene ")
	RestoreArmor()
	ResetActorScale()
	ResetGhostActor()
	MfgConsoleFuncExt.resetmfg(mainFemaleActor)
	MfgConsoleFuncExt.resetmfg(mainMaleActor)
	MuFacialExpressionExtended.RevertExpression(mainFemaleActor) 
	StorageUtil.unSetIntValue(None, "DisableSLSOExpression")
	StorageUtil.unsetStringValue(None, "ASLFemaleSpeech")
	StorageUtil.unSetIntValue(None, "FemaleMakingSound")
	MasterScript.RegisterThatSceneIsEnding(maleOnlyScene)
	RemoveTracker()
	
	
endfunction

Event IVDTOnOrgasm(Form actorRef, Int thread)

	If thread != sceneID  || actorWithSceneTrackerSpell != mainFemaleActor
		
		Return
	EndIf

	if ASLCanAccumulateBrokenPoints()
	
		if  ishugepp() || GetMainNPCTrait() == "+The Penetrator"
			StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken" , StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken")+2)
		else
			StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken" , StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken")+1)
		endif
			
		;miscutil.PrintConsole ("ASLTotalOrgasmtoBroken" + StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken"))
	endif
	
	Actor actorHavingOrgasm = actorRef as Actor
	if EnableHentaiIVDTNormalExpressions == 1 && usehentaiexpressionng != 1
			MakeOrgasmFace()
	endif
	
	if actorHavingOrgasm != mainFemaleActor
		GiveSHMilkSperm(actorHavingOrgasm)
	endif
	
	
	If ( actorHavingOrgasm == mainMaleActor || (MasterScript.IsMale(actorHavingOrgasm) || hasSchlong(actorHavingOrgasm))) && actorHavingOrgasm != mainFemaleActor && !femaleisgiving()
	

			StorageUtil.SetIntValue(None, "ASLMaleOrgasm", 1)
			;if its NOuveau Riche
			if GetMainNPCTrait() == "+The Nouceau Riche"
				mainFemaleActor.additem(Game.GetFormFromFile(0xF, "Skyrim.esm") , utility.Randomint(1,100))
			elseif GetMainNPCTrait() == "+The Gifter"
				mainFemaleActor.additem(Game.GetFormFromFile(0x2E4E3, "Skyrim.esm") , 1)
			endif
			
			If mainMaleVoice != None && actorHavingOrgasm == mainMaleActor
				PlaySound(mainMaleVoice.Orgasm, mainMaleActor, requiredChemistry = 0, soundPriority = 3, waitForCompletion = False, debugtext ="MaleOrgasm")	
			elseif DefaultMaleVoice != None
				PlaySound(DefaultMaleVoice.Orgasm, actorHavingOrgasm, requiredChemistry = 0, soundPriority = 3, waitForCompletion = False, debugtext ="DefaultMaleOrgasm")
			EndIf	
	
			if !HasDeviousGag(mainFemaleActor) && SexLabThreadController.TotalTime - timeOfLastKneeJerkReaction > 2.0 && mainFemaleEnjoyment <= FemaleOrgasmHypeEnjoyment
				;leak cum when bursting at seams 
				;miscutil.PrintConsole ("Main FemaleisBurstingAtSeams  : " + MainFemaleisBurstingAtSeams())	
				if MainFemaleisBurstingAtSeams() && CurrentPenetrationLvl() > 1
				;miscutil.PrintConsole ("leaking from burst seam")
				
					float AdditionalHugePPChanceLeak = 1
					
						if ishugePP()
							AdditionalHugePPChanceLeak = 2
						endif
					ChangeHentaiExpression("hugeppgape")	

					PlaySound(mainFemaleVoice.SurprisedByMaleOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3)
					
						; chance to cum leak from mouth if is doggy position and is intense and hashugepp
					if   Utility.RandomFloat(0.0, 1.0) < ChanceToLeakOralCum * AdditionalHugePPChanceLeak && (currentanimation.HasTag("Doggy")|| currentanimation.HasTag("Doggystyle") || currentanimation.HasTag("Doggy Style") ) && (stagelabel == "FA" || stagelabel == "FV" || stagelabel == "DP" || stagelabel == "TP") 
						;miscutil.PrintConsole (" leaking Oral")
						ASLAddTongue()
						ASLAddOralLeak()
						ChangeHentaiExpression("hugeppgape")

						PlaySound(mainFemaleVoice.MaleOrgasmOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "MaleOrgasmOral")
						
						Utility.Wait(Utility.RandomFloat(1.0, 3.0))
						ASLAddCumPool()
						PlaySound(mainFemaleVoice.MaleOrgasmOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "MaleOrgasmOral" )
						
						Utility.Wait(Utility.RandomFloat(1.0, 3.0))
						ASLRemoveOralLeak()
						if !ASLIsBroken()
							ASLRemoveTongue()
						endif
					else
						;miscutil.PrintConsole (" leaking pussy")
						ASLAddThickCumleak()
						ASLAddCumPool()
						
					endif
						
						
						
				elseif 	stagelabel == "LI" && !femaleisvictim()
					ChangeHentaiExpression("wantmore")
					PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 2 , debugtext= "ReadyToGetGoing")	
	
				elseif ishugepp() && SexLabThreadController.TotalTime - timeOfLastStageStart > 2
					ChangeHentaiExpression("hugeppgape")

					PlaySound(mainFemaleVoice.SurprisedByMaleOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext= "SurprisedByMaleOrgasm")
					
				ElseIf (stagelabel == "TP" ||  stagelabel == "SR")  && Utility.RandomFloat(0.0, 1.0) < 0.5  && SexLabThreadController.TotalTime - timeOfLastStageStart > 2
					ChangeHentaiExpression("kneejerk")

					PlaySound(mainFemaleVoice.MaleOrgasmNonOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "MaleOrgasmNonOral")	
					
				ElseIf stagelabel == "SB" ||  stagelabel == "FB" || stagelabel == "TP" ||  stagelabel == "SR" 	&& SexLabThreadController.TotalTime - timeOfLastStageStart > 2
					Utility.Wait(Utility.RandomFloat(0.5, 1.5))
					ChangeHentaiExpression("kneejerk")

					PlaySound(mainFemaleVoice.MaleOrgasmOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "MaleOrgasmOral")	
					
				elseif CurrentPenetrationLvl() > 1  && SexLabThreadController.TotalTime - timeOfLastStageStart > 2
					ChangeHentaiExpression("kneejerk")

					PlaySound(mainFemaleVoice.MaleOrgasmNonOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3, debugtext= "MaleOrgasmNonOral")
					

				EndIf
				
			endif
			timeOfLastKneeJerkReaction = SexLabThreadController.TotalTime
			StorageUtil.SetIntValue(None, "ASLMaleOrgasm", 0)
			RecordMaleOrgasm()
			Reactedtomaleorgasm = false
			teasedClosetoorgasm = false
			
	ElseIf actorHavingOrgasm == mainFemaleActor
	
		;break immediately if NPC is the breaker
		if GetMainNPCTrait()== "+The Breaker" && !ASLisBroken()
			StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken" , StorageUtil.GetIntValue(None, "ASLTargetOrgasmtoBroken")) 
		endif
		
		if ChancetoLactateDuringOrgasm <= Utility.RandomInt(1, 100)
			Lactate()
		endif

		ASLAddOrgasmSSquirt()
		;ASLHandleFemaleOrgasmReaction()
			MakeOrgasmFace()
			StorageUtil.SetIntValue(None, "ASLOrgasm" , 1)
		if !HasDeviousGag(mainFemaleActor) && !IsUnconcious()
			Reactedtofemaleorgasm = false
			
			if femaleisgiving() 
				Reactedtofemaleorgasm = true
			endif
			
			ChangeHentaiExpression("orgasm")
			PlaySound(mainFemaleVoice.Orgasm, mainFemaleActor, requiredChemistry = 0, soundPriority = 3, debugtext ="FemaleOrgasm" , Force = true) ;, waitForCompletion = False)	

		endif
		
	;	if hasSchlong(mainFemaleActor) && DefaultMaleVoice != None
	;		PlaySound(DefaultMaleVoice.Orgasm, actorHavingOrgasm, requiredChemistry = 0, soundPriority = 3, waitForCompletion = False, debugtext ="DefaultMaleOrgasm")
	;	endif
			
			StorageUtil.SetIntValue(None, "ASLOrgasm" , 0)
			StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 1)
			CommentedClosetoOrgasm = false
		timeOfLastKneeJerkReaction = SexLabThreadController.TotalTime
		RecordFemaleOrgasm()
		ASLRemoveOrgasmSSquirt()
		ASLRefreshBrokenStatus()
	EndIf
	
EndEvent

Event IVDTOnStageStart(string eventName, string argString, float argNum, form sender)
	
	If argString as Int != sceneID
		Return
	EndIf
	
EndEvent

Event OnUpdate()
	;non PC actor updates


while Initialized == false ; wait until initialization complete
	Utility.Wait(1)
endwhile

if SexLab.FindPlayerController() == -1 
	StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)

	ASLEndScene()
endif

if actorWithSceneTrackerSpell == mainMaleActor
		;miscutil.PrintConsole ("on update with MALE")

		PhaseFemaleexpressions()		
elseif actorWithSceneTrackerSpell == mainFemaleActor

;miscutil.PrintConsole ("-----------------IVDT CYCLE-------------------- " )


	if ShouldInitialize == true && currentstage == 1

		PerformInitialization()
	endif

Race MaleActorRace = mainMaleActor.GetRace()
String MaleRaceName = MaleActorRace.GetName()

Bool mainFemaleIsVictim = SexLab.IsVictim(sceneID, mainFemaleActor)
	;---First, update status

	;calculate timers for auto advancing stages
		cycle = cycle + 1
	
	if cycle <= 1
		ASLUpdate()
	elseif (GetMainNPCTrait() == "Aggressive+" || GetMainNPCTrait() == "Impatient+" )&& SkiptoAggressiveStage == false && cycle >= 2 && MainMaleCanControl()
		SkiptoAggressiveStage()
	elseif ASLProcessStageAdvancing()
		cycle = 0

		if ShouldMovebackAStage()
			sexLabThreadController.advancestage(true)
		else
			sexLabThreadController.advancestage()
		endif
	endif

	ASLUpdate()

;=========================run section for anim stage labels=======================
	; Debug.Notification("Streak: " + penetrativeStreakDuration + ", Limit: " + streakTooLongDuration)	
	;run lactating

	if mainFemaleActor.IsEquipped(MilkL) || mainFemaleActor.IsEquipped(MilkR)
		if ChancetoStopLactate <= Utility.RandomInt(1, 100) && GetMainNPCTrait() != "+The Milker" ;cant start lactating until scene ends with the milker
			StopLactate()
		endif
	else
		if ChancetoLactateDuringIntense <= Utility.RandomInt(1, 100) && ASLcurrentlyIntense
			Lactate()
		endif	
	endif
	
	while StorageUtil.GetIntValue(None, "ASLOrgasm") == 1
		Utility.Wait(1) ;wait until female orgasm complete before proceeding
	;	miscutil.PrintConsole ("waiting for orgasm to finish: " + SexLabThreadController.TotalTime)
	;miscutil.PrintConsole ("waiting for orgasm to finish " )
	endwhile
	;if SexLabThreadController.TotalTime - timeOfLastRecordedFemaleOrgasm >= 8
	if EnableHentaiIVDTNormalExpressions == 1 && !equippedtongue()
		UpdateNormalExpression()
	endif
	
	if EnableHentaiIVDTAhegaoExpressions == 1 && equippedtongue()
		UpdateAhegaoExpression()
	endif

	if HasDeviousGag(mainFemaleActor) 
		StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
		if EnableDDGagVoice == 1
			ASLPlayGagSound()
		else
			Utility.Wait(8) ; dont play any voice if gagged
		endif
	;endif 

	elseif Reactedtofemaleorgasm == false && Utility.RandomFloat(0.0, 1.0) < 0.5
		
		ASLHandleFemaleOrgasmReaction()
		nextUpdateInterval = Utility.RandomFloat(0.5, 1.0)
	elseif	Reactedtomaleorgasm == false && Utility.RandomFloat(0.0, 1.0) < 0.6 && !FemaleisGiving()
		
	;miscutil.PrintConsole ("Handle Male Orgasm" + SexLabThreadController.TotalTime)
	;	miscutil.PrintConsole ("seconds after Male orgasm :" + (SexLabThreadController.TotalTime - timeOfLastMaleOrgasm))
	;	miscutil.PrintConsole ("Playing Handle Male Orgasm" )
	;	miscutil.PrintConsole ("SexLabThreadController.TotalTime : " + SexLabThreadController.TotalTime )
	;	miscutil.PrintConsole ("timeOfLastMaleOrgasm :" + timeOfLastMaleOrgasm )
	;	Utility.Wait(Utility.RandomFloat(1.0, 3.0))

		ASLHandleMaleOrgasmReaction()
		nextUpdateInterval = Utility.RandomFloat(0.1, 1.0)
	elseif stagelabel == "LI"
		;miscutil.PrintConsole ("Debug : Playing LI")
		ASLPlayLI()
		nextUpdateInterval = Utility.RandomFloat(1.0, 2.0)

	elseif stagelabel == "SA" || stagelabel == "SV" 
		;miscutil.PrintConsole ("Debug : Playing SA SV")
		ASLPlaySASV()
		nextUpdateInterval = Utility.RandomFloat(0.1, 1.0)
	elseif stagelabel == "FA" || stagelabel == "FV" 
		;miscutil.PrintConsole ("Debug : Playing FA FV")
		if FemaleisGiving()
			ASLPlaySASV()
		else
			ASLPlayFAFV()
		endif
		nextUpdateInterval = 0.1
	elseif stagelabel == "EN"
		;miscutil.PrintConsole ("Debug : Playing EN")
		ASLPlayEN()
		nextUpdateInterval = 0.1
	elseif stagelabel == "SB" || stagelabel == "FB"
		;miscutil.PrintConsole ("Playing SB FB")
		ASLPlaySBFB()
		nextUpdateInterval = Utility.RandomFloat(0.1, 0.5)
	elseif stagelabel == "DP"
		;miscutil.PrintConsole ("Debug : Playing DP")
		ASLPlayDP() 
		nextUpdateInterval = 0.1
	elseif stagelabel == "TP"
		if Utility.RandomFloat(0.0, 1.0) < 0.75
			;miscutil.PrintConsole ("Debug : Playing TP")
			ASLPlaySBFB()
			nextUpdateInterval = Utility.RandomFloat(0.1, 0.5)
		else
			;miscutil.PrintConsole ("Debug : Playing DP")
			ASLPlayDP() 
			nextUpdateInterval = 0.1
		endif 
		
	elseif stagelabel == "SR"
	;	if Utility.RandomFloat(0.0, 1.0) < 0.25 && currentstage > 1
			;miscutil.PrintConsole ("Debug : Playing FA FV")
		;	ASLPlayFAFV()
		;	nextUpdateInterval = 0.1
		;else
			;miscutil.PrintConsole ("Debug : Playing SB FB")
			ASLPlaySBFB()
			nextUpdateInterval = Utility.RandomFloat(0.1, 0.3)
	;	endif

	endif

endif

if actorWithSceneTrackerSpell == mainMaleActor
	nextUpdateInterval = 0.1
endif

	RegisterForSingleUpdate(nextUpdateInterval)
	
;miscutil.PrintConsole ("-----------------End CYCLE-------------------- " )
EndEvent

Function RemoveTracker()
	; Debug.Notification("Removing IVDT tracker from " + mainFemaleActor.GetActorBase().GetName())
	StorageUtil.UnSetIntValue(None, "ASLOrgasm")
	StorageUtil.UnSetIntValue(None, "ASLMaleOrgasm")
	StorageUtil.UnSetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet")
	StorageUtil.unSetStringValue(None, "Scenario")
	StopLactate()
	ASLRemoveTongue()
	ASLRemoveOrgasmSSquirt()
	ASLRemoveThickCumleak()
	ASLRemoveCumPool()
	ASLRemoveOralLeak()
	;Perform needed clean up first
	UnregisterForUpdate()
	LowPrioritySounds.UnMute()
	
	;Do this very last, but make sure to do it (it's what actually removes the tracker)
	actorWithSceneTrackerSpell.RemoveSpell(SceneTrackerSpell)

EndFunction



Function RecordMaleOrgasm()
	;Ordering of some these statements matter because some depend on the others...
	
	if CurrentPenetrationLvl() > 1 && !FemaleisGiving()
		CameInsideCount = CameInsideCount + 1
	endif
	
	locationOfLastMaleOrgasm = CurrentPenetrationLvl()
	

	maleOrgasmCount += 1
	timeOfLastMaleOrgasm = sexLabThreadController.TotalTime
	
EndFunction

Function RecordFemaleOrgasm()
	femaleRecordedOrgasmCount += 1
	timeOfLastRecordedFemaleOrgasm = sexLabThreadController.TotalTime
	
	
EndFunction

Int Function GetActorEnjoyment(Actor actorInQuestion)
	If actorInQuestion == None
		Return -1
	Else
		Return sexLabThreadController.ActorAlias(actorInQuestion).GetFullEnjoyment()
	EndIf
EndFunction

Function PlaySound(Sound theSound, Actor actorMakingSound, Int requiredChemistry = 0, Int soundPriority = 0, Float maxQueueDuration = 5.0, Bool waitForCompletion = True , string debugtext = "None" , Bool Force = false , Bool SkipWait = false)

	Sound soundToPlay = thesound
	


	If soundToPlay == None
	
		Return
	EndIf
	; male or other playing sound
	if actorMakingSound != mainFemaleActor && (currentlyPlayingSoundCountMale == 0 || soundpriority > 1) ;others playing sound. 
	
		currentlyPlayingSoundCountMale = currentlyPlayingSoundCountMale + 1
		
		;lower down voice of female moan when male says something
	
		
	;	if soundPriority >2
	;		LowPrioritySoundsMale.mute()	
	;	endif
		
		MasterScript.PlaySound(soundToPlay, actorMakingSound, waitForCompletion)
	
		currentlyPlayingSoundCountMale = currentlyPlayingSoundCountMale - 1
		
	;	if currentlyPlayingSoundCountMale == 0
	;		LowPrioritySoundsMale.unmute()
	;	endif

		
	;female playing sound
	elseif actorMakingSound == mainFemaleActor && (currentlyPlayingSoundCount == 0 || soundpriority > 1)	 ;Female play sound
		StorageUtil.SetIntValue(None, "FemaleMakingSound" ,1)
		
		currentlyPlayingSoundCount = currentlyPlayingSoundCount + 1

		if SoundPriority <= 1 && soundToPlay != PreviousSound && SkipWait == false
			if ASLcurrentlyIntense
				utility.wait(utility.randomint(0,1))
			else
				utility.wait(utility.randomint(1,2))
			endif
		endif
		;track previous sound
		PreviousSound = soundToPlay

		if soundPriority >2 
			LowPrioritySounds.mute()
		endif
		
		if IsUnconcious()
			LowPrioritySounds.mute()
			HighPrioritySounds.mute()
		endif
		
		MasterScript.PlaySound(soundToPlay, actorMakingSound, waitForCompletion)
	
		currentlyPlayingSoundCount = currentlyPlayingSoundCount - 1
		
		if currentlyPlayingSoundCount ==0
			if !IsUnconcious()
				LowPrioritySounds.unmute()
				HighPrioritySounds.unmute()
			endif
		endif
			
	else
		Utility.Wait(Utility.RandomFloat(1, 2))
	EndIf

EndFunction


Bool Function IsEarlyToCum()
	Return currentstage <= 2
EndFunction


Bool Function ShouldPlayMaleOrgasmHype()
	return mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && teasedClosetoorgasm == false && !FemaleisGiving() ;Male is not close enough yet

EndFunction

;make romantic comment
Function MakeRomanticCommentIfRightTime(Bool forceComment = False)
	ChangeHentaiExpression("Amused")
	PlaySound(mainFemaleVoice.LoveyDovey, mainFemaleActor, requiredChemistry = 0)
	
	timeOfLastRomanticRemark = SexLabThreadController.TotalTime
	
EndFunction

Bool Function ShouldMakeRomanticComment()
	if femaleisvictim()
		return false
	elseIf SexLabThreadController.TotalTime - timeOfLastRomanticRemark < 60 ;Too soon. Romantic comments should be spaced out and rare
		Return False
	ElseIf withMaleLover && (currentAnimation.HasTag("Kissing") || currentAnimation.HasTag("cunnilingus")) && stagelabel == "LI" && Currentstage <= 2
		Return Utility.RandomFloat(0.0, 1.0) < 0.1
	else 
		return false
	EndIf
EndFunction


Bool Function FemaleIsSatisfied()
	;If either the male or the female have cummed a bunch, or its been more than 10 minutes, then we're satisfied
	;...This function doesn't take regard to any impending orgasms or high levels of enjoyment. It's assumed those are taken into account where this is called
	Return !femaleisvictim() && mainFemaleEnjoyment <= 30
endfunction


Bool Function PossiblyAskForCumInSpecificLocation()
	ChangeHentaiExpression("wantmore")
	if stagelabel == "DP"
		if Utility.RandomFloat(0.0, 1.0) < 0.3
			PlaySound(mainFemaleVoice.AskForAnalCum, mainFemaleActor, requiredChemistry = 3)
		else	
			PlaySound(mainFemaleVoice.AskForVaginalCum, mainFemaleActor, requiredChemistry = 4)
		endif
	elseif stagelabel == "TP" || stagelabel == "SR"
			PlaySound(mainFemaleVoice.AskForOralCum, mainFemaleActor, requiredChemistry = 2)
	elseif CurrentPenetrationLvl() == 2   ;Ask for vaginal cum	
			PlaySound(mainFemaleVoice.AskForVaginalCum, mainFemaleActor, requiredChemistry = 4)
	elseif CurrentPenetrationLvl() == 1  ;Ask for oral cum
			PlaySound(mainFemaleVoice.AskForOralCum, mainFemaleActor, requiredChemistry = 2)
	ElseIf CurrentPenetrationLvl() == 3 ;Ask for anal cum
			PlaySound(mainFemaleVoice.AskForAnalCum, mainFemaleActor, requiredChemistry = 3)
	endif


EndFunction

;Returns whether a remark was made
Bool Function PossiblyRemarkOnCumLocation()
	ChangeHentaiExpression("Ending")
	;Go ahead with remark
	If locationOfLastMaleOrgasm == 1
		PlaySound(mainFemaleVoice.CameInMouth, mainFemaleActor, requiredChemistry = 0)
		Return True
	ElseIf locationOfLastMaleOrgasm == 2 
		PlaySound(mainFemaleVoice.CameInPussy, mainFemaleActor, requiredChemistry = 0)
		Return True
	ElseIf locationOfLastMaleOrgasm == 3 
		PlaySound(mainFemaleVoice.CameInAss, mainFemaleActor, requiredChemistry = 0)
		
		Utility.Wait(Utility.RandomFloat(0.75, 1.75))
		
		
		Return True
	Else
		Return False ;Can't figure out where the hell we came so just uh pass on remarking
	EndIf
EndFunction






Bool Function FemaleCanAttackFromPosition(sslBaseAnimation theAnimation)
	; theAnimation.HasTag("Missionary") || theAnimation.HasTag("Laying") || theAnimation.HasTag("Standing") ;Blacklist
	If theAnimation.HasTag("Doggystyle") || theAnimation.HasTag("Doggy Style") || theAnimation.HasTag("Cowgirl") ;Whitelist
		Return True
	Else
		Return False
	EndIf
EndFunction

;Determine if we should start or continue an attack, based on what value is passed into the parameter.
Bool Function ShouldGoOnTheAttack(sslBaseAnimation theAnimation , Bool startOfAttack = True)
	Bool mainFemaleIsVictim = SexLab.IsVictim(sceneID, mainFemaleActor)
	if	mainFemaleIsVictim 
		return false
	;attack when female controlling and is not victim. 
	elseif !ASLCurrentlyintense && (theAnimation.HasTag("Cowgirl") || theAnimation.HasTag("FemDom") || theAnimation.HasTag("Fem Dom") || theAnimation.HasTag("Amazon"))
	return true
	
	;female taking the penetration role as futa or strapon
	elseif ActorsInPlay[0] != mainFemaleActor && (theAnimation.HasTag("Anal") || theAnimation.HasTag("Vaginal"))
		return true
	;Don't attack if there's no male, we don't have the energy, we're too close to orgasm, sex is just getting started/resumed, or we want to get back to foreplay
	ElseIf mainMaleActor == None ;|| !currentlyIntense || femaleCloseToOrgasm || inRefractoryPeriod || mainMaleEnjoyment < 25 || FemaleReadyToReturnToForeplay()
		Return False
	
	;If male near orgasm, don't attack if we don't want the male to cum inside
	ElseIf mainMaleEnjoyment > 70  && !okwithvaginalcum() ; !(cumLocationDecision == 2 || cumLocationDecision == 3)
		Return False
	
	ElseIf chemistryLevel < 5 || CurrentPenetrationLvl() <= 1 || currentStage == 1 || !FemaleCanAttackFromPosition(currentAnimation) || femaleAnalCommunication < 0
		Return False
	
	Else
		Return MasterScript.ConfigOptions.GetModSettingBool("bAllowAttacks:DialogueOptions")
	EndIf
EndFunction



Function PlaySpankingSequence(Bool aggressiveLineAtStart = True)
	;spanking scenario
int spanksCompleted = 0
int SpankTarget = 0

SpankTarget = Utility.RandomInt(MinSpankCount, MaxSpankCount)
		
		if AllowMaleVoice()
		;	miscutil.PrintConsole ("Playing Male Comments spanking sequence")
			PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = False)
		endif
	While spanksCompleted < SpankTarget
		ASLIsinSpanking = true
		UpdateNPCExpression(mainMaleActor)
		PlaySound(MasterScript.Sounds.Smack, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1 ,waitForCompletion = false)
		ChangeHentaiExpression("kneejerk")

		PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , SkipWait = true)
		if EnableHentaiIVDTNormalExpressions == 1 && equippedtongue()
			UpdateAhegaoExpression(true)
		elseif EnableHentaiIVDTNormalExpressions == 1
			UpdateNormalExpression(true)
		endif
		spanksCompleted += 1
	
	EndWhile
		ASLIsinSpanking = false
		if	EnableHentaiIVDTNormalExpressions == 1
			UpdateNormalExpression(true)
		endif
	if Utility.RandomFloat(0.0, 1.0) < 0.7
		ChangeHentaiExpression("intensepenetrationcomments")
		PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)
	else
		ASLPlayPenetrationComments()
		
	endif

EndFunction

Function PlayBreathySound(Bool playIntenseVersion)
	ChangeHentaiExpression("grunt")
	If playIntenseVersion
		PlaySound(mainFemaleVoice.BreathyIntense, mainFemaleActor, requiredChemistry = 0)
	Else
		PlaySound(mainFemaleVoice.BreathySoft, mainFemaleActor, requiredChemistry = 0)
	EndIf
EndFunction

Bool Function OKWithVaginalCum()

Bool mainFemaleIsVictim = SexLab.IsVictim(sceneID, mainFemaleActor)

if MainFemaleisSuccubus()
return true
endif

if mainFemaleIsVictim
return false
endif


	If okWithVaginalCumCode >= 0 ;Decision already made. 1 = yes, 0 = no.
		Return okWithVaginalCumCode == 1
	EndIf
	
	;Decision not yet made. Consult user setting to settle this debate!
	Bool itsOK = UserSettingPOLLSaysOKForVaginalCum()
	
	;Remember the setting so we don't have to poll for it next time
	If itsOK
		okWithVaginalCumCode = 1
	Else
		okWithVaginalCumCode = 0
	EndIf
	
	Return itsOK
EndFunction

Bool Function UserSettingPOLLSaysOKForVaginalCum() ;Don't use this unless you know what you're doing (for performance reasons). Use OKWithVaginalCum() instead.
	Int usersBlessedChoice = MasterScript.ConfigOptions.GetModSettingInt("iOKWithVaginalCum:DialogueOptions")
	
	;Based on user's choice, decide whether its ok. God bless the user. Customer is always right
	If usersBlessedChoice == 0
		Return True
	ElseIf usersBlessedChoice == 1
		Return False
	ElseIf usersBlessedChoice == 2
		Return AreMarried(mainFemaleActor, mainMaleActor)
	ElseIf usersBlessedChoice == 3
		Return withMaleLover
	ElseIf usersBlessedChoice == 4
		Return AreAssumedToBeFrequentPartners(mainFemaleActor, mainMaleActor)
	ElseIf usersBlessedChoice == 5
		Return AreMarried(mainFemaleActor, mainMaleActor) && AreAssumedToBeFrequentPartners(mainFemaleActor, mainMaleActor)
	ElseIf usersBlessedChoice == 6
		Return withMaleLover && AreAssumedToBeFrequentPartners(mainFemaleActor, mainMaleActor)
	ElseIf usersBlessedChoice == 7
		Return withMaleLover || AreAssumedToBeFrequentPartners(mainFemaleActor, mainMaleActor)
	EndIf
EndFunction

Bool Function AreMarried(Actor actor1, Actor actor2)
	If actor1 == playerCharacter
		Return actor2.IsInFaction(PlayerMarriedFaction)
	ElseIf actor2 == playerCharacter
		Return actor1.IsInFaction(PlayerMarriedFaction)
	Else
		Return actor1.HasAssociation(SpouseAssocation, actor2)
	EndIf
EndFunction

Bool Function AreAssumedToBeFrequentPartners(Actor actor1, Actor actor2)
	If actor1 == playerCharacter
		Return SexLab.PlayerSexCount(actor2)
	ElseIf actor2 == playerCharacter
		Return SexLab.PlayerSexCount(actor1)
	Else
		Return actor1.HasAssociation(SpouseAssocation, actor2)
	EndIf
EndFunction


Bool Function IsAggressivehugePP()

	Race MaleActorRace = mainMaleActor.GetRace()
	String MaleRaceName = MaleActorRace.GetName()

	if currentlyintense && IshugePP()
		Return True 
	else 
		Return False
	endif
EndFunction

Bool Function IshugePP()

	if EnableHugePPScenario != 1 
		return false
	endif
	if !mainMaleActor
		return false
	endif
	Race MaleActorRace = mainMaleActor.GetRace()
	String MaleRaceName = MaleActorRace.GetName()

	if stringutil.find(MaleRaceName ,"Brute") > 0 || stringutil.find(MaleRaceName ,"Spider") > 0 || stringutil.find(MaleRaceName ,"Lurker") > 0 || stringutil.find(MaleRaceName ,"Daedroth") > 0  ||  stringutil.find(MaleRaceName ,"Horse") > 0 || stringutil.find(MaleRaceName ,"Bear") > 0 || stringutil.find(MaleRaceName ,"Chaurus") > 0 || stringutil.find(MaleRaceName ,"Dragon") > 0 || MaleRaceName ==  "Frost Atronach" || stringutil.find(MaleRaceName ,"Giant") > 0 || MaleRaceName ==  "Mammoth" || MaleRaceName ==  "Sabre Cat" || stringutil.find(MaleRaceName ,"Troll") > 0 || MaleRaceName ==  "Werewolf" || stringutil.find(MaleRaceName ,"Gargoyle") > 0 || MaleRaceName ==  "Dwarven Centurion" || stringutil.find(MaleRaceName ,"Ogre") > 0 ||  MaleRaceName ==  "Ogrim" || MaleRaceName ==  "Nest Ant Flier" || stringutil.find(MaleRaceName ,"OGrim") > 0
		Return True 
	else 
	;if Schlong is big
	If (SchlongFaction)
		Return mainMaleActor.GetFactionRank(SchlongFaction) >= HugePPSchlongSize
	elseif(TNG_XL)
		;keywords can explicitly overwrite value
		int TNG_Size = TNG_PapyrusUtil.GetActorSize(mainMaleActor)
		bool tngxl = mainMaleActor.HasKeyword(TNG_XL)
		bool tngl = mainMaleActor.HasKeyword(TNG_L)
		bool isBig = tngxl || TNG_Size >= HugePPSchlongSize || tngl
		;miscutil.PrintConsole ("DEBUG : current TNG_XL : " + tngxl)
		;miscutil.PrintConsole ("DEBUG : current TNG_PapyrusUtil.GetActorSize : " + TNG_Size)
		;miscutil.PrintConsole ("DEBUG : current TNG_L : " + tngl)
		;miscutil.PrintConsole ("DEBUG : current isBig : " + isBig)
		Return isBig
	else
		Return false
	EndIf	
endif
EndFunction

Bool Function Ishumanoidrace()

Race MaleActorRace = mainMaleActor.GetRace()
String MaleRaceName = MaleActorRace.GetName()

if MaleRaceName ==  "Wood Elf" || MaleRaceName ==  "Draugr" || MaleRaceName ==  "Redguard" || MaleRaceName ==  "Old People Race" || MaleRaceName ==  "Khajiit" || MaleRaceName ==  "High Elf" || MaleRaceName ==  "Dremora" || MaleRaceName ==  "Draugr" || MaleRaceName ==  "Dark Elf" || MaleRaceName ==  "Giant" || MaleRaceName ==  "Orc" || MaleRaceName ==  "Troll" || MaleRaceName ==  "Werewolf" || MaleRaceName ==  "Gargoyle" || MaleRaceName ==  "Snow Troll" || MaleRaceName ==  "Nord" || MaleRaceName ==  "Imperial" || MaleRaceName ==  "Breton" || MaleRaceName ==  "Argonian"
Return True 
else 
Return False
endif
Return False
EndFunction

Bool Function FemaleIsVictim()
return SexLab.IsVictim(sceneID, mainFemaleActor) && !MainFemaleisSuccubus() && !ASLisBroken() && EnableVictimScenario == 1
EndFunction

Bool Function MaleIsVictim()
return SexLab.IsVictim(sceneID, mainMaleActor) && EnableVictimScenario == 1
EndFunction

bool function isDP()
;check if its double penetration

if stagelabel == "DP" || stagelabel == "TP"
return true
else
return CurrentPenetrationLvl() >= 2 && currentAnimation.HasTag("Vaginal") && currentAnimation.HasTag("Anal") && (currentAnimation.HasTag("MMF") || currentAnimation.HasTag("FMM") || currentAnimation.HasTag("FMMM")|| currentAnimation.HasTag("MMMF") || currentAnimation.HasTag("FMMMM")|| currentAnimation.HasTag("MMMMF"))
endif
EndFunction

Function MakeOrgasmFace()
if usehentaiexpressionng == 1
	return
endif
Race FemaleActorRace = mainFemaleActor.GetRace()
String FemaleRaceName = FemaleActorRace.GetName()
int blink = 0
int browin = 0
int browup = 0

	if FemaleRaceName =="Elin" || FemaleRaceName =="Erin"

		MfgConsoleFunc.SetModifier(mainFemaleActor, 11, vlookup) ;look up
		blink = Utility.Randomint(vblink*80/100, vblink)
		browin = Utility.Randomint(vbrowin*80/100, vbrowin)
		browup = Utility.Randomint(vbrowup*80/100, vbrowup)

			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
			MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
	
		if EquippedTongue()
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah) ; big aah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Vohq) ; oh q
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Veee*30/100) ; eee
		else
			if normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*20/100, Vaah*50/100)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*90/100, Vohq)) ; ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*20/100, vbigaah*50/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ; oh
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,0) ; eh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Utility.Randomint(Veee*70/100, Veee)) ; eee
			endif
		
		endif	
	else ;vanilla race
		blink = Utility.Randomint(vblink*80/100, vblink)
		browin = Utility.Randomint(vbrowin*80/100, vbrowin)
		browup = Utility.Randomint(vbrowup*80/100, vbrowup)
			
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
			MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		if EquippedTongue()	
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,0); aah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah); big ah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Veh); eh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0) ; oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ;OhQ
		else	
			
			if normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*90/100, vbigaah))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*20/100, Voh*50/100)) ; oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*90/100, Vohq)) ; ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,0)  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*90/100, Vaah)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*90/100, Vohq)) ; ohq
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*50/100, Vaah*60/100)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*50/100, vbigaah*60/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(0, Voh*40/100)) ; oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ; ohq
			endif
		endif	
	endif
	




endfunction

Function RunNPCUpdates()

	Actor[] actorList = sexLabThreadController.Positions
	Int actorCount = actorList.Length
	Int actorIndex = 0
	
	
	;Go through the list of all actors in the scene and get data on their gender and voices
	;PC is always main female
	While actorIndex < actorCount
		
		Actor actorInQuestion = actorList[actorIndex]
			if actorInQuestion != mainFemaleActor
				MfgConsoleFunc.ResetPhonemeModifier(actorInQuestion)
				UpdateNPCExpression(actorInQuestion)
			endif
		actorIndex += 1
	EndWhile

EndFunction



Function UpdateNPCExpression(Actor Char , bool Orgasming = false)
;Simple set of NPC expressions

if EnableNPCExpressions != 1 ||  gender >= 2
return
endif

;if NPC is dead from sex
if Char.GetActorValuePercentage("Health") <= 1
	Char.SetExpressionOverride(4 ,100) ;surprised
	MfgConsoleFunc.SetPhoneme(Char,11,100) ;oh
	MfgConsoleFunc.SetModifier(mainFemaleActor, 11, 100) ;look up
	return
endif

int intensitymodifier 

	if ASLcurrentlyIntense
		intensitymodifier = 2
		else 
		intensitymodifier = 1
	endif

		;open mouth modifier
		if normalexpressionpath == 1
			MfgConsoleFunc.SetPhoneme(Char,0,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;aah
		elseif normalexpressionpath == 2
			MfgConsoleFunc.SetPhoneme(Char,1,Utility.Randomint(15*intensitymodifier, 45*intensitymodifier)) ;big aah
		elseif normalexpressionpath == 3
			MfgConsoleFunc.SetPhoneme(Char,11,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;oh
		endif
		
		;eee twist
		if MaleIsVictim()
			MfgConsoleFunc.SetPhoneme(Char,5,Utility.Randomint(20*intensitymodifier, 50*intensitymodifier)) ;eee
		endif
	if Orgasming
		if MaleIsVictim()
			Char.SetExpressionOverride(1,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;fear
		else
			Char.SetExpressionOverride(2 * Utility.Randomint(0,1) ,Utility.Randomint(35*intensitymodifier, 50*intensitymodifier)) ;anger or happy
		endif
	elseif	ASLIsinSpanking || femaleisvictim() 
		Char.SetExpressionOverride(2 * Utility.Randomint(0,1) ,Utility.Randomint(35*intensitymodifier, 50*intensitymodifier)) ;anger or happy
		MfgConsoleFunc.SetPhoneme(Char,5,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;eee
	elseif MaleIsVictim()
		if Utility.Randomint(1,2) == 1
			Char.SetExpressionOverride(1,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;fear
		else
			Char.SetExpressionOverride(3,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;sad
		endif
	elseif ShouldGoOnTheAttack(currentAnimation)
		Char.SetExpressionOverride(4 / Utility.Randomint(1,2) ,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;surprised or happy
	else
		Char.SetExpressionOverride(2 ,Utility.Randomint(25*intensitymodifier, 50*intensitymodifier)) ;happy
	endif	
	

endfunction


function UpdateNormalExpression(bool ForceChange = false)

if UseHentaiExpressionNG == 1
	return
elseif EnableHentaiIVDTNormalExpressions != 1
	return
endif

Race FemaleActorRace = mainFemaleActor.GetRace()
String FemaleRaceName = FemaleActorRace.GetName()
int blink = 0
int browin = 0
int browup = 0
int squint = 0
int surprise = 0


if IsUnconcious()
	MfgConsoleFunc.SetModifier(mainFemaleActor, 0, 100) ;left blink
	MfgConsoleFunc.SetModifier(mainFemaleActor, 1, 100) ;right blink
	MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(0, Vaah*50/100)) ; aah
	if ( stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" || stagelabel == "TP" ) ;Involve oral		
			if FemaleRaceName =="Elin"  || FemaleRaceName =="Erin"
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Voh) ; oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,vaah)  ; aah
			else
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0); oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,0) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah)  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ; ohq
			endif
	endif
elseif !EquippedTongue() && StorageUtil.GetIntValue(None, "ASLOrgasm") == 0 && 	(sexLabThreadController.TotalTime - timeOfLastNormalExpressionUpdate >= 3 || ForceChange == true) && PauseExpressionUpdate == false

;eyes modifier for both elin and vanilla
	if ASLIsBroken()

		MfgConsoleFunc.SetModifier(mainFemaleActor, 11, Vlookup) ;look up
	elseif !ASLIsBroken()	
		if currentAnimation.hastag("Cowgirl") && CurrentPenetrationLvl() > 1

			MfgConsoleFunc.SetModifier(mainFemaleActor, 8, vlookdown) ;look down
		elseif  (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style")) && CurrentPenetrationLvl() > 1 && !FemaleisGiving()
			if NormalExpressionLookleftorRight == 1
				MfgConsoleFunc.SetModifier(mainFemaleActor, 9, vlookleftright) ;look left 
			elseif NormalExpressionLookleftorRight == 2
				MfgConsoleFunc.SetModifier(mainFemaleActor, 10, vlookleftright) ; look right	
			endif
	endif

	endif

	if FemaleRaceName =="Elin"  || FemaleRaceName =="Erin"
	 
		if stagelabel == "EN"
			blink = Utility.Randomint(vblink*60/100, vblink)	
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,vaah*50/100)  ; aah
			
			if Previousstagelabel == "FB" || Previousstagelabel == "SB"
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,voh); oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Vaah); aah
		else
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,vaah*50/100)  ; aah
		endif
			
			
		elseif ASLIsBroken()
		blink = Utility.Randomint(vblink*40/100, vblink)
		browin = Utility.Randomint(vbrowin*70/100, vbrowin)
		browup = Utility.Randomint(Vbrowup*70/100, Vbrowup)
		surprise =  Utility.Randomint(Vmaxexpressionstrength*70/100, Vmaxexpressionstrength)
		
	;Eyes Modifier

		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R	
	
	;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" || stagelabel == "TP";Involve oral		
			surprise =  Utility.Randomint(Vmaxexpressionstrength*70/100, Vmaxexpressionstrength)
			
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Voh) ; oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,vaah)  ; aah

	;No Oral Stage Phoneme	

		else
		
			if normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*70/100, Vaah)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*10/100, Vohq*50/100)) ; ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*20/100, vbigaah*50/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(voh*60/100, Voh)) ; oh
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Utility.Randomint(Veh*50/100, Veh)) ; eh

			endif


		endif
			

		elseif ASLcurrentlyintense 

		blink = Utility.Randomint(0, vblink)
		browin = Utility.Randomint(Vbrowin*70/100, Vbrowin)
		browup = Utility.Randomint(vbrowup*70/100, vbrowup)
	; eyes modifier

		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		
		if normalexpressionpath >= 2
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink			
		else
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, 0) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, 0) ;right blink	
		endif
		
		
		;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" ;Involve oral		
			surprise =  Utility.Randomint(Vmaxexpressionstrength*70/100, Vmaxexpressionstrength)
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,voh); oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Vaah); aah
			
		;No Oral Stage Phoneme	
		else
			if ishugepp()
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Utility.Randomint(Veee*50/100, Veee)) ; eee
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*50/100, Vohq)) ; ohq
			elseif normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*70/100, Vaah)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*10/100, Vohq*50/100)) ; ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*20/100, vbigaah*50/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(voh*60/100, Voh)) ; oh
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Utility.Randomint(Veh*50/100, Veh)) ; eh

			endif

		endif
		else
	;non intense stage
		blink = Utility.Randomint(0, vblink*40/100)
		browin = Utility.Randomint(0, vbrowin*30/100)
		browup = Utility.Randomint(0, vbrowup*30/100)
		squint =  Utility.Randomint(Vsquint*40/100, vsquint)
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink

		
		if !ShouldGoOnTheAttack(currentAnimation)
			MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
			MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		endif
		
		;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" || stagelabel == "TP" ;Involve oral		
			surprise =  Utility.Randomint(vmaxexpressionstrength*70/100, vmaxexpressionstrength)
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Voh); oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Voh); aah

		;No Oral Stage Phoneme	
		else
			if normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*20/100, Vaah*50/100)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*00/100, Vohq*20/100)) ; ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*10/100, vbigaah*30/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(voh*20/100, Voh*60/100)) ; oh
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Utility.Randomint(Veh*20/100, Veh*60/100)) ; eh

			endif

		endif
		
		
	endif

		if stagelabel == "EN"
		blink = Utility.Randomint(vblink*60/100, vblink)
	
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		endif
	
		if ASLIsBroken()
		mainFemaleActor.SetExpressionOverride(4,vmaxexpressionstrength)
		elseIF	ASLIsinSpanking
			if femaleisvictim()
				mainFemaleActor.SetExpressionOverride(6,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			else
				mainFemaleActor.SetExpressionOverride(4,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			endif
		elseif IsaggressivehugePP()
			if normalexpressionpath <=2
				mainFemaleActor.SetExpressionOverride(4,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
			else
				mainFemaleActor.SetExpressionOverride(3,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			endif
		
		MfgConsoleFunc.SetModifier(mainFemaleActor, 11, Utility.Randomint(Vlookup*70/100, Vlookup)) ;look up
		elseif MainFemaleisSuccubus()

		mainFemaleActor.SetExpressionOverride(2,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))

		elseif femaleisvictim() 
			if normalexpressionpath == 1  && !ASLcurrentlyIntense
				;disgust when victim
				mainFemaleActor.SetExpressionOverride(6,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			elseif normalexpressionpath == 2
				;sad when victim
				mainFemaleActor.SetExpressionOverride(3,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			else
				; fear when victim
				mainFemaleActor.SetExpressionOverride(1,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			endif
		
		mainFemaleActor.SetExpressionOverride(3,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))

		elseif ShouldGoOnTheAttack(currentAnimation)
		;happy while attacking 
		mainFemaleActor.SetExpressionOverride(2,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Utility.Randomint(0, Veee)) ; eee
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(0, Vohq)) ; ohq
		else
		;happy or surprised for consensual
			if normalexpressionpath == 1 
				mainFemaleActor.SetExpressionOverride(2,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			elseif normalexpressionpath == 2
				mainFemaleActor.SetExpressionOverride(4,Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			else
				mainFemaleActor.SetExpressionOverride(4/Utility.Randomint(1, 2),Utility.Randomint(vmaxexpressionstrength*50/100, vmaxexpressionstrength))
			endif
	endif

else ;non elin human race
	;broken expression
	if stagelabel == "EN"
		
		blink = Utility.Randomint(vblink*60/100, Vblink)
	
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		if Previousstagelabel == "FB" || Previousstagelabel == "SB"
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah)  ; bigaah
		else
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,vaah*50/100)  ; aah
		endif
	elseif ASLIsBroken();
		blink = Utility.Randomint(vblink*40/100, vblink*80/100)
		browin = Utility.Randomint(vbrowin*70/100, vbrowin)
		browup = Utility.Randomint(Vbrowup*70/100, Vbrowup)
		surprise =  Utility.Randomint(vmaxexpressionstrength*70/100, vmaxexpressionstrength)
	
	;Eyes Modifier
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R	
	
	;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" ;Involve oral		
			surprise =  Utility.Randomint(vmaxexpressionstrength*70/100, vmaxexpressionstrength)
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0); oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,0) ; aah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah)  ; bigaah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ; ohq
	;No Oral Stage Phoneme	
		else
		
			if normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*20/100, vbigaah*60/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*70/100, Voh)) ; oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*60/100, Vohq)) ; ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*20/100, vbigaah*60/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*60/100, Vaah)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*60/100, Vohq)) ; ohq
		;	MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,0)  ; bigaah
			;MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0); oh
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*0/100, Vaah*40/100)) ; aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*0/100, vbigaah*50/100))  ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*0/100, Voh*40/100)) ; oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*0/100, Vohq*40/100)) ; ohq
			endif


		endif
	elseif ASLcurrentlyintense 

		blink = Utility.Randomint(0, vblink)
		browin = Utility.Randomint(vbrowin*70/100, vbrowin)
		browup = Utility.Randomint(vbrowup*70/100, vbrowup)
	; eyes modifier

		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		
		if normalexpressionpath >= 2
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink			
		else
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, 0) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, 0) ;right blink	
		endif
		;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" || stagelabel == "TP" ;Involve oral		
			;surprise =  Utility.Randomint(vmaxexpressionstrength*70/100, vmaxexpressionstrength)

			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0); oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,0) ; aah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah)  ; bigaah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ; ohq

		;No Oral Stage Phoneme	
		else
			if normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,0); big aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*20/100, voh * 70/100)); oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(vohq*60/100, Vohq)); ohq
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*40/100, Vaah*80/100)); ah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*20/100, voh*60/100)); oh
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(0, Vaah*50/100)); ah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(0, voh*50/100)); oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(0, vbigaah*50/100)) ; bigaah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(0, Vohq)); ohq
			endif
		endif
	else
	;non intense stage
		blink = Utility.Randomint(0, Vblink*40/100)
			
		
		;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" || stagelabel == "TP";Involve oral		

			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0); oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,0) ; aah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah)  ; bigaah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ; ohq

		;No Oral Stage Phoneme	
		else
			
			if	ShouldGoOnTheAttack(currentAnimation)
				if normalexpressionpath == 1
					MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*30/100, voh*60/100)); oh
				elseif	normalexpressionpath == 2
					MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*0/100, vbigaah*40/100))  ; bigaah
				elseif	normalexpressionpath == 3	
					MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*0/100, Vaah*35/100)); ah
				endif
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Utility.Randomint(0, Veee*50/100)) ; eee
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Utility.Randomint(0,Veh*50/100)); eh
			elseif normalexpressionpath == 1
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*30/100, voh*60/100)); oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Utility.Randomint(Vohq*40/100, Vohq)); ohq
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*0/100, vbigaah*40/100))  ; bigaah
			elseif normalexpressionpath == 2
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(vaah*30/100, vaah*80/100)) ;aah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*20/100, vbigaah*60/100))  ; bigaah
			elseif normalexpressionpath == 3
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(Vaah*0/100, Vaah*35/100)); ah
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,Utility.Randomint(voh*0/100, voh*35/100)); oh
				MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,Utility.Randomint(vbigaah*0/100, vbigaah*45/100)) ; bigaah
			endif
		endif
		
		
	endif


	
	IF	ASLIsinSpanking
		mainFemaleActor.SetExpressionOverride(6,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
		
	elseif IsaggressivehugePP()
		if normalexpressionpath <=2
			mainFemaleActor.SetExpressionOverride(4,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
		else
			mainFemaleActor.SetExpressionOverride(1,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
		endif
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Utility.Randomint(Veee*60/100, Veee)) ; eee
	elseif MainFemaleisSuccubus()
		mainFemaleActor.SetExpressionOverride(2,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
	elseif femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < 0.5
		mainFemaleActor.SetExpressionOverride(1,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
	elseif femaleisvictim()
		mainFemaleActor.SetExpressionOverride(3,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
	elseif ShouldGoOnTheAttack(currentAnimation)
		mainFemaleActor.SetExpressionOverride(2,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
			
	else
		mainFemaleActor.SetExpressionOverride(Utility.Randomint(1, 5),Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
	endif



endif

	timeOfLastNormalExpressionUpdate = sexLabThreadController.TotalTime
endif	


endfunction


;variety ahegao expressions
Function UpdateAhegaoExpression(Bool ForceChange = false)

if UseHentaiExpressionNG == 1
	return
elseif EnableHentaiIVDTAhegaoExpressions != 1
	return
endif

Race FemaleActorRace = mainFemaleActor.GetRace()
String FemaleRaceName = FemaleActorRace.GetName()
int blink = 0
int browin = 0
int browup = 0
int squint = 0


if  EquippedTongue() && StorageUtil.GetIntValue(None, "ASLOrgasm") == 0 && 	(sexLabThreadController.TotalTime - timeOfLastAhegaoExpressionUpdate >= 3 || ForceChange == true) && PauseExpressionUpdate == false
;if Ahegao is trigged by SLS or tongue

if !ASLIsBroken()	
	if currentAnimation.hastag("Cowgirl") && CurrentPenetrationLvl() > 1

		MfgConsoleFunc.SetModifier(mainFemaleActor, 8, Vlookdown) ;look down
	elseif  (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style")) && CurrentPenetrationLvl() > 1 && !FemaleisGiving()
		if NormalExpressionLookleftorRight == 1
			MfgConsoleFunc.SetModifier(mainFemaleActor, 9, vlookleftright) ;look left 
		elseif NormalExpressionLookleftorRight == 2  ;look right 
			MfgConsoleFunc.SetModifier(mainFemaleActor, 10, vlookleftright)
		
		endif
	endif

endif
int surprise = 0
;if its elin race
if FemaleRaceName =="Elin" || FemaleRaceName =="Erin"


		MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah) ; big aah
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Vohq) ; oh q
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Veee*30/100) ; eee
	if stagelabel == "EN"
		blink = Utility.Randomint(vblink*60/100, Vblink)
	
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
	
	elseif ASLIsBroken();currentlyintense 
		blink = Utility.Randomint(vblink*20/100, Vblink)
		browin = Utility.Randomint(vbrowin*40/100, vbrowin)
		browup = Utility.Randomint(vbrowup*40/100, vbrowup)
		surprise =  Utility.Randomint(vmaxexpressionstrength*70/100, vmaxexpressionstrength)
		
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 11, Vlookup) ;look up
		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		

		


	;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" ;Involve oral
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,voh)  ; oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Vaah) ; aah

		endif
		
		
	else
		blink = Utility.Randomint(0, vblink*80/100)
		browin = Utility.Randomint(vbrowin*20/100, vbrowin*60/100)
		browup = Utility.Randomint(vbrowup*20/100, vbrowup *60/100)
		surprise =  0
		
		if normalexpressionpath >= 2
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink			
		else
			MfgConsoleFunc.SetModifier(mainFemaleActor, 0, 0) ;left blink
			MfgConsoleFunc.SetModifier(mainFemaleActor, 1, 0) ;right blink	
		endif
		
		if !ShouldGoOnTheAttack(currentAnimation)
			MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 5, browin) ;brow in R
			MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
			MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		endif
		
		
			;Oral Stage Phoneme
		if  stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" ;Involve oral	
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,voh) ; oh
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,vaah); aah
			
		endif
	endif
	


		
	if ASLisBroken()
		mainFemaleActor.SetExpressionOverride(4,surprise)
		
	elseif IsaggressivehugePP()
		
			if normalexpressionpath <=2
				mainFemaleActor.SetExpressionOverride(4,Utility.Randomint(Vmaxexpressionstrength*50/100, Vmaxexpressionstrength))
			else
				mainFemaleActor.SetExpressionOverride(Utility.Randomint(1, 3),Vmaxexpressionstrength)
			endif
	elseif MainFemaleisSuccubus()
		mainFemaleActor.SetExpressionOverride(2,Vmaxexpressionstrength)

	elseif femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < 0.5	
		mainFemaleActor.SetExpressionOverride(1,Vmaxexpressionstrength)

	elseif femaleisvictim()
		mainFemaleActor.SetExpressionOverride(3,Vmaxexpressionstrength)

	elseif ShouldGoOnTheAttack(currentAnimation)
		mainFemaleActor.SetExpressionOverride(2,Vmaxexpressionstrength)

	else
		mainFemaleActor.SetExpressionOverride(Utility.Randomint(1, 5),Vmaxexpressionstrength)

	endif
else

	;non Elin human race
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,0); aah
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah); big ah
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Veh); eh
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,11,0) ; oh
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,0) ;OhQ
	
	if stagelabel == "EN"
		blink = Utility.Randomint(vblink*60/100, Vblink)
	
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0, blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
	elseif ASLisBroken()
	
		blink =  Utility.Randomint(vblink*40/100, vblink)
		browin = Utility.Randomint(Vbrowin*70/100, Vbrowin)
		browup = Utility.Randomint(vbrowup*70/100, vbrowup)
		squint =  Utility.Randomint(0, Vsquint*40/100)
		MfgConsoleFunc.SetModifier(mainFemaleActor, 11, Vlookup) ;look up
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0,blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5,browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 12, squint) ;left squint
		MfgConsoleFunc.SetModifier(mainFemaleActor, 13, squint) ;right squint
		; intense
	elseif ASLcurrentlyintense 
		blink = Utility.Randomint(vblink*20/100, vblink*60/100)
		browin = Utility.Randomint(Vbrowin*70/100, Vbrowin)
		browup = Utility.Randomint(vbrowup*70/100, vbrowup)
		squint =  Utility.Randomint(Vsquint*60/100, Vsquint*80/100)
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0,blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5,browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 12, squint) ;left squint
		MfgConsoleFunc.SetModifier(mainFemaleActor, 13, squint) ;right squint
	; non intense
	else
		blink = Utility.Randomint(0, VBlink*40/100)
		browin = Utility.Randomint(0, browin*40/100)
		browup = Utility.Randomint(0, browup*40/100)
		squint =  Utility.Randomint(Vsquint*40/100, Vsquint)
		MfgConsoleFunc.SetModifier(mainFemaleActor, 11, 0) ;look up
		MfgConsoleFunc.SetModifier(mainFemaleActor, 0,blink) ;left blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 1, blink) ;right blink
		MfgConsoleFunc.SetModifier(mainFemaleActor, 4, browin) ;brow in L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 5,browin) ;brow in R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 6, browup) ;Brow Up L
		MfgConsoleFunc.SetModifier(mainFemaleActor, 7, browup) ;Brow Up R
		MfgConsoleFunc.SetModifier(mainFemaleActor, 12, squint) ;left squint
		MfgConsoleFunc.SetModifier(mainFemaleActor, 13, squint) ;right squint
		
	endif
		
	if IshugePP()
		mainFemaleActor.SetExpressionOverride(Utility.Randomint(1, 3),Vmaxexpressionstrength)

	elseif MainFemaleisSuccubus()
		mainFemaleActor.SetExpressionOverride(2,Vmaxexpressionstrength)

	elseif femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < 0.5
		mainFemaleActor.SetExpressionOverride(1,Vmaxexpressionstrength)

	elseif femaleisvictim()
		mainFemaleActor.SetExpressionOverride(3,Vmaxexpressionstrength)

	elseif ShouldGoOnTheAttack(currentAnimation)
		mainFemaleActor.SetExpressionOverride(2,Vmaxexpressionstrength)
		MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Veee * 60/100) ; eee
	else
		mainFemaleActor.SetExpressionOverride(Utility.Randomint(1, 5),Vmaxexpressionstrength)
	endif
	
endif	

timeOfLastAhegaoExpressionUpdate = sexLabThreadController.TotalTime
	
endif	
endfunction

;new functions for using Anim stage labels
;things to DO
;BLOW JOB


	
Function ASLUPDATE()
;check if thread is still running for PC
bool StageTransitioning = false

if SexLab.FindPlayerController() == -1
ASLEndScene()
else
	
	;initialize certain variables if different animation or stage
	if currentAnimation != SexLabThreadController.Animation || currentStage != SexLabThreadController.Stage
			currentStage = SexLabThreadController.Stage
			currentAnimation = SexLabThreadController.Animation	
			timeOfLastStageStart = sexLabThreadController.TotalTime
			
			if ishugepp()
				StorageUtil.SetIntValue(None, "HentaiHugePP", 1)
			else
				StorageUtil.SetIntValue(None, "HentaiHugePP", 0)
			endif
			
			Previousstagelabel = stagelabel
			stagelabel = animstagelabels.getlabel(CurrentAnimation , currentstage)
		;miscutil.PrintConsole ("DEBUG : Different Stage or Animation. Setting Stage Variables")
		;multiply stage timers for certain NPC traits
		float TimerMultiplier = 1
		;longer timers for Aggressive NPC
	if MainMaleCanControl()
		if GetMainNPCTrait() == "Aggressive+" && (stagelabel == "FA" ||  stagelabel == "FV" || (stagelabel == "DP" && Currentstage > 1) || (stagelabel == "SR" && Currentstage > 1) || (stagelabel == "TP" && Currentstage > 1))
			TimerMultiplier = 2
		elseif GetMainNPCTrait() == "Aggressive+" && stagelabel == "LI"
			TimerMultiplier = 0.5
		elseif GetMainNPCTrait() =="Rape Loving+" && femaleisvictim() && CurrentPenetrationLvl() >= 2 && stagelabel != "EN"
			TimerMultiplier = 1.5
		elseif GetMainNPCTrait() =="Pussy Loving+" && CurrentPenetrationLvl() == 2 && stagelabel != "EN"
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="Anal Loving+" && CurrentPenetrationLvl() == 3 && stagelabel != "EN" 
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="+The Penetrator" && CurrentPenetrationLvl() >= 2 && stagelabel != "EN"
			TimerMultiplier = 1.5
		elseif GetMainNPCTrait() =="Oral Loving+" && CurrentPenetrationLvl() >= 1 && (currentAnimation.hastag("aggressive") ||currentAnimation.hastag("forced") || currentAnimation.hastag("rape")) && stagelabel != "EN"
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="Sexually Frustrated+"	&& CurrentPenetrationLvl() >= 2
			TimerMultiplier = 1.5 
		elseif GetMainNPCTrait() =="+The Nut Gobbler" && CurrentPenetrationLvl() == 1
			TimerMultiplier = 2 
		elseif GetMainNPCTrait() =="+Cowgirl" && currentAnimation.hastag("cowgirl") && CurrentPenetrationLvl() >= 2
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="+In Heat"&& currentAnimation.hastag("cowgirl") && CurrentPenetrationLvl() >= 2
			TimerMultiplier = 1.3
		endif
	endif
			;miscutil.printconsole("StageLabel : " + stagelabel +"TimerMultiplier :" + TimerMultiplier )
		if actorWithSceneTrackerSpell == mainFemaleActor
			ASLStagetimetoadvance = sexLabThreadController.TotalTime  + (sexLabThreadController.gettimer() * TimerMultiplier)
			SetActorScale()
			StageTransitioning = true
			
		
				if stagelabel == "None" 
					if currentstage ==  CurrentAnimation.stagecount
					stagelabel = "EN"
					else
					stagelabel = "LI"
					endif
				endif
			;set intensity
			ASLpreviouslyintense = ASLcurrentlyIntense

			if stagelabel == "FA" ||  stagelabel == "FV" || (stagelabel == "DP" && Currentstage > 1) || (stagelabel == "SR" && Currentstage > 1) || (stagelabel == "TP" && Currentstage > 1) || stagelabel == "FB"
				ASLCurrentlyintense = true
			else
				ASLCurrentlyintense = false
			endif
		elseif actorWithSceneTrackerSpell == mainMaleActor
			
			stagelabel = animstagelabels.getlabel(CurrentAnimation , currentstage)
			
			if stagelabel == "None" 
				if currentstage ==  CurrentAnimation.stagecount
					stagelabel = "EN"
				else
					stagelabel = "LI"
				endif
			endif
			;set intensity
			ASLpreviouslyintense = ASLcurrentlyIntense

			if stagelabel == "FA" ||  stagelabel == "FV" || (stagelabel == "DP" && Currentstage > 1) || (stagelabel == "SR" && Currentstage > 1) || (stagelabel == "TP" && Currentstage > 1) || stagelabel == "FB"
				ASLCurrentlyintense = true
			else
				ASLCurrentlyintense = false
			endif
			
			
		endif

	endif
	
	;set intense as false if weak NPC
	if GetMainNPCTrait() != "Weak+"
		ASLCurrentlyintense = false
	endif
	
	mainFemaleEnjoyment = GetActorEnjoyment(mainFemaleActor)
	mainMaleEnjoyment = GetActorEnjoyment(mainMaleActor)
	
	

	
;calculate time needed to advance stage
	;miscutil.PrintConsole ("DEBUG : current anim stage : " + currentstage)
	;miscutil.PrintConsole ("DEBUG : ASL stage is : " + stagelabel)


if StageTransitioning && actorWithSceneTrackerSpell == mainFemaleActor
	;miscutil.PrintConsole ("DEBUG : Stage Transitioning")
	ASLPlayStageTransition()
endif
;miscutil.PrintConsole ("DEBUG : ASL Updating Step 3")

endif
endfunction

Function ASLPlayLI() ;Leadin

if ASLIsBroken()
ASLPlayBrokenVoice()
	;miscutil.PrintConsole ("IVDT is playing animstagelabelPlayLI")
elseif currentstage > 1 && femaleCloseToOrgasm()		
	ASLPlayFemaleOrgasmHype()
else

if currentstage < 3 ;greets only on first 2 LI stages	
		;unamused lines if is victim
	if AllowMaleVoice()
		ASLPlayMaleComments()
	endif
	if  ShouldMakeRomanticComment()
		MakeRomanticCommentIfRightTime()
	;If FemaleIsVictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused && !femaleCloseToOrgasm() 
		;PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0)
	;greet huge PP
	elseif ishugepp() && shouldgoontheattack(currentAnimation) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLIStage
		ChangeHentaiExpression("Greeting")
		PlaySound(mainFemaleVoice.GreetLoadedFamiliar, mainFemaleActor, requiredChemistry = 1)
	;make greeting at 7% chance at 1st stage
	elseif !femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLIStage && Currentstage == 1
		ASLMakeGreetingToMalePartner()
	endif
endif	
	
	
	if Previousstagelabel == "EN" ; for some reason if the EN stage was extended into LI	
		ChangeHentaiExpression("Panting")
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0)
	elseif Utility.RandomFloat(0.0, 1.0) < 0.5 && mainFemaleEnjoyment >= 30 && Currentstage > 2
		ChangeHentaiExpression("Grunt")
		PlaySound(mainFemaleVoice.ForeplayIntense, mainFemaleActor, requiredChemistry = 0)
	elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLIStage * 2 && mainFemaleEnjoyment >= 50 && !FemaleIsVictim()
		ChangeHentaiExpression("WantMore")
		PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 0)	
	else
		
		PlayBreathyorforeplaysound()

	endif
endif
endfunction

Function ASLPlaySBFB() ;blowjob

if FemaleisGiving()
	MfgConsoleFunc.SetPhoneme(mainMaleActor,1,100) ; big aah
endif

if	mainFemaleActor.IsEquipped(Tongue)  
ASLRemoveTongue()
endif
	;miscutil.PrintConsole ("IVDT is playing ASLPlaySBFB")

If femaleCloseToOrgasm() && (stagelabel == "SR" || stagelabel == "TP") ;When female close to orgasm
	ASLPlayFemaleOrgasmHype()	
else	
	if !femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLIStage && Currentstage == 1 && stagelabel != "TP" && stagelabel != "SR"
		ASLMakeGreetingToMalePartner()
	endif

if VoiceVariation == "A"
	if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
		ASLPlayMaleClosetoOrgasmComments()
	elseif ActorsInPlay[0] != mainFemaleActor
		PlayBreathyorforeplaysound()
	elseif !femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononBlowjobStage && ShouldPlayMaleOrgasmHype()
		PossiblyAskForCumInSpecificLocation()
	elseif Utility.RandomFloat(0.0, 1.0) <= ChanceToCommentononBlowjobStage && (stagelabel == "FB" || stagelabel == "SR" || stagelabel == "TP")
		ChangeHentaiExpression("intensepenetrationcomments")
		PlaySound(mainFemaleVoice.AppreciatePartner, mainFemaleActor, requiredChemistry = 0)
	elseif Utility.RandomFloat(0.0, 1.0) <= ChanceToCommentononBlowjobStage && !femaleisvictim() && !ASLIsBroken() && !ASLcurrentlyIntense
		ChangeHentaiExpression("penetrationcomments")
		PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry = 0)
	elseif (stagelabel == "FB" || stagelabel == "SR" || stagelabel == "TP")
		ChangeHentaiExpression("intensegrunt")
		PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry = 0)
	else
		ChangeHentaiExpression("grunt")
		PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0)
	endif
else	
	if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
		ASLPlayMaleClosetoOrgasmComments()
	elseif FemaleisGiving()
		PlayBreathyorforeplaysound()
	elseif !femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononBlowjobStage && ShouldPlayMaleOrgasmHype() 
		PossiblyAskForCumInSpecificLocation()
	elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononBlowjobStage && currentstage > 1 && !femaleisvictim() && !ASLIsBroken()
		ChangeHentaiExpression("penetrationcomments")
		PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry = 0)
	elseif stagelabel == "FB" || stagelabel == "SR" || stagelabel == "TP"
		ChangeHentaiExpression("intensegrunt")
		PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry = 0)
	else
		ChangeHentaiExpression("grunt")
		PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0)
	endif
endif
endif	

endfunction

Function ASLPlaySASV() ; play voices for SA SV
	;miscutil.PrintConsole ("IVDT is playing ASLPlaySASV")
;lactate throughout the scene if have hentai lactate mod
if  GetMainNPCTrait() == "+The Milker" 
	Lactate()
endif 
;add tongue immediately if is penetrator
if GetMainNPCTrait() =="+The Penetrator" 
	ASLAddTongue()
endif

if shouldgoontheattack(currentAnimation) 	;go on the attack scenario
	;miscutil.PrintConsole ("IVDT is playing ASLPlayGoOnTheAttack")
	ASLPlayGoOnTheAttack()
elseif ASLIsBroken()
	ASLPlayBrokenVoice()
elseif ishugePP()	
	;miscutil.PrintConsole ("IVDT is playing ASLPlayHugePPPenetrationSound")
	ASLPlayHugePPPenetrationSound()
else
	;chance of unamused if victim
	If femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused && !femaleCloseToOrgasm() && !MainFemaleisSuccubus()
		ChangeHentaiExpression("unamused")
		PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0)
	EndIf

	if AllowMaleVoice();chance of male commenting
		ASLPlayMaleComments()	
	endif
	; Normal scenario
		if CommentedClosetoOrgasm
			ChangeHentaiExpression("grunt")
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
		elseIf femaleCloseToOrgasm() ;When female close to orgasm
			ASLPlayFemaleOrgasmHype()
		elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
			ASLPlayMaleClosetoOrgasmComments()
		elseIf  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage/2 && !femaleisvictim()
			ChangeHentaiExpression("amused")
			PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 3)
		elseIf  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
			ASLPlayPenetrationComments()
		Else
			ChangeHentaiExpression("grunt")
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
		EndIf

endif

endfunction

Function ASLPlayEN() ;Play for EN 
;end of scene comments

;remove cum leak the before the next round of comments
ASLRemoveThickCumleak()


UpdateAhegaoExpression()
UpdateNormalExpression()
UpdatePauseExpressionflag()


;chance to leak cum 
if  Utility.RandomFloat(0.0, 1.0) < ChanceToLeakThickCum && CameInsideCount > 0 && ASLDoneLeakingCum == false 
	ASLAddThickCumleak()
	ChangeHentaiExpression("kneejerk")

	PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 3)
	ASLDoneLeakingCum = true
endif

StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)

if ASLIsBroken()
	ASLPlayBrokenVoice()
else	
	
	if maleOrgasmCount > 0 && commentedcumlocation == false && !femaleisvictim() && !FemaleisGiving()
		commentedcumlocation = true
		PossiblyRemarkOnCumLocation()
	elseif MaleCommentsonEN == false && AllowMaleVoice() 
		;miscutil.PrintConsole ("Playing Male Comments EN stage")
		if MaleIsVictim()
			PlaySound(mainMaleVoice.TeaseAggressivePartner, mainMaleActor, soundPriority = 2 , waitForCompletion = False)
		else
			PlaySound(mainMaleVoice.PostNutRemark, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = false)
		endif
		Utility.Wait(Utility.RandomFloat(1.0, 2.0))
		ChangeHentaiExpression("panting")
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0)
	elseif commentedorgasmremark == false  && Utility.RandomFloat(0.0, 1.0) < 0.3
		commentedorgasmremark = true
			If	femaleisvictim() && Utility.RandomFloat(0, 1.0) < ChanceToCommentUnamused * 4
				ChangeHentaiExpression("unamusedending")
				PlaySound(mainFemaleVoice.UnamusedEnd, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
		elseif	femaleRecordedOrgasmCount > Utility.RandomInt(2, 5) && Utility.RandomFloat(0.0, 1.0) < 0.5 && !FemaleisGiving()
				ChangeHentaiExpression("ending")
				PlaySound(mainFemaleVoice.MadeMeCumSoMuch, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
		EndIf
	elseif !IshugePP() && shouldgoontheattack(currentAnimation) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage
		ChangeHentaiExpression("amused")
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0)
	else
		ChangeHentaiExpression("panting")
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0)
	endif
ENDIF
endfunction

Function ASLPlayFAFV() ; play voices for FA FV
;lactate throughout the scene if have hentai lactate mod
if  GetMainNPCTrait() == "+The Milker" && MainMaleCanControl()
	Lactate()
endif 

;add tongue immediately if is penetrator
if GetMainNPCTrait() =="+The Penetrator" 
	ASLAddTongue()
endif
	;miscutil.PrintConsole ("IVDT is playing ASLPlayFAFV")
	if  Utility.RandomFloat(0.0, 1.0) < ChanceToStickoutTongueDuringIntense && !equippedtongue()
		ASLAddTongue()
	endif
	
		;miscutil.PrintConsole ("ishumanoidrace : " + isHumanoidrace())
	;	miscutil.PrintConsole ("can spank : " + isHumanoidrace() && Utility.RandomFloat(0.0, 1.0) < ChanceTohaveSpanking && (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Standing") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style")))
	if isHumanoidrace() && Utility.RandomFloat(0.0, 1.0) < ChanceTohaveSpanking && (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Standing") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style"))
		PlaySpankingSequence()
	endif
if ishugePP()	
	;miscutil.PrintConsole ("IVDT is playing ASLPlayHugePPPenetrationSound")

	ASLPlayHugePPPenetrationSound()
else

		if AllowMaleVoice() ;  chance of male commenting
			ASLPlayMaleComments()
		endif
	; Normal scenario
	
		if CommentedClosetoOrgasm
			ChangeHentaiExpression("intensegrunt")
			PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 )
		elseIf femaleCloseToOrgasm()  ;When female close to orgasm
			ASLPlayFemaleOrgasmHype()
		elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm && !ASLisBroken() ; when male close to orgasm
			ASLPlayMaleClosetoOrgasmComments()

		elseIf	shouldgoontheattack(currentAnimation) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononIntenseStage
			ChangeHentaiExpression("inawe")
			PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0)
		elseIf CurrentPenetrationLvl() == 3 && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononIntenseStage
			ChangeHentaiExpression("intensepenetrationcomments")
			PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry = 0)
		elseIf  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononIntenseStage
			ASLPlayPenetrationComments()
		Elseif Utility.RandomFloat(0.0, 1.0) < 0.10 
			ChangeHentaiExpression("overthetop")
			PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0)
		else
			ChangeHentaiExpression("intensegrunt")
			PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 )
		EndIf

endif	

endfunction

Function ASLPlayGoOnTheAttack() ; when on the attack scenario
	;miscutil.PrintConsole ("IVDT is playing ASLPlayGoOnTheAttack")
if Utility.RandomFloat(0.0, 1.0) < ChanceToStickOutTongueDuringAttacking && !equippedtongue()
	ASLaddtongue()
endif

if AllowMaleVoice() ;  chance of male commenting
	ASLPlayMaleComments()
endif

if CommentedClosetoOrgasm
	ChangeHentaiExpression("grunt")
	PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
elseIf ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm  ;if male close or orgasm
	ASLPlayMaleClosetoOrgasmComments()

elseIf femaleCloseToOrgasm() ;When female close to orgasm
	ASLPlayFemaleOrgasmHype()

else
	;make greeting 
	if Utility.RandomFloat(0.0, 1.0)  < ChanceToCommentonLIStage && currentstage == 1 && (stagelabel == "SA" || stagelabel == "SV" || stagelabel == "LI")
		ASLMakeGreetingToMalePartner()
	endif
	
	if femaleisgiving() ;main female penetrating others as futa or strapon
		if ASLIsBroken()
				ASLPlayBrokenVoice()	
		elseIf Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage
				ChangeHentaiExpression("attackingcomments")
				PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry = 0)	
		elseIf	Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/3
				ChangeHentaiExpression("inawe")
				PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0)
		elseif	Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/3
				ChangeHentaiExpression("amused")
				PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0)
		else	
			ChangeHentaiExpression("grunt")
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
		EndIf		
	elseif CurrentPenetrationLvl() > 1
			;Chance to mix in grunts with thrusts
			if ASLIsBroken()
				ASLPlayBrokenVoice()	
			elseIf Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage
				ChangeHentaiExpression("attackingcomments")
				PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry = 0)	
			ElseIf Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/2
				ASLPlayPenetrationComments()
			Elseif currentstage <= 2
				PlayBreathySound(false)
			else	
				ChangeHentaiExpression("grunt")
				PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
			EndIf

	endif		

			
endif

			
			
			
	
EndFunction

Function ASLPlayHugePPPenetrationSound() ; when on huge pp scenario
;miscutil.PrintConsole ("IVDT is playing ASL huge pp penetration sound")

if CommentedClosetoOrgasm
	ChangeHentaiExpression("overthetop")
	PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0)
elseif femaleCloseToOrgasm() 
	ASLPlayFemaleOrgasmHype()
else
	if ASLCurrentlyintense	
		if CurrentPenetrationLvl() == 3 && utility.RandomFloat(0.0, 1.0) < ChanceToCommentononIntenseStage
			ChangeHentaiExpression("intensepenetrationcomments")
			PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry = 0)
		elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononIntenseStage
			ASLPlayPenetrationComments()
		else
			ChangeHentaiExpression("overthetop")
			PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0)
		endif
	else
		

		if ShouldGoOnTheAttack(currentAnimation) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage * 0.7
			ChangeHentaiExpression("inawe")
			PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 1)
		elseif ShouldGoOnTheAttack(currentAnimation) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
			ChangeHentaiExpression("amused")
			PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry = 0) 
		endif
		; breath and gape breath and gape. ASL SA FA reserved for large pp creature piston cycle time > 2 seconds
		if Utility.RandomFloat(0.0, 1.0) < 0.7
			PlayBreathySound(True)
		else
			ChangeHentaiExpression("grunt")
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
		endif
		
		
		
		if Utility.RandomFloat(0.0, 1.0) < 0.2
			Utility.Wait(Utility.RandomFloat(1.0, 2.0))
			ChangeHentaiExpression("kneejerk")

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 3 )
			Utility.Wait(1.0)
			ChangeHentaiExpression("hugeppgape")

			PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3)
		endif
	endif
endif

EndFunction

Function ASLPlayDP() ;double penetration stage

;DP usually not too intense on first stage
;miscutil.PrintConsole ("IVDT is playing ASLPlayDP")
if femaleCloseToOrgasm()
	ASLPlayFemaleOrgasmHype()
else

	if AllowMaleVoice() ;  chance of male commenting
		ASLPlayMaleComments()	
	endif
	
	if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm
		ASLPlayMaleClosetoOrgasmComments()
		
	elseif ASLCurrentlyintense	;fast dp
	
	
		if  utility.RandomFloat(0.0, 1.0) <= 0.1 
			ChangeHentaiExpression("intensepenetrationcomments")
			PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry = 0)
		elseif Utility.RandomFloat(0.0, 1.0) < 0.2
			ASLPlayPenetrationComments()
		else
			ChangeHentaiExpression("overthetop")
			PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0)
		endif
	else
		; slowly dp
		if Utility.RandomFloat(0.0, 1.0) < 0.5
			PlayBreathySound(true)
		else
			ChangeHentaiExpression("grunt")
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
		endif
		
		if Utility.RandomFloat(0.0, 1.0) < 0.2
			Utility.Wait(Utility.RandomFloat(1.0, 2.0))
			ChangeHentaiExpression("kneejerk")

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 3 )
			Utility.Wait(1.0)
			ChangeHentaiExpression("hugeppgape")

			PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3)
		endif
	endif
endif

EndFunction

function PlayBreathyorforeplaysound()
	ChangeHentaiExpression("LeadIn")
	if ASLCurrentlyintense
		if Utility.RandomFloat(0.0, 1.0) <= 0.5 || stagelabel == "LI"
			PlaySound(mainFemaleVoice.Foreplayintense, mainFemaleActor, requiredChemistry = 0)
		else
			PlayBreathySound(true)
		endif
	else
		if Utility.RandomFloat(0.0, 1.0) <= 0.5 || stagelabel == "LI"
			PlaySound(mainFemaleVoice.Foreplaysoft, mainFemaleActor, requiredChemistry = 0)
		else
			PlayBreathySound(false)
		endif
	endif

endfunction

function ASLPlayMaleClosetoOrgasmComments()
			;miscutil.PrintConsole ("Teasing Male Close to Orgasm")
		;if Utility.RandomFloat(0.0, 1.0) < 0.3 && !femaleisvictim() && !ASLcurrentlyintense
		;	PossiblyAskForCumInSpecificLocation() 
		;else

		if	mainFemaleEnjoyment > 50 && !femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < 0.25
		ChangeHentaiExpression("amused")
		PlaySound(mainFemaleVoice.CumTogetherTease, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
		
		elseif  !OKWithVaginalCum() && (CurrentPenetrationLvl() == 2 || stagelabel == "DP" || stagelabel == "TP")
			ChangeHentaiExpression("pullout")
			PlaySound(mainFemaleVoice.PullOut, mainFemaleActor, requiredChemistry = 0, soundPriority = 2)
		elseif IsEarlyToCum()	&& !ASLCurrentlyintense && !femaleisvictim() && CurrentPenetrationLvl() >= 2
			ChangeHentaiExpression("maleclosetoorgasm")
			PlaySound(mainFemaleVoice.MaleCloseAlready, mainFemaleActor, requiredChemistry = 1, soundPriority = 1)
		elseif shouldgoontheattack(currentAnimation) && !ASLCurrentlyintense	&& CurrentPenetrationLvl() >= 2
			ChangeHentaiExpression("amused")
			PlaySound(mainFemaleVoice.MaleCloseNotice, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
		elseif ASLCurrentlyintense && CurrentPenetrationLvl() >= 2
			ChangeHentaiExpression("maleclosetoorgasmintense")
			PlaySound(mainFemaleVoice.TeaseMaleCloseToOrgasmIntense, mainFemaleActor, requiredChemistry = 1 , soundPriority = 1)
		elseif  CurrentPenetrationLvl() >= 2
			ChangeHentaiExpression("maleclosetoorgasm")
			PlaySound(mainFemaleVoice.TeaseMaleCloseToOrgasmSoft, mainFemaleActor, requiredChemistry = 1 , soundPriority = 1)
		endif
				
		if Utility.RandomFloat(0.0, 1.0) < 0.5 && !femaleisvictim()
			Utility.Wait(Utility.RandomFloat(1.0, 3.0))
			PossiblyAskForCumInSpecificLocation() 
		endif

		teasedClosetoorgasm = true 
		
endfunction

Function ASLPlayFemaleOrgasmHype()
;skip commenting orgasm if orgasm in quick succession
if SexLabThreadController.TotalTime - timeOfLastRecordedFemaleOrgasm <= 8 
	StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
	CommentedClosetoOrgasm = true
	return
endif

if CurrentPenetrationLvl() < 2 && !femaleisvictim()
	ChangeHentaiExpression("greeting")
	PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 0)	
elseif IshugePP() && ASLCurrentlyintense
	If Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
		ChangeHentaiExpression("closetoorgasmintense")
		PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)		
	Else 
		ChangeHentaiExpression("overthetop")
		PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)	
	EndIf

elseif ASLCurrentlyintense
	If Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
		ChangeHentaiExpression("closetoorgasmintense")
		PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	Else 
		ChangeHentaiExpression("intensegrunt")
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	EndIf
else	
	; if not intense and hugepp
	ChangeHentaiExpression("closetoorgasm")
	If VoiceVariation == "NA" && maleOrgasmCount > femaleRecordedOrgasmCount && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && !FemaleIsVictim() && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
		PlaySound(mainFemaleVoice.MyTurnToCum, mainFemaleActor, requiredChemistry = 3 , soundPriority = 1)
	elseif VoiceVariation == "A" && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm  && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
		PlaySound(mainFemaleVoice.MyTurnToCum, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	Elseif VoiceVariation == "NA" && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm  && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
		PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	else
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	EndIf
endif
StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
CommentedClosetoOrgasm = true
;miscutil.PrintConsole ("IVDT Play FemalrOrgasmHype")
;miscutil.PrintConsole ("ASLDoNotAllowFemaleOrgasmYet" + StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet"))

EndFunction

bool function Malewantsmore()

	return mainMaleEnjoyment >= 30

endfunction

function ASLHandlemaleOrgasmreaction()

	
	if maleOrgasmCount > 1 && !femaleisvictim() && stagelabel != "SB" &&  stagelabel != "FB" &&  stagelabel != "SR" && Utility.RandomFloat(0.0, 1.0) < 0.5
		PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	endif

	;a chance to react to male orgasm
		
	if stagelabel == "SB" ||  stagelabel == "FB"
					
		if AllowMaleVoice()
			;	miscutil.PrintConsole ("Playing Male Comments SB FB Joke After Orgasm")
			PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 2, waitForCompletion = false)
		endif	
	ChangeHentaiExpression("intensepenetrationcomments")				
	PlaySound(mainFemaleVoice.CameInMouth, mainFemaleActor, requiredChemistry = 0 , soundPriority = 2)
				; chance for male comments	
				
	elseIf 	ASLCurrentlyintense 
				
		;Chance for male comments	
		if AllowMaleVoice()
		;	miscutil.PrintConsole ("Playing Male Comments intense Joke After Orgasm")
			PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))
		endif
		
		if Utility.RandomFloat(0.0, 1.0) <= 0.4
			ChangeHentaiExpression("intensepenetrationcomments")
			PlaySound(mainFemaleVoice.MaleOrgasmReactionIntense, mainFemaleActor, requiredChemistry = 0, soundPriority = 2)
		endif

	Elseif CurrentPenetrationLvl() > 1
				if AllowMaleVoice()
				;	miscutil.PrintConsole ("Playing Male Comments Non Intense Joke After Orgasm")
					PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
					Utility.Wait(Utility.RandomFloat(0.5, 2.0))
				endif
		if Utility.RandomFloat(0.0, 1.0) <= 0.4	
			if femaleisvictim()
				ChangeHentaiExpression("unamused")
				PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0)
			else
				ChangeHentaiExpression("penetrationcomments")
				PlaySound(mainFemaleVoice.MaleOrgasmReactionSoft, mainFemaleActor, requiredChemistry = 0, soundPriority = 2)
			endif
		endif
	EndIf


	Reactedtomaleorgasm = true
	ASLRemoveThickCumleak()
	;miscutil.PrintConsole ("IVDT Done MaleOrgasm")
	;miscutil.PrintConsole ("ASLMaleOrgasm" + StorageUtil.GetIntValue(None, "ASLMaleOrgasm"))
	
	
endfunction

Function ASLHandleFemaleOrgasmReaction()

	
	if ((Utility.RandomFloat(0.0, 1.0) < 0.4 && ishugepp() ) || Utility.RandomFloat(0.0, 1.0) < 0.2) && femaleRecordedOrgasmCount >=  Utility.RandomInt(2, 4)
		ASLAddTongue()
	endif	

;chance to react after orgasm

if VoiceVariation == "A"

	if	ASLIsBroken()
		PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	elseif FemaleisGiving()
		ChangeHentaiExpression("amused")
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	elseif ASLCurrentlyintense  && Utility.RandomFloat(0.0, 1.0) < 0.6
		ChangeHentaiExpression("intenseafterorgasmcomments")
		PlaySound(mainFemaleVoice.AskForPacingBreak, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < 0.6
		ChangeHentaiExpression("afterorgasmcomments")
		PlaySound(mainFemaleVoice.AfterOrgasmRemarks, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < 0.3
		ChangeHentaiExpression("panting")
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	else
		ASLPlayPenetrationComments()
	endif

else
	if	ASLIsBroken()
		ChangeHentaiExpression("grunt")
		PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	elseif FemaleisGiving()
		ChangeHentaiExpression("amused")
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	elseif ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < 0.6
		ASLPlayPenetrationComments()

	elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < 0.3
		ChangeHentaiExpression("panting")
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	else
		ChangeHentaiExpression("afterorgasmcomments")
		PlaySound(mainFemaleVoice.AfterOrgasmRemarks, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	endif
endif
	
If mainMaleActor != None && Utility.RandomFloat(0.0, 1.0) < 0.5 && !FemaleIsVictim()  && !ASLCurrentlyintense
	If !FemaleIsSatisfied() && CurrentPenetrationLvl() > 1 
			Utility.Wait(Utility.RandomFloat(1.0, 2.0))
			ChangeHentaiExpression("wantmore")
			PlaySound(mainFemaleVoice.WantMore, mainFemaleActor, requiredChemistry = 5, soundPriority = 1)
	else
		ChangeHentaiExpression("amused")
		PlaySound(mainFemaleVoice.Satisfied, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	EndIf
EndIf	


Reactedtofemaleorgasm = true
;miscutil.PrintConsole ("IVDT Done Orgasm")
;miscutil.PrintConsole ("ASLDoNotAllowFemaleOrgasmYet" + StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet"))
;miscutil.PrintConsole ("ASLOrgasm" + StorageUtil.GetIntValue(None, "ASLOrgasm"))
endfunction

Function ASLPlayStageTransition()
;miscutil.PrintConsole ("DEBUG : Playing Stage Transition")
if currentStage >= 3
	ShouldInitialize = true
endif

if CurrentPenetrationLvl() > 1
	timesGaped += 1
endif	
	RunNPCUpdates()
	ResetExpressionvalues()	
	if stagelabel != previousstagelabel && usehentaiexpressionng != 1
		if !equippedtongue()
			MfgConsoleFunc.ResetPhonemeModifier(mainFemaleActor)
		endif
	endif
	
	Utility.Wait(Utility.RandomFloat(0.5, 1.0)) ; wait up to 1 second for transition to complete before playing voice
	
		if equippedtongue() &&  usehentaiexpressionng == 1
			ChangeHentaiExpression("tongueoverride")
		elseif equippedtongue()
			UpdateAhegaoExpression()
		else
			UpdateNormalExpression()
		endif

	
		;Female knee-jerk reaction on stage transition	
		BodySwitchtoLewdArmor()

		
		
	if mainFemaleEnjoyment >= 90
		return
	elseif !MainMaleCanControl()  && previousstagelabel == "EN" && CurrentPenetrationLvl() >= 1
			ChangeHentaiExpression("amused")
			PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	elseif	CurrentPenetrationLvl() >= 1 && previousstagelabel == "EN" && MainMaleCanControl()
			ChangeHentaiExpression("kneejerk")

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , SkipWait = true)
			Utility.Wait(Utility.RandomFloat(0.5, 1.5))
		PlaySound(mainFemaleVoice.NoticeMaleWantsMore, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
	elseif stagelabel == "LI" && previousstagelabel == "LI" && !HasDeviousGag(mainFemaleActor)  ;if stage is still leadin
		
		if AllowMaleVoice()
			PlaySound(mainMaleVoice.Aroused, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = false) 
		endif
		PlayBreathyorforeplaysound()
	
	;Transition from no penetration to penetration
	elseif (stagelabel == "FA" || stagelabel == "FV" || stagelabel == "TP" || stagelabel == "DP" || stagelabel == "SA" ||  stagelabel == "SV" ||  stagelabel == "SR") && (currentstage == 1 || previousstagelabel == "LI" || previousstagelabel == "SB" || previousstagelabel == "FB") ;if stage move to slow penetration after leadin or BJ
		
			
			PlaySound(MasterScript.Sounds.PullOutGape, mainFemaleActor, requiredChemistry = 0, soundPriority = 2, waitForCompletion = false)
			IF !HasDeviousGag(mainFemaleActor) 
			ChangeHentaiExpression("kneejerk")
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 )
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))
			endif
		if AllowMaleVoice()
		;	miscutil.PrintConsole ("playing male transition voice no penetration to penetration")
			PlaySound(mainMaleVoice.StrugglingEarly, mainMaleActor, requiredChemistry = 0, soundPriority = 2)
		endif
		IF !HasDeviousGag(mainFemaleActor) && !FemaleisGiving()
			if ASLIsBroken()
				ChangeHentaiExpression("hugeppgape")

				PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3)
			elseIf CurrentPenetrationLvl() >= 2
				if FemaleisGiving()
					ChangeHentaiExpression("amused")
					PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
				elseif ASLCurrentlyintense || ishugePP() 
					ChangeHentaiExpression("intensepenetrationcomments")
					PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)	
				elseif  CurrentPenetrationLvl() == 3
					ChangeHentaiExpression("initialinsertioncomments")
					PlaySound(mainFemaleVoice.InsertionAnalSlow, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
				elseif femaleisvictim() && Utility.RandomFloat(0.5, 1.0) < 0.5
					ChangeHentaiExpression("unamused")
					PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0)
				else
					ChangeHentaiExpression("initialinsertioncomments")
					PlaySound(mainFemaleVoice.InsertionGeneric, mainFemaleActor, requiredChemistry = 0 ,  soundPriority = 1)
				endif
			
			endif
		endif
	;maintain Fast Penetration during Transition  
	elseif ASLpreviouslyintense && ASLCurrentlyintense 
		IF !HasDeviousGag(mainFemaleActor)
			ChangeHentaiExpression("kneejerk")

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 )
			Utility.Wait(Utility.RandomFloat(0.5, 1.5))
		
			if AllowMaleVoice()
			;miscutil.PrintConsole ("playing male transition voice maintain Fast Penetration")
			PlaySound(mainMaleVoice.Aggressive, mainMaleActor, soundPriority = 2 )
			endif
			
			if CurrentPenetrationLvl() == 1
				ChangeHentaiExpression("grunt")
				PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry = 0)
			elseif mainFemaleEnjoyment > 60 && Utility.RandomFloat(0.0, 1.0)  < 0.4
				ChangeHentaiExpression("intensepenetrationcomments")
				PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
			elseif Utility.RandomFloat(0.0, 1.0)  < 0.3
				ChangeHentaiExpression("intensegrunt")
				PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
			elseif FemaleIsVictim()
				ChangeHentaiExpression("intensepenetrationcomments")
				PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)	
			else
				ChangeHentaiExpression("inawe")
				PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
			endif
		endif	
	;Transition from Slow Penetration to Fast Penetration
	elseif (stagelabel == "FA" ||  stagelabel == "FV" ||  stagelabel == "DP" ||  stagelabel == "TP" ||  stagelabel == "SR") && (previousstagelabel == "LI" || previousstagelabel == "SA" ||  previousstagelabel == "SV" || previousstagelabel == "") 
	
			
		if ishugepp() || isDP() 
			
			IF !HasDeviousGag(mainFemaleActor) 
			ChangeHentaiExpression("kneejerk")
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 )
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))
			endif
			
			ChangeHentaiExpression("hugeppgape")
			PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3)


		elseif !FemaleIsVictim() && !HasDeviousGag(mainFemaleActor)
			ChangeHentaiExpression("kneejerk")
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 )
			
			if AllowMaleVoice()
				PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, soundPriority = 2 )
				Utility.Wait(Utility.RandomFloat(0.5, 1.5))
				ChangeHentaiExpression("intensepenetrationcomments")
				PlaySound(mainFemaleVoice.MaleHalfwayIntense, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)	
			endif
				
		else
			IF !HasDeviousGag(mainFemaleActor)
			ChangeHentaiExpression("kneejerk")
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 )
			endif
			if AllowMaleVoice()
				PlaySound(mainMaleVoice.Aggressive, mainMaleActor, soundPriority = 2 )
			endif
			IF !HasDeviousGag(mainFemaleActor) 
			Utility.Wait(Utility.RandomFloat(0.5, 1.5))
			ChangeHentaiExpression("intensepenetrationcomments")
			PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)	
			endif
		endif
		
		;stage with no prior insertion
		;if (previousstagelabel == "LI" || previousstagelabel == "SB" || previousstagelabel == "FB") 
		;	PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , waitForCompletion = False)
		;	if CurrentPenetrationLvl() == 3 &&  Utility.RandomFloat(0.0, 1.0) < 0.7
		;		PlaySound(mainFemaleVoice.InsertionAnalExcited, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
		;	elseif CurrentPenetrationLvl() == 2 && Utility.RandomFloat(0.0, 1.0) < 0.7
		;		PlaySound(mainFemaleVoice.InsertionGeneric, mainFemaleActor, requiredChemistry = 0 ,  soundPriority = 1)
		;	endif
		;endif

		;if non intense after intense penetrative action
	elseif	(previousstagelabel == "FA" ||  previousstagelabel == "FV" ||  previousstagelabel == "DP" ||  previousstagelabel == "TP") && !ASLcurrentlyIntense && !HasDeviousGag(mainFemaleActor) 
			
			;If IshugePP() || ASLCurrentlyintense
				;PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
			;	miscutil.PrintConsole ("Playing After Orgasm Arouse in stage transition ")
			;else
				ChangeHentaiExpression("panting")
				PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
		;	EndIf	
	
	endif

endfunction

Function ASLMakeGreetingToMalePartner()

	 Bool partnerLoaded = mainMaleEnjoyment > 50 
	 
	If hoursSinceLastSex < 5.0 || stealthScene ;Don't need to greet if its really just resuming what was left off by the last scene or if we're trying to be stealthy
		Return
	EndIf
	
	If !MasterScript.ConfigOptions.GetModSettingBool("bAllowGreets:DialogueOptions")
		Return
	EndIf
	ChangeHentaiExpression("Greeting")
	if partnerLoaded 
		PlaySound(mainFemaleVoice.GreetLoadedFamiliar, mainFemaleActor, requiredChemistry = 4)
	elseif withMaleLover	
		PlaySound(mainFemaleVoice.GreetLover, mainFemaleActor, requiredChemistry = 6)
	else
		PlaySound(mainFemaleVoice.GreetFamiliar, mainFemaleActor, requiredChemistry = 4)
	endif

	
EndFunction

Function ASLPlayPenetrationComments()

if femaleisgiving()
	if ShouldPlayMaleOrgasmHype()
		ASLPlayMaleClosetoOrgasmComments()
	elseif  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage
		ChangeHentaiExpression("amused")
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0)
	elseif ASLcurrentlyIntense
		ChangeHentaiExpression("intensegrunt")
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0)
	else
		ChangeHentaiExpression("grunt")
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
	endif
elseif ASLcurrentlyIntense
	ChangeHentaiExpression("intensepenetrationcomments")
	if CommentedClosetoOrgasm
		ChangeHentaiExpression("maleclosetoorgasmIntense")
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
	elseif ASLisBroken() || EquippedTongue()
		PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry = 0)	
	elseif  femaleisvictim() || ishugepp() 
		PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)
		
	elseif !femaleisvictim() && mainFemaleEnjoyment
		PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry = 0)	
	
	else
		PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)

	endif
else
	if ASLisBroken()
		ASLPlayBrokenVoice()
	elseif femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused 
		ChangeHentaiExpression("unamused")
		PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0)
	elseif mainFemaleEnjoyment > 30 && !femaleisvictim()
		ChangeHentaiExpression("penetrationcomments")
		PlaySound(mainFemaleVoice.PenetrativeCommentssoft, mainFemaleActor, requiredChemistry = 0)
	else
		ChangeHentaiExpression("grunt")
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
	endif
endif
EndFunction

Function ASLAddTongue()
;if has MFEE

if hasMFEE && MFEETongueOutOverride.length > 1 && MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,0,0) == 0

	MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,8,0,100) ;tongueout
	MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,8,2,100) ;tongue down

endif


if EnableTongue != 1 || HasDeviousGag(mainFemaleActor)  || IsUnconcious()

	Return
endif

Race FemaleActorRace = mainFemaleActor.GetRace()
String FemaleRaceName = FemaleActorRace.GetName()

if	!mainFemaleActor.IsEquipped(Tongue) && Game.GetModbyName("sr_fillherup.esp") != 255  && stagelabel != "FB" && stagelabel != "SB" && stagelabel != "SR" && EnableTongue == 1
	if usehentaiexpressionng == 1
	
		ChangeHentaiExpression("tongueoverride")
		
	elseif EnableHentaiIVDTAhegaoExpressions == 1

		MfgConsoleFunc.ResetPhonemeModifier(mainFemaleActor); reset phoneme
		if FemaleRaceName =="Elin" || FemaleRaceName =="Erin"

			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah) ; big aah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,12,Vohq) ; ohq
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,5,Veee*30/100) ; eee
		else ;vanilla race

			MfgConsoleFunc.SetPhoneme(mainFemaleActor,1,vbigaah); big ah
			MfgConsoleFunc.SetPhoneme(mainFemaleActor,6,Veh); eh
		endif

		UpdateAhegaoExpression(true)
	endif
	
mainFemaleActor.addItem(Tongue , abSilent=true)
mainFemaleActor.EquipItem(Tongue , abSilent=true)

endif

endfunction


Function ASLRemoveTongue()
	
	if hasMFEE && MFEETongueOutOverride.length > 1

		MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,8,0,0) ;tongueout
		MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,8,2,0) ;tongue down

	endif

	if	mainFemaleActor.IsEquipped(Tongue) 
		mainFemaleActor.unEquipItem(Tongue, abSilent=true)
		mainFemaleActor.removeItem(Tongue , abSilent=true)
		
		if usehentaiexpressionng == 1
			ChangeHentaiExpression("tongueoverride")
		elseif EnableHentaiIVDTAhegaoExpressions == 1
		
		MfgConsoleFunc.ResetPhonemeModifier(mainFemaleActor); reset phoneme
		UpdateNormalExpression(true)
		endif
	endif


endfunction


Function ASLAddOrgasmSSquirt()
if Utility.RandomFloat(0.0, 1.0) < ChanceToOrgasmSquirt

if	!mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255 
	mainFemaleActor.addItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor , abSilent=true)
	mainFemaleActor.EquipItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor)
endif

endif
endfunction

Function ASLRemoveOrgasmSSquirt()
if	mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor) 
	mainFemaleActor.unEquipItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor , abSilent=true)
	mainFemaleActor.removeItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor)
endif

endfunction

Function ASLAddThickCumleak()
if EnableThickCumLeak != 1 
	Return
endif
if FemaleisGiving() ;main female penetrating
	if	!mainMaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255 
		mainMaleActor.addItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor , abSilent=true)
		mainMaleActor.EquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
	endif
else ;main female receiving
	if	!mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255 
		mainFemaleActor.addItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor , abSilent=true)
		mainFemaleActor.EquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
	endif
endif
endfunction

Function ASLRemoveThickCumleak()
if FemaleisGiving() ;main female penetrating
	if	mainMaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) 
		mainMaleActor.unEquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor , abSilent=true)
		mainMaleActor.removeItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
	endif
else
	if	mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) 
		mainFemaleActor.unEquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor , abSilent=true)
		mainFemaleActor.removeItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
	endif
endif
endfunction

Function ASLAddCumPool()
if EnableThickCumLeak != 1 || FemaleisGiving()
	Return
endif

if	!mainFemaleActor.IsEquipped(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255 
	mainFemaleActor.addItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor , abSilent=true)
	mainFemaleActor.EquipItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor)
endif

endfunction

Function ASLRemoveCumPool()
if	mainFemaleActor.IsEquipped(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor) 
	mainFemaleActor.unEquipItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor , abSilent=true)
	mainFemaleActor.removeItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor)
endif

endfunction


Function ASLAddOralLeak()
if EnableThickCumLeak != 1 || FemaleisGiving()
	Return
endif

if	!mainFemaleActor.IsEquipped(Game.GetFormFromFile(0x14C253, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255 
	mainFemaleActor.addItem(Game.GetFormFromFile(0x14C253, "sr_fillherup.esp") as Armor , abSilent=true)
	mainFemaleActor.EquipItem(Game.GetFormFromFile(0x14C253, "sr_fillherup.esp") as Armor)
endif
endfunction

Function ASLRemoveOralLeak()
if	mainFemaleActor.IsEquipped(Game.GetFormFromFile(0x14C253, "sr_fillherup.esp") as Armor) 
	mainFemaleActor.unEquipItem(Game.GetFormFromFile(0x14C253, "sr_fillherup.esp") as Armor , abSilent=true)
	mainFemaleActor.removeItem(Game.GetFormFromFile(0x14C253, "sr_fillherup.esp") as Armor)
endif
endfunction

Bool Function EquippedTongue()

		return  mainFemaleActor.IsEquipped(tongue) || MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,8,0) > 0
	
endfunction


Function ASLPlayBrokenVoice()

if CommentedClosetoOrgasm
	ChangeHentaiExpression("overthetop")
	PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0)
elseIf femaleCloseToOrgasm() ;When female close to orgasm
	ASLPlayFemaleOrgasmHype()
elseif  Utility.RandomFloat(0.0, 1.0) < 0.15	&& !ASLcurrentlyintense
	ChangeHentaiExpression("panting")
	PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)	
elseif shouldgoontheattack(currentAnimation) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/2
	ChangeHentaiExpression("attackingcomments")
	PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry = 0) 	
elseif  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/4
	ChangeHentaiExpression("amused")
	PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)
elseif  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/4	
	ChangeHentaiExpression("inawe")
	PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0)	
else
	ChangeHentaiExpression("grunt")
	PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
endif
endfunction

Function ASLRefreshBrokenStatus()
if  actorWithSceneTrackerSpell == mainFemaleActor
	if ASLIsBroken()
		ChanceToOrgasmSquirt = ChanceToOrgasmSquirt * 2
		
		if !hasMFEE 
			ASLAddTongue()
		endif
	elseif StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken") > StorageUtil.GetIntValue(None, "ASLTargetOrgasmtoBroken")
		StorageUtil.SetIntValue(None, "ASLIsBroken" , 1)
		ASLAddTongue()
	else
		StorageUtil.SetIntValue(None, "ASLIsBroken" , 0)
		
	endif
	
endif	
;	miscutil.PrintConsole ("ASLTotalOrgasmtoBroken  : " + StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken"))
;	miscutil.PrintConsole ("ASLIsBroken  : " + StorageUtil.GetIntValue(None, "ASLIsBroken"))
if ASLIsBroken() && NotifiedBrokenstatus == false
debug.notification("You are Mentally Broken from being Raped Continuously")
NotifiedBrokenstatus = true
endif
EndFunction

bool function ASLIsBroken()
	
	return StorageUtil.GetIntValue(None, "ASLIsBroken") >= 1 && EnableBrokenStatus == 1
endfunction

bool function ASLCanAccumulateBrokenPoints()
	
	if BrokenStatusVictimOnly == 1 && !femaleisvictim() 
		return false
	else
		return true
	endif
	
endfunction

Bool Function ASLProcessStageAdvancing()
	if EnableAutoAdvanceStage != 1
		return false
	elseif cycle >= 7 && currentlyPlayingSoundCount == 0
		return true
	elseif cycle >= 4 && StageLabel == "EN" && currentlyPlayingSoundCount == 0
		return true
	elseif actorWithSceneTrackerSpell == mainMaleActor
		return false
	elseif MainMaleCanControl() && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && CurrentPenetrationLvl() >= 2  
		return false
	elseif mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && CurrentPenetrationLvl() >= 1 && !MainMaleCanControl()
		return false
	elseif !MainMaleCanControl() && mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment  && CurrentPenetrationLvl() >= 2
		return false
	elseif MainMaleCanControl() && maleOrgasmCount/currentAnimation.stagecount >= utility.randomint(4,7) && currentlyPlayingSoundCount == 0
		return true
	elseif !MainMaleCanControl() && femaleRecordedOrgasmCount/currentAnimation.stagecount >= utility.randomint(3,5) && currentlyPlayingSoundCount == 0
		return true

	elseif sexLabThreadController.TotalTime <= 10
		return false
	elseif  sexLabThreadController.TotalTime - timeOfLastRecordedFemaleOrgasm <= 7

		return false
	else

		Return ASLstagetimetoadvance < sexLabThreadController.TotalTime && currentlyPlayingSoundCount == 0 && currentlyPlayingSoundCountMale == 0  && ((!femaleCloseToOrgasm() && !MaleCloseToOrgasm()) || CurrentPenetrationLvl() <= 1 )
	
	endif
endfunction

Bool Function MainFemaleisSuccubus()

if has_spell(mainFemaleActor, 0x238627, "ChildrenofLilith.esp") 	
	return true
endif

endfunction

Function SetActorScale()
Race MaleActorRace = mainMaleActor.GetRace()
String MaleRaceName = mainMaleActor.GetName()
float scalevalue = 1.0
;scaling frostbite spider to 1
if MaleRaceName ==  "Frostbite Spider"
	if ActorOne != none
		ActorOne.setscale(1.0)
	endif
	
 	if ActorTwo != none
		ActorTwo.setscale(1.0)
	endif
endif
 
if enabletagscaling == 1 && ( currentAnimation.hasTag("Bigguy") || currentAnimation.hasTag("Big Guy") || currentAnimation.hasTag("Shota") )
;define scale value
	if currentAnimation.hasTag("Bigguy") || currentAnimation.hasTag("Big Guy")
		scalevalue = 1.15
	elseif	currentAnimation.hasTag("Shota")
		scalevalue = 0.8
	else
		scalevalue = 1.0
	endif


;start scaling
if ActorOne != none  && !currentAnimation.hasTag("smFF")  && !currentAnimation.hasTag("smFFF"); &&  ActorOne.getscale()  != scalevalue 

ActorOne.setscale(scalevalue)

endif
if ActorTwo != none && !currentAnimation.hasTag("MsmF")  && !currentAnimation.hasTag("smFFF") ;&& ActorTwo.getscale() != scalevalue  
ActorTwo.setscale(scalevalue)

endif
if ActorThree != none ;&& ActorThree.getscale() != scalevalue 
ActorThree.setscale(scalevalue)

endif
if ActorFour != none ;&& ActorFour.getscale() != scalevalue 
ActorFour.setscale(scalevalue)

endif
if ActorFive != none ;&& ActorFive.getscale() != scalevalue 
ActorFive.setscale(scalevalue)

endif	


endif
endfunction

Function ResetActorScale()
if enabletagscaling == 1  && ( currentAnimation.hasTag("Bigguy") || currentAnimation.hasTag("Big Guy") || currentAnimation.hasTag("Shota") )

if ActorOne != none
ActorOne.setscale(Actor1BaseScale)
endif
if ActorTwo != none
ActorTwo.setscale(Actor2BaseScale)
endif
if ActorThree != none
ActorThree.setscale(Actor3BaseScale)
endif
if ActorFour != none
ActorFour.setscale(Actor4BaseScale)
endif
if ActorFive != none
ActorFive.setscale(Actor5BaseScale)
endif
	
endif
endfunction




Bool Function ShouldSkipP3sound()

return 	StorageUtil.GetIntValue(None, "ASLOrgasm") == 1 || 	StorageUtil.GetIntValue(None, "ASLMaleOrgasm") == 1 

endfunction

Bool Function MainFemaleisBurstingAtSeams()

if has_spell(mainFemaleActor, 0x387D, "sr_fillherup.esp") 	
	return true
endif

endfunction

Bool function femaleCloseToOrgasm()
	return mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment && CommentedClosetoOrgasm == false
endfunction

Bool function MaleCloseToOrgasm()
	mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment
endfunction

Bool Function HasSchlong(Actor char)
	if !char
		return false
	endif
	if (schlongfaction)
		return char.isinfaction(schlongfaction)
	elseif (TNG_Gentlewoman)
		if char.GetActorBase().GetSex() == 1 && !char.HasKeyword(TNG_Gentlewoman)
			return false ; Female
		  else
			return true ; Male or Futa
		  endif
	else
		  return char.GetActorBase().GetSex() == 0
	EndIf 
endfunction


Bool Function HasDeviousGag(Actor char)
	if !char
		return false
	endif
	if has_MagicEffect(char, 0x2b077, "Devious Devices - Integration.esm") 	&& Char == MainfemaleActor			;devious gag
			return true
		endif
		return false
endfunction


bool function has_MagicEffect(actor a, int id, string filename)
	if !a
		return false
	endif
	MagicEffect ME = get_form(id, filename) as MagicEffect
	if !ME
		return false
	endif
	return a.HasMagicEffect(ME)
endfunction

bool function has_spell(actor a, int id, string filename)
	if !a
		return false
	endif
	spell sp = get_form(id, filename) as spell
	if !sp
		return false
	endif
	return a.HasSpell(sp)
endfunction

form function get_form(int id, string filename)
	if Game.GetModbyName(filename) == 255 
		return None
	endif
	return Game.GetFormFromFile(id, filename)
endfunction

function ResetExpressionvalues()
	NormalExpressionPath = Utility.RandomInt(1,3)

	NormalExpressionLookleftorRight = Utility.RandomInt(1,3)

endfunction


function ASLPlayGagSound()

	if AllowMaleVoice()
		ASLPlayMaleComments()
	endif
	;intense gag noise
	if ASLCurrentlyintense
		PlaySound(mainFemaleVoice.AssFlattering, mainFemaleActor, requiredChemistry =0)
	else
	; less intense gag noises
		PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0)
	endif

endfunction




Function UpdatePauseExpressionflag()

if stagelabel == "EN"
	PauseExpressionUpdate = true
else
	PauseExpressionUpdate = false
endif

endfunction
;mFG 
	;akActor.SetExpressionOverride(3,100)
;MfgConsoleFunc.ResetPhonemeModifier(akActor) reset phoneme
;MfgConsoleFunc.SetPhoneme(akActor,1,70)
;MfgConsoleFunc.SetModifier(akActor,3,50)
	
Bool Function GiveSHMilkSperm(Actor char)

Race MaleActorRace = char.GetRace()
String MaleRaceName = char.GetName()
	;set Gender
	Gender = SexLab.GetGender(char) ; 0 = male , 1 = female , 2 = male creature , 3 = female creature
	
if EnableSuccubusHeartMilkSperm == 1 && Game.GetModbyName("Succubus Heart.esp") != 255 

	
	If Gender == 2; male creature
		if MaleRaceName == "Troll" || MaleRaceName ==  "Snow Troll" 
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x257A0A, "Succubus Heart.esp") as Ingredient, 3)
 		elseif IshugePP()
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x257A0A, "Succubus Heart.esp") as Ingredient, 2)
		else
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x257A0A, "Succubus Heart.esp") as Ingredient, 1)
		endif
		
	elseif Gender == 3 ; Female creature
		if MaleRaceName == "Troll" || MaleRaceName ==  "Snow Troll" 
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x257A0C, "Succubus Heart.esp") as Ingredient, 3)
		elseif IshugePP()
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x257A0C, "Succubus Heart.esp") as Ingredient, 2)
		else
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x257A0C, "Succubus Heart.esp") as Ingredient, 1)
		endif
	elseif Gender == 1 ; female
		if MaleRaceName == "Orc"
			if HasSchlong(char)
				mainFemaleActor.AddItem(Game.GetFormFromFile(0x82B, "Succubus Heart.esp") as Ingredient, 2)
			else
				mainFemaleActor.AddItem(Game.GetFormFromFile(0x835, "Succubus Heart.esp") as Ingredient, 2)
			endif			
		else
			if HasSchlong(char)
				mainFemaleActor.AddItem(Game.GetFormFromFile(0x82B, "Succubus Heart.esp") as Ingredient, 1)
			else
				mainFemaleActor.AddItem(Game.GetFormFromFile(0x835, "Succubus Heart.esp") as Ingredient, 1)
			endif
		endif
	else ; male
		if MaleRaceName == "Orc"
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x82B, "Succubus Heart.esp") as Ingredient, 2)
		else
			mainFemaleActor.AddItem(Game.GetFormFromFile(0x82B, "Succubus Heart.esp") as Ingredient, 1)
		endif		
	endif	
endif

endfunction

; future to do. make comments on blowjob
Function ASLPlayMaleComments()
	
	if stagelabel == "LI" && Currentstage < 3
	
		PlaySound(mainMaleVoice.Aroused, mainMaleActor, requiredChemistry = 0, soundPriority = 2) 		
		ChangeHentaiExpression("LeadIn")
		if HasDeviousGag(mainFemaleActor) 
		;intense gag noise
			if ASLCurrentlyintense
				PlaySound(mainFemaleVoice.AssFlattering, mainFemaleActor, requiredChemistry =0)
			else
		; less intense gag noises
			PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0)
			endif	
		elseif	ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)	
		else
			PlaySound(mainFemaleVoice.Foreplaysoft, mainFemaleActor, requiredChemistry = 0)
		endif	

	elseif ShouldPlayMaleOrgasmHype() 

		
		PlaySound(mainMaleVoice.AboutToCum, mainMaleActor, requiredChemistry = 0,  soundPriority = 2 , waitForCompletion = False)
		;female background moaning
		
		if IsUnconcious()
			return
		elseif HasDeviousGag(mainFemaleActor) 	
			if ASLCurrentlyintense
				PlaySound(mainFemaleVoice.AssFlattering, mainFemaleActor, requiredChemistry =0)
			else
				; less intense gag noises
				PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0)
			endif	
		elseif ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 )	
		else
			if ASLCurrentlyintense 
				ChangeHentaiExpression("maleclosetoorgasmIntense")
				PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
				else
				ChangeHentaiExpression("maleclosetoorgasm")
				PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1 )
			endif	
		endif
		
	elseif MaleIsVictim() || ShouldGoOnTheAttack(currentanimation)
		;miscutil.PrintConsole ("Playing Male Comments male victim On the attack")
		;male say something
		ChangeHentaiExpression("grunt")
		PlaySound(mainMaleVoice.TeaseAggressivePartner, mainMaleActor, soundPriority = 2 , waitForCompletion = False)
		;female background moaning
		if IsUnconcious()
			return
		elseif HasDeviousGag(mainFemaleActor) 	
				PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0)
		elseif ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1)	
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1)
			if Utility.RandomFloat(0.0, 1.0) <0.3
			ChangeHentaiExpression("amused")
			PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0)
			endif
		endif
		
		
			
	elseif  CurrentPenetrationLvl() >= 2 && ASLCurrentlyintense 
		;miscutil.PrintConsole ("Playing Male Comments intense penetration")
		
		;male say something
		if IsUnconcious()
			return
		elseif femaleisvictim()
			PlaySound(mainMaleVoice.Aggressive, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = False)
		else
			PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = False)
		endif
		ChangeHentaiExpression("intensegrunt")
		;female background moaning
		if HasDeviousGag(mainFemaleActor) 	
			if ASLCurrentlyintense
				PlaySound(mainFemaleVoice.AssFlattering, mainFemaleActor, requiredChemistry =0 , soundPriority = 1)
			else
				; less intense gag noises
				PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
			endif		
		else
			PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1)
		endif
					
	elseif	CurrentPenetrationLvl() >= 2 && !ASLCurrentlyintense 
		;miscutil.PrintConsole ("Playing Male Comments non Intense Penetration")
				;female background moaning
		PlaySound(mainMaleVoice.StrugglingEarly, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = False)
		ChangeHentaiExpression("grunt")
		if IsUnconcious()
			return
		elseif HasDeviousGag(mainFemaleActor) 	
			; less intense gag noises
			PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0)

		elseif ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 )	
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1)
			
			if Utility.RandomFloat(0.0, 1.0) <0.3
				if femaleisvictim() 
					ChangeHentaiExpression("unamused")
					PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0)
				else
					ChangeHentaiExpression("inawe")
					PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0)	
				endif
			endif                       
		endif
		
		
	endif		


	
endfunction

Bool Function AllowMaleVoice()

	return  Utility.RandomFloat(0.0, 1.0) <= ChanceForMaleToComment && EnableMaleVoice == 1 && Gender == 0 && mainMaleVoice != None ;gender must be male only
	
endfunction

Bool Function FemaleisGiving()
	return mainFemaleActor != ActorsInPlay[0] && CurrentPenetrationLvl() >= 1
endfunction

Function BodySwitchtoLewdArmor()
; this is meant for slot 32 body armor switching only at the beginning of the stage.
if SwappedUpperArmor == true && EnableArmorSwapping != 1
return
endif

int slotlength = ArmorSlotsToSwitch.length
int slotindex = 0
Armor BaseArmor
Armor LewdArmor

	;miscutil.PrintConsole ("wearing lewd armor...")
	while slotindex < slotlength
		BaseArmor = mainFemaleActor.GetWornForm(Armor.GetMaskForSlot(ArmorSlotsToSwitch[slotindex] as int)) as armor
		if BaseArmor
			LewdArmor = jsonutil.GetFormValue(ArmorSwappingFile, BaseArmor.getname(), none)	as armor
			if LewdArmor != none
				;miscutil.PrintConsole (slotindex + " Trying to add  : "+ LewdArmor.getname())
				mainFemaleActor.addItem(LewdArmor , abSilent=true)
				
				;miscutil.PrintConsole (slotindex + " Trying to unequip  : "+ BaseArmor.getname())
				mainFemaleActor.unEquipItem(BaseArmor , abSilent=true)
				
				;miscutil.PrintConsole (slotindex + " Trying to equip  : "+ LewdArmor.getname())
				mainFemaleActor.EquipItem(LewdArmor , abSilent=true)
				
				
		
				BaseArmorArr = papyrusutil.pushform(BaseArmorArr , BaseArmor)
				LewdArmorArr = papyrusutil.pushform(LewdArmorArr , LewdArmor)
			endif
		endif
		
	
	;miscutil.PrintConsole ("Armor Switching  ")
	;miscutil.PrintConsole ("BaseArmor  : "+ BaseArmor.getname())
	;miscutil.PrintConsole ("LewdArmor  : "+ LewdArmor.getname())


;	if LewdArmor != none && ArmorSlotsToSwitch[slotindex] as int == 32
;		SwappingChar.addItem(LewdArmor , abSilent=true)
;		SwappingChar.EquipItem(LewdArmor)
;		SwappingChar.unEquipItem(BaseArmor)
		

;		BaseArmorArr = papyrusutil.pushform(BaseArmorArr , BaseArmor)
;		LewdArmorArr = papyrusutil.pushform(LewdArmorArr , LewdArmor)
;	endif
	slotindex += 1
	endwhile
SwappedUpperArmor = true
endfunction


Function RestoreArmor()

if EnableArmorSwapping != 1
return
endif

int slotlength = BaseArmorArr.length
int slotindex = 0
Armor BaseArmor
Armor LewdArmor

;miscutil.PrintConsole ("restoring armor....")
while slotindex < slotlength 
		BaseArmor = BaseArmorArr[slotindex] as armor
		LewdArmor = LewdArmorArr[slotindex] as armor
		
		;miscutil.PrintConsole (slotindex + " Trying to equip  : "+ BaseArmor.getname())
		mainFemaleActor.EquipItem(BaseArmor , abSilent=true)
		
		;miscutil.PrintConsole (slotindex + " Trying to remove  : "+ LewdArmor.getname())
		mainFemaleActor.RemoveItem(LewdArmor , abSilent=true)
	
	slotindex += 1
	endwhile

EndFunction


Int Function CurrentPenetrationLvl()
	Bool hasVaginalTag = CurrentAnimation.HasTag("Vaginal")
	Bool hasLeadInTag = CurrentAnimation.HasTag("LeadIn")
	Bool hasAnalTag = CurrentAnimation.HasTag("Anal")

	if stagelabel != "None"
			
			if stagelabel == "SR"
				if CurrentAnimation.HasTag("Vaginal")
					return 2
				else 
					return 3
				endif
		
		elseif stagelabel == "LI"
			return 0
		elseif stagelabel == "FA" || stagelabel == "SA" || stagelabel == "DP" || stagelabel == "TP"
			return 3
		elseif stagelabel == "FV" || stagelabel == "SV" 
			return 2
		elseif stagelabel == "FB" || stagelabel == "SB" 
			return 1
		elseif stagelabel == "EN" && (previousstagelabel == "FB" || previousstagelabel == "SB")
			return 1
		elseif stagelabel == "EN" && (previousstagelabel == "FA" || previousstagelabel == "SA" || previousstagelabel == "DP" || previousstagelabel == "TP")
			return 3
		elseif stagelabel == "EN" && (previousstagelabel == "FV" || previousstagelabel == "SV" )
			return 2
		else 
			return 0
		endif
	endif
	return 0
EndFunction

Bool Function IsUnconcious()
	if (currentanimation.HasTag("faint") || currentanimation.HasTag("sleep") || currentanimation.HasTag("necro")) && !femaleisgiving()
		StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet",0)
		Return true
	else
		return false
	endif
endfunction

Bool Function ShouldMovebackAStage()

	if	!MainMaleCanControl() && stagelabel == "EN" && mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment  && CurrentPenetrationLvl() >= 2 && femaleRecordedOrgasmCount <= 3
		return true
	elseif stagelabel == "EN" && CurrentPenetrationLvl() >= 2 && FemaleIsVictim() &&  AggressiveChancetoMoveBackAStage >=  Utility.Randomint(0, 100) 
		return true
	elseif stagelabel == "EN" && CurrentPenetrationLvl() >= 2 && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && MainMaleCanControl() &&  maleOrgasmCount <= 3
		return true
	else
		return false
	endif
endfunction

Function ResetHentaiExpressionGroup()
	Type = Utility.Randomint(1,3)
	
	if type == 1
		ExpressionGroup = "A"
	elseif type == 2
		ExpressionGroup = "B"
	elseif type == 3
		ExpressionGroup = "C"
	endif

endfunction

Function ChangeHentaiExpression(String Scenario)
if UseHentaiExpressionNG != 1 
	return
endif
;Utility.Wait(0.5) ;add delay to sync with hentai expressions NG
StorageUtil.SetStringValue(None, "Scenario" ,Scenario)
;miscutil.printconsole("Scenario changed to : " + Scenario)
EndFunction

Function NotificationifFileisBad()

if !jsonutil.isgood(ConfigFile)
	miscutil.printconsole("IVDT Hentai : Config json file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif

if !jsonutil.isgood(ExpressionsNGFile)
	miscutil.printconsole("IVDT Hentai : IVDT Hentai Expressions NG file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif

if !jsonutil.isgood(ArmorSwappingFile)
	miscutil.printconsole("IVDT Hentai : Armor Swapping json file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif

if !jsonutil.isgood(RaceBaseExpressionFile)
	miscutil.printconsole("IVDT Hentai : Race Base Expression File json file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif

endfunction

Function PhaseFemaleexpressions()

if UseHentaiExpressionNG != 1  

	return
endif

int phase = 1
String[] PhaseExpressionsArr
String[] MFEEArr
string PhaseLookup 
int variance 
float speed = 0.50
string Scenario = "grunt"
String ASLFemaleSpeech 

string Role = "C"
int lookdirection = 9
	if femaleisvictim()
		Role = "V"
	endif



if IsUnconcious();if unconcious stage
	MfgConsoleFunc.SetModifier(mainFemaleActor, 0, 100) ;left blink
	MfgConsoleFunc.SetModifier(mainFemaleActor, 1, 100) ;right blink
	MfgConsoleFunc.SetPhoneme(mainFemaleActor,0,Utility.Randomint(0, Vaah*50/100)) ; aah
endif

;miscutil.printconsole("Female making sound : " + StorageUtil.GetIntValue(None, "FemaleMakingSound",0))
while StorageUtil.GetIntValue(None, "FemaleMakingSound",0) == 1
	ASLUpdate()

	int ExpressionIndex = 0
	lookdirection = utility.Randomint(8,10)
	Scenario = StorageUtil.GetStringValue(None, "Scenario", "leadin")
	
	ASLFemaleSpeech = role + Scenario + ExpressionGroup
	;miscutil.printconsole("Scenario = " + Scenario)
	;miscutil.printconsole("ASLFemaleSpeech = " + ASLFemaleSpeech)
	;Scenario = Stringutil.substring(ASLFemaleSpeech , 1 , Stringutil.getlength(ASLFemaleSpeech) - 2)
	;miscutil.printconsole("Phase Scenario : " + Scenario)
	
	Speed = ExpressionSpeed(Scenario)

	PhaseLookup = ASLFemaleSpeech + Phase
	PhaseExpressionsArr = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsNGFile,Phaselookup,"") ,",")
	
	if hasMFEE
		MFEEArr = papyrusutil.stringsplit(JsonUtil.GetStringValue(MFEEFile,Phaselookup,"") ,",")

	endif
	;-----------------------------START CYCLE RUNNING EXPRESSION PHASES------------------------------	

		PhaseExpressionsArr = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsNGFile,Phaselookup,"") ,",")
		variance = PhaseExpressionsArr[32] as int
	;miscutil.printconsole("PhaseLookup :" + PhaseLookup)
	if PhaseExpressionsArr.length < 32 && Scenario != "blowjoboverride" && Scenario != "tongueoverride"  && Scenario != "brokenoverride"
		miscutil.printconsole("IVDT Hentai Expressions :" + phaselookup +" only has " +phaseExpressionsArr.length+ "items . it is either incorrectly formatted or missing in HentaiExpressionsNG.json file")
		return
	endif

	;-----------------------------------------Set EXPRESSION-----------------------------------------
	if ASLIsBroken() || Scenario == "brokenoverride" || ((CurrentPenetrationLvl() >=2 && GetMainNPCTrait() =="+The Penetrator" ))
		;have MFEE Expressions for Elin
		if hasMFEE && MFEEBrokenOverride.length > 1 && CurrentPenetrationLvl() != 1 && MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,0,MFEEBrokenOverride[30] as int) != MFEEBrokenOverride[31] as int
			MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,0,MFEEBrokenOverride[30] as int, MFEEBrokenOverride[31] as int)
			RunningMFEEAhegao = true
			;miscutil.printconsole("Applying MFEE category 0 , mood :" + MFEEBrokenOverride[30] + "Value : " + MFEEBrokenOverride[31])
		endif		
		
		;run with normal expressions
		if MfgConsoleFunc.GetExpressionValue(mainFemaleActor) != BrokenOverride[31] as int
			MfgConsoleFuncExt.SetExpression(mainFemaleActor,BrokenOverride[30] as int,BrokenOverride[31] as int) 
		endif
	else
		;mfee
		if hasMFEE && MFEEArr.length > 1 && !MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,0,MFEEArr[30] as int) != MFEEArr[31] as int
			MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,0,MFEEArr[30] as int, MFEEArr[31] as int)
		;	miscutil.printconsole("Applying MFEE category 0 , mood :" + MFEEArr[30] + "Value : " + MFEEArr[31])
		endif
		
			if MfgConsoleFunc.GetExpressionValue(mainFemaleActor) != PhaseExpressionsArr[31] as int
				MfgConsoleFuncExt.SetExpression(mainFemaleActor,PhaseExpressionsArr[30] as int,PhaseExpressionsArr[31] as int) ; 
			endif
	endif	
	;-----------------------------------------Set MFEE-----------------------------------------
	;DISABLE For now until MFEE gets MFG FIX NG update

;	if HasMFEE && !IsUnconcious() && MFEEArr.length > 1
;		;Ears
;		while ExpressionIndex <= 3  
;			if !MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,2,ExpressionIndex) != MFEEArr[ExpressionIndex] as int
;				miscutil.printconsole("Applying MFEE category 2 Ears, morph :" + ExpressionIndex + "Value : " + MFEEArr[ExpressionIndex])
;				MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,2,ExpressionIndex, MFEEArr[ExpressionIndex] as int)
;			endif
;			ExpressionIndex = ExpressionIndex + 1
;		endwhile
;		ExpressionIndex = 0
;		;tail
;		while ExpressionIndex <= 1
;;		if !MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,3,ExpressionIndex) != MFEEArr[ExpressionIndex + 4] as int
	;		miscutil.printconsole("Applying MFEE category 3 Tail, morph :" + ExpressionIndex + "Value : " + MFEEArr[ExpressionIndex + 4])
	;		MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,3,ExpressionIndex , MFEEArr[ExpressionIndex + 4] as int )
	;	endif
	;		ExpressionIndex = ExpressionIndex + 1
	;	endwhile
	;	;face
	;	while ExpressionIndex <= 0
;		if !MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,4,ExpressionIndex) != MFEEArr[ExpressionIndex + 6] as int
;			miscutil.printconsole("Applying MFEE category 4 Face, morph :" + ExpressionIndex + "Value : " + MFEEArr[ExpressionIndex + 6])
;			MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,4,ExpressionIndex, MFEEArr[ExpressionIndex + 6] as int )
;		endif
;			ExpressionIndex = ExpressionIndex + 1
;		endwhile
;		ExpressionIndex = 0	
;		
		;eyes
;		while ExpressionIndex <= 3
;		if !MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,5,ExpressionIndex) != MFEEArr[ExpressionIndex + 7] as int
;			miscutil.printconsole("Applying MFEE category 5 eyes, morph :" + ExpressionIndex + "Value : " + MFEEArr[ExpressionIndex + 7])
;			MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,5,ExpressionIndex, MFEEArr[ExpressionIndex + 7] as int )
;		endif
;			ExpressionIndex = ExpressionIndex + 1
;		endwhile
;		ExpressionIndex = 0	
;		
;		;Mouth
;		while ExpressionIndex <= 10
;		if !MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,7,ExpressionIndex) != MFEEArr[ExpressionIndex + 10] as int
;;			miscutil.printconsole("Applying MFEE category 7 Mouth, morph :" + ExpressionIndex + "Value : " + MFEEArr[ExpressionIndex + 10])
	;		MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,7,ExpressionIndex, MFEEArr[ExpressionIndex + 10] as int )
	;	endif
;			ExpressionIndex = ExpressionIndex + 1
;		endwhile
;		ExpressionIndex = 0	
;		
;		;Tongue
;		while ExpressionIndex <= 6
;		if MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,8,ExpressionIndex) != MFEEArr[ExpressionIndex + 20] as int
;			miscutil.printconsole("Applying MFEE category 8 Tongue, morph :" + ExpressionIndex + "Value : " + MFEEArr[ExpressionIndex + 20])
;			MuFacialExpressionExtended.SetExpressionByNumber(mainFemaleActor,8,ExpressionIndex, MFEEArr[ExpressionIndex + 20] as int )
;		endif
;			ExpressionIndex = ExpressionIndex + 1
;		endwhile
;		ExpressionIndex = 0	
;	endif
	;------------------------------------------------Set PHONEME-------------------------------------------------
	;miscutil.printconsole("ExpressionIndex : "+ ExpressionIndex + "/ IsUnconcious() : " + IsUnconcious() + "/ CurrentPenetrationLvl() : " + CurrentPenetrationLvl())
	while ExpressionIndex <= 15 && (!IsUnconcious() ||  EquippedTongue() || Scenario == "tongueoverride" ) && RunningMFEEAhegao == false

	;	miscutil.printconsole("Applying Phoneme :" + ExpressionIndex)
		int upperlimit = PhaseExpressionsArr[ExpressionIndex] as int*(100+variance)/100
		int lowerlimit = PhaseExpressionsArr[ExpressionIndex] as int*(100-variance)/100
		;avoid out of bounds
		if upperlimit > 100
			upperlimit = 100
		endif
		if lowerlimit < 0
			lowerlimit = 0
		endif
		
			if ((((Stagelabelminusone == "FB" || Stagelabelminusone == "SB") && stagelabel == "EN")||stagelabel == "FB" || stagelabel == "SB" || stagelabel == "SR" || stagelabel == "TP") || HasDeviousGag(mainFemaleActor) || Scenario == "blowjoboverride") && ActorsInPlay[0] == mainFemaleActor
				;special handling for MFEE ahegao if during blowjob

					if hasMFEE && (MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,0,0) > 0 || MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,1,0) > 0 || MuFacialExpressionExtended.GetExpressionValueByNumber(mainFemaleActor,1,0) > 0)
						if RunningMFEEAhegao 
							MfgConsoleFuncExt.SetPhoneme(mainFemaleActor, 1 , 30 , 0.1) ; ;big aah 30
						else
							MfgConsoleFuncExt.SetPhoneme(mainFemaleActor, 1 , 100 , 0.1) ; ;big aah 100
						endif
					elseif MfgConsoleFunc.GetPhoneme(mainFemaleActor, ExpressionIndex) != Blowjoboverride[ExpressionIndex] as int
						MfgConsoleFuncExt.SetPhoneme(mainFemaleActor,ExpressionIndex,Blowjoboverride[ExpressionIndex] as int , 0.1) ; 
					endif
				
			elseif (EquippedTongue() || Scenario == "tongueoverride") && !RunningMFEEAhegao
				if MfgConsoleFunc.GetPhoneme(mainFemaleActor, ExpressionIndex) != TongueoutOverride[ExpressionIndex] as int
	
					MfgConsoleFuncExt.SetPhoneme(mainFemaleActor,ExpressionIndex,TongueoutOverride[ExpressionIndex] as int , 0.05) ; 
				endif
			elseif !IsUnconcious()
				if MfgConsoleFunc.GetPhoneme(mainFemaleActor, ExpressionIndex) != PhaseExpressionsArr[ExpressionIndex] as int ;ignore if phoneme and existing phoneme is the same
					MfgConsoleFuncExt.SetPhoneme(mainFemaleActor,ExpressionIndex, Utility.Randomint( lowerlimit,upperlimit ) ,speed) ; 
				endif
			endif	

		ExpressionIndex = ExpressionIndex + 1
	endwhile

	ExpressionIndex = 0
	
	;----------------------------------------------Set MODIFIERS-----------------------------------------
	while ExpressionIndex <= 13 && !IsUnconcious()
			;avoid out of bounds
	;miscutil.printconsole("Applying modifier :" + ExpressionIndex)	
		int modifier = PhaseExpressionsArr[ExpressionIndex + 16] as int 
		;int upperlimit = modifier*(100+variance)/100
		;int lowerlimit = modifier*(100-variance)/100
		
		;if upperlimit > 100
		;	upperlimit = 100
		;endif
		;if lowerlimit < 0
		;	lowerlimit = 0
		;endif
		float modifierspeed 
		if expressionindex == 8  && expressionindex == 11
			modifierspeed = 0
		else
			modifierspeed = Speed
		endif

		;make sure left and right has the same value applied
		;miscutil.printconsole("Applying modifier :" + ExpressionIndex + " value : " + modifier)
		;ignore if modifier is the same
		
			;run modifiers
			if (ASLIsBroken() || Scenario == "brokenoverride" )|| ishugepp() || (CurrentPenetrationLvl() >= 2 && GetMainNPCTrait() =="+The Penetrator" )
					if MfgConsoleFunc.GetModifier(mainFemaleActor, ExpressionIndex) != BrokenOverride[ExpressionIndex + 16] as int
						MfgConsoleFuncExt.SetModifier(mainFemaleActor,ExpressionIndex,BrokenOverride[ExpressionIndex+16] as int , modifierspeed) ; 
						
					endif
				ExpressionIndex = ExpressionIndex + 1
			elseif currentAnimation.hastag("Cowgirl") && CurrentPenetrationLvl() > 1 && expressionindex == 8 ;look downwards if riding override
			;		miscutil.printconsole("cowgirl modifier")
				;	miscutil.printconsole("Applying modifier :" + ExpressionIndex + " value : " + modifier)
					MfgConsoleFuncExt.SetModifier(mainFemaleActor,8,100, modifierspeed) ;
					ExpressionIndex = 12	
					
			elseif (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style")) && CurrentPenetrationLvl() > 1 && expressionindex == 8
			;		miscutil.printconsole("doggy modifier")
			;		miscutil.printconsole("Applying modifier :" + ExpressionIndex + " value : " + modifier)
					MfgConsoleFuncExt.SetModifier(mainFemaleActor,lookdirection,100, modifierspeed) ; look left or right or down
					ExpressionIndex = 12
				
			else
					if MfgConsoleFunc.GetModifier(mainFemaleActor, ExpressionIndex) != PhaseExpressionsArr[ExpressionIndex + 16] as int
			;			miscutil.printconsole("normal modifier")
			;			miscutil.printconsole("Applying modifier :" + ExpressionIndex + " value : " + modifier)
						MfgConsoleFuncExt.SetModifier(mainFemaleActor,ExpressionIndex, modifier , modifierspeed)
					endif
					ExpressionIndex = ExpressionIndex + 1
			endif
				
				
				
		
	endwhile


	

	if (Scenario == "kneejerk" || Scenario == "hugeppgape") && Phase >= 5
		StorageUtil.SetIntValue(None, "FemaleMakingSound" ,0) ;stop phasing after kneejerk actions
	elseif phase >= 5
		phase = 1
	else 
		phase = phase + 1
	endif
		;-----------end CYCLE RUNNING EXPRESSION PHASES--------------	
	
	utility.wait(0.3)

endwhile



	if ASLCurrentlyintense
		ChangeHentaiExpression("intensegrunt")
	elseif stagelabel == "LI"
		ChangeHentaiExpression("leadin")
	else
		ChangeHentaiExpression("grunt")
	endif

endfunction

float function ExpressionSpeed(String Scenario)
	if Scenario == "kneejerk" || Scenario == "hugeppgape"
	
		return hentaiexpressionngkneejerkspeed as float /100;0.1
	elseif Scenario != "grunt" && Scenario != "intensegrunt" && Scenario != "leadin" && Scenario != "panting" && Scenario != "overthetop"

		return hentaiexpressionngspeechspeed as float/100;0.2
	elseif ASLcurrentlyIntense == true
		
		return hentaiexpressionngintensespeed as float/100;0.3
	elseif stagelabel == "EN" || stagelabel == "LI"

		return hentaiexpressionngnonpenetrationspeed as float/100;0.5
	else
	
		return hentaiexpressionngnonintensespeed as float/100;0.4
	endif
endfunction

Function Lactate()

if (AlwaysLactate == 1 || PCHasLactatingSpell() ) && EnableLactate == 1 || StorageUtil.GetIntValue(None, "HentaiLactate") == 1 

	if  Game.GetModbyName("IVDTHentaiLactate.esp") != 255 && !mainFemaleActor.IsEquipped(MilkL) && !mainFemaleActor.IsEquipped(MilkR) && MilkL != None && MilkR != None && CurrentPenetrationLvl() > 1
		mainFemaleActor.AddItem(MilkR , abSilent=true)
		mainFemaleActor.AddItem(MilkL , abSilent=true)
		mainFemaleActor.EquipItem(MilkR , abSilent=true)
		mainFemaleActor.EquipItem(MilkL , abSilent=true)
		NippleLeakCBBE.play(MainfemaleActor, Utility.Randomint(15,30))
	endif
endif
endfunction


Function  StopLactate()
if EnableLactate == 0
	return
endif	
	if Game.GetModbyName("IVDTHentaiLactate.esp") != 255 && mainFemaleActor.IsEquipped(MilkL) || mainFemaleActor.IsEquipped(MilkR)
		mainFemaleActor.unEquipItem(MilkR, abSilent=true)
		mainFemaleActor.unEquipItem(MilkL, abSilent=true)
		mainFemaleActor.removeItem(MilkR , abSilent=true)
		mainFemaleActor.removeItem(MilkL , abSilent=true)
		
	endif
endfunction



Function SetGhostActor()

if enableghostactors == 1 

	Spell Ghost = Game.GetFormFromFile(0xd2056, "Skyrim.esm") as Spell


	int counter = 0

	while counter <=5 
		if  ActorsInPlay[counter] != mainFemaleActor
				ActorsInPlay[counter].Addspell(Ghost)
		endif
		counter = counter+ 1
	endwhile

	
endif
endfunction



Function ResetGhostActor()

if enableghostactors == 1 

Spell Ghost = Game.GetFormFromFile(0xd2056, "Skyrim.esm") as Spell

	int counter = 0

	while counter <=5
		if  ActorsInPlay[counter] != mainFemaleActor
		ActorsInPlay[counter].Removespell(Ghost)
		ActorsInPlay[counter].setalpha(1.0,true)
		endif
		counter = counter+ 1
	endwhile
	
endif
endfunction

String Function GetMainNPCTrait()
;	miscutil.printconsole("Main NPC Trait IVDT Hentai : " +  StorageUtil.GetStringValue(None, "MainNPCTrait", ""))
	return StorageUtil.GetStringValue(None, "MainNPCTrait", "")
endfunction

Function SkiptoAggressiveStage()
;skip only once
if SkiptoAggressiveStage == true
	return
endif

string TargetStage = ""
int counter = 1

	;search for FV
	while counter <= currentAnimation.stagecount && TargetStage == ""
		if currentAnimation.hasTag(counter as string +"FV")
			TargetStage = counter as string +"FV"
		endif
		counter += 1
		
	endwhile
	;search for FA
	while counter <= currentAnimation.stagecount && TargetStage == ""
		if currentAnimation.hasTag(counter as string +"FA")
			TargetStage = counter as string +"FA"
		endif
		counter += 1
		
	endwhile
	;search for SR
	while counter <= currentAnimation.stagecount && TargetStage == ""
		if currentAnimation.hasTag(counter as string +"SR")
			TargetStage = counter as string +"SR"
		endif
		counter += 1
		
	endwhile
	;search for DP
	while counter <= currentAnimation.stagecount && TargetStage == ""
		if currentAnimation.hasTag(counter as string +"DP")
			TargetStage = counter as string +"DP"
		endif
		counter += 1
		
	endwhile
	;search for TP
	while counter <= currentAnimation.stagecount && TargetStage == ""
		if currentAnimation.hasTag(counter as string +"TP")
			TargetStage = counter as string +"TP"
		endif
		counter += 1
		
	endwhile
	if TargetStage != ""
		sexLabThreadController.GoToStage(Counter)
		miscutil.printconsole("Skipping to Aggressive Stage :" + TargetStage)	
	endif
		SkiptoAggressiveStage = true
endfunction

Bool Function MainMaleCanControl()
	;cowgirl femdom and non forced blowjob -> false
	if (currentAnimation.hasTag("Cowgirl") || currentAnimation.hasTag("femdom") || currentAnimation.hasTag("Amazon") || (CurrentPenetrationLvl() == 1 && !currentAnimation.hasTag("Forced")))  && ActorsInPlay[0] == mainFemaleActor

		return false
	;PC in penetrating as futa 
	elseif CurrentPenetrationLvl() >= 2 && ActorsInPlay[0] != mainFemaleActor
		return false
	else
		return true
	endif
endfunction


Bool Function IsPenetration()

	return CurrentPenetrationLvl() >= 2
	
endfunction

Bool Function IsBlowJob()

	return CurrentPenetrationLvl() == 1
	
endfunction



Bool Function PCHasLactatingSpell()

Spell Lactating = Game.GetFormFromFile(0x851, "IVDTHentaiNPCTraitsAndEnjoyment.esp") as Spell

return mainFemaleActor.hasspell(Lactating)

endfunction

