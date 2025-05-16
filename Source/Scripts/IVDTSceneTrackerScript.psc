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
bool GreetedMalePartner = false


;Config
Float dialogueSpacingMultiplier = 1.0
Int generalIntensityThreshold = 60
Int analIntensityThreshold = 40
Int femaleCloseToOrgasmThreshold = 80
Int analAnimationFilter = 2 ;Different values indicate different criteria for if an animation is considered anal
Int okWithVaginalCumCode = -1 ;-1 = setting not loaded in yet, 0 = no, 1 = yes
float timeOfLastKneeJerkReaction
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
string Primarystagelabel = ""
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
Bool ReacttoFemaleOrgasmNext = false
Bool ReacttoMaleOrgasmNext = false
Float Volume


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

Sound PreviousSound = none
	
Actor[] ActorsInPlay
;JSONUtil configs
String ConfigFile  = "IVDTHentai/Config.json"
String AnimSpeedFile  = "HentairimEnjoyment/AnimSpeed.json"
String TimerConfigFile  = "IVDTHentai/Timers.json"
String VoiceVariationFile  = "IVDTHentai/VoiceVariation.json"
String DDGagFile  = "IVDTHentai/DDGagConfig.json"
String ArmorSwappingFile  = "IVDTHentai/ArmorSwapping.json"
String LactateFile  = "IVDTHentai/Lactate.json"
int cumleakcount = 0
Bool MaleisCommenting = false
int cycle = 0

int	EnableAutoAdvanceStage  ;done
int EnableTagScaling ;done
int	EnableBrokenStatus ;done
int BrokenStatusVictimOnly ;done
int HoursSinceLastSexToResetBrokenStatus  ;done
;int MinOrgasmsToBroken ;done
;int MaxOrgasmsToBroken ;done
int	EnableHugePPScenario ;done
int	EnableVictimScenario ;done
float 	ChanceTohaveSpanking ;done
float	ChanceToCommentUnamused  ;done
int		MinSpankCount ;done
Int		MaxSpankCount ;done
float	ChanceToCommentonLeadinStage ;done
float	ChanceToCommentonNonIntenseStage  ;done
float	chancetocommentonintensestage ;done
float	ChanceToCommentononAttackingStage  ;done
float	ChanceToCommentonBlowjobStage ;done
float	ChanceToCommentWhenCloseToOrgasm ;done
float	ChanceToCommentWhenMaleCloseToOrgasm   ;done
float ChanceToOrgasmSquirt ;done
int EnableThickCumLeak ;done
float ChanceToLeakThickCum ;done

int FemaleOrgasmHypeEnjoyment ;done
int MaleOrgasmHypeEnjoyment ;done
int EnableDDGagVoice ;done
Int EnableMaleVoice ;done
float ChanceForMaleToComment ; done

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

Int Type = 0
Faction SchlongFaction
Keyword TNG_XL
Keyword TNG_L
Keyword TNG_Gentlewoman
int HugePPSchlongSize
int EnableGhostActors
int MoanOnly
int donotadvanceifpcclosetoorgasm 
int donotadvanceifnpcclosetoorgasm 


	Float nextUpdateInterval = 1.0

Armor MilkR
Armor MilkL
EffectShader NippleLeakCBBE
int EnableLactate
int AlwaysLactate
int ChancetoLactateDuringOrgasm
int ChanceToLactateDuringIntense
int ChancetoStopLactate 
int donotadvanceifpartnerclosetoorgasm
String Property NINODE_ROOT = "NPC" AutoReadOnly
String Property RACEMENUHH_KEY = "RaceMenuHH.esp" AutoReadOnly
String Property INTERNAL_KEY = "internal" AutoReadOnly
Bool CommentedClosetoOrgasm = false
;SOS

Form ArmortoSwitch

Faction HentairimResistance
Faction HentairimBroken

	
int gender = 0	
Bool NotifiedBrokenstatus = false
int hypebeforeorgasm

;Bool ASLshouldplayfemaleorgasm = true ;often enoough SLSO doesnt reset enjoyment before orgasm and orgasm talk can complete, causing near orgasm talk after orgasm

Event OnEffectStart(Actor akTarget, Actor akCaster)
	playerCharacter = Game.GetPlayer()
	actorWithSceneTrackerSpell = akTarget
	mainFemaleActor = playerCharacter ;Temporary default until FindActorsAndVoices is called
	PerformInitialization()

EndEvent

int EnablePrintDebug
int useblowjobsoundforkissing
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

;MinOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile, "minorgasmstobroken"  , 9999)
;MaxOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile, "maxorgasmstobroken"  , 9999)
HoursSinceLastSexToResetBrokenStatus = JsonUtil.GetIntValue(ConfigFile, "hourssincelastsextoresetbrokenstatus" ,9999)

EnableAutoAdvanceStage = JsonUtil.GetIntValue(ConfigFile,"enableautoadvancestage",0)
donotadvanceifpartnerclosetoorgasm =  JsonUtil.GetIntValue(ConfigFile,"donotadvanceifpartnerclosetoorgasm",0)
donotadvanceifpcclosetoorgasm =  JsonUtil.GetIntValue(ConfigFile,"donotadvanceifpcclosetoorgasm",0)
donotadvanceifnpcclosetoorgasm =  JsonUtil.GetIntValue(ConfigFile,"donotadvanceifnpcclosetoorgasm",0)
EnableTagScaling = JsonUtil.GetIntValue(ConfigFile,"enabletagscaling",0)
ChanceToOrgasmSquirt = JsonUtil.GetIntValue(ConfigFile,"chancetoorgasmsquirt",0) as float/100
EnableBrokenStatus = JsonUtil.GetIntValue(ConfigFile,"enablebrokenstatus",0)
BrokenStatusVictimOnly = JsonUtil.GetIntValue(ConfigFile,"brokenstatusvictimonly",0)
EnableThickCumLeak = JsonUtil.GetIntValue(ConfigFile,"enablethickcumleak",0)
ChanceToLeakThickCum = JsonUtil.GetIntValue(ConfigFile,"chancetoleakthickcum",0) as float/100
HoursSinceLastSexToResetBrokenStatus = JsonUtil.GetIntValue(ConfigFile,"hourssincelastsextoresetbrokenstatus",0)
;MaxOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile,"maxorgasmstobroken",9999)
;MinOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile,"minorgasmstobroken",9999)
EnableHugePPScenario = JsonUtil.GetIntValue(ConfigFile,"enablehugeppscenario",0)
EnableVictimscenario = JsonUtil.GetIntValue(ConfigFile,"enablevictimscenario",0)
ChanceTohaveSpanking = JsonUtil.GetIntValue(ConfigFile,"chancetohavespanking",0) as float/100
MinSpankCount = JsonUtil.GetIntValue(ConfigFile,"minspankcount",0)
MaxSpankCount = JsonUtil.GetIntValue(ConfigFile,"maxspankcount",0)
ChanceToCommentUnamused = JsonUtil.GetIntValue(ConfigFile,"chancetocommentunamused",0) as float/100
ChanceToCommentonLeadinStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentonleadinstage",0) as float/100
ChanceToCommentonNonIntenseStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentonnonintensestage",0) as float /100
chancetocommentonintensestage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentonintensestage",0) as float /100
ChanceToCommentononAttackingStage = JsonUtil.GetIntValue(ConfigFile,"chancetocommentononattackingstage",0) as float /100
ChanceToCommentonBlowjobStage = JsonUtil.GetIntValue(ConfigFile,"ChanceToCommentonBlowjobStage",0) as float /100
ChanceToCommentWhenCloseToOrgasm = JsonUtil.GetIntValue(ConfigFile,"chancetocommentwhenclosetoorgasm",0) as float /100
ChanceToCommentWhenMaleCloseToOrgasm = JsonUtil.GetIntValue(ConfigFile,"chancetocommentwhenmaleclosetoorgasm",0) as float /100
FemaleOrgasmHypeEnjoyment = JsonUtil.GetIntValue(ConfigFile,"femaleorgasmhypeenjoyment",0) 
MaleOrgasmHypeEnjoyment = JsonUtil.GetIntValue(ConfigFile,"maleorgasmhypeenjoyment",0) 
EnableDDGagVoice = JsonUtil.GetIntValue(DDGagFile,"enableddgagvoice",0) 
EnableMaleVoice = JsonUtil.GetIntValue(ConfigFile,"enablemalevoice",0)  
ChanceForMaleToComment = JsonUtil.GetIntValue(ConfigFile,"chanceformaletocomment",0) as float /100  
ArmorSlotsToSwitch = papyrusutil.stringsplit(JsonUtil.GetStringValue(ArmorSwappingFile,"armorslots","") ,",")

EnableArmorSwapping = JsonUtil.GetIntValue(ConfigFile,"enablearmorswapping",0)  
VoiceVariation = JsonUtil.GetStringValue(VoiceVariationFile,"voicevariation","NA")  
AggressiveChancetoMoveBackAStage =  JsonUtil.GetIntValue(ConfigFile,"aggressivechancetomovebackastage",0)  
EnjoymentForAggressiveToMoveBackAStage = JsonUtil.GetIntValue(ConfigFile,"enjoymentforaggressivetomovebackastage",0)  


HugePPSchlongSize = JsonUtil.GetIntValue(ConfigFile,"hugeppschlongsize",0)
EnableGhostActors  = JsonUtil.GetIntValue(ConfigFile,"enableghostactors",0)  
MoanOnly  = JsonUtil.GetIntValue(ConfigFile,"moanonly",0) 
hypebeforeorgasm = JsonUtil.GetIntValue(ConfigFile,"hypebeforeorgasm",0) 
EnableLactate = JsonUtil.GetIntValue(LactateFile,"enablelactating",0)
AlwaysLactate = JsonUtil.GetIntValue(LactateFile,"alwayslactate",0)
ChancetoLactateDuringOrgasm = JsonUtil.GetIntValue(LactateFile,"chancetolactateduringorgasm",0)
ChanceToLactateDuringIntense = JsonUtil.GetIntValue(LactateFile,"chancetolactateduringintense",0)
ChancetoStopLactate = JsonUtil.GetIntValue(LactateFile,"chancetostoplactate",0)  
useblowjobsoundforkissing = JsonUtil.GetIntValue(ConfigFile,"useblowjobsoundforkissing",0) 
EnablePrintDebug =  JsonUtil.GetIntValue(ConfigFile,"printdebug",1)  
InitializeTimerConfig() 
 
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
		
	;Last item of set up: register for events
	RegisterForTheEventsWeNeed()

	;After set up, greet our partner if applicable

	InitializeConfigValues()
	
	 ;Make sure everything is up to date before we make our greeting

	;initialize storageutil to set if its orgasming
	if hypebeforeorgasm == 1
		StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 1)
	endif
	;if 	StorageUtil.GetIntValue(None, "ASLTargetOrgasmtoBroken") == 0
	;	StorageUtil.SetIntValue(None, "ASLTargetOrgasmtoBroken" , Utility.RandomInt(MinOrgasmsToBroken, MaxOrgasmsToBroken))
;	endif

	
	;initialize broken status
	;if hoursSinceLastSex >= HoursSinceLastSexToResetBrokenStatus as float
	;	StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken" , 0)
	;	StorageUtil.SetIntValue(None, "ASLTargetOrgasmtoBroken" , Utility.RandomInt(MinOrgasmsToBroken, MaxOrgasmsToBroken))
		;StorageUtil.SetIntValue(None, "ASLisBroken" , 0)
;	else

	ASLUPDATE()

	;Set Schlong Faction
	if isDependencyReady("Schlongs of Skyrim.esp") && !schlongFaction
		schlongfaction = Game.GetFormFromFile(0xAFF8 , "Schlongs of Skyrim.esp") as Faction
	endif
	
	;TNG
	if isDependencyReady("TheNewGentleman.esp") && !TNG_Gentlewoman
		TNG_XL = Game.GetFormFromFile(0xFE5, "TheNewGentleman.esp") as Keyword
		TNG_L = Game.GetFormFromFile(0xFE4, "TheNewGentleman.esp") as Keyword
		TNG_Gentlewoman = Game.GetFormFromFile(0xFF8, "TheNewGentleman.esp") as Keyword
	endif
	
	;Hentairim Enjoyment 
	HentairimResistance = Game.GetFormFromFile(0x854, "Hentairim Enjoyment Expressions Traits.esp") as Faction	
	HentairimBroken = Game.GetFormFromFile(0x853, "Hentairim Enjoyment Expressions Traits.esp") as Faction

	;Lactate
	MilkR = Game.GetFormFromFile(0x812, "IVDTHentaiLactate.esp") as Armor
	MilkL = Game.GetFormFromFile(0x813, "IVDTHentaiLactate.esp") as Armor
	NippleLeakCBBE  = game.GetFormFromFile(0x814, "IVDTHentaiLactate.esp") as EffectShader
	SetGhostActor()

	Initialized = true
	printdebug("initialized complete")

EndFunction

Bool Function isDependencyReady(String modname) Global
	int index = Game.GetModByName(modname)
	if index == 255 || index == -1
		return false
	else
		return true
	endif
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

int PCPosition

Function FindActorsAndVoices()
	
	
	Actor[] actorList = sexLabThreadController.Positions
	Int actorCount = actorList.Length
	Int actorIndex = 0

	mainFemaleVoice = MasterScript.GetVoiceForActress(playerCharacter)
	
	;Go through the list of all actors in the scene and get data on their gender and voices
	;PC is always main female
	While actorIndex < actorCount
	
		Actor actorInQuestion = actorList[actorIndex]
		if actorInQuestion == playerCharacter
			PCPosition = actorIndex
		endif
		
		
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
			
	if mainMaleActor == None
		if mainFemaleActor == actorList[0]
			mainMaleActor = actorList[1]
		else
			mainMaleActor = actorList[0]
		endif
	endif
	
	printdebug("mainfemaleactor :" + mainFemaleActor.getleveledactorbase().GetName())
	printdebug("mainmaleactor :" + mainMaleActor.getleveledactorbase().GetName())
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
	
	MasterScript.RegisterThatSceneIsEnding(maleOnlyScene)
	RemoveTracker()
	

	
EndEvent

Function ASLEndScene()	;manually end scene
	;miscutil.PrintConsole ("Triggered ASLEndScene ")
	RestoreArmor()
	ResetActorScale()
	ResetGhostActor()
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

	
	
	;If ( actorHavingOrgasm == mainMaleActor || (MasterScript.IsMale(actorHavingOrgasm) || hasSchlong(actorHavingOrgasm))) && actorHavingOrgasm != mainFemaleActor && !femaleisgiving()
	If actorHavingOrgasm != mainFemaleActor 
	printdebug("non PC ORGASM!" )
			RecordMaleOrgasm()


			if IsSuckingoffOther() || IsgettingPenetrated()
				If mainMaleVoice != None && actorHavingOrgasm == mainMaleActor
					PlaySound(mainMaleVoice.Orgasm, mainMaleActor, requiredChemistry = 0, soundPriority = 3, waitForCompletion = False, debugtext ="MaleOrgasm")	
				elseif DefaultMaleVoice != None
					PlaySound(DefaultMaleVoice.Orgasm, actorHavingOrgasm, requiredChemistry = 0, soundPriority = 3, waitForCompletion = False, debugtext ="DefaultMaleOrgasm")
				EndIf	
			endif
			
			if  SexLabThreadController.TotalTime - timeOfLastKneeJerkReaction > 2.0 && mainFemaleEnjoyment <= FemaleOrgasmHypeEnjoyment

				if MainFemaleisBurstingAtSeams() && CurrentPenetrationLvl() > 1
				
					float AdditionalHugePPChanceLeak = 1
					
						if ishugePP()
							AdditionalHugePPChanceLeak = 2
						endif	

						PlaySound(mainFemaleVoice.SurprisedByMaleOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext ="SurprisedByMaleOrgasm")

						;miscutil.PrintConsole (" leaking pussy")
						ASLAddThickCumleak()
						ASLAddCumPool()

				elseif 	!IsSuckingoffOther() || !IsgettingPenetrated() && !femaleisvictim() && moanonly != 1

					PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 2 , debugtext= "ReadyToGetGoing")	
				
				ElseIf IsSuckingoffOther() 	&& SexLabThreadController.TotalTime - timeOfLastStageStart > 2
					Utility.Wait(Utility.RandomFloat(0.5, 1.5))

					PlaySound(mainFemaleVoice.MaleOrgasmOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "MaleOrgasmOral")	
				
				elseif ishugepp() && SexLabThreadController.TotalTime - timeOfLastStageStart > 2 && moanonly != 1

					PlaySound(mainFemaleVoice.SurprisedByMaleOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext= "SurprisedByMaleOrgasm")

				elseif CurrentPenetrationLvl() > 1  && SexLabThreadController.TotalTime - timeOfLastStageStart > 2
					if moanonly == 1
						PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "MaleOrgasmNonOral")
					else
						PlaySound(mainFemaleVoice.MaleOrgasmNonOral, mainFemaleActor, requiredChemistry = 0, soundPriority = 3, debugtext= "MaleOrgasmNonOral")
					endif

				EndIf
				
			endif
			timeOfLastKneeJerkReaction = SexLabThreadController.TotalTime

			if Utility.RandomFloat(0.0, 1.0) <= 0.5
				ReacttoMaleOrgasmNext = true
			endif 

			teasedClosetoorgasm = false
			
	ElseIf actorHavingOrgasm == mainFemaleActor
	printdebug("PC ORGASM! ")
		;break immediately if NPC is the breaker
		if GetMainNPCTrait()== "+The Breaker" && !ASLisBroken()
			StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken" , StorageUtil.GetIntValue(None, "ASLTargetOrgasmtoBroken")) 
		endif
		
		if ChancetoLactateDuringOrgasm <= Utility.RandomInt(1, 100)
			Lactate()
		endif

		ASLAddOrgasmSSquirt()
		
		if !IsUnconcious()
			if moanonly == 1
				PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0, soundPriority = 3 , debugtext= "Oh")
			else
				PlaySound(mainFemaleVoice.Orgasm, mainFemaleActor, requiredChemistry = 0, soundPriority = 3, debugtext ="FemaleOrgasm" , Force = true) ;, waitForCompletion = False)	
			endif
		endif
			if hypebeforeorgasm == 1
				StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 1)
			endif
			CommentedClosetoOrgasm = false
		timeOfLastKneeJerkReaction = SexLabThreadController.TotalTime
		RecordFemaleOrgasm()
		ASLRemoveOrgasmSSquirt()
		
		
		;chance to create reaction next cycle
		float ChancetoReact = 0.6

		if ASLCurrentlyintense
			ChancetoReact = ChancetoReact / 2
		endif

		if ChancetoReact <= Utility.RandomFloat(0.0, 1.0)
			ReacttoFemaleOrgasmNext = true
		endif 
	EndIf
	
EndEvent

Event IVDTOnStageStart(string eventName, string argString, float argNum, form sender)
	
	If argString as Int != sceneID
		Return
	EndIf
	
EndEvent

Event OnUpdate()
printdebug(" Updating")
while Initialized == false ; wait until initialization complete
	Utility.Wait(1)
endwhile

if SexLab.FindPlayerController() == -1 
	StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)

	ASLEndScene()
endif

if actorWithSceneTrackerSpell == mainFemaleActor

	if ShouldInitialize == true && currentstage == 1

		PerformInitialization()
	endif
	;update enjoyment
	mainFemaleEnjoyment = GetActorEnjoyment(mainFemaleActor)
	mainMaleEnjoyment = GetActorEnjoyment(mainMaleActor)
	printdebug(" PC Enjoyment = " + mainFemaleEnjoyment)
	printdebug(" main Male Enjoyment = " + mainMaleEnjoyment)
	;calculate timers for auto advancing stages
		cycle = cycle + 1
	
	if cycle <= 1
		ASLUpdate()
	elseif ASLProcessStageAdvancing()
		cycle = 0
		
		if ShouldMovebackAStage()
			sexLabThreadController.advancestage(true)
		elseif	IsfinalStage() ;end stage if is last stage.
			printdebug(" Last Stage. Ending Sex Scene")
			ASLEndScene()
			sexLabThreadController.EndAnimation(true)
		else
			sexLabThreadController.advancestage()
		endif
	endif

	ASLUpdate()

;=========================run Dirty Talk & sex Effects=======================	
	;run lactating

	if (mainFemaleActor.IsEquipped(MilkL) || mainFemaleActor.IsEquipped(MilkR)) && !ASLcurrentlyIntense
		if Utility.RandomInt(1, 100) <= ChancetoStopLactate && GetMainNPCTrait() != "+The Milker" ;cant start lactating until scene ends with the milker
			printdebug(" Stop Lactating")
			StopLactate()
		endif
	else
		if ChancetoLactateDuringIntense <= Utility.RandomInt(1, 100) && ASLcurrentlyIntense
			Lactate()
		endif	
	endif
	
	;chance for male voice
	if AllowMaleVoice()
		PlayMaleComments()
	endif
	
	;if gagged, override everything else
	if HasDeviousGag(mainFemaleActor) 
	
		StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
		if EnableDDGagVoice == 1
			PlayGaggedSound()
		else
			Utility.Wait(8) ; dont play any voice if gagged
		endif 
	elseif IsKissing()  ;kissing 
	
		PlayKissing()
	elseif MoanOnly == 1	
		
		PlayMoanonly()
	;if reacting to female orgasm
	elseif ReacttoFemaleOrgasmNext == true 
	
		ASLHandleFemaleOrgasmReaction()
		
	;if reacting to male orgasm
	elseif	ReacttoMaleOrgasmNext == true

		ASLHandleMaleOrgasmReaction()
		
	elseif IsSuckingoffOther() ;blowjob always first because muffled by cock
	
		PlayBlowjob()
			
	elseif IsCunnilingus() && !ASLcurrentlyintense ;Cunnilingus
		
		PlayCunnilingus()

	elseif ASLisBroken() && !ASLCurrentlyintense
	
		PlayBroken()
	
	elseif IsCowgirl() ;cowgirl or femdom
	
		PlayCowgirl()
		
	elseif IsgettingPenetrated() && IshugePP() ; Huge pp Penetration
	
		PlayGettingFuckedbyHugePP()	
		
	elseif IsGettingDoublePenetrated() ; double penetratino
	
		PlayGettingFuckedDouble()
		
	elseif IsGettingInsertedBig() ; Fisting or huge objects
	
		PlayStimulatedHard() 
		
	elseif IsgettingPenetrated() ; Penetration

		PlayGettingFucked()
	
	elseif IsGivingAnalPenetration() || IsGivingVaginalPenetration() ;fucking others with penis
		
		PlayFuckingOthers()
	
	elseif IsGettingStimulated() ;Getting Stimulated like fingering but no penetration
	
		PlayGettingStimulated()
		
	elseif IsStimulatingOthers() ;Stimulating others with finger handjob footjob titfuck
		
		PlayStimulatingOthers()
		
	elseif IsEnding()
		
		PlayEnding()
		
	elseif IsLeadIN()
		
		PlayLeadIn()
	endif
	nextUpdateInterval = NextUpdateInterval()
endif

if actorWithSceneTrackerSpell == mainMaleActor
	nextUpdateInterval = 0.1
endif

	RegisterForSingleUpdate(nextUpdateInterval)
	
;miscutil.PrintConsole ("-----------------End CYCLE-------------------- " )
EndEvent

Function RemoveTracker()
	; Debug.Notification("Removing IVDT tracker from " + mainFemaleActor.GetActorBase().GetName())

	StorageUtil.UnSetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet")
	StorageUtil.unSetStringValue(None, "Scenario")
	StopLactate()
	ASLRemoveOrgasmSSquirt()
	ASLRemoveThickCumleak()
	ASLRemoveCumPool()
	;Perform needed clean up first
	UnregisterForUpdate()
	LowPrioritySounds.UnMute()
	
	;Do this very last, but make sure to do it (it's what actually removes the tracker)
	actorWithSceneTrackerSpell.RemoveSpell(SceneTrackerSpell)

EndFunction



Function RecordMaleOrgasm()
	;Ordering of some these statements matter because some depend on the others...
	
	if IsgettingPenetrated()
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
		Printdebug("Non PC Playing voice : " + debugtext)
		currentlyPlayingSoundCountMale = currentlyPlayingSoundCountMale + 1
		
		;lower down voice of female moan when male says something
	
		
		MasterScript.PlaySound(soundToPlay, actorMakingSound, waitForCompletion)
	
		currentlyPlayingSoundCountMale = currentlyPlayingSoundCountMale - 1
		

		
	;female playing sound
	elseif actorMakingSound == mainFemaleActor && (currentlyPlayingSoundCount == 0 || soundpriority > 1)	 ;Female play sound
		Printdebug("PC Playing voice : " + debugtext)
		ChangePCExpressions(debugtext)
		
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
	Return currentstage <= 2 && maleOrgasmCount < 2
EndFunction


Bool Function ShouldPlayMaleOrgasmHype()
	return mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && teasedClosetoorgasm == false

EndFunction

;make romantic comment
Function MakeRomanticCommentIfRightTime(Bool forceComment = False)

	PlaySound(mainFemaleVoice.LoveyDovey, mainFemaleActor, requiredChemistry = 0, debugtext="LoveyDovey")
	
	timeOfLastRomanticRemark = SexLabThreadController.TotalTime
	
EndFunction

Bool Function ShouldMakeRomanticComment()
	if femaleisvictim()
		return false
	elseIf SexLabThreadController.TotalTime - timeOfLastRomanticRemark < 60 ;Too soon. Romantic comments should be spaced out and rare
		Return False
	ElseIf !IsgettingPenetrated() && Currentstage <= 2
		Return Utility.RandomFloat(0.0, 1.0) < 0.1
	else 
		return false
	EndIf
EndFunction


Bool Function FemaleIsSatisfied()

	Return femaleRecordedOrgasmCount > utility.randomint(2,4)
endfunction

Bool Function MaleIsSatisfied()

	Return maleOrgasmCount >  utility.randomint(2,4)
endfunction


Bool Function PossiblyAskForCumInSpecificLocation()

	if IsGettingDoublePenetrated()
		if Utility.RandomFloat(0.0, 1.0) < 0.3
			PlaySound(mainFemaleVoice.AskForAnalCum, mainFemaleActor, requiredChemistry = 3 , debugtext = "AskForAnalCum")
		else	
			PlaySound(mainFemaleVoice.AskForVaginalCum, mainFemaleActor, requiredChemistry = 4 , debugtext = "AskForVaginalCum")
		endif
	elseif IsGettingVaginallyPenetrated()
		PlaySound(mainFemaleVoice.AskForVaginalCum, mainFemaleActor, requiredChemistry = 4 , debugtext = "AskForVaginalCum")
	elseif IsGettingAnallyPenetrated()
		PlaySound(mainFemaleVoice.AskForAnalCum, mainFemaleActor, requiredChemistry = 3 , debugtext = "AskForAnalCum")
   
	elseif IsSuckingoffOther()
		PlaySound(mainFemaleVoice.AskForOralCum, mainFemaleActor, requiredChemistry = 2 , debugtext = "AskForOralCum")	
	endif


EndFunction

Bool Function PossiblyRemarkOnCumLocation()
	;Go ahead with remark
	If locationOfLastMaleOrgasm == 1
		PlaySound(mainFemaleVoice.CameInMouth, mainFemaleActor, requiredChemistry = 0 , debugtext = "CameInMouth")
		Utility.Wait(Utility.RandomFloat(0.75, 1.75))
		Return True
	ElseIf locationOfLastMaleOrgasm == 2 
		PlaySound(mainFemaleVoice.CameInPussy, mainFemaleActor, requiredChemistry = 0 , debugtext = "CameInPussy")
		Utility.Wait(Utility.RandomFloat(0.75, 1.75))
		Return True
	ElseIf locationOfLastMaleOrgasm == 3 
		PlaySound(mainFemaleVoice.CameInAss, mainFemaleActor, requiredChemistry = 0 , debugtext = "CameInAss")
		
		Utility.Wait(Utility.RandomFloat(0.75, 1.75))
		
		
		Return True
	Else
		Return False ;Can't figure out where the hell we came so just uh pass on remarking
	EndIf
EndFunction


Function PlaySpankingSequence(Bool aggressiveLineAtStart = True)
	;spanking scenario
int spanksCompleted = 0
int SpankTarget = 0

SpankTarget = Utility.RandomInt(MinSpankCount, MaxSpankCount)
		
		if AllowMaleVoice()
		;	miscutil.PrintConsole ("Playing Male Comments spanking sequence")
			PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = False , debugtext = "StrugglingSubtle")
		endif
	While spanksCompleted < SpankTarget
		ASLIsinSpanking = true
		PlaySound(MasterScript.Sounds.Smack, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1 ,waitForCompletion = false)

		PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , SkipWait = true, debugtext = "Oh")
		spanksCompleted += 1
	
	EndWhile
		ASLIsinSpanking = false
		
	if Utility.RandomFloat(0.0, 1.0) < 0.7
		PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)
		
	endif

EndFunction

Bool Function IshugePP()

if EnableHugePPScenario != 1 
	return false
endif

Race MaleActorRace = mainMaleActor.GetRace()
String MaleRaceName = MaleActorRace.GetName()

if stringutil.find(MaleRaceName ,"Brute") > -1 || stringutil.find(MaleRaceName ,"Spider") > -1 || stringutil.find(MaleRaceName ,"Lurker") > -1 || stringutil.find(MaleRaceName ,"Daedroth") > -1  ||  stringutil.find(MaleRaceName ,"Horse") > -1 || stringutil.find(MaleRaceName ,"Bear") > -1 || stringutil.find(MaleRaceName ,"Chaurus") > -1 || stringutil.find(MaleRaceName ,"Dragon") > -1 || MaleRaceName ==  "Frost Atronach" || stringutil.find(MaleRaceName ,"Giant") > -1 || MaleRaceName ==  "Mammoth" || MaleRaceName ==  "Sabre Cat" || stringutil.find(MaleRaceName ,"Troll") > -1 || MaleRaceName ==  "Werewolf" || stringutil.find(MaleRaceName ,"Gargoyle") > -1 || MaleRaceName ==  "Dwarven Centurion" || stringutil.find(MaleRaceName ,"Ogre") > -1 ||  MaleRaceName ==  "Ogrim" || MaleRaceName ==  "Nest Ant Flier" || stringutil.find(MaleRaceName ,"OGrim") > -1

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
	EndIf
	
	Return false
endif
EndFunction


Bool Function IsLeadIN()
	return stringutil.find(Labelsconcat ,"1F") == -1 && stringutil.find(Labelsconcat ,"1S") == -1 && stringutil.find(Labelsconcat ,"BST") == -1
endfunction 


Bool Function Ishumanoidrace()

Race MaleActorRace = mainMaleActor.GetRace()
String MaleRaceName = MaleActorRace.GetName()

if MaleRaceName ==  "Wood Elf" || MaleRaceName ==  "Draugr" || MaleRaceName ==  "Redguard" || MaleRaceName ==  "Old People Race" || MaleRaceName ==  "Khajiit" || MaleRaceName ==  "High Elf" || MaleRaceName ==  "Dremora" || MaleRaceName ==  "Draugr" || MaleRaceName ==  "Dark Elf" || MaleRaceName ==  "Giant" || MaleRaceName ==  "Orc" || MaleRaceName ==  "Troll" || MaleRaceName ==  "Werewolf" || MaleRaceName ==  "Gargoyle" || MaleRaceName ==  "Snow Troll" || MaleRaceName ==  "Nord" || MaleRaceName ==  "Imperial" || MaleRaceName ==  "Breton" || MaleRaceName ==  "Argonian"
Return True 
else 
Return False
endif
EndFunction

Bool Function FemaleIsVictim()
return SexLab.IsVictim(sceneID, mainFemaleActor) && !ASLisBroken() && EnableVictimScenario == 1
EndFunction

Bool Function MaleIsVictim()
return SexLab.IsVictim(sceneID, mainMaleActor) && EnableVictimScenario == 1
EndFunction


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
		printdebug("ishugepp Scenario : " + ishugepp()) 
		UpdateLabels(CurrentAnimation , currentstage , PCPosition) ;update only for PC
		PrimaryStageLabel = GetPrimaryLabel()		

		;multiply stage timers for certain NPC traits
		float TimerMultiplier = 1
		;longer timers for Aggressive NPC
	if MainMaleCanControl()
	
		if GetMainNPCTrait() == "Aggressive+" && IsgettingPenetrated()
			TimerMultiplier = 2
		elseif GetMainNPCTrait() == "Aggressive+" && !IsgettingPenetrated()
			TimerMultiplier = 0.5
		elseif GetMainNPCTrait() == "Impatient+" && !IsgettingPenetrated()
			TimerMultiplier = 0.5
		elseif GetMainNPCTrait() =="Rape Loving+" && femaleisvictim() && IsgettingPenetrated()
			TimerMultiplier = 1.5
		elseif GetMainNPCTrait() =="Pussy Loving+" && IsGettingVaginallyPenetrated()
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="Anal Loving+"  && IsGettingAnallyPenetrated()
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="+The Penetrator" && IsgettingPenetrated()
			TimerMultiplier = 1.5
		elseif GetMainNPCTrait() =="Oral Loving+" && IsSuckingoffOther()
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="Sexually Frustrated+" && IsgettingPenetrated()
			TimerMultiplier = 1.5 
		elseif GetMainNPCTrait() =="+The Nut Gobbler" && IsSuckingoffOther()
			TimerMultiplier = 2 
		elseif GetMainNPCTrait() =="+Cowgirl" && IsCowgirl()
			TimerMultiplier = 2
		elseif GetMainNPCTrait() =="+In Heat" && IsgettingPenetrated()
			TimerMultiplier = 1.3
		endif
	endif
		printdebug("Stage Timer : " + GetPrimaryLabel() +" : "+ GetTimer())
		printdebug(" Main NPC Trait From Hentairim traits - " + GetMainNPCTrait() + " . " + " Stage time multiplier = " + TimerMultiplier)

		ASLStagetimetoadvance = sexLabThreadController.TotalTime  + (GetTimer() * TimerMultiplier)
		
		printdebug("Stage Time to Advance (Seconds): " + GetTimer() * TimerMultiplier )
		
		SetActorScale()
		StageTransitioning = true

		;set intensity
		ASLpreviouslyintense = ASLcurrentlyIntense

		if Isintense() 
			ASLCurrentlyintense = true
		else
			ASLCurrentlyintense = false
		endif
		printdebug("Stage is intense? : " + ASLCurrentlyintense)
	endif

	

	
;calculate time needed to advance stage
	if StageTransitioning && actorWithSceneTrackerSpell == mainFemaleActor

		printdebug("Stage Transitioning")
		ASLPlayStageTransition()
	endif

endif
endfunction

Function PlayLeadIn() ;no relevant tags
printdebug("Play Lead In")

if currentstage < 3 && !femaleisvictim() ;greets only on first 2 stages	

	if  ShouldMakeRomanticComment()
		MakeRomanticCommentIfRightTime()
	elseif ishugepp() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLeadinStage
		PlaySound(mainFemaleVoice.GreetLoadedFamiliar, mainFemaleActor, requiredChemistry = 1, debugtext = "GreetLoadedFamiliar")
	;make greeting at 7% chance at 1st stage
	elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLeadinStage && Currentstage == 1
		ASLMakeGreetingToMalePartner()
	endif
endif	
	
	
	if PrevEndingLabel == "ENO" || PrevEndingLabel == "ENI"; for some reason if the EN stage was extended into LI	
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 , debugtext = "AfterOrgasmExclamations")
	elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLeadinStage * 2 && mainFemaleEnjoyment >= 50 && !FemaleIsVictim()
		PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 0 , debugtext = "ReadyToGetGoing")	
	else
		
		PlayBreathyorforeplaysound()

	endif

endfunction

Function PlayKissing()
printdebug("Play Kissing")

if  ShouldMakeRomanticComment()
	MakeRomanticCommentIfRightTime()
else		
;dont say make any noise while kissing. let Enjoyment make the kissing sound
if useblowjobsoundforkissing == 1
	PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionSoft")
else
	Utility.wait(3)
endif
;PlayBreathyorforeplaysound()

endif
endfunction

Function PlayCunnilingus()
printdebug("Play Cunnilingus")

if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
	ASLPlayMaleClosetoOrgasmComments()
else
	PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionSoft")
endif
endfunction

Function PlayMaleComments()
	
	if (Primarystagelabel == "LDI" || IsGettingStimulated()) && !IsgettingPenetrated() && Currentstage < 3
	
		PlaySound(mainMaleVoice.Aroused, mainMaleActor, requiredChemistry = 0, soundPriority = 2 ) 		

		if	ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "AfterOrgasmExclamations")	
		else
			PlaySound(mainFemaleVoice.Foreplaysoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "Foreplaysoft")
		endif	

	elseif ShouldPlayMaleOrgasmHype() 

		
		PlaySound(mainMaleVoice.AboutToCum, mainMaleActor, requiredChemistry = 0,  soundPriority = 2 , waitForCompletion = False )
		;female background moaning
		
		if IsUnconcious()
			return
		elseif ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "AfterOrgasmExclamations")	
		else
			if ASLCurrentlyintense 

				PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "NearOrgasmNoises")
				else
				PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1 , debugtext = "PenetrativeGrunts")
			endif	
		endif
		
	elseif MaleIsVictim() || IsFemdom()
		;miscutil.PrintConsole ("Playing Male Comments male victim On the attack")
		;male say something
		PlaySound(mainMaleVoice.TeaseAggressivePartner, mainMaleActor, soundPriority = 2 , waitForCompletion = False )
		;female background moaning
		if IsUnconcious()
			return
		elseif ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "AfterOrgasmExclamations")	
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1 , debugtext = "PenetrativeGrunts")
			
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
		;female background moaning
		
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "NearOrgasmNoises")
	
	elseif	CurrentPenetrationLvl() >= 2 && !ASLCurrentlyintense 
		;miscutil.PrintConsole ("Playing Male Comments non Intense Penetration")
				;female background moaning
		PlaySound(mainMaleVoice.StrugglingEarly, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = False , debugtext = "StrugglingEarly")

		if IsUnconcious()
			return
		elseif ASLisBroken()
			PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "AfterOrgasmExclamations" )	
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 1 , debugtext = "PenetrativeGrunts")
			        
		endif
		
		
	endif		

endfunction


Function PlayBlowjob()

	If femaleCloseToOrgasm() && IsgettingPenetrated() ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()	
	else	

		if VoiceVariation == "A"
			if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
				ASLPlayMaleClosetoOrgasmComments()
			elseif Utility.RandomFloat(0.0, 1.0) <= ChanceToCommentonBlowjobStage && ASLcurrentlyIntense
				PlaySound(mainFemaleVoice.AppreciatePartner, mainFemaleActor, requiredChemistry = 0 , debugtext = "AppreciatePartner")
			elseif Utility.RandomFloat(0.0, 1.0) <= ChanceToCommentonBlowjobStage && !femaleisvictim() && !ASLIsBroken() && !ASLcurrentlyIntense
				PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobRemarks")
			elseif ASLcurrentlyIntense
				PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionIntense")
			else
				PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionSoft")
			endif
		else	
			if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
				ASLPlayMaleClosetoOrgasmComments()
			elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonBlowjobStage && currentstage > 1 && !femaleisvictim() && !ASLIsBroken()
				PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobRemarks")
			elseif ASLcurrentlyIntense
				PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionIntense")
			else
				PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionSoft")
			endif
		endif

	endif	

endfunction

Function PlayStimulatingOthers() 
printdebug("Play Stimulating Others")

If ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm  ;if male close or orgasm
	ASLPlayMaleClosetoOrgasmComments()
else
	;after close to orgasm handling
	if	Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/3 && !FemaleIsVictim()
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Amused")
	else
		PlayBreathyorforeplaysound()
	EndIf
			
endif
EndFunction


Function PlayStimulatedHard() 
printdebug("Play Stimulated Hard (Huge non Penile insertion)")


if CommentedClosetoOrgasm
	PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , debugtext = "SensitivePleasure")
elseif femaleCloseToOrgasm() 
	ASLPlayFemaleOrgasmHype()
else
	if Utility.RandomFloat(0.0, 1.0) < 0.8
			PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , debugtext = "SensitivePleasure")
	
	else	
		PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 3 , debugtext = "Oh")
		Utility.Wait(Utility.RandomFloat(1.0, 2.0))
		PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext = "AfterGape")
	endif
endif

EndFunction

Function PlayGettingStimulated() 

printdebug("Play Getting Stimulated")
;------------------INTENSE-------------------
if ASLCurrentlyintense
	
	if CommentedClosetoOrgasm
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
	elseIf femaleCloseToOrgasm()  ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()
	else ;After Handling close to Orgasm
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	EndIf
	
;------------------ NOt INTENSE-------------------
else	
	if CommentedClosetoOrgasm
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	elseIf femaleCloseToOrgasm() ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()
	else
		;after handling close to orgasm
		If femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused
			PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Unamused")
		else
			PlayBreathyorforeplaysound()
		EndIf
	endif
endif

EndFunction

Function PlayFuckingOthers() 
printdebug("Play Fucking Others")

if CommentedClosetoOrgasm
	if ASLcurrentlyintense
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	else
		PlayBreathyorforeplaysound()
	endif
elseIf femaleCloseToOrgasm() ;When female close to orgasm
	ASLPlayFemaleOrgasmHype()
elseIf ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm  ;if male close or orgasm
	ASLPlayMaleClosetoOrgasmComments()
else
	;after close to orgasm handling
	if	Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/3
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Amused")
	else
		if ASLcurrentlyintense
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
		else
			PlayBreathyorforeplaysound()
		endif
	EndIf
			
endif

EndFunction

Function PlayBroken()
printdebug("Play Broken")
if CommentedClosetoOrgasm
	PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
elseIf femaleCloseToOrgasm() ;When female close to orgasm
	ASLPlayFemaleOrgasmHype()
elseif  Utility.RandomFloat(0.0, 1.0) < 0.15	&& !ASLcurrentlyintense

	PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "AfterOrgasmExclamations")	
elseif IsFemdom() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/2

	PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry = 0 , debugtext = "OnTheAttack") 	
elseif  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/4

	PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "Amused") 
elseif  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage/4	

	PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0 , debugtext = "InAwe")	
else

	PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "AfterOrgasmArouse")
endif
endfunction

Function PlayCowgirl() 

printdebug("Play Cowgirl")

if CommentedClosetoOrgasm
	if ASLcurrentlyintense
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
	else
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	endif
elseIf femaleCloseToOrgasm() ;When female close to orgasm
	ASLPlayFemaleOrgasmHype()
elseIf ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm  ;if male close or orgasm
	ASLPlayMaleClosetoOrgasmComments()
else
	;after close to orgasm handling

	;make greeting 
	if Utility.RandomFloat(0.0, 1.0)  < ChanceToCommentonNonIntenseStage && currentstage == 1 && GreetedMalePartner == false && !ASLCurrentlyintense
		ASLMakeGreetingToMalePartner() 
		GreetedMalePartner = true
	endif
	
	If Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage ; femdom comments
		if Utility.RandomInt(1,2) == 1
			PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry = 0 , debugtext = "OnTheAttack")	
		else 
			PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Amused")
		endif
	elseif ishugepp() && Utility.RandomFloat(0.0, 1.0)  < ChanceToCommentonNonIntenseStage && !ASLcurrentlyIntense
		PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 1 , debugtext = "InAwe")
	elseif Utility.RandomFloat(0.0, 1.0)  < ChanceToCommentonNonIntenseStage && !ASLcurrentlyIntense
		if Utility.randomint(1,2) == 1
			PossiblyAskForCumInSpecificLocation()
		else
			PlaySound(mainFemaleVoice.PenetrativeCommentssoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeCommentssoft")	
		endif
	elseif Utility.RandomFloat(0.0, 1.0)  < ChanceToCommentonIntenseStage && ASLcurrentlyIntense
		PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeCommentsIntense")	
	else	
		if ASLcurrentlyintense
			PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
		endif
	EndIf
			
endif

EndFunction


Function PlayGettingFuckedbyHugePP() ; when on huge pp scenario
printdebug("Play Getting Fucked by Huge PP")


if CommentedClosetoOrgasm
	PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , debugtext = "SensitivePleasure")
elseif femaleCloseToOrgasm() 
	ASLPlayFemaleOrgasmHype()
else
	if IsGettingDoublePenetrated()
	
		PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , debugtext = "SensitivePleasure")
		
	elseif ASLCurrentlyintense	
		if IsGettingAnallyPenetrated() && utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
			PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry = 0 , debugtext = "IntenseAnal")
		elseif Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
			PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)
		else
			PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , debugtext = "SensitivePleasure")
		endif
	else

		; breath and gape breath and gape. ASL SA FA reserved for large pp creature piston cycle time > 2 seconds
		if Utility.RandomFloat(0.0, 1.0) < 0.5
			PlayBreathyorforeplaysound()
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
		endif
		
		if Utility.RandomFloat(0.0, 1.0) < 0.2
			Utility.Wait(Utility.RandomFloat(1.0, 2.0))

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 ,soundPriority = 3 , debugtext = "Oh")
			Utility.Wait(1.0)

			PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext = "AfterGape")
		endif
	endif
endif

EndFunction


Function PlayMoanonly()
printdebug("Play Moan only")

StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
if ASLCurrentlyintense
	if IsSuckingoffOther()
		PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionIntense")
	elseif IsgettingPenetrated()
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
	elseif IsGettingStimulated()
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	else
		PlayBreathyorforeplaysound()
	endif

else
	if IsSuckingoffOther()
		PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "BlowjobActionSoft")
	elseif IsgettingPenetrated()
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	elseif isending()
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0  , debugtext = "AfterOrgasmExclamations")
	else
		PlayBreathyorforeplaysound()
	endif
	
endif
endfunction


Function PlayGettingFucked() 
printdebug("Play Getting Fucked")

;------------------ INTENSE-------------------
if ASLCurrentlyintense
	;if isHumanoidrace() && Utility.RandomFloat(0.0, 1.0) < ChanceTohaveSpanking && (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Standing") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style"))
	;	PlaySpankingSequence()
	;endif
	
	if CommentedClosetoOrgasm
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
	elseIf femaleCloseToOrgasm()  ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()
	elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm 
		ASLPlayMaleClosetoOrgasmComments()
	else ;After Handling close to Orgasm
		if FemaleIsVictim() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
			PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0)
		elseIf IsGettingAnallyPenetrated() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
			PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry = 0 , debugtext = "IntenseAnal")
		elseIf IsGettingVaginallyPenetrated() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
			PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeCommentsIntense")	
		else
			PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
		endif
	EndIf
	
;------------------ NOT INTENSE-------------------
else	
	if CommentedClosetoOrgasm
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	elseIf femaleCloseToOrgasm() ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()
	elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
		ASLPlayMaleClosetoOrgasmComments()
	else
		;after handling close to orgasm
		If femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused
			PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Unamused")
		elseIf  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
			PlaySound(mainFemaleVoice.PenetrativeCommentssoft, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeCommentssoft")	
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
		EndIf

	endif
endif
endfunction

Function PlayGettingFuckedDouble() 
printdebug("Play Getting Double Fucked")

if ASLCurrentlyintense

	
	if CommentedClosetoOrgasm
		PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
	elseIf femaleCloseToOrgasm()  ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()
	elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm 
		ASLPlayMaleClosetoOrgasmComments()
	else ;After Handling close to Orgasm
		If IsGettingAnallyPenetrated() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
			if Utility.Randomint(1,2) == 1
				PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry = 0 , debugtext = "IntenseAnal")
			else
				PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeCommentsIntense")
			endif	
		else
			if currentAnimation.hastag("Tentacles")
				PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
			else
				PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , debugtext = "SensitivePleasure")
			endif
		endif
	EndIf
	
	;Not Intense
else	
	if CommentedClosetoOrgasm
		PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , debugtext = "PenetrativeGrunts")
	elseIf femaleCloseToOrgasm() ;When female close to orgasm
		ASLPlayFemaleOrgasmHype()
	elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
		ASLPlayMaleClosetoOrgasmComments()
	else
		;after handling close to orgasm
		If femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused
			PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Unamused")
		elseIf  Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
			PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0 , debugtext = "TeaseAggressivePartner")
		else
			if currentAnimation.hastag("Tentacles")
				PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "PenetrativeGrunts")
			else
				PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , debugtext = "NearOrgasmNoises")
			endif
		EndIf
	endif
endif

endfunction

Function PlayEnding()
printdebug("PLay Ending")
;chance to leak cum 
if  Utility.RandomFloat(0.0, 1.0) < ChanceToLeakThickCum && CameInsideCount > 0
	ASLAddThickCumleak()

endif

StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)

	if commentedcumlocation == false && !femaleisvictim() && CameInsideCount > 0
		commentedcumlocation = true
		PossiblyRemarkOnCumLocation()
	elseif MaleCommentsonEN == false && AllowMaleVoice() 
		;miscutil.PrintConsole ("Playing Male Comments EN stage")
		if MaleIsVictim()
			PlaySound(mainMaleVoice.TeaseAggressivePartner, mainMaleActor, soundPriority = 2 , waitForCompletion = False ,debugtext = "TeaseAggressivePartner")
		else
			PlaySound(mainMaleVoice.PostNutRemark, mainMaleActor, requiredChemistry = 0, soundPriority = 2 , waitForCompletion = false ,debugtext = "PostNutRemark")
		endif
		Utility.Wait(Utility.RandomFloat(1.0, 2.0))
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 ,debugtext = "AfterOrgasmExclamations")
	elseif commentedorgasmremark == false  && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
		commentedorgasmremark = true
			If	femaleisvictim() && Utility.RandomFloat(0, 1.0) < ChanceToCommentUnamused * 3
				PlaySound(mainFemaleVoice.UnamusedEnd, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 ,debugtext = "UnamusedEnd")
		elseif	femaleRecordedOrgasmCount > Utility.RandomInt(2, 5) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
				PlaySound(mainFemaleVoice.MadeMeCumSoMuch, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "MadeMeCumSoMuch")
		EndIf
	elseif currentAnimation.HasTag("femdom") && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage
		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0 ,debugtext = "Amused")
	else
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 ,debugtext = "AfterOrgasmExclamations")
	endif

endfunction



function PlayBreathyorforeplaysound()

	if ASLCurrentlyintense
		if Utility.RandomFloat(0.0, 1.0) <= 0.5
			PlaySound(mainFemaleVoice.Foreplayintense, mainFemaleActor, requiredChemistry = 0 , debugtext ="Foreplayintense")
		else
			PlaySound(mainFemaleVoice.BreathyIntense, mainFemaleActor, requiredChemistry = 0 , debugtext ="BreathyIntense")
		endif
	else
		if Utility.RandomFloat(0.0, 1.0) <= 0.5 
			PlaySound(mainFemaleVoice.Foreplaysoft, mainFemaleActor, requiredChemistry = 0 , debugtext ="Foreplaysoft")
		else
			PlaySound(mainFemaleVoice.BreathySoft, mainFemaleActor, requiredChemistry = 0 , debugtext ="BreathySoft")
		endif
	endif

endfunction

function ASLPlayMaleClosetoOrgasmComments()
			;miscutil.PrintConsole ("Teasing Male Close to Orgasm")
		if IsStimulatingOthers() && !IsgettingPenetrated() && !IsGettingStimulated()
			PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 0 , debugtext = "ReadyToGetGoing")
		elseif	mainFemaleEnjoyment > femaleorgasmhypeenjoyment && !femaleisvictim() && IsgettingPenetrated()

		PlaySound(mainFemaleVoice.CumTogetherTease, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "CumTogetherTease")
		
		elseif  FemaleIsVictim() && IsgettingPenetrated()

			PlaySound(mainFemaleVoice.PullOut, mainFemaleActor, requiredChemistry = 0, soundPriority = 2 , debugtext = "PullOut")
		elseif IsEarlyToCum()	&& !ASLCurrentlyintense && !femaleisvictim() && IsgettingPenetrated()

			PlaySound(mainFemaleVoice.MaleCloseAlready, mainFemaleActor, requiredChemistry = 1, soundPriority = 1 , debugtext = "MaleCloseAlready" )
		elseif IsFemdom() && !ASLCurrentlyintense

			PlaySound(mainFemaleVoice.MaleCloseNotice, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "MaleCloseNotice")
			
		elseif ASLCurrentlyintense  && IsgettingPenetrated()
		
			PlaySound(mainFemaleVoice.TeaseMaleCloseToOrgasmIntense, mainFemaleActor, requiredChemistry = 1 , soundPriority = 1 , debugtext = "TeaseMaleCloseToOrgasmIntense")
		elseif  IsgettingPenetrated()

			PlaySound(mainFemaleVoice.TeaseMaleCloseToOrgasmSoft, mainFemaleActor, requiredChemistry = 1 , soundPriority = 1 , debugtext = "TeaseMaleCloseToOrgasmSoft")
		
		endif
				
		if Utility.RandomFloat(0.0, 1.0) < chancetocommentwhenmaleclosetoorgasm && !femaleisvictim()
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

;-----------------------NOT INTENSE------------------

	if !ASLCurrentlyintense
		if (IsStimulatingOthers() || IsGettingStimulated()) && !femaleisvictim() && !IsgettingPenetrated()
			PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry = 0 , debugtext = "ReadyToGetGoing")	
		elseif maleOrgasmCount > femaleRecordedOrgasmCount && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && !FemaleIsVictim() && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
			PlaySound(mainFemaleVoice.MyTurnToCum, mainFemaleActor, requiredChemistry = 3 , soundPriority = 1 , debugtext = "MyTurnToCum")
		Elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm  && CommentedClosetoOrgasm == false
			PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "NearOrgasmExclamations")
		else
			PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "PenetrativeGrunts")
		endif
;-----------------------INTENSE------------------
	elseif ASLcurrentlyIntense 
		If IshugePP() && IsgettingPenetrated() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
				PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "SensitivePleasure")	
		EndIf
	elseif IsgettingPenetrated() || IsGettingStimulated()
		If Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && CommentedClosetoOrgasm == false
			PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "NearOrgasmExclamations")
		Else 
			PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "NearOrgasmNoises")
		EndIf
		
	endif
StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
printdebug("Allow Female Orgasm")
CommentedClosetoOrgasm = true

EndFunction

bool function Malewantsmore()

	return mainMaleEnjoyment >= 30 || maleOrgasmCount <= Utility.randomint(1,4)

endfunction

function ASLHandlemaleOrgasmreaction()

	
	if maleOrgasmCount > 1 && !femaleisvictim() && !IsSuckingoffOther() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
		PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "InAwe")
	endif

	;a chance to react to male orgasm
		
	if IsSuckingoffOther()
					
		if AllowMaleVoice()
			PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 2, waitForCompletion = false , debugtext = "JokeAfterOrgasm")
		endif	
				
		PlaySound(mainFemaleVoice.CameInMouth, mainFemaleActor, requiredChemistry = 0 , soundPriority = 2 , debugtext = "CameInMouth")
				
	elseif IsCowgirl() || IsGivingAnalPenetration() || IsGivingVaginalPenetration()
	
		PlaySound(mainFemaleVoice.MaleOrgasmReactionSoft, mainFemaleActor, requiredChemistry = 0, soundPriority = 2 , debugtext = "MaleOrgasmReactionSoft")
		
	elseIf 	ASLCurrentlyintense && IsgettingPenetrated()
				
		;Chance for male comments	
		if AllowMaleVoice()

			PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "JokeAfterOrgasm")
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))
		endif
		
		if Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
			PlaySound(mainFemaleVoice.MaleOrgasmReactionIntense, mainFemaleActor, requiredChemistry = 0, soundPriority = 2 , debugtext = "MaleOrgasmReactionIntense")
		endif

	Elseif IsgettingPenetrated()
		if AllowMaleVoice()
			PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "JokeAfterOrgasm")
			Utility.Wait(Utility.RandomFloat(0.5, 2.0))
		endif
		
		if Utility.RandomFloat(0.0, 1.0) <= 0.4	
			if femaleisvictim()

				PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0 , debugtext = "Unamused")
			else

				PlaySound(mainFemaleVoice.MaleOrgasmReactionSoft, mainFemaleActor, requiredChemistry = 0, soundPriority = 2)
			endif
		endif
	EndIf


	ReacttoMaleOrgasmNext = false

	
endfunction

Function ASLHandleFemaleOrgasmReaction()

;chance to react after orgasm

if VoiceVariation == "A"

	if	ASLIsBroken() && mainMaleActor != None
	
		PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext="AfterOrgasmArouse")
		
	elseif (IsGivingAnalPenetration() || IsGivingVaginalPenetration() ) && mainMaleActor != None

		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="Amused")
		
	elseif ASLCurrentlyintense  && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage && mainMaleActor != None
		if IsCowgirl()
			PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext="Amused")
		else
			PlaySound(mainFemaleVoice.AskForPacingBreak, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="AskForPacingBreak")
		endif
	elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage && mainMaleActor != None

		PlaySound(mainFemaleVoice.AfterOrgasmRemarks, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="AfterOrgasmRemarks")
	else
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="AfterOrgasmExclamations")
	endif

else
	if	ASLIsBroken()

		PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext="AfterOrgasmArouse")
	elseif IsFemdom() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage

		PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="Amused")
		
	elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
	
		PlaySound(mainFemaleVoice.AfterOrgasmRemarks, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="AfterOrgasmRemarks")
		
	else
		PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="AfterOrgasmExclamations")	
	endif
endif
	
If mainMaleActor != None && Utility.RandomFloat(0.0, 1.0) < 0.5 && !FemaleIsVictim()  && !ASLCurrentlyintense
	If !FemaleIsSatisfied() && IsgettingPenetrated()
			Utility.Wait(Utility.RandomFloat(1.0, 2.0))

			PlaySound(mainFemaleVoice.WantMore, mainFemaleActor, requiredChemistry = 5, soundPriority = 1 , debugtext = "WantMore")
	else

		PlaySound(mainFemaleVoice.Satisfied, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "Satisfied")
	EndIf
EndIf	

ReacttoFemaleOrgasmNext = false


endfunction

Function ASLPlayStageTransition()

if currentStage >= 3
	ShouldInitialize = true
endif

if IsgettingPenetrated()
	timesGaped += 1
endif	
	
	Utility.Wait(Utility.RandomFloat(0.5, 1.0)) ; wait up to 1 second for transition to complete before playing voice
	

		BodySwitchtoLewdArmor()
		;unequipmask for blowjob

		
	
	if mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment || moanonly == 1
		if !PreviousStageHasPenetration() && IsgettingPenetrated()
			PlaySound(MasterScript.Sounds.PullOutGape, mainFemaleActor, requiredChemistry = 0, soundPriority = 2, waitForCompletion = false , debugtext="PullOutGape")
			if ishugepp()

				PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext = "AfterGape")
			else
				PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext = "Oh")
			endif
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))
		endif
		return
	elseif HasDeviousGag(mainFemaleActor) 
		StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet" , 0)
		if EnableDDGagVoice == 1
			PlayGaggedSound()
		endif 	
	;male moving backwards from ending to fuck somemore
	elseif	IsgettingPenetrated() && PrevEndingLabel == "ENO" && MainMaleCanControl()

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , SkipWait = true , debugtext="Oh")
			Utility.Wait(Utility.RandomFloat(0.5, 1.5))
			PlaySound(mainFemaleVoice.NoticeMaleWantsMore, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="NoticeMaleWantsMore")
				
				if !MainFemaleisBurstingAtSeams()
					ASLRemoveThickCumleak()
				endif	
				
	;-------------Transition from no penetration to penetration----------------------
	elseif !PreviousStageHasPenetration() && IsgettingPenetrated()
		printdebug("Stage Transition - No Penetration to Penetration")
		PlaySound(MasterScript.Sounds.PullOutGape, mainFemaleActor, requiredChemistry = 0, soundPriority = 2, waitForCompletion = false , debugtext="PullOutGape")
		
		if ishugepp()

			PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext = "AfterGape")
		else
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext = "Oh")
		endif
		Utility.Wait(Utility.RandomFloat(0.5, 1.0))

		
		if AllowMaleVoice()
			PlaySound(mainMaleVoice.StrugglingEarly, mainMaleActor, requiredChemistry = 0, soundPriority = 2, debugtext="StrugglingEarly")
		endif
		
		IF !IsSuckingoffOther() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
			if IsCowgirl()

				PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="Amused")
			elseif ASLCurrentlyintense || ishugePP() 

				PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0 , debugtext="TeaseAggressivePartner")
				
			elseif femaleisvictim() && Utility.RandomFloat(0.5, 1.0) < 0.5
			
				PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry = 0 , debugtext="Unamused")	
			elseif IsGettingAnallyPenetrated()

				PlaySound(mainFemaleVoice.InsertionAnalSlow, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext="InsertionAnalSlow")
			
			else

				PlaySound(mainFemaleVoice.InsertionGeneric, mainFemaleActor, requiredChemistry = 0 ,  soundPriority = 1 , debugtext="InsertionGeneric")
			endif
				
		endif
		
	;------------maintain Fast Penetration during Transition---------------- 
	elseif ASLpreviouslyintense && ASLCurrentlyintense 
		printdebug(" Stage Transition - Maintain Intensity")
		
			if AllowMaleVoice()
				PlaySound(mainMaleVoice.Aggressive, mainMaleActor, soundPriority = 2, debugtext="Aggressive" )
			endif
			
			if  !IsSuckingoffOther() && IsgettingPenetrated() && Utility.randomfloat(0.0,1.0) < chancetocommentonintensestage
				PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext="InAwe" )
			endif
	;------------------Transition from Slow Penetration to Fast Penetration-----------------
	elseif !ASLpreviouslyintense && PreviousStageHasPenetration() && ASLcurrentlyintense && IsgettingPenetrated()
		
		if AllowMaleVoice() 
				PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, soundPriority = 2 , waitForCompletion = false, debugtext="StrugglingSubtle" )
				
		endif		

		
		if ishugepp() || IsGettingDoublePenetrated()
				
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext="Oh" )
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))			

			PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext="AfterGape")


		elseif !FemaleIsVictim()

			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3, debugtext="Oh"  )
			
			Utility.Wait(Utility.RandomFloat(0.5, 1.0))
			
			if Utility.randomfloat(0.0,1.0) < chancetocommentonintensestage
				PlaySound(mainFemaleVoice.MaleHalfwayIntense, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext="MaleHalfwayIntense")	
			endif		
		else
			PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry = 0 , soundPriority = 3 , debugtext="Oh")
			
			if AllowMaleVoice() 
				PlaySound(mainMaleVoice.Aggressive, mainMaleActor, soundPriority = 2 , debugtext = "Aggressive")
			endif
			
			IF Utility.randomfloat(0.0,1.0) < chancetocommentonintensestage
			Utility.Wait(Utility.RandomFloat(0.5, 1.5))
				PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry = 0 , soundPriority = 1 , debugtext = "TeaseAggressivePartner")	
			endif
			
		endif

;----------------------------if non intense after intense penetrative action--------------
	elseif	ASLpreviouslyintense && !ASLcurrentlyIntense 
			printdebug(" Stage Transition - Non Intense to Intense")
				PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry = 0, soundPriority = 1 , debugtext = "AfterOrgasmExclamations")
	
	endif

endfunction

Function ASLMakeGreetingToMalePartner()

	 Bool partnerLoaded = mainMaleEnjoyment > 50 
	 
	If hoursSinceLastSex < 5.0
		Return
	EndIf

	if partnerLoaded 
		PlaySound(mainFemaleVoice.GreetLoadedFamiliar, mainFemaleActor, requiredChemistry = 4 , debugtext = "GreetLoadedFamiliar")
	elseif withMaleLover	
		PlaySound(mainFemaleVoice.GreetLover, mainFemaleActor, requiredChemistry = 6 , debugtext = "GreetLover")
	else
		PlaySound(mainFemaleVoice.GreetFamiliar, mainFemaleActor, requiredChemistry = 4 , debugtext = "GreetFamiliar")
	endif

	
EndFunction



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

	if	!mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255 
		mainFemaleActor.addItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor , abSilent=true)
		mainFemaleActor.EquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
	endif

endfunction

Function ASLRemoveThickCumleak()

	if	mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) 
		mainFemaleActor.unEquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor , abSilent=true)
		mainFemaleActor.removeItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
	endif

endfunction

Function ASLAddCumPool()
if EnableThickCumLeak != 1 
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

bool function ASLIsBroken()
	
	return GetBrokenPoints() > 0 && EnableBrokenStatus == 1
endfunction

int function GetBrokenPoints()
	return mainfemaleactor.GetFactionRank(HentairimBroken)
endFunction


bool function ASLCanAccumulateBrokenPoints()
	
	if BrokenStatusVictimOnly == 1 && !femaleisvictim() 
		return false
	else
		return true
	endif
	
endfunction

Bool Function ASLProcessStageAdvancing()
	if EnableAutoAdvanceStage != 1
		Printdebug("Auto Advance Stage Not Enabled")
		return false

	elseif donotadvanceifnpcclosetoorgasm  == 1 && MainMaleCanControl() && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && IsgettingPenetrated() ;main male busy fucking and is going to cum
		Printdebug("Stage not advancing due to : Male Enjoyment > Orgasm Hype Enjoymen . is FUcking someone.")
		return false
	elseif donotadvanceifpcclosetoorgasm == 1 && mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment && CurrentPenetrationLvl() >= 1 && !MainMaleCanControl() ;main female busy fucking and is going to cum
		Printdebug("Stage not advancing due to : Female Enjoyment > Orgasm Hype Enjoymen . is femdom someone.")
		return false
	elseif donotadvanceifpartnerclosetoorgasm == 1 && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && (IsStimulatingOthers() || IsgettingPenetrated()) && !MainMaleCanControl() ;main female wants to drain male before advancing
		Printdebug("Stage not advancing due to : donotadvanceifpartnerclosetoorgasm = 1 . is femdom someone. Male Enjoyment > Male Enjoyment Hype. is fucking or stimulating main male")
		return false	
	elseif cycle >= 8 && currentlyPlayingSoundCount == 0  ;advance if cycle has gone too long
		Printdebug("stage Advancing as it has been playing for too long.")
		return true
	elseif cycle >= 5 && IsEnding() && currentlyPlayingSoundCount == 0 ;advance if cycle has gone too long in ending
		Printdebug("stage Advancing as it has been playing for too long in ending scene.")
		return true
	elseif sexLabThreadController.TotalTime <= 10
		Printdebug("Stage not advancing as the stage has only just started running under 10 seconds")
		return false
	elseif  sexLabThreadController.TotalTime - timeOfLastRecordedFemaleOrgasm <= 7
		Printdebug("Stage not advancing After Female orgasm for 7 seconds")
		return false
	else
		Printdebug("Checking Conditions to Advance")
		Printdebug("Total Seconds in Sex" + sexLabThreadController.TotalTime)
		Printdebug("Total Seconds in Sex to advance " + ASLstagetimetoadvance + ". This must be lower than total seconds in sex")
		Printdebug("Female voice count " + currentlyPlayingSoundCount + ". This must be 0")
		Printdebug("Male voice count " + currentlyPlayingSoundCountMale + ". This must be 0") 
		Return ASLstagetimetoadvance < sexLabThreadController.TotalTime && currentlyPlayingSoundCount == 0 && currentlyPlayingSoundCountMale == 0 
	
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
		printdebug("Scaling to 1.15 for Bigguy Animation")
	elseif	currentAnimation.hasTag("Shota")
		scalevalue = 0.8
		printdebug("Scaling to 0.8 for Shota Animation")
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




Bool Function AllowMaleVoice()

	return  Utility.RandomFloat(0.0, 1.0) <= ChanceForMaleToComment && EnableMaleVoice == 1 && Gender == 0 && mainMaleVoice != None ;gender must be male only
	
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

		if Primarystagelabel == "LDI" || IsStimulatingOthers()
			return 0
		elseif IsGettingAnallyPenetrated()  ||  IsGivingAnalPenetration()
			return 3
		elseif IsGettingVaginallyPenetrated() || IsGivingVaginalPenetration()
			return 2
		elseif IsSuckingoffOther() || IsGettingSuckedoff()
			return 1
		elseif IsEnding() && PreviouslyIsSuckingoffOther()
			return 1
		elseif IsEnding() && PreviouslyIsGettingAnallyPenetrated()
			return 3
		elseif IsEnding() && PreviouslyIsGettingVaginallyPenetrated()
			return 2
		else 
			return 0
		endif
		
	
EndFunction

Bool Function IsUnconcious()
	if (currentanimation.HasTag("faint") || currentanimation.HasTag("sleep") || currentanimation.HasTag("necro"))
		StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet",0)
		Return true
	else
		return false
	endif
endfunction

Bool Function ShouldMovebackAStage()
	;female is not satisfied
	if	!MainMaleCanControl() && IsEnding() && (PreviouslyIsCowgirl() || PreviouslyIsGivingVaginalPenetration() || PreviouslyIsGivingAnalPenetration()) && mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment  && isfemdom() && !FemaleIsSatisfied()
		printdebug("Moving back a stage as it is Ending. is femdom. female Enjoyment > Orgasm HYpe Enjoyment. female didnt orgasm Enough (random between 2-4)")
		return true
	;rapist is not satisfied a
	elseif IsEnding() && PreviouslyIsgettingPenetrated() && FemaleIsVictim() &&  Utility.Randomint(0, 100) <= AggressiveChancetoMoveBackAStage
		printdebug("Moving back a stage as it is Ending. PC is victim, and rolled for AggressiveChancetoMoveBackAStage")
		return true
	;Male is not satisfied 
	elseif IsEnding() && PreviouslyIsgettingPenetrated() && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && MainMaleCanControl() && !MaleIsSatisfied()
		printdebug("Moving back a stage as it is Ending. is femdom. Male Enjoyment > Orgasm HYpe Enjoyment. main Male Didnt Cum Enough (random between 2-4)")
		return true
	else
		return false
	endif
endfunction

Function NotificationifFileisBad()

if !jsonutil.isgood(ConfigFile)
	printdebug("Config json file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif

if !jsonutil.isgood(ArmorSwappingFile)
	printdebug("Armor Swapping json file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif

if !jsonutil.isgood(TimerConfigFile)
	printdebug("Timer Config json file format is bad , please check the format of the json file which you have edited. you can search and use any json validator online")
endif


endfunction


Function Lactate()

if (AlwaysLactate == 1 || PCHasLactatingSpell() ) && EnableLactate == 1 || StorageUtil.GetIntValue(None, "HentaiLactate") == 1 
	printdebug("PC Lactating")
	if  Game.GetModbyName("IVDTHentaiLactate.esp") != 255 && !mainFemaleActor.IsEquipped(MilkL) && !mainFemaleActor.IsEquipped(MilkR) && MilkL != None && MilkR != None
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

Bool Function MainMaleCanControl()
	;cowgirl femdom and non forced blowjob -> false
	if (currentAnimation.hasTag("Cowgirl") || currentAnimation.hasTag("femdom") || currentAnimation.hasTag("Amazon") || (IsSuckingoffOther() && !currentAnimation.hasTag("Forced")))  && ActorsInPlay[0] == mainFemaleActor

		return false
	else
		return true
	endif
endfunction

Bool Function PCHasLactatingSpell()

Spell Lactating = Game.GetFormFromFile(0x851, "IVDTHentaiNPCTraitsAndEnjoyment.esp") as Spell

return mainFemaleActor.hasspell(Lactating)

endfunction

Bool Function Isintense()
		return stringutil.find(Labelsconcat ,"1F") > -1 || IsGettingInsertedBig()
endfunction

Bool Function IsEnding()
	return EndingLabel == "ENI" || EndingLabel == "ENO"
endfunction

Bool Function IsGivingAnalPenetration()
	return PenisActionLabel == "FDA" || PenisActionLabel == "SDA"
endfunction

Bool Function IsGivingVaginalPenetration()
	return PenisActionLabel =="FDV" || PenisActionLabel == "SDV"
endfunction

Bool Function PreviouslyIsGivingVaginalPenetration()
	return PrevPenisActionLabel =="FDV" || PrevPenisActionLabel == "SDV"
endfunction

Bool Function PreviouslyIsGivingAnalPenetration()
	return PrevPenisActionLabel =="FDA" || PrevPenisActionLabel == "FDV" 
endfunction

Bool Function IsgettingPenetrated()
	return IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()
endfunction

Bool Function PreviouslyIsgettingPenetrated()
	return PreviouslyIsGettingAnallyPenetrated() || PreviouslyIsGettingVaginallyPenetrated()
endfunction

Bool Function IsGettingDoublePenetrated()
return PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction 

Bool Function IsGettingVaginallyPenetrated()
	return PenetrationLabel == "SVP" || PenetrationLabel == "FVP" || PenetrationLabel == "SCG" || PenetrationLabel == "FCG" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool Function PreviouslyIsGettingVaginallyPenetrated()
	return PrevPenetrationLabel == "SVP" || PrevPenetrationLabel == "FVP" || PrevPenetrationLabel == "SCG" || PrevPenetrationLabel == "FCG" || PrevPenetrationLabel == "SDP" || PrevPenetrationLabel == "FDP"
endfunction

Bool Function PreviouslyIsFemdom()
	return PrevPenetrationLabel == "SCG" || PrevPenetrationLabel == "FCG" 
endfunction

Bool Function IsGettingAnallyPenetrated()
	return PenetrationLabel == "SAP" || PenetrationLabel == "FAP"  || PenetrationLabel == "SAC" || PenetrationLabel == "FAC" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool Function PreviouslyIsGettingAnallyPenetrated()
	return PrevPenetrationLabel == "SAP" || PrevPenetrationLabel == "FAP"  || PrevPenetrationLabel == "SAC" || PrevPenetrationLabel == "FAC" || PrevPenetrationLabel == "SDP" || PrevPenetrationLabel == "FDP"
endfunction

Bool Function IsGettingInsertedBig()
	return Stimulationlabel == "BST"
endfunction

Bool Function IsGettingSuckedoff()
	return PenisActionLabel == "SMF" ||  PenisActionLabel == "FMF"	
endfunction

Bool Function IsGettingStimulated()
	return Stimulationlabel == "SST" ||  Stimulationlabel == "FST"
endfunction

Bool Function IsSuckingoffOther()
	return OralLabel == "SBJ" ||  OralLabel == "FBJ"	
endfunction

Bool Function PreviouslyIsSuckingoffOther()
	return PrevOralLabel == "SBJ" ||  PrevOralLabel == "FBJ"	
endfunction

Bool Function IsCowgirl()
	return (PenetrationLabel == "SCG" ||  PenetrationLabel == "FCG" ||  PenetrationLabel == "SAC" ||  PenetrationLabel == "FAC") && !femaleisvictim()	
endfunction

Bool Function PreviouslyIsCowgirl()
	return (PrevPenetrationLabel == "SCG" ||  PrevPenetrationLabel == "FCG" ||  PrevPenetrationLabel == "SAC" ||  PrevPenetrationLabel == "FAC")&& !femaleisvictim()			
endfunction

Bool Function IsKissing()
	return OralLabel == "KIS"
endfunction

;for Femdom or penetrating others
Bool Function IsFemdom()

	if	femaleisvictim() 
		return false
	else
		return IsCowgirl() || IsGivingAnalPenetration() || IsStimulatingOthers() || IsGivingOthersIntenseStimulation || IsGivingVaginalPenetration()
	endif
EndFunction


Bool Function IsCunnilingus()
	return OralLabel == "CUN"
endfunction

Bool Function PreviousStageHasPenetration()
	return PreviouslyIsGettingAnallyPenetrated() || PreviouslyIsGettingVaginallyPenetrated()
endfunction

Bool Function IsStimulatingOthers()

 return isTitfuckOthers || isHandjobOthers || IsFootjobOthers || IsCunnilingus()

endfunction

Function PrintDebug(string Contents = "")
if EnablePrintDebug == 1
;bool function WriteToFile(string fileName, string text, bool append = true, bool timestamp = false) global native
	miscutil.printconsole("HentaiRim IVDT : " + Contents)
endif
endfunction 

String Stimulationlabel
String PenisActionLabel
string OralLabel
string EndingLabel
string PenetrationLabel
String PrevStimulationlabel
String PrevPenisActionLabel
string PrevOralLabel
string PrevEndingLabel
string PrevPenetrationLabel
string Labelsconcat
Bool isTitfuckOthers = false
Bool isHandjobOthers = false
Bool IsFootjobOthers = false
Bool IsGivingOthersIntenseStimulation = false

Function UpdateLabels(sslBaseAnimation anim , int stage , int actorpos = 0 )

 PrevStimulationlabel = Stimulationlabel
 PrevPenisActionLabel = PenisActionLabel
 PrevOralLabel = OralLabel
 PrevEndingLabel = EndingLabel
 PrevPenetrationLabel = PenetrationLabel
 
 Stimulationlabel = HentairimTags.StimulationLabel(anim , stage , actorpos)
 PenisActionLabel  = HentairimTags.PenisActionLabel(anim , stage , actorpos)
 OralLabel  = HentairimTags.OralLabel(anim , stage , actorpos)
 EndingLabel  = HentairimTags.EndingLabel(anim , stage , actorpos)
 PenetrationLabel = HentairimTags.PenetrationLabel(anim , stage , actorpos)
 
 Labelsconcat = "1" +Stimulationlabel + "1" + PenisActionLabel + "1" + OralLabel + "1" + PenetrationLabel + "1" + EndingLabel
 PrintDebug("Stimulationlabel :" + Stimulationlabel + ", PenisActionLabel :" +  PenisActionLabel  + ", OralLabel :" +  OralLabel  + ", PenetrationLabel :" +  PenetrationLabel  + ", EndingLabel :" +  EndingLabel)
 PrintDebug("PrevStimulationlabel :" + PrevStimulationlabel + ", PrevPenisActionLabel :" +  PrevPenisActionLabel  + ", PrevOralLabel :" +  PrevOralLabel  + ", PrevPenetrationLabel :" +  PrevPenetrationLabel  + ", PrevEndingLabel :" +  PrevEndingLabel)

;find NPC getting tit fucked
int counter = 0
string Result
 isTitfuckOthers = false
 isHandjobOthers = false
 IsFootjobOthers = false
 IsGivingOthersIntenseStimulation = false

while counter < ActorsInPlay.length && PCPosition == 0
	if counter != Actorpos ;ignore PC position
		Result = HentairimTags.PenisActionLabel(anim , stage , counter)
		
		if Result == "STF"
			isTitfuckOthers = true
			printdebug("isTitfuckOthers TRUE")
		elseif Result == "FTF"
			isTitfuckOthers = true
			IsGivingOthersIntenseStimulation = true
			printdebug("isTitfuckOthers TRUE")
			printdebug("IsGivingOthersIntenseStimulation TRUE")
		elseif Result == "SHJ"
			isHandjobOthers = true
			printdebug("isHandjobOthers TRUE")
			printdebug("IsGivingOthersIntenseStimulation TRUE")
		elseif Result == "FHJ"
			isHandjobOthers = true
			IsGivingOthersIntenseStimulation = true
			
			printdebug("isHandjobOthers TRUE")
			printdebug("IsGivingOthersIntenseStimulation TRUE")
		elseif Result == "SFJ"
			IsFootjobOthers = true
			printdebug("IsFootjobOthers TRUE")
		elseif Result == "FFJ"
			IsFootjobOthers = true
			IsGivingOthersIntenseStimulation = true
			printdebug("IsFootjobOthers TRUE")
			printdebug("IsGivingOthersIntenseStimulation TRUE")
		endif
	endif
	counter += 1
endwhile

endfunction

int ldi
int sst
int fst
int bst
int kis
int cun
int sbj
int fbj
int sap
int svp
int fap
int fvp
int sdp
int fdp
int scg
int sac
int fcg
int fac
int sdv
int sda
int fdv
int fda
int shj
int fhj
int stf
int ftf
int smf
int fmf
int sfj
int ffj
int eno
int eni

Function InitializeTimerConfig()
ldi = JsonUtil.GetIntValue(TimerConfigFile,"ldi",9999)
sst = JsonUtil.GetIntValue(TimerConfigFile,"sst",9999)
fst = JsonUtil.GetIntValue(TimerConfigFile,"fst",9999)
bst = JsonUtil.GetIntValue(TimerConfigFile,"bst",9999)
kis = JsonUtil.GetIntValue(TimerConfigFile,"kis",9999)
cun = JsonUtil.GetIntValue(TimerConfigFile,"cun",9999)
sbj = JsonUtil.GetIntValue(TimerConfigFile,"sbj",9999)
fbj = JsonUtil.GetIntValue(TimerConfigFile,"fbj",9999)
sap = JsonUtil.GetIntValue(TimerConfigFile,"sap",9999)
svp = JsonUtil.GetIntValue(TimerConfigFile,"svp",9999)
fap = JsonUtil.GetIntValue(TimerConfigFile,"fap",9999)
fvp = JsonUtil.GetIntValue(TimerConfigFile,"fvp",9999)
sdp = JsonUtil.GetIntValue(TimerConfigFile,"sdp",9999)
fdp = JsonUtil.GetIntValue(TimerConfigFile,"fdp",9999)
scg = JsonUtil.GetIntValue(TimerConfigFile,"scg",9999)
sac = JsonUtil.GetIntValue(TimerConfigFile,"sac",9999)
fcg = JsonUtil.GetIntValue(TimerConfigFile,"fcg",9999)
fac = JsonUtil.GetIntValue(TimerConfigFile,"fac",9999)
sdv = JsonUtil.GetIntValue(TimerConfigFile,"sdv",9999)
sda = JsonUtil.GetIntValue(TimerConfigFile,"sda",9999)
fdv = JsonUtil.GetIntValue(TimerConfigFile,"fdv",9999)
fda = JsonUtil.GetIntValue(TimerConfigFile,"fda",9999)
shj = JsonUtil.GetIntValue(TimerConfigFile,"shj",9999)
fhj = JsonUtil.GetIntValue(TimerConfigFile,"fhj",9999)
stf = JsonUtil.GetIntValue(TimerConfigFile,"stf",9999)
ftf = JsonUtil.GetIntValue(TimerConfigFile,"ftf",9999)
smf = JsonUtil.GetIntValue(TimerConfigFile,"smf",9999)
fmf = JsonUtil.GetIntValue(TimerConfigFile,"fmf",9999)
sfj = JsonUtil.GetIntValue(TimerConfigFile,"sfj",9999)
ffj = JsonUtil.GetIntValue(TimerConfigFile,"ffj",9999)
eno = JsonUtil.GetIntValue(TimerConfigFile,"eno",9999)
eni = JsonUtil.GetIntValue(TimerConfigFile,"eni",9999)

endfunction

String Function GetPrimaryLabel()
	if EndingLabel != "LDI"
		return EndingLabel
	elseIF OralLabel != "LDI"
		return OralLabel
	elseif Stimulationlabel == "BST"
		return Stimulationlabel
	elseif PenetrationLabel != "LDI"
		return PenetrationLabel
	elseif PenisActionLabel != "LDI"
		return PenisActionLabel
	else
		return Stimulationlabel
	endif
endfunction

int Function GetTimer()
  
 IF GetPrimaryLabel() == "ldi"
return ldi
elseIF GetPrimaryLabel() == "sst"
return sst
elseIF GetPrimaryLabel() == "fst"
return fst
elseIF GetPrimaryLabel() == "bst"
return bst
elseIF GetPrimaryLabel() == "kis"
return kis
elseIF GetPrimaryLabel() == "cun"
return cun
elseIF GetPrimaryLabel() == "sbj"
return sbj
elseIF GetPrimaryLabel() == "fbj"
return fbj
elseIF GetPrimaryLabel() == "sap"
return sap
elseIF GetPrimaryLabel() == "svp"
return svp
elseIF GetPrimaryLabel() == "fap"
return fap
elseIF GetPrimaryLabel() == "fvp"
return fvp
elseIF GetPrimaryLabel() == "sdp"
return sdp
elseIF GetPrimaryLabel() == "fdp"
return fdp
elseIF GetPrimaryLabel() == "scg"
return scg
elseIF GetPrimaryLabel() == "sac"
return sac
elseIF GetPrimaryLabel() == "fcg"
return fcg
elseIF GetPrimaryLabel() == "fac"
return fac
elseIF GetPrimaryLabel() == "sdv"
return sdv
elseIF GetPrimaryLabel() == "sda"
return sda
elseIF GetPrimaryLabel() == "fdv"
return fdv
elseIF GetPrimaryLabel() == "fda"
return fda
elseIF GetPrimaryLabel() == "shj"
return shj
elseIF GetPrimaryLabel() == "fhj"
return fhj
elseIF GetPrimaryLabel() == "stf"
return stf
elseIF GetPrimaryLabel() == "ftf"
return ftf
elseIF GetPrimaryLabel() == "smf"
return smf
elseIF GetPrimaryLabel() == "fmf"
return fmf
elseIF GetPrimaryLabel() == "sfj"
return sfj
elseIF GetPrimaryLabel() == "ffj"
return ffj
elseIF GetPrimaryLabel() == "eno"
return eno
elseIF GetPrimaryLabel() == "eni"
return eni
elseIF GetPrimaryLabel() == "fmf"
return fmf
elseIF GetPrimaryLabel() == "sfj"
return sfj
elseIF GetPrimaryLabel() == "ffj"
return ffj
elseIF GetPrimaryLabel() == "eno"
return eno
elseIF GetPrimaryLabel() == "eni"
return eni
else
printdebug("Label for TImer is not found. Defaulting to 15")
return 15

endif

endfunction

float function NextUpdateInterval()

if ASLcurrentlyIntense
	return Utility.RandomFloat(0.1, 1.0)
else
	return Utility.RandomFloat(1.0, 2.0)
endif

endfunction

Function PlayGaggedSound()

;intense gag noise
if ASLCurrentlyintense
	PlaySound(mainFemaleVoice.AssFlattering, mainFemaleActor, requiredChemistry =0 , debugtext = "AssFlattering")
else; less intense gag noises
	PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry = 0, debugtext = "AssToMouth")
endif

endfunction

Function ChangeHentaiExpression(String Scenario)

;ChangeHentaiExpression("hugeppgape")
;ChangeHentaiExpression("wantmore")
;ChangeHentaiExpression("kneejerk")
;ChangeHentaiExpression("orgasm")
;ChangeHentaiExpression("Amused")
;ChangeHentaiExpression("Ending")
;ChangeHentaiExpression("intensepenetrationcomments")
;ChangeHentaiExpression("grunt")
;ChangeHentaiExpression("Greeting")
;ChangeHentaiExpression("Panting")
;ChangeHentaiExpression("penetrationcomments")
;ChangeHentaiExpression("intensegrunt")
;ChangeHentaiExpression("unamused")
;ChangeHentaiExpression("unamusedending")
;ChangeHentaiExpression("inawe")
;ChangeHentaiExpression("overthetop")
;ChangeHentaiExpression("attackingcomments")
;ChangeHentaiExpression("LeadIn")
;ChangeHentaiExpression("pullout")
;ChangeHentaiExpression("maleclosetoorgasm")
;ChangeHentaiExpression("maleclosetoorgasmintense")
;ChangeHentaiExpression("closetoorgasmintense")
;ChangeHentaiExpression("closetoorgasm")
;ChangeHentaiExpression("intenseafterorgasmcomments")
;ChangeHentaiExpression("afterorgasmcomments")
;ChangeHentaiExpression("initialinsertioncomments")

StorageUtil.SetStringValue(None, "HentaiScenario" ,Scenario)

EndFunction

Function ChangePCExpressions(String debugtext = "")
if debugtext =="Oh"
	ChangeHentaiExpression("kneejerk")
elseif debugtext =="SurprisedByMaleOrgasm" || debugtext =="AfterGape"
	ChangeHentaiExpression("hugeppgape")
elseif debugtext == "InsertionAnalSlow" || debugtext == "InsertionGeneric"
	ChangeHentaiExpression("initialinsertioncomments")
elseif debugtext == "WantMore" || debugtext == "AskForAnalCum" || debugtext == "AskForVaginalCum" || debugtext == "AskForOralCum"
	ChangeHentaiExpression("wantmore")
elseif debugtext =="FemaleOrgasm" 
	ChangeHentaiExpression("orgasm")
elseif debugtext == "Amused"
	ChangeHentaiExpression("Amused")				
elseif debugtext == "intensepenetrationcomments"
	ChangeHentaiExpression("Ending")
elseif debugtext == "PenetrativeCommentsIntense" || debugtext == "AskForPacingBreak" || debugtext == "TeaseAggressivePartner" || debugtext == "IntenseAnal"
	ChangeHentaiExpression("intensepenetrationcomments")
elseif debugtext == "GreetLoadedFamiliar" || debugtext == "GreetFamiliar" || debugtext == "GreetLover"
	ChangeHentaiExpression("Greeting")
elseif (debugtext == "CameInAss" || debugtext == "CameInPussy" || debugtext == "CameInMouth") && IsFemdom()
	ChangeHentaiExpression("Amused")
elseif debugtext == "CameInAss" || debugtext == "CameInPussy" || debugtext == "CameInMouth"
	ChangeHentaiExpression("penetrationcomments")
elseif debugtext == "PenetrativeCommentssoft"
	ChangeHentaiExpression("penetrationcomments")
elseif  debugtext == "Unamused"
	ChangeHentaiExpression("unamused") || (debugtext == "NoticeMaleWantsMore" && femaleisvictim())
elseif debugtext == "UnamusedEnd"
	ChangeHentaiExpression("unamusedending")
elseif debugtext == "ReadyToGetGoing" || debugtext == "InAwe" || (debugtext == "NoticeMaleWantsMore" && !femaleisvictim())
	ChangeHentaiExpression("inawe")
elseif debugtext == "SensitivePleasure" || debugtext == "AfterOrgasmArouse" 
	ChangeHentaiExpression("overthetop")
elseif debugtext == "OnTheAttack"
	ChangeHentaiExpression("attackingcomments")
elseif debugtext == "PullOut"
	ChangeHentaiExpression("pullout")
elseif debugtext == "TeaseMaleCloseToOrgasmSoft" || debugtext == "MaleCloseNotice" || debugtext == "MaleCloseAlready" || debugtext == "CumTogetherTease"
	ChangeHentaiExpression("maleclosetoorgasm")
elseif debugtext == "TeaseMaleCloseToOrgasmIntense"
	ChangeHentaiExpression("maleclosetoorgasmintense")
elseIf debugtext == "MyTurnToCum"
	ChangeHentaiExpression("closetoorgasm")
elseif debugtext == "NearOrgasmExclamations"
	ChangeHentaiExpression("closetoorgasmintense")
elseif debugtext == "AfterOrgasmRemarks" && ASLcurrentlyintense
	ChangeHentaiExpression("intenseafterorgasmcomments")
elseif debugtext == "AfterOrgasmRemarks" || debugtext == "Satisfied"
	ChangeHentaiExpression("afterorgasmcomments")
elseif debugtext == "PenetrativeGrunts"
	ChangeHentaiExpression("grunt")
elseif debugtext == "NearOrgasmNoises"
	ChangeHentaiExpression("intensegrunt")
elseif debugtext == "AfterOrgasmExclamations"
	ChangeHentaiExpression("Panting")	
elseif IsFemdom()
	ChangeHentaiExpression("attacking")
elseif IsGettingStimulated() && ASLCurrentlyintense	
	ChangeHentaiExpression("grunt")
elseif IsGettingStimulated() || debugtext == "BreathySoft" || debugtext == "Foreplaysoft"
    ChangeHentaiExpression("LeadIn")
else 
	if !IsSuckingoffOther() && debugtext != "PullOutGape"
		miscutil.PrintConsole(" IVDT " + debugtext + " Has No Expressions conditions ")
	endif
	ChangeHentaiExpression("")
endif

Endfunction

Bool Function IsfinalStage()
	return currentstage == CurrentAnimation.StageCount
endfunction
