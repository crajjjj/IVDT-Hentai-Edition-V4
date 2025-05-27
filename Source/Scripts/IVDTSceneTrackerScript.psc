Scriptname IVDTSceneTrackerScript extends ActiveMagicEffect
{Each instance of this script tracks a single SexLab scene (or more colloquially called fuck) and controls/plays the dialogue for it.}

Keyword property CityKeyword auto
Keyword property ClearableKeyword auto
IVDTVoiceFemaleScript property FakeFemaleVoice auto ;Actually a guy voice in disguise. Used as a workaround to support male-only scenes. Originally it was assumed there would always be a female
SoundCategory property HighPrioritySounds auto
SoundCategory property HighPrioritySoundsMale auto
SoundCategory property LowPrioritySounds auto
SoundCategory property LowPrioritySoundsMale auto
IVDTControllerScript property MasterScript auto

;References for determining if its a stealth scene
Keyword property PlayerHomeKeyword auto
Faction property PlayerHousecarlFaction auto
Faction property PlayerMarriedFaction auto
Spell property SceneTrackerSpell auto

;References
SexLabFramework property SexLab auto

;References needed to determine personality traits above
AssociationType property SpouseAssocation auto
Keyword property TownKeyword auto

String property INTERNAL_KEY="internal" autoreadonly
String property NINODE_ROOT="NPC" autoreadonly
String property RACEMENUHH_KEY="RaceMenuHH.esp" autoreadonly

Bool ASLCurrentlyintense = false
Bool ASLIsinSpanking = false
float ASLStagetimetoadvance = 0.0
bool ASLpreviouslyintense = False
Float Actor1BaseScale = 0.0
Float Actor2BaseScale = 0.0
Float Actor3BaseScale = 0.0
Float Actor4BaseScale = 0.0
Float Actor5BaseScale = 0.0
Actor ActorFive = none
Actor ActorFour = none
Actor ActorOne = none
Actor ActorThree = none
Actor ActorTwo = none
Actor[] ActorsInPlay
int AggressiveChancetoMoveBackAStage
int AlwaysLactate
String AnimSpeedFile = "HentairimEnjoyment/AnimSpeed.json"
String[] ArmorSlotsToSwitch
String ArmorSwappingFile = "IVDTHentai/ArmorSwapping.json"

;SOS
Form ArmortoSwitch
form[] BaseArmorArr
int BrokenStatusVictimOnly ;done
int CameInsideCount = 0
float ChanceForMaleToComment ; done
float ChanceToCommentUnamused ;done
float ChanceToCommentWhenCloseToOrgasm ;done
float ChanceToCommentWhenMaleCloseToOrgasm ;done
float ChanceToCommentonBlowjobStage ;done
float ChanceToCommentonLeadinStage ;done
float ChanceToCommentonNonIntenseStage ;done
float ChanceToCommentononAttackingStage ;done
int ChanceToLactateDuringIntense
float ChanceToLeakThickCum ;done
float ChanceToOrgasmSquirt ;done
float ChanceTohaveSpanking ;done
int ChancetoLactateDuringOrgasm
int ChancetoStopLactate
Bool CommentedClosetoOrgasm = false

;JSONUtil configs
String ConfigFile = "IVDTHentai/Config.json"
String DDGagFile = "IVDTHentai/DDGagConfig.json"
IVDTVoiceMaleScript DefaultMaleVoice = None
Int EnableArmorSwapping
int EnableAutoAdvanceStage ;done
int EnableBrokenStatus ;done
int EnableDDGagVoice ;done
int EnableGhostActors

;int MinOrgasmsToBroken ;done
;int MaxOrgasmsToBroken ;done
int EnableHugePPScenario ;done
int EnableLactate
Int EnableMaleVoice ;done
int EnablePrintDebug
int EnableTagScaling ;done
int EnableThickCumLeak ;done
int EnableVictimScenario ;done
string EndingLabel
int EnjoymentForAggressiveToMoveBackAStage
int FemaleOrgasmHypeEnjoyment ;done
bool GreetedMalePartner = false
Faction HentairimBroken
Faction HentairimResistance
int HoursSinceLastSexToResetBrokenStatus ;done
int HugePPSchlongSize
Bool Initialized = false
Bool IsFootjobOthers = false
Bool IsGivingOthersIntenseStimulation = false
string Labelsconcat
String LactateFile = "IVDTHentai/Lactate.json"
Spell Lactating
form[] LewdArmorArr
bool MaleCommentsonEN = false
int MaleOrgasmHypeEnjoyment ;done
Bool MaleisCommenting = false
Int MaxSpankCount ;done
Armor MilkL
Armor MilkR
int MinSpankCount ;done
int MoanOnly
EffectShader NippleLeakCBBE
Bool NotifiedBrokenstatus = false
string OralLabel
int PCPosition
string PenetrationLabel
String PenisActionLabel
string PrevEndingLabel
string PrevOralLabel
string PrevPenetrationLabel
String PrevPenisActionLabel
String PrevStimulationlabel
Sound PreviousSound = none

;for new anim stage label
string Primarystagelabel = ""
Bool ReacttoFemaleOrgasmNext = false
Bool ReacttoMaleOrgasmNext = false
Faction SchlongFaction
Bool ShouldInitialize = false
String Stagelabelminusone = ""
String Stimulationlabel
Bool SwappedLowerArmor = false
Bool SwappedUpperArmor = false
Keyword TNG_Gentlewoman
Keyword TNG_L
Keyword TNG_XL
String TimerConfigFile = "IVDTHentai/Timers.json"
Int Type = 0
Int[] ValidSlots
String VoiceVariation
String VoiceVariationFile = "IVDTHentai/VoiceVariation.json"
Float Volume
Bool acknowledgedAnal = False
Actor actorWithSceneTrackerSpell = None ;Important we track this since we have to remove the spell at the end of the scene.
Float aggressiveness = 0.0 ;from 0.0 (lowest) to 1.0 (highest). controls likeliness female will 'go on the attack'
Int analAnimationFilter = 2 ;Different values indicate different criteria for if an animation is considered anal
Int analIntensityThreshold = 40
Int attackStage = 0 ;0 - not currently attacking, 1 - currently attacking, 2 - currently retreating
int bst
float chancetocommentonintensestage ;done
Int chemistryLevel = -1 ;from 0 (no chemistry) to 10 (great chemistry). this is referring to the sexual chemistry between the partners. controls what voice lines are played
bool commentedcumlocation = false
bool commentedorgasmremark = false
Int cumLocationDecision = 0 ;0 - no decision (yet), 1 = oral, 2 = vaginal, 3 = anal
int cumleakcount = 0
int cun
sslBaseAnimation currentAnimation = None
Int currentStage = -1 ;Current stage of the sslBaseAnimation (SexLab animation) that is currently playing
Bool currentlyIntense = False ;I consider the opposite phase "soft". Soft is when gentle voices are used, intense is when combative voices are used
Int currentlyPlayingSoundCount = 0
Int currentlyPlayingSoundCountMale = 0
int cycle = 0

;Config
Float dialogueSpacingMultiplier = 1.0
int donotadvanceifnpcclosetoorgasm
int donotadvanceifpartnerclosetoorgasm
int donotadvanceifpcclosetoorgasm
int eni
int eno
int fac
int fap
int fbj
int fcg
int fda
int fdp
int fdv
Int femaleAnalCommunication = 0 ;-2 = warning to stop now, -1 = baseless reprimanding, 0 = not interested in anal, 1 = previously interested but now satisfied, 2 = interested but nothing has happened, 3 = vocalized interest
Bool femaleCloseToOrgasm = False
Int femaleCloseToOrgasmThreshold = 80
Int femaleRecordedOrgasmCount = 0
int ffj
int fhj
int fmf

;The voice actors' memory (mostly for the female's dialogue)
Bool foundASoundToPlay = False
int fst
int ftf
int fvp
int gender = 0
Int generalIntensityThreshold = 60
Float hoursSinceLastSex = 0.0 ;For the main female. In game hours. Doesn't include current scene.
int hypebeforeorgasm
Bool inRefractoryPeriod = False ;When satisfied after the male orgasm (not left demanding more), the female actor may be in temporary limbo remarking on the orgasm, unsure if the male wants more
bool inserted = false
Bool isBootyGirl = False
Bool isHandjobOthers = false
Bool isTitfuckOthers = false
int kis
Bool lastMaleOrgasmWasUnexpected = False
int ldi
Int locationOfLastMaleOrgasm = 0 ;0 - not set (or other), 1 - oral, 2 - vaginal, 3 = anal
Actor mainFemaleActor = None
Int mainFemaleEnjoyment = 0
IVDTVoiceFemaleScript mainFemaleVoice = None
Actor mainMaleActor = None
Int mainMaleEnjoyment = 0
IVDTVoiceMaleScript mainMaleVoice = None
Bool maleOnlyScene = False
Int maleOrgasmCount = 0
Float nextUpdateInterval = 1.0
Int okWithVaginalCumCode = -1 ;-1 = setting not loaded in yet, 0 = no, 1 = yes
Int orgasmTalkStage = 0 ;0 - 1st possible hint male is close, 1 - 2nd possible hint, 2 - last hint and female acknowledges, 3 - female teasing male for cum, 4 - male came, 5 - female reacted to orgasm
Float penetrativeStreakDuration = 0.0 ;How long the current level of penetration as defined by CurrentPenetrationLvl() has lasted in irl seconds
Actor playerCharacter = None
sslBaseAnimation previousAnimation = None
Sound queuedSound = None ;Sounds attempting to play with a priority of 1 when another sound is playing will be queued up to play afterwards
Float queuedSoundMaxWait = 0.0 ;The longest the queuedSound can sit in the queue before we give up on trying to play it
int sac
int sap
int sbj
Int sceneID = -1
int scg
int sda
int sdp
int sdv
sslThreadController sexLabThreadController = None
int sfj
int shj
int smf
Bool socializedCumLocationDecision = False
Bool socializedNeedToCum = False
int sst
Bool stealthScene = False
int stf
Float streakTooLongDuration = 0.0 ;When penetrativeStreakDuration gets longer than this, the female will begin asking for a change up. Set when streak resets
int svp
bool teasedClosetoorgasm = true
Float timeOfLastJoke = 0.0
float timeOfLastKneeJerkReaction
Float timeOfLastMaleOrgasm = -20.0
Float timeOfLastRecordedFemaleOrgasm = -20.0
Float timeOfLastRomanticRemark = 0.0
Float timeOfLastStageStart = 0.0
Float timeSoundWasQueued = 0.0 ;The timestamp at which queuedSound originally attempted to play
Int timesGaped = 0 ;Number of times the female has been gaped for the current scene
Float totalAnalSexDuration = 0.0
Float totalPenetrativeSexDuration = 0.0
int useblowjobsoundforkissing

;Main female's personality for the scene
Bool withMaleLover = False
Bool withMaleOfInterest = False
Bool withMaleThane = False

event IVDTOnOrgasm(Form actorRef, Int thread)
  if thread != sceneID || actorWithSceneTrackerSpell != mainFemaleActor
    return
  endif
  if ASLCanAccumulateBrokenPoints()
    if ishugepp() || GetMainNPCTrait() == "+The Penetrator"
      StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken", StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken") + 2)
    else
      StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken", StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken") + 1)
    endif

    ;miscutil.PrintConsole ("ASLTotalOrgasmtoBroken" + StorageUtil.GetIntValue(None, "ASLTotalOrgasmtoBroken"))
  endif
  Actor actorHavingOrgasm = actorRef as Actor

  ;If ( actorHavingOrgasm == mainMaleActor || (MasterScript.IsMale(actorHavingOrgasm) || hasSchlong(actorHavingOrgasm))) && actorHavingOrgasm != mainFemaleActor && !femaleisgiving()
  if actorHavingOrgasm != mainFemaleActor
    printdebug("non PC ORGASM!")
    RecordMaleOrgasm()
    if IsSuckingoffOther() || IsgettingPenetrated()
      if mainMaleVoice != None && actorHavingOrgasm == mainMaleActor
        PlaySound(mainMaleVoice.Orgasm, mainMaleActor, requiredChemistry=0, soundPriority=3, waitForCompletion=False, debugtext="MaleOrgasm")
      elseif DefaultMaleVoice != None
        PlaySound(DefaultMaleVoice.Orgasm, actorHavingOrgasm, requiredChemistry=0, soundPriority=3, waitForCompletion=False, debugtext="DefaultMaleOrgasm")
      endif
    endif
    if SexLabThreadController.TotalTime - timeOfLastKneeJerkReaction > 2.0 && mainFemaleEnjoyment <= FemaleOrgasmHypeEnjoyment
      if MainFemaleisBurstingAtSeams() && CurrentPenetrationLvl() > 1
        float AdditionalHugePPChanceLeak = 1
        if ishugePP()
          AdditionalHugePPChanceLeak = 2
        endif
        PlaySound(mainFemaleVoice.SurprisedByMaleOrgasm, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="SurprisedByMaleOrgasm")

        ;miscutil.PrintConsole (" leaking pussy")
        ASLAddThickCumleak()
        ASLAddCumPool()
      elseif !IsSuckingoffOther() || !IsgettingPenetrated() && !femaleisvictim() && moanonly != 1
        PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry=2, debugtext="ReadyToGetGoing")
      elseif IsSuckingoffOther() && SexLabThreadController.TotalTime - timeOfLastStageStart > 2
        Utility.Wait(Utility.RandomFloat(0.5, 1.5))
        PlaySound(mainFemaleVoice.MaleOrgasmOral, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="MaleOrgasmOral")
      elseif ishugepp() && SexLabThreadController.TotalTime - timeOfLastStageStart > 2 && moanonly != 1
        PlaySound(mainFemaleVoice.SurprisedByMaleOrgasm, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="SurprisedByMaleOrgasm")
      elseif CurrentPenetrationLvl() > 1 && SexLabThreadController.TotalTime - timeOfLastStageStart > 2
        if moanonly == 1
          PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="MaleOrgasmNonOral")
        else
          PlaySound(mainFemaleVoice.MaleOrgasmNonOral, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="MaleOrgasmNonOral")
        endif
      endif
    endif
    timeOfLastKneeJerkReaction = SexLabThreadController.TotalTime
    if Utility.RandomFloat(0.0, 1.0) <= 0.5
      ReacttoMaleOrgasmNext = true
    endif
    teasedClosetoorgasm = false
  elseif actorHavingOrgasm == mainFemaleActor
    printdebug("PC ORGASM! ")

    ;break immediately if NPC is the breaker
    if GetMainNPCTrait() == "+The Breaker" && !ASLisBroken()
      StorageUtil.SetIntValue(None, "ASLTotalOrgasmtoBroken", StorageUtil.GetIntValue(None, "ASLTargetOrgasmtoBroken"))
    endif
    if ChancetoLactateDuringOrgasm <= Utility.RandomInt(1, 100)
      Lactate()
    endif
    ASLAddOrgasmSSquirt()
    if !IsUnconcious()
      if moanonly == 1
        PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
      else
        PlaySound(mainFemaleVoice.Orgasm, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="FemaleOrgasm", Force=true) ;, waitForCompletion = False)
      endif
    endif
    if hypebeforeorgasm == 1
      StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 1)
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
  endif
endevent

event IVDTOnStageStart(string eventName, string argString, float argNum, form sender)
  if argString as Int != sceneID
    return
  endif
endevent

;When a sexlab scene ends, we want to remove our tracker script (and do some other important shit too)
event IVDTSceneEnd(string eventName, string argString, float argNum, form sender) ;
  if argString as Int != sceneID ;If true, this isn't our scene that just ended but another scene. So, ignore it.
    return
  endif

  ;	miscutil.PrintConsole ("Triggered IVDTSceneEnd ")
  RestoreArmor()
  ResetActorScale()
  ResetGhostActor()
  MasterScript.RegisterThatSceneIsEnding(maleOnlyScene)
  RemoveTracker()
endevent

;Bool ASLshouldplayfemaleorgasm = true ;often enoough SLSO doesnt reset enjoyment before orgasm and orgasm talk can complete, causing near orgasm talk after orgasm
event OnEffectStart(Actor akTarget, Actor akCaster)
  playerCharacter = Game.GetPlayer()
  actorWithSceneTrackerSpell = akTarget
  mainFemaleActor = playerCharacter ;Temporary default until FindActorsAndVoices is called
  PerformInitialization()
endevent

event OnUpdate()
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
      elseif IsfinalStage() ;end stage if is last stage.
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
    if MilkL && MilkR
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
    endif

    ;chance for male voice
    if AllowMaleVoice()
      PlayMaleComments()
    endif

    ;if gagged, override everything else
    if HasDeviousGag(mainFemaleActor)
      StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
      if EnableDDGagVoice == 1
        PlayGaggedSound()
      else
        Utility.Wait(8) ; dont play any voice if gagged
      endif
    elseif IsKissing() ;kissing
      PlayKissing()
    elseif MoanOnly == 1
      PlayMoanonly()

      ;if reacting to female orgasm
    elseif ReacttoFemaleOrgasmNext == true
      ASLHandleFemaleOrgasmReaction()

      ;if reacting to male orgasm
    elseif ReacttoMaleOrgasmNext == true
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
endevent

function ASLAddCumPool()
  if EnableThickCumLeak != 1
    return
  endif
  if !mainFemaleActor.IsEquipped(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255
    mainFemaleActor.addItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor, abSilent=true)
    mainFemaleActor.EquipItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor)
  endif
endfunction

function ASLAddOrgasmSSquirt()
  if Utility.RandomFloat(0.0, 1.0) < ChanceToOrgasmSquirt
    if !mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255
      mainFemaleActor.addItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor, abSilent=true)
      mainFemaleActor.EquipItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor)
    endif
  endif
endfunction

function ASLAddThickCumleak()
  if EnableThickCumLeak != 1
    return
  endif
  if !mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor) && Game.GetModbyName("sr_fillherup.esp") != 255
    mainFemaleActor.addItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor, abSilent=true)
    mainFemaleActor.EquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
  endif
endfunction

bool function ASLCanAccumulateBrokenPoints()
  if BrokenStatusVictimOnly == 1 && !femaleisvictim()
    return false
  else
    return true
  endif
endfunction

function ASLEndScene() ;manually end scene
  ;miscutil.PrintConsole ("Triggered ASLEndScene ")
  RestoreArmor()
  ResetActorScale()
  ResetGhostActor()
  MasterScript.RegisterThatSceneIsEnding(maleOnlyScene)
  RemoveTracker()
endfunction

function ASLHandleFemaleOrgasmReaction()
  ;chance to react after orgasm
  if VoiceVariation == "A"
    if ASLIsBroken() && mainMaleActor != None
      PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmArouse")
    elseif (IsGivingAnalPenetration() || IsGivingVaginalPenetration()) && mainMaleActor != None
      PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="Amused")
    elseif ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage && mainMaleActor != None
      if IsCowgirl()
        PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="Amused")
      else
        PlaySound(mainFemaleVoice.AskForPacingBreak, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AskForPacingBreak")
      endif
    elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage && mainMaleActor != None
      PlaySound(mainFemaleVoice.AfterOrgasmRemarks, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmRemarks")
    else
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
    endif
  else
    if ASLIsBroken()
      PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmArouse")
    elseif IsFemdom() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
      PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="Amused")
    elseif !ASLCurrentlyintense && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
      PlaySound(mainFemaleVoice.AfterOrgasmRemarks, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmRemarks")
    else
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
    endif
  endif
  if mainMaleActor != None && Utility.RandomFloat(0.0, 1.0) < 0.5 && !FemaleIsVictim() && !ASLCurrentlyintense
    if !FemaleIsSatisfied() && IsgettingPenetrated()
      Utility.Wait(Utility.RandomFloat(1.0, 2.0))
      PlaySound(mainFemaleVoice.WantMore, mainFemaleActor, requiredChemistry=5, soundPriority=1, debugtext="WantMore")
    else
      PlaySound(mainFemaleVoice.Satisfied, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="Satisfied")
    endif
  endif
  ReacttoFemaleOrgasmNext = false
endfunction

function ASLHandlemaleOrgasmreaction()
  if maleOrgasmCount > 1 && !femaleisvictim() && !IsSuckingoffOther() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
    PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="InAwe")
  endif

  ;a chance to react to male orgasm
  if IsSuckingoffOther()
    if AllowMaleVoice()
      PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=false, debugtext="JokeAfterOrgasm")
    endif
    PlaySound(mainFemaleVoice.CameInMouth, mainFemaleActor, requiredChemistry=0, soundPriority=2, debugtext="CameInMouth")
  elseif IsCowgirl() || IsGivingAnalPenetration() || IsGivingVaginalPenetration()
    PlaySound(mainFemaleVoice.MaleOrgasmReactionSoft, mainFemaleActor, requiredChemistry=0, soundPriority=2, debugtext="MaleOrgasmReactionSoft")
  elseif ASLCurrentlyintense && IsgettingPenetrated()
    ;Chance for male comments
    if AllowMaleVoice()
      PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="JokeAfterOrgasm")
      Utility.Wait(Utility.RandomFloat(0.5, 1.0))
    endif
    if Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
      PlaySound(mainFemaleVoice.MaleOrgasmReactionIntense, mainFemaleActor, requiredChemistry=0, soundPriority=2, debugtext="MaleOrgasmReactionIntense")
    endif
  elseif IsgettingPenetrated()
    if AllowMaleVoice()
      PlaySound(mainMaleVoice.JokeAfterOrgasm, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="JokeAfterOrgasm")
      Utility.Wait(Utility.RandomFloat(0.5, 2.0))
    endif
    if Utility.RandomFloat(0.0, 1.0) <= 0.4
      if femaleisvictim()
        PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry=0, debugtext="Unamused")
      else
        PlaySound(mainFemaleVoice.MaleOrgasmReactionSoft, mainFemaleActor, requiredChemistry=0, soundPriority=2)
      endif
    endif
  endif
  ReacttoMaleOrgasmNext = false
endfunction

bool function ASLIsBroken()
  return GetBrokenPoints() > 0 && EnableBrokenStatus == 1
endfunction

function ASLMakeGreetingToMalePartner()
  Bool partnerLoaded = mainMaleEnjoyment > 50
  if hoursSinceLastSex < 5.0
    return
  endif
  if partnerLoaded
    PlaySound(mainFemaleVoice.GreetLoadedFamiliar, mainFemaleActor, requiredChemistry=4, debugtext="GreetLoadedFamiliar")
  elseif withMaleLover
    PlaySound(mainFemaleVoice.GreetLover, mainFemaleActor, requiredChemistry=6, debugtext="GreetLover")
  else
    PlaySound(mainFemaleVoice.GreetFamiliar, mainFemaleActor, requiredChemistry=4, debugtext="GreetFamiliar")
  endif
endfunction

function ASLPlayFemaleOrgasmHype()
  ;skip commenting orgasm if orgasm in quick succession
  if SexLabThreadController.TotalTime - timeOfLastRecordedFemaleOrgasm <= 8
    StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
    CommentedClosetoOrgasm = true
    return
  endif

  ;-----------------------NOT INTENSE------------------
  if !ASLCurrentlyintense
    if (IsStimulatingOthers() || IsGettingStimulated()) && !femaleisvictim() && !IsgettingPenetrated()
      PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry=0, debugtext="ReadyToGetGoing")
    elseif maleOrgasmCount > femaleRecordedOrgasmCount && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && !FemaleIsVictim() && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
      PlaySound(mainFemaleVoice.MyTurnToCum, mainFemaleActor, requiredChemistry=3, soundPriority=1, debugtext="MyTurnToCum")
    elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && CommentedClosetoOrgasm == false
      PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="NearOrgasmExclamations")
    else
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="PenetrativeGrunts")
    endif

    ;-----------------------INTENSE------------------
  elseif ASLcurrentlyIntense
    if IshugePP() && IsgettingPenetrated() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && StorageUtil.GetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1
      PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="SensitivePleasure")
    endif
  elseif IsgettingPenetrated() || IsGettingStimulated()
    if Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenCloseToOrgasm && CommentedClosetoOrgasm == false
      PlaySound(mainFemaleVoice.NearOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="NearOrgasmExclamations")
    else
      PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="NearOrgasmNoises")
    endif
  endif
  StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
  printdebug("Allow Female Orgasm")
  CommentedClosetoOrgasm = true
endfunction

function ASLPlayMaleClosetoOrgasmComments()
  ;miscutil.PrintConsole ("Teasing Male Close to Orgasm")
  if IsStimulatingOthers() && !IsgettingPenetrated() && !IsGettingStimulated()
    PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry=0, debugtext="ReadyToGetGoing")
  elseif mainFemaleEnjoyment > femaleorgasmhypeenjoyment && !femaleisvictim() && IsgettingPenetrated()
    PlaySound(mainFemaleVoice.CumTogetherTease, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="CumTogetherTease")
  elseif FemaleIsVictim() && IsgettingPenetrated()
    PlaySound(mainFemaleVoice.PullOut, mainFemaleActor, requiredChemistry=0, soundPriority=2, debugtext="PullOut")
  elseif IsEarlyToCum() && !ASLCurrentlyintense && !femaleisvictim() && IsgettingPenetrated()
    PlaySound(mainFemaleVoice.MaleCloseAlready, mainFemaleActor, requiredChemistry=1, soundPriority=1, debugtext="MaleCloseAlready")
  elseif IsFemdom() && !ASLCurrentlyintense
    PlaySound(mainFemaleVoice.MaleCloseNotice, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="MaleCloseNotice")
  elseif ASLCurrentlyintense && IsgettingPenetrated()
    PlaySound(mainFemaleVoice.TeaseMaleCloseToOrgasmIntense, mainFemaleActor, requiredChemistry=1, soundPriority=1, debugtext="TeaseMaleCloseToOrgasmIntense")
  elseif IsgettingPenetrated()
    PlaySound(mainFemaleVoice.TeaseMaleCloseToOrgasmSoft, mainFemaleActor, requiredChemistry=1, soundPriority=1, debugtext="TeaseMaleCloseToOrgasmSoft")
  endif
  if Utility.RandomFloat(0.0, 1.0) < chancetocommentwhenmaleclosetoorgasm && !femaleisvictim()
    Utility.Wait(Utility.RandomFloat(1.0, 3.0))
    PossiblyAskForCumInSpecificLocation()
  endif
  teasedClosetoorgasm = true
endfunction

function ASLPlayStageTransition()
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
      PlaySound(MasterScript.Sounds.PullOutGape, mainFemaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=false, debugtext="PullOutGape")
      if ishugepp()
        PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="AfterGape")
      else
        PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
      endif
      Utility.Wait(Utility.RandomFloat(0.5, 1.0))
    endif
    return
  elseif HasDeviousGag(mainFemaleActor)
    StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
    if EnableDDGagVoice == 1
      PlayGaggedSound()
    endif

    ;male moving backwards from ending to fuck somemore
  elseif IsgettingPenetrated() && PrevEndingLabel == "ENO" && MainMaleCanControl()
    PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, SkipWait=true, debugtext="Oh")
    Utility.Wait(Utility.RandomFloat(0.5, 1.5))
    PlaySound(mainFemaleVoice.NoticeMaleWantsMore, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="NoticeMaleWantsMore")
    if !MainFemaleisBurstingAtSeams()
      ASLRemoveThickCumleak()
    endif

    ;-------------Transition from no penetration to penetration----------------------
  elseif !PreviousStageHasPenetration() && IsgettingPenetrated()
    printdebug("Stage Transition - No Penetration to Penetration")
    PlaySound(MasterScript.Sounds.PullOutGape, mainFemaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=false, debugtext="PullOutGape")
    if ishugepp()
      PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="AfterGape")
    else
      PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
    endif
    Utility.Wait(Utility.RandomFloat(0.5, 1.0))
    if AllowMaleVoice()
      PlaySound(mainMaleVoice.StrugglingEarly, mainMaleActor, requiredChemistry=0, soundPriority=2, debugtext="StrugglingEarly")
    endif
    if !IsSuckingoffOther() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonnonintensestage
      if IsCowgirl()
        PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="Amused")
      elseif ASLCurrentlyintense || ishugePP()
        PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry=0, debugtext="TeaseAggressivePartner")
      elseif femaleisvictim() && Utility.RandomFloat(0.5, 1.0) < 0.5
        PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry=0, debugtext="Unamused")
      elseif IsGettingAnallyPenetrated()
        PlaySound(mainFemaleVoice.InsertionAnalSlow, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="InsertionAnalSlow")
      else
        PlaySound(mainFemaleVoice.InsertionGeneric, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="InsertionGeneric")
      endif
    endif

    ;------------maintain Fast Penetration during Transition----------------
  elseif ASLpreviouslyintense && ASLCurrentlyintense
    printdebug(" Stage Transition - Maintain Intensity")
    if AllowMaleVoice()
      PlaySound(mainMaleVoice.Aggressive, mainMaleActor, soundPriority=2, debugtext="Aggressive")
    endif
    if !IsSuckingoffOther() && IsgettingPenetrated() && Utility.randomfloat(0.0, 1.0) < chancetocommentonintensestage
      PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="InAwe")
    endif

    ;------------------Transition from Slow Penetration to Fast Penetration-----------------
  elseif !ASLpreviouslyintense && PreviousStageHasPenetration() && ASLcurrentlyintense && IsgettingPenetrated()
    if AllowMaleVoice()
      PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, soundPriority=2, waitForCompletion=false, debugtext="StrugglingSubtle")
    endif
    if ishugepp() || IsGettingDoublePenetrated()
      PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
      Utility.Wait(Utility.RandomFloat(0.5, 1.0))
      PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="AfterGape")
    elseif !FemaleIsVictim()
      PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
      Utility.Wait(Utility.RandomFloat(0.5, 1.0))
      if Utility.randomfloat(0.0, 1.0) < chancetocommentonintensestage
        PlaySound(mainFemaleVoice.MaleHalfwayIntense, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="MaleHalfwayIntense")
      endif
    else
      PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
      if AllowMaleVoice()
        PlaySound(mainMaleVoice.Aggressive, mainMaleActor, soundPriority=2, debugtext="Aggressive")
      endif
      if Utility.randomfloat(0.0, 1.0) < chancetocommentonintensestage
        Utility.Wait(Utility.RandomFloat(0.5, 1.5))
        PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="TeaseAggressivePartner")
      endif
    endif

    ;----------------------------if non intense after intense penetrative action--------------
  elseif ASLpreviouslyintense && !ASLcurrentlyIntense
    printdebug(" Stage Transition - Non Intense to Intense")
    PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
  endif
endfunction

Bool function ASLProcessStageAdvancing()
  if EnableAutoAdvanceStage != 1
    Printdebug("Auto Advance Stage Not Enabled")
    return false
  elseif donotadvanceifnpcclosetoorgasm == 1 && MainMaleCanControl() && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && IsgettingPenetrated() ;main male busy fucking and is going to cum
    Printdebug("Stage not advancing due to : Male Enjoyment > Orgasm Hype Enjoymen . is FUcking someone.")
    return false
  elseif donotadvanceifpcclosetoorgasm == 1 && mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment && CurrentPenetrationLvl() >= 1 && !MainMaleCanControl() ;main female busy fucking and is going to cum
    Printdebug("Stage not advancing due to : Female Enjoyment > Orgasm Hype Enjoymen . is femdom someone.")
    return false
  elseif donotadvanceifpartnerclosetoorgasm == 1 && mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && (IsStimulatingOthers() || IsgettingPenetrated()) && !MainMaleCanControl() ;main female wants to drain male before advancing
    Printdebug("Stage not advancing due to : donotadvanceifpartnerclosetoorgasm = 1 . is femdom someone. Male Enjoyment > Male Enjoyment Hype. is fucking or stimulating main male")
    return false
  elseif cycle >= 8 && currentlyPlayingSoundCount == 0 ;advance if cycle has gone too long
    Printdebug("stage Advancing as it has been playing for too long.")
    return true
  elseif cycle >= 5 && IsEnding() && currentlyPlayingSoundCount == 0 ;advance if cycle has gone too long in ending
    Printdebug("stage Advancing as it has been playing for too long in ending scene.")
    return true
  elseif sexLabThreadController.TotalTime <= 10
    Printdebug("Stage not advancing as the stage has only just started running under 10 seconds")
    return false
  elseif sexLabThreadController.TotalTime - timeOfLastRecordedFemaleOrgasm <= 7
    Printdebug("Stage not advancing After Female orgasm for 7 seconds")
    return false
  else
    Printdebug("Checking Conditions to Advance")
    Printdebug("Total Seconds in Sex" + sexLabThreadController.TotalTime)
    Printdebug("Total Seconds in Sex to advance " + ASLstagetimetoadvance + ". This must be lower than total seconds in sex")
    Printdebug("Female voice count " + currentlyPlayingSoundCount + ". This must be 0")
    Printdebug("Male voice count " + currentlyPlayingSoundCountMale + ". This must be 0")
    return ASLstagetimetoadvance < sexLabThreadController.TotalTime && currentlyPlayingSoundCount == 0 && currentlyPlayingSoundCountMale == 0
  endif
endfunction

function ASLRemoveCumPool()
  if mainFemaleActor.IsEquipped(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor)
    mainFemaleActor.unEquipItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor, abSilent=true)
    mainFemaleActor.removeItem(Game.GetFormFromFile(0x633D5, "sr_fillherup.esp") as Armor)
  endif
endfunction

function ASLRemoveOrgasmSSquirt()
  if mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor)
    mainFemaleActor.unEquipItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor, abSilent=true)
    mainFemaleActor.removeItem(Game.GetFormFromFile(0xD7B19, "sr_fillherup.esp") as Armor)
  endif
endfunction

function ASLRemoveThickCumleak()
  if mainFemaleActor.IsEquipped(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
    mainFemaleActor.unEquipItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor, abSilent=true)
    mainFemaleActor.removeItem(Game.GetFormFromFile(0xE1D1C, "sr_fillherup.esp") as Armor)
  endif
endfunction

function ASLUPDATE()
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
      UpdateLabels(CurrentAnimation, currentstage, PCPosition) ;update only for PC
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
        elseif GetMainNPCTrait() == "Rape Loving+" && femaleisvictim() && IsgettingPenetrated()
          TimerMultiplier = 1.5
        elseif GetMainNPCTrait() == "Pussy Loving+" && IsGettingVaginallyPenetrated()
          TimerMultiplier = 2
        elseif GetMainNPCTrait() == "Anal Loving+" && IsGettingAnallyPenetrated()
          TimerMultiplier = 2
        elseif GetMainNPCTrait() == "+The Penetrator" && IsgettingPenetrated()
          TimerMultiplier = 1.5
        elseif GetMainNPCTrait() == "Oral Loving+" && IsSuckingoffOther()
          TimerMultiplier = 2
        elseif GetMainNPCTrait() == "Sexually Frustrated+" && IsgettingPenetrated()
          TimerMultiplier = 1.5
        elseif GetMainNPCTrait() == "+The Nut Gobbler" && IsSuckingoffOther()
          TimerMultiplier = 2
        elseif GetMainNPCTrait() == "+Cowgirl" && IsCowgirl()
          TimerMultiplier = 2
        elseif GetMainNPCTrait() == "+In Heat" && IsgettingPenetrated()
          TimerMultiplier = 1.3
        endif
      endif
      printdebug("Stage Timer : " + GetPrimaryLabel() + " : " + GetTimer())
      printdebug(" Main NPC Trait From Hentairim traits - " + GetMainNPCTrait() + " . " + " Stage time multiplier = " + TimerMultiplier)
      ASLStagetimetoadvance = sexLabThreadController.TotalTime + (GetTimer() * TimerMultiplier)
      printdebug("Stage Time to Advance (Seconds): " + GetTimer() * TimerMultiplier)
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

Bool function AllowMaleVoice()
  return Utility.RandomFloat(0.0, 1.0) <= ChanceForMaleToComment && EnableMaleVoice == 1 && Gender == 0 && mainMaleVoice != None ;gender must be male only
endfunction

function BodySwitchtoLewdArmor()
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
      LewdArmor = jsonutil.GetFormValue(ArmorSwappingFile, BaseArmor.getname(), none) as armor
      if LewdArmor != none
        ;miscutil.PrintConsole (slotindex + " Trying to add  : "+ LewdArmor.getname())
        mainFemaleActor.addItem(LewdArmor, abSilent=true)

        ;miscutil.PrintConsole (slotindex + " Trying to unequip  : "+ BaseArmor.getname())
        mainFemaleActor.unEquipItem(BaseArmor, abSilent=true)

        ;miscutil.PrintConsole (slotindex + " Trying to equip  : "+ LewdArmor.getname())
        mainFemaleActor.EquipItem(LewdArmor, abSilent=true)
        BaseArmorArr = papyrusutil.pushform(BaseArmorArr, BaseArmor)
        LewdArmorArr = papyrusutil.pushform(LewdArmorArr, LewdArmor)
      endif
    endif
    slotindex += 1
  endwhile
  SwappedUpperArmor = true
endfunction

function ChangeHentaiExpression(String Scenario)
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
  StorageUtil.SetStringValue(None, "HentaiScenario", Scenario)
endfunction

function ChangePCExpressions(String debugtext="")
  if debugtext == "Oh"
    ChangeHentaiExpression("kneejerk")
  elseif debugtext == "SurprisedByMaleOrgasm" || debugtext == "AfterGape"
    ChangeHentaiExpression("hugeppgape")
  elseif debugtext == "InsertionAnalSlow" || debugtext == "InsertionGeneric"
    ChangeHentaiExpression("initialinsertioncomments")
  elseif debugtext == "WantMore" || debugtext == "AskForAnalCum" || debugtext == "AskForVaginalCum" || debugtext == "AskForOralCum"
    ChangeHentaiExpression("wantmore")
  elseif debugtext == "FemaleOrgasm"
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
  elseif debugtext == "Unamused"
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
  elseif debugtext == "MyTurnToCum"
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
endfunction

Int function CurrentPenetrationLvl()
  if Primarystagelabel == "LDI" || IsStimulatingOthers()
    return 0
  elseif IsGettingAnallyPenetrated() || IsGivingAnalPenetration()
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
endfunction

Bool function FemaleIsSatisfied()
  return femaleRecordedOrgasmCount > utility.randomint(2, 4)
endfunction

Bool function FemaleIsVictim()
  return SexLab.IsVictim(sceneID, mainFemaleActor) && !ASLisBroken() && EnableVictimScenario == 1
endfunction

function FindActorsAndVoices()
  Actor[] actorList = sexLabThreadController.Positions
  Int actorCount = actorList.Length
  Int actorIndex = 0
  mainFemaleVoice = MasterScript.GetVoiceForActress(playerCharacter)

  ;Go through the list of all actors in the scene and get data on their gender and voices
  ;PC is always main female
  while actorIndex < actorCount
    Actor actorInQuestion = actorList[actorIndex]
    if actorInQuestion == playerCharacter
      PCPosition = actorIndex
    endif
    if DefaultMaleVoice == none
      DefaultMaleVoice = MasterScript.GetDefaultMaleVoice(actorInQuestion)
    endif
    if (MasterScript.IsMale(actorInQuestion) || hasSchlong(actorInQuestion)) && actorInQuestion != playerCharacter
      ;If mainMaleVoice == None
      mainMaleVoice = MasterScript.GetVoiceForActor(actorInQuestion)
      if mainMaleVoice != None && mainMaleActor == None
        mainMaleActor = actorInQuestion
      endif

      ;EndIf
    endif
    actorIndex += 1
  endwhile
  if mainMaleActor == None
    if mainFemaleActor == actorList[0]
      mainMaleActor = actorList[1]
    else
      mainMaleActor = actorList[0]
    endif
  endif
  printdebug("mainfemaleactor :" + mainFemaleActor.getleveledactorbase().GetName())
  printdebug("mainmaleactor :" + mainMaleActor.getleveledactorbase().GetName())
endfunction

Int function GetActorEnjoyment(Actor actorInQuestion)
  if actorInQuestion == None
    return -1
  else
    return sexLabThreadController.ActorAlias(actorInQuestion).GetFullEnjoyment()
  endif
endfunction

int function GetBrokenPoints()
  return mainfemaleactor.GetFactionRank(HentairimBroken)
endfunction

String function GetMainNPCTrait()
  ;	miscutil.printconsole("Main NPC Trait IVDT Hentai : " +  StorageUtil.GetStringValue(None, "MainNPCTrait", ""))
  return StorageUtil.GetStringValue(None, "MainNPCTrait", "")
endfunction

String function GetPrimaryLabel()
  if EndingLabel != "LDI"
    return EndingLabel
  elseif OralLabel != "LDI"
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

int function GetTimer()
  if GetPrimaryLabel() == "ldi"
    return ldi
  elseif GetPrimaryLabel() == "sst"
    return sst
  elseif GetPrimaryLabel() == "fst"
    return fst
  elseif GetPrimaryLabel() == "bst"
    return bst
  elseif GetPrimaryLabel() == "kis"
    return kis
  elseif GetPrimaryLabel() == "cun"
    return cun
  elseif GetPrimaryLabel() == "sbj"
    return sbj
  elseif GetPrimaryLabel() == "fbj"
    return fbj
  elseif GetPrimaryLabel() == "sap"
    return sap
  elseif GetPrimaryLabel() == "svp"
    return svp
  elseif GetPrimaryLabel() == "fap"
    return fap
  elseif GetPrimaryLabel() == "fvp"
    return fvp
  elseif GetPrimaryLabel() == "sdp"
    return sdp
  elseif GetPrimaryLabel() == "fdp"
    return fdp
  elseif GetPrimaryLabel() == "scg"
    return scg
  elseif GetPrimaryLabel() == "sac"
    return sac
  elseif GetPrimaryLabel() == "fcg"
    return fcg
  elseif GetPrimaryLabel() == "fac"
    return fac
  elseif GetPrimaryLabel() == "sdv"
    return sdv
  elseif GetPrimaryLabel() == "sda"
    return sda
  elseif GetPrimaryLabel() == "fdv"
    return fdv
  elseif GetPrimaryLabel() == "fda"
    return fda
  elseif GetPrimaryLabel() == "shj"
    return shj
  elseif GetPrimaryLabel() == "fhj"
    return fhj
  elseif GetPrimaryLabel() == "stf"
    return stf
  elseif GetPrimaryLabel() == "ftf"
    return ftf
  elseif GetPrimaryLabel() == "smf"
    return smf
  elseif GetPrimaryLabel() == "fmf"
    return fmf
  elseif GetPrimaryLabel() == "sfj"
    return sfj
  elseif GetPrimaryLabel() == "ffj"
    return ffj
  elseif GetPrimaryLabel() == "eno"
    return eno
  elseif GetPrimaryLabel() == "eni"
    return eni
  elseif GetPrimaryLabel() == "fmf"
    return fmf
  elseif GetPrimaryLabel() == "sfj"
    return sfj
  elseif GetPrimaryLabel() == "ffj"
    return ffj
  elseif GetPrimaryLabel() == "eno"
    return eno
  elseif GetPrimaryLabel() == "eni"
    return eni
  else
    printdebug("Label for TImer is not found. Defaulting to 15")
    return 15
  endif
endfunction

Bool function HasDeviousGag(Actor char)
  if !char
    return false
  endif
  if has_MagicEffect(char, 0x2b077, "Devious Devices - Integration.esm") && Char == MainfemaleActor ;devious gag
    return true
  endif
  return false
endfunction

Bool function HasSchlong(Actor char)
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
  endif
endfunction

function InitializeConfigValues()
  ;Store Actor Base Scaling for reset later after animation ends,
  ActorsInPlay = sexLabThreadController.Positions
  int count = ActorsInPlay.Length
  if count > 0
    ActorOne = ActorsInPlay[0]
  endif
  if count > 1
    ActorTwo = ActorsInPlay[1]
  endif
  if count > 2
    ActorThree = ActorsInPlay[2]
  endif
  if count > 3
    ActorFour = ActorsInPlay[3]
  endif
  if count > 4
    ActorFive = ActorsInPlay[4]
  endif
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
  HoursSinceLastSexToResetBrokenStatus = JsonUtil.GetIntValue(ConfigFile, "hourssincelastsextoresetbrokenstatus", 9999)
  EnableAutoAdvanceStage = JsonUtil.GetIntValue(ConfigFile, "enableautoadvancestage", 0)
  donotadvanceifpartnerclosetoorgasm = JsonUtil.GetIntValue(ConfigFile, "donotadvanceifpartnerclosetoorgasm", 0)
  donotadvanceifpcclosetoorgasm = JsonUtil.GetIntValue(ConfigFile, "donotadvanceifpcclosetoorgasm", 0)
  donotadvanceifnpcclosetoorgasm = JsonUtil.GetIntValue(ConfigFile, "donotadvanceifnpcclosetoorgasm", 0)
  EnableTagScaling = JsonUtil.GetIntValue(ConfigFile, "enabletagscaling", 0)
  ChanceToOrgasmSquirt = JsonUtil.GetIntValue(ConfigFile, "chancetoorgasmsquirt", 0) as float / 100
  EnableBrokenStatus = JsonUtil.GetIntValue(ConfigFile, "enablebrokenstatus", 0)
  BrokenStatusVictimOnly = JsonUtil.GetIntValue(ConfigFile, "brokenstatusvictimonly", 0)
  EnableThickCumLeak = JsonUtil.GetIntValue(ConfigFile, "enablethickcumleak", 0)
  ChanceToLeakThickCum = JsonUtil.GetIntValue(ConfigFile, "chancetoleakthickcum", 0) as float / 100
  HoursSinceLastSexToResetBrokenStatus = JsonUtil.GetIntValue(ConfigFile, "hourssincelastsextoresetbrokenstatus", 0)

  ;MaxOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile,"maxorgasmstobroken",9999)
  ;MinOrgasmsToBroken = JsonUtil.GetIntValue(ConfigFile,"minorgasmstobroken",9999)
  EnableHugePPScenario = JsonUtil.GetIntValue(ConfigFile, "enablehugeppscenario", 0)
  EnableVictimscenario = JsonUtil.GetIntValue(ConfigFile, "enablevictimscenario", 0)
  ChanceTohaveSpanking = JsonUtil.GetIntValue(ConfigFile, "chancetohavespanking", 0) as float / 100
  MinSpankCount = JsonUtil.GetIntValue(ConfigFile, "minspankcount", 0)
  MaxSpankCount = JsonUtil.GetIntValue(ConfigFile, "maxspankcount", 0)
  ChanceToCommentUnamused = JsonUtil.GetIntValue(ConfigFile, "chancetocommentunamused", 0) as float / 100
  ChanceToCommentonLeadinStage = JsonUtil.GetIntValue(ConfigFile, "chancetocommentonleadinstage", 0) as float / 100
  ChanceToCommentonNonIntenseStage = JsonUtil.GetIntValue(ConfigFile, "chancetocommentonnonintensestage", 0) as float / 100
  chancetocommentonintensestage = JsonUtil.GetIntValue(ConfigFile, "chancetocommentonintensestage", 0) as float / 100
  ChanceToCommentononAttackingStage = JsonUtil.GetIntValue(ConfigFile, "chancetocommentononattackingstage", 0) as float / 100
  ChanceToCommentonBlowjobStage = JsonUtil.GetIntValue(ConfigFile, "ChanceToCommentonBlowjobStage", 0) as float / 100
  ChanceToCommentWhenCloseToOrgasm = JsonUtil.GetIntValue(ConfigFile, "chancetocommentwhenclosetoorgasm", 0) as float / 100
  ChanceToCommentWhenMaleCloseToOrgasm = JsonUtil.GetIntValue(ConfigFile, "chancetocommentwhenmaleclosetoorgasm", 0) as float / 100
  FemaleOrgasmHypeEnjoyment = JsonUtil.GetIntValue(ConfigFile, "femaleorgasmhypeenjoyment", 0)
  MaleOrgasmHypeEnjoyment = JsonUtil.GetIntValue(ConfigFile, "maleorgasmhypeenjoyment", 0)
  EnableDDGagVoice = JsonUtil.GetIntValue(DDGagFile, "enableddgagvoice", 0)
  EnableMaleVoice = JsonUtil.GetIntValue(ConfigFile, "enablemalevoice", 0)
  ChanceForMaleToComment = JsonUtil.GetIntValue(ConfigFile, "chanceformaletocomment", 0) as float / 100
  ArmorSlotsToSwitch = papyrusutil.stringsplit(JsonUtil.GetStringValue(ArmorSwappingFile, "armorslots", ""), ",")
  EnableArmorSwapping = JsonUtil.GetIntValue(ConfigFile, "enablearmorswapping", 0)
  VoiceVariation = JsonUtil.GetStringValue(VoiceVariationFile, "voicevariation", "NA")
  AggressiveChancetoMoveBackAStage = JsonUtil.GetIntValue(ConfigFile, "aggressivechancetomovebackastage", 0)
  EnjoymentForAggressiveToMoveBackAStage = JsonUtil.GetIntValue(ConfigFile, "enjoymentforaggressivetomovebackastage", 0)
  HugePPSchlongSize = JsonUtil.GetIntValue(ConfigFile, "hugeppschlongsize", 0)
  EnableGhostActors = JsonUtil.GetIntValue(ConfigFile, "enableghostactors", 0)
  MoanOnly = JsonUtil.GetIntValue(ConfigFile, "moanonly", 0)
  hypebeforeorgasm = JsonUtil.GetIntValue(ConfigFile, "hypebeforeorgasm", 0)
  EnableLactate = JsonUtil.GetIntValue(LactateFile, "enablelactating", 0)
  AlwaysLactate = JsonUtil.GetIntValue(LactateFile, "alwayslactate", 0)
  ChancetoLactateDuringOrgasm = JsonUtil.GetIntValue(LactateFile, "chancetolactateduringorgasm", 0)
  ChanceToLactateDuringIntense = JsonUtil.GetIntValue(LactateFile, "chancetolactateduringintense", 0)
  ChancetoStopLactate = JsonUtil.GetIntValue(LactateFile, "chancetostoplactate", 0)
  useblowjobsoundforkissing = JsonUtil.GetIntValue(ConfigFile, "useblowjobsoundforkissing", 0)
  EnablePrintDebug = JsonUtil.GetIntValue(ConfigFile, "printdebug", 1)
  InitializeTimerConfig()
endfunction

function InitializeTimerConfig()
  ldi = JsonUtil.GetIntValue(TimerConfigFile, "ldi", 9999)
  sst = JsonUtil.GetIntValue(TimerConfigFile, "sst", 9999)
  fst = JsonUtil.GetIntValue(TimerConfigFile, "fst", 9999)
  bst = JsonUtil.GetIntValue(TimerConfigFile, "bst", 9999)
  kis = JsonUtil.GetIntValue(TimerConfigFile, "kis", 9999)
  cun = JsonUtil.GetIntValue(TimerConfigFile, "cun", 9999)
  sbj = JsonUtil.GetIntValue(TimerConfigFile, "sbj", 9999)
  fbj = JsonUtil.GetIntValue(TimerConfigFile, "fbj", 9999)
  sap = JsonUtil.GetIntValue(TimerConfigFile, "sap", 9999)
  svp = JsonUtil.GetIntValue(TimerConfigFile, "svp", 9999)
  fap = JsonUtil.GetIntValue(TimerConfigFile, "fap", 9999)
  fvp = JsonUtil.GetIntValue(TimerConfigFile, "fvp", 9999)
  sdp = JsonUtil.GetIntValue(TimerConfigFile, "sdp", 9999)
  fdp = JsonUtil.GetIntValue(TimerConfigFile, "fdp", 9999)
  scg = JsonUtil.GetIntValue(TimerConfigFile, "scg", 9999)
  sac = JsonUtil.GetIntValue(TimerConfigFile, "sac", 9999)
  fcg = JsonUtil.GetIntValue(TimerConfigFile, "fcg", 9999)
  fac = JsonUtil.GetIntValue(TimerConfigFile, "fac", 9999)
  sdv = JsonUtil.GetIntValue(TimerConfigFile, "sdv", 9999)
  sda = JsonUtil.GetIntValue(TimerConfigFile, "sda", 9999)
  fdv = JsonUtil.GetIntValue(TimerConfigFile, "fdv", 9999)
  fda = JsonUtil.GetIntValue(TimerConfigFile, "fda", 9999)
  shj = JsonUtil.GetIntValue(TimerConfigFile, "shj", 9999)
  fhj = JsonUtil.GetIntValue(TimerConfigFile, "fhj", 9999)
  stf = JsonUtil.GetIntValue(TimerConfigFile, "stf", 9999)
  ftf = JsonUtil.GetIntValue(TimerConfigFile, "ftf", 9999)
  smf = JsonUtil.GetIntValue(TimerConfigFile, "smf", 9999)
  fmf = JsonUtil.GetIntValue(TimerConfigFile, "fmf", 9999)
  sfj = JsonUtil.GetIntValue(TimerConfigFile, "sfj", 9999)
  ffj = JsonUtil.GetIntValue(TimerConfigFile, "ffj", 9999)
  eno = JsonUtil.GetIntValue(TimerConfigFile, "eno", 9999)
  eni = JsonUtil.GetIntValue(TimerConfigFile, "eni", 9999)
endfunction

Bool function IsCowgirl()
  return (PenetrationLabel == "SCG" || PenetrationLabel == "FCG" || PenetrationLabel == "SAC" || PenetrationLabel == "FAC") && !femaleisvictim()
endfunction

Bool function IsCunnilingus()
  return OralLabel == "CUN"
endfunction

Bool function IsEarlyToCum()
  return currentstage <= 2 && maleOrgasmCount < 2
endfunction

Bool function IsEnding()
  return EndingLabel == "ENI" || EndingLabel == "ENO"
endfunction

;for Femdom or penetrating others
Bool function IsFemdom()
  if femaleisvictim()
    return false
  else
    return IsCowgirl() || IsGivingAnalPenetration() || IsStimulatingOthers() || IsGivingOthersIntenseStimulation || IsGivingVaginalPenetration()
  endif
endfunction

Bool function IsGettingAnallyPenetrated()
  return PenetrationLabel == "SAP" || PenetrationLabel == "FAP" || PenetrationLabel == "SAC" || PenetrationLabel == "FAC" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool function IsGettingDoublePenetrated()
  return PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool function IsGettingInsertedBig()
  return Stimulationlabel == "BST"
endfunction

Bool function IsGettingStimulated()
  return Stimulationlabel == "SST" || Stimulationlabel == "FST"
endfunction

Bool function IsGettingSuckedoff()
  return PenisActionLabel == "SMF" || PenisActionLabel == "FMF"
endfunction

Bool function IsGettingVaginallyPenetrated()
  return PenetrationLabel == "SVP" || PenetrationLabel == "FVP" || PenetrationLabel == "SCG" || PenetrationLabel == "FCG" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool function IsGivingAnalPenetration()
  return PenisActionLabel == "FDA" || PenisActionLabel == "SDA"
endfunction

Bool function IsGivingVaginalPenetration()
  return PenisActionLabel == "FDV" || PenisActionLabel == "SDV"
endfunction

Bool function IsKissing()
  return OralLabel == "KIS"
endfunction

Bool function IsLeadIN()
  return stringutil.find(Labelsconcat, "1F") == -1 && stringutil.find(Labelsconcat, "1S") == -1 && stringutil.find(Labelsconcat, "BST") == -1
endfunction

Bool function IsStimulatingOthers()
  return isTitfuckOthers || isHandjobOthers || IsFootjobOthers || IsCunnilingus()
endfunction

Bool function IsSuckingoffOther()
  return OralLabel == "SBJ" || OralLabel == "FBJ"
endfunction

Bool function IsUnconcious()
  if (currentanimation.HasTag("faint") || currentanimation.HasTag("sleep") || currentanimation.HasTag("necro"))
    StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
    return true
  else
    return false
  endif
endfunction

Bool function IsfinalStage()
  return currentstage == CurrentAnimation.StageCount
endfunction

Bool function IsgettingPenetrated()
  return IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()
endfunction

Bool function IshugePP()
  if EnableHugePPScenario != 1
    return false
  endif
  Race MaleActorRace = mainMaleActor.GetRace()
  String MaleRaceName = MaleActorRace.GetName()
  if stringutil.find(MaleRaceName, "Brute") > -1 || stringutil.find(MaleRaceName, "Spider") > -1 || stringutil.find(MaleRaceName, "Lurker") > -1 || stringutil.find(MaleRaceName, "Daedroth") > -1 || stringutil.find(MaleRaceName, "Horse") > -1 || stringutil.find(MaleRaceName, "Bear") > -1 || stringutil.find(MaleRaceName, "Chaurus") > -1 || stringutil.find(MaleRaceName, "Dragon") > -1 || MaleRaceName == "Frost Atronach" || stringutil.find(MaleRaceName, "Giant") > -1 || MaleRaceName == "Mammoth" || MaleRaceName == "Sabre Cat" || stringutil.find(MaleRaceName, "Troll") > -1 || MaleRaceName == "Werewolf" || stringutil.find(MaleRaceName, "Gargoyle") > -1 || MaleRaceName == "Dwarven Centurion" || stringutil.find(MaleRaceName, "Ogre") > -1 || MaleRaceName == "Ogrim" || MaleRaceName == "Nest Ant Flier" || stringutil.find(MaleRaceName, "OGrim") > -1
    return True
  else
    ;if Schlong is big
    if (SchlongFaction)
      return mainMaleActor.GetFactionRank(SchlongFaction) >= HugePPSchlongSize
    elseif (TNG_XL)
      ;keywords can explicitly overwrite value
      int TNG_Size = TNG_PapyrusUtil.GetActorSize(mainMaleActor)
      bool tngxl = mainMaleActor.HasKeyword(TNG_XL)
      bool tngl = mainMaleActor.HasKeyword(TNG_L)
      bool isBig = tngxl || TNG_Size >= HugePPSchlongSize || tngl

      ;miscutil.PrintConsole ("DEBUG : current TNG_XL : " + tngxl)
      ;miscutil.PrintConsole ("DEBUG : current TNG_PapyrusUtil.GetActorSize : " + TNG_Size)
      ;miscutil.PrintConsole ("DEBUG : current TNG_L : " + tngl)
      ;miscutil.PrintConsole ("DEBUG : current isBig : " + isBig)
      return isBig
    endif
    return false
  endif
endfunction

Bool function Ishumanoidrace()
  Race MaleActorRace = mainMaleActor.GetRace()
  String MaleRaceName = MaleActorRace.GetName()
  if MaleRaceName == "Wood Elf" || MaleRaceName == "Draugr" || MaleRaceName == "Redguard" || MaleRaceName == "Old People Race" || MaleRaceName == "Khajiit" || MaleRaceName == "High Elf" || MaleRaceName == "Dremora" || MaleRaceName == "Draugr" || MaleRaceName == "Dark Elf" || MaleRaceName == "Giant" || MaleRaceName == "Orc" || MaleRaceName == "Troll" || MaleRaceName == "Werewolf" || MaleRaceName == "Gargoyle" || MaleRaceName == "Snow Troll" || MaleRaceName == "Nord" || MaleRaceName == "Imperial" || MaleRaceName == "Breton" || MaleRaceName == "Argonian"
    return True
  else
    return False
  endif
endfunction

Bool function Isintense()
  return stringutil.find(Labelsconcat, "1F") > -1 || IsGettingInsertedBig()
endfunction

function Lactate()
  if (AlwaysLactate == 1 || PCHasLactatingSpell()) && EnableLactate == 1 || StorageUtil.GetIntValue(None, "HentaiLactate") == 1
    printdebug("PC Lactating")
    if Game.GetModbyName("IVDTHentaiLactate.esp") != 255 && !mainFemaleActor.IsEquipped(MilkL) && !mainFemaleActor.IsEquipped(MilkR) && MilkL != None && MilkR != None
      mainFemaleActor.AddItem(MilkR, abSilent=true)
      mainFemaleActor.AddItem(MilkL, abSilent=true)
      mainFemaleActor.EquipItem(MilkR, abSilent=true)
      mainFemaleActor.EquipItem(MilkL, abSilent=true)
      NippleLeakCBBE.play(MainfemaleActor, Utility.Randomint(15, 30))
    endif
  endif
endfunction

Bool function MainFemaleisBurstingAtSeams()
  if has_spell(mainFemaleActor, 0x387D, "sr_fillherup.esp")
    return true
  endif
endfunction

Bool function MainMaleCanControl()
  ;cowgirl femdom and non forced blowjob -> false
  if (currentAnimation.hasTag("Cowgirl") || currentAnimation.hasTag("femdom") || currentAnimation.hasTag("Amazon") || (IsSuckingoffOther() && !currentAnimation.hasTag("Forced"))) && ActorsInPlay[0] == mainFemaleActor
    return false
  else
    return true
  endif
endfunction

;make romantic comment
function MakeRomanticCommentIfRightTime(Bool forceComment=False)
  PlaySound(mainFemaleVoice.LoveyDovey, mainFemaleActor, requiredChemistry=0, debugtext="LoveyDovey")
  timeOfLastRomanticRemark = SexLabThreadController.TotalTime
endfunction

Bool function MaleCloseToOrgasm()
  mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment
endfunction

Bool function MaleIsSatisfied()
  return maleOrgasmCount > utility.randomint(2, 4)
endfunction

Bool function MaleIsVictim()
  return SexLab.IsVictim(sceneID, mainMaleActor) && EnableVictimScenario == 1
endfunction

bool function Malewantsmore()
  return mainMaleEnjoyment >= 30 || maleOrgasmCount <= Utility.randomint(1, 4)
endfunction

float function NextUpdateInterval()
  if ASLcurrentlyIntense
    return Utility.RandomFloat(0.1, 1.0)
  else
    return Utility.RandomFloat(1.0, 2.0)
  endif
endfunction

function NotificationifFileisBad()
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

Bool function PCHasLactatingSpell()
  if Lactating
    return mainFemaleActor.hasspell(Lactating)
  endif
  return false
endfunction

function PerformInitialization()
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
    schlongfaction = Game.GetFormFromFile(0xAFF8, "Schlongs of Skyrim.esp") as Faction
  endif

  ;TNG
  if isDependencyReady("TheNewGentleman.esp") && !TNG_Gentlewoman
    TNG_XL = Game.GetFormFromFile(0xFE5, "TheNewGentleman.esp") as Keyword
    TNG_L = Game.GetFormFromFile(0xFE4, "TheNewGentleman.esp") as Keyword
    TNG_Gentlewoman = Game.GetFormFromFile(0xFF8, "TheNewGentleman.esp") as Keyword
  endif

  ;Hentairim Enjoyment
  if isDependencyReady("Hentairim Enjoyment Expressions Traits.esp")
    HentairimResistance = Game.GetFormFromFile(0x854, "Hentairim Enjoyment Expressions Traits.esp") as Faction
    HentairimBroken = Game.GetFormFromFile(0x853, "Hentairim Enjoyment Expressions Traits.esp") as Faction
  endif

  ;Lactate
  if isDependencyReady("IVDTHentaiLactate.esp")
    MilkR = Game.GetFormFromFile(0x812, "IVDTHentaiLactate.esp") as Armor
    MilkL = Game.GetFormFromFile(0x813, "IVDTHentaiLactate.esp") as Armor
    NippleLeakCBBE = game.GetFormFromFile(0x814, "IVDTHentaiLactate.esp") as EffectShader
  endif
  if isDependencyReady("IVDTHentaiNPCTraitsAndEnjoyment.esp") && !Lactating
    Lactating = Game.GetFormFromFile(0x851, "IVDTHentaiNPCTraitsAndEnjoyment.esp") as Spell
  endif
  SetGhostActor()
  Initialized = true
  printdebug("initialized complete")
endfunction

function PlayBlowjob()
  if femaleCloseToOrgasm() && IsgettingPenetrated() ;When female close to orgasm
    ASLPlayFemaleOrgasmHype()
  else
    if VoiceVariation == "A"
      if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
        ASLPlayMaleClosetoOrgasmComments()
      elseif Utility.RandomFloat(0.0, 1.0) <= ChanceToCommentonBlowjobStage && ASLcurrentlyIntense
        PlaySound(mainFemaleVoice.AppreciatePartner, mainFemaleActor, requiredChemistry=0, debugtext="AppreciatePartner")
      elseif Utility.RandomFloat(0.0, 1.0) <= ChanceToCommentonBlowjobStage && !femaleisvictim() && !ASLIsBroken() && !ASLcurrentlyIntense
        PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobRemarks")
      elseif ASLcurrentlyIntense
        PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionIntense")
      else
        PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionSoft")
      endif
    else
      if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
        ASLPlayMaleClosetoOrgasmComments()
      elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonBlowjobStage && currentstage > 1 && !femaleisvictim() && !ASLIsBroken()
        PlaySound(mainFemaleVoice.BlowjobRemarks, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobRemarks")
      elseif ASLcurrentlyIntense
        PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionIntense")
      else
        PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionSoft")
      endif
    endif
  endif
endfunction

function PlayBreathyorforeplaysound()
  if ASLCurrentlyintense
    if Utility.RandomFloat(0.0, 1.0) <= 0.5
      PlaySound(mainFemaleVoice.Foreplayintense, mainFemaleActor, requiredChemistry=0, debugtext="Foreplayintense")
    else
      PlaySound(mainFemaleVoice.BreathyIntense, mainFemaleActor, requiredChemistry=0, debugtext="BreathyIntense")
    endif
  else
    if Utility.RandomFloat(0.0, 1.0) <= 0.5
      PlaySound(mainFemaleVoice.Foreplaysoft, mainFemaleActor, requiredChemistry=0, debugtext="Foreplaysoft")
    else
      PlaySound(mainFemaleVoice.BreathySoft, mainFemaleActor, requiredChemistry=0, debugtext="BreathySoft")
    endif
  endif
endfunction

function PlayBroken()
  printdebug("Play Broken")
  if CommentedClosetoOrgasm
    PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
  elseif femaleCloseToOrgasm() ;When female close to orgasm
    ASLPlayFemaleOrgasmHype()
  elseif Utility.RandomFloat(0.0, 1.0) < 0.15 && !ASLcurrentlyintense
    PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
  elseif IsFemdom() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage / 2
    PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry=0, debugtext="OnTheAttack")
  elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage / 4
    PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="Amused")
  elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage / 4
    PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry=0, debugtext="InAwe")
  else
    PlaySound(mainFemaleVoice.AfterOrgasmArouse, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmArouse")
  endif
endfunction

function PlayCowgirl()
  printdebug("Play Cowgirl")
  if CommentedClosetoOrgasm
    if ASLcurrentlyintense
      PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
    else
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    endif
  elseif femaleCloseToOrgasm() ;When female close to orgasm
    ASLPlayFemaleOrgasmHype()
  elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ;if male close or orgasm
    ASLPlayMaleClosetoOrgasmComments()
  else
    ;after close to orgasm handling
    ;make greeting
    if Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage && currentstage == 1 && GreetedMalePartner == false && !ASLCurrentlyintense
      ASLMakeGreetingToMalePartner()
      GreetedMalePartner = true
    endif
    if Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage ; femdom comments
      if Utility.RandomInt(1, 2) == 1
        PlaySound(mainFemaleVoice.OnTheAttack, mainFemaleActor, requiredChemistry=0, debugtext="OnTheAttack")
      else
        PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, debugtext="Amused")
      endif
    elseif ishugepp() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage && !ASLcurrentlyIntense
      PlaySound(mainFemaleVoice.InAwe, mainFemaleActor, requiredChemistry=1, debugtext="InAwe")
    elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage && !ASLcurrentlyIntense
      if Utility.randomint(1, 2) == 1
        PossiblyAskForCumInSpecificLocation()
      else
        PlaySound(mainFemaleVoice.PenetrativeCommentssoft, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeCommentssoft")
      endif
    elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonIntenseStage && ASLcurrentlyIntense
      PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeCommentsIntense")
    else
      if ASLcurrentlyintense
        PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
      else
        PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
      endif
    endif
  endif
endfunction

function PlayCunnilingus()
  printdebug("Play Cunnilingus")
  if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
    ASLPlayMaleClosetoOrgasmComments()
  else
    PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionSoft")
  endif
endfunction

function PlayEnding()
  printdebug("PLay Ending")

  ;chance to leak cum
  if Utility.RandomFloat(0.0, 1.0) < ChanceToLeakThickCum && CameInsideCount > 0
    ASLAddThickCumleak()
  endif
  StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
  if commentedcumlocation == false && !femaleisvictim() && CameInsideCount > 0
    commentedcumlocation = true
    PossiblyRemarkOnCumLocation()
  elseif MaleCommentsonEN == false && AllowMaleVoice()
    ;miscutil.PrintConsole ("Playing Male Comments EN stage")
    if MaleIsVictim()
      PlaySound(mainMaleVoice.TeaseAggressivePartner, mainMaleActor, soundPriority=2, waitForCompletion=False, debugtext="TeaseAggressivePartner")
    else
      PlaySound(mainMaleVoice.PostNutRemark, mainMaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=false, debugtext="PostNutRemark")
    endif
    Utility.Wait(Utility.RandomFloat(1.0, 2.0))
    PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, debugtext="AfterOrgasmExclamations")
  elseif commentedorgasmremark == false && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
    commentedorgasmremark = true
    if femaleisvictim() && Utility.RandomFloat(0, 1.0) < ChanceToCommentUnamused * 3
      PlaySound(mainFemaleVoice.UnamusedEnd, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="UnamusedEnd")
    elseif femaleRecordedOrgasmCount > Utility.RandomInt(2, 5) && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
      PlaySound(mainFemaleVoice.MadeMeCumSoMuch, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="MadeMeCumSoMuch")
    endif
  elseif currentAnimation.HasTag("femdom") && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage
    PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, debugtext="Amused")
  else
    PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, debugtext="AfterOrgasmExclamations")
  endif
endfunction

function PlayFuckingOthers()
  printdebug("Play Fucking Others")
  if CommentedClosetoOrgasm
    if ASLcurrentlyintense
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    else
      PlayBreathyorforeplaysound()
    endif
  elseif femaleCloseToOrgasm() ;When female close to orgasm
    ASLPlayFemaleOrgasmHype()
  elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ;if male close or orgasm
    ASLPlayMaleClosetoOrgasmComments()
  else
    ;after close to orgasm handling
    if Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage / 3
      PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, debugtext="Amused")
    else
      if ASLcurrentlyintense
        PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
      else
        PlayBreathyorforeplaysound()
      endif
    endif
  endif
endfunction

function PlayGaggedSound()
  ;intense gag noise
  if ASLCurrentlyintense
    PlaySound(mainFemaleVoice.AssFlattering, mainFemaleActor, requiredChemistry=0, debugtext="AssFlattering")
  else ; less intense gag noises
    PlaySound(mainFemaleVoice.AssToMouth, mainFemaleActor, requiredChemistry=0, debugtext="AssToMouth")
  endif
endfunction

function PlayGettingFucked()
  printdebug("Play Getting Fucked")

  ;------------------ INTENSE-------------------
  if ASLCurrentlyintense
    ;if isHumanoidrace() && Utility.RandomFloat(0.0, 1.0) < ChanceTohaveSpanking && (currentAnimation.HasTag("Doggy") || currentAnimation.HasTag("Standing") || currentAnimation.HasTag("Doggystyle") || currentAnimation.HasTag("Doggy Style"))
    ;	PlaySpankingSequence()
    ;endif
    if CommentedClosetoOrgasm
      PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
    elseif femaleCloseToOrgasm() ;When female close to orgasm
      ASLPlayFemaleOrgasmHype()
    elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm
      ASLPlayMaleClosetoOrgasmComments()
    else ;After Handling close to Orgasm
      if FemaleIsVictim() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
        PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry=0)
      elseif IsGettingAnallyPenetrated() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
        PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry=0, debugtext="IntenseAnal")
      elseif IsGettingVaginallyPenetrated() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
        PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeCommentsIntense")
      else
        PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
      endif
    endif

    ;------------------ NOT INTENSE-------------------
  else
    if CommentedClosetoOrgasm
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    elseif femaleCloseToOrgasm() ;When female close to orgasm
      ASLPlayFemaleOrgasmHype()
    elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
      ASLPlayMaleClosetoOrgasmComments()
    else
      ;after handling close to orgasm
      if femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused
        PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry=0, debugtext="Unamused")
      elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
        PlaySound(mainFemaleVoice.PenetrativeCommentssoft, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeCommentssoft")
      else
        PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
      endif
    endif
  endif
endfunction

function PlayGettingFuckedDouble()
  printdebug("Play Getting Double Fucked")
  if ASLCurrentlyintense
    if CommentedClosetoOrgasm
      PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
    elseif femaleCloseToOrgasm() ;When female close to orgasm
      ASLPlayFemaleOrgasmHype()
    elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm
      ASLPlayMaleClosetoOrgasmComments()
    else ;After Handling close to Orgasm
      if IsGettingAnallyPenetrated() && Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
        if Utility.Randomint(1, 2) == 1
          PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry=0, debugtext="IntenseAnal")
        else
          PlaySound(mainFemaleVoice.PenetrativeCommentsIntense, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeCommentsIntense")
        endif
      else
        if currentAnimation.hastag("Tentacles")
          PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
        else
          PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, debugtext="SensitivePleasure")
        endif
      endif
    endif

    ;Not Intense
  else
    if CommentedClosetoOrgasm
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    elseif femaleCloseToOrgasm() ;When female close to orgasm
      ASLPlayFemaleOrgasmHype()
    elseif ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ; when male close to orgasm
      ASLPlayMaleClosetoOrgasmComments()
    else
      ;after handling close to orgasm
      if femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused
        PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry=0, debugtext="Unamused")
      elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonNonIntenseStage
        PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry=0, debugtext="TeaseAggressivePartner")
      else
        if currentAnimation.hastag("Tentacles")
          PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="PenetrativeGrunts")
        else
          PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
        endif
      endif
    endif
  endif
endfunction

function PlayGettingFuckedbyHugePP() ; when on huge pp scenario
  printdebug("Play Getting Fucked by Huge PP")
  if CommentedClosetoOrgasm
    PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, debugtext="SensitivePleasure")
  elseif femaleCloseToOrgasm()
    ASLPlayFemaleOrgasmHype()
  else
    if IsGettingDoublePenetrated()
      PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, debugtext="SensitivePleasure")
    elseif ASLCurrentlyintense
      if IsGettingAnallyPenetrated() && utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
        PlaySound(mainFemaleVoice.IntenseAnal, mainFemaleActor, requiredChemistry=0, debugtext="IntenseAnal")
      elseif Utility.RandomFloat(0.0, 1.0) < chancetocommentonintensestage
        PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry=0)
      else
        PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, debugtext="SensitivePleasure")
      endif
    else
      ; breath and gape breath and gape. ASL SA FA reserved for large pp creature piston cycle time > 2 seconds
      if Utility.RandomFloat(0.0, 1.0) < 0.5
        PlayBreathyorforeplaysound()
      else
        PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
      endif
      if Utility.RandomFloat(0.0, 1.0) < 0.2
        Utility.Wait(Utility.RandomFloat(1.0, 2.0))
        PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
        Utility.Wait(1.0)
        PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="AfterGape")
      endif
    endif
  endif
endfunction

function PlayGettingStimulated()
  printdebug("Play Getting Stimulated")

  ;------------------INTENSE-------------------
  if ASLCurrentlyintense
    if CommentedClosetoOrgasm
      PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
    elseif femaleCloseToOrgasm() ;When female close to orgasm
      ASLPlayFemaleOrgasmHype()
    else ;After Handling close to Orgasm
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    endif

    ;------------------ NOt INTENSE-------------------
  else
    if CommentedClosetoOrgasm
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    elseif femaleCloseToOrgasm() ;When female close to orgasm
      ASLPlayFemaleOrgasmHype()
    else
      ;after handling close to orgasm
      if femaleisvictim() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentUnamused
        PlaySound(mainFemaleVoice.Unamused, mainFemaleActor, requiredChemistry=0, debugtext="Unamused")
      else
        PlayBreathyorforeplaysound()
      endif
    endif
  endif
endfunction

function PlayKissing()
  printdebug("Play Kissing")
  if ShouldMakeRomanticComment()
    MakeRomanticCommentIfRightTime()
  else
    ;dont say make any noise while kissing. let Enjoyment make the kissing sound
    if useblowjobsoundforkissing == 1
      PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionSoft")
    else
      Utility.wait(3)
    endif

    ;PlayBreathyorforeplaysound()
  endif
endfunction

function PlayLeadIn() ;no relevant tags
  printdebug("Play Lead In")
  if currentstage < 3 && !femaleisvictim() ;greets only on first 2 stages
    if ShouldMakeRomanticComment()
      MakeRomanticCommentIfRightTime()
    elseif ishugepp() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLeadinStage
      PlaySound(mainFemaleVoice.GreetLoadedFamiliar, mainFemaleActor, requiredChemistry=1, debugtext="GreetLoadedFamiliar")

      ;make greeting at 7% chance at 1st stage
    elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLeadinStage && Currentstage == 1
      ASLMakeGreetingToMalePartner()
    endif
  endif
  if PrevEndingLabel == "ENO" || PrevEndingLabel == "ENI" ; for some reason if the EN stage was extended into LI
    PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, debugtext="AfterOrgasmExclamations")
  elseif Utility.RandomFloat(0.0, 1.0) < ChanceToCommentonLeadinStage * 2 && mainFemaleEnjoyment >= 50 && !FemaleIsVictim()
    PlaySound(mainFemaleVoice.ReadyToGetGoing, mainFemaleActor, requiredChemistry=0, debugtext="ReadyToGetGoing")
  else
    PlayBreathyorforeplaysound()
  endif
endfunction

function PlayMaleComments()
  if (Primarystagelabel == "LDI" || IsGettingStimulated()) && !IsgettingPenetrated() && Currentstage < 3
    PlaySound(mainMaleVoice.Aroused, mainMaleActor, requiredChemistry=0, soundPriority=2)
    if ASLisBroken()
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
    else
      PlaySound(mainFemaleVoice.Foreplaysoft, mainFemaleActor, requiredChemistry=0, debugtext="Foreplaysoft")
    endif
  elseif ShouldPlayMaleOrgasmHype()
    PlaySound(mainMaleVoice.AboutToCum, mainMaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=False)

    ;female background moaning
    if IsUnconcious()
      return
    elseif ASLisBroken()
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
    else
      if ASLCurrentlyintense
        PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="NearOrgasmNoises")
      else
        PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="PenetrativeGrunts")
      endif
    endif
  elseif MaleIsVictim() || IsFemdom()
    ;miscutil.PrintConsole ("Playing Male Comments male victim On the attack")
    ;male say something
    PlaySound(mainMaleVoice.TeaseAggressivePartner, mainMaleActor, soundPriority=2, waitForCompletion=False)

    ;female background moaning
    if IsUnconcious()
      return
    elseif ASLisBroken()
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
    else
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="PenetrativeGrunts")
    endif
  elseif CurrentPenetrationLvl() >= 2 && ASLCurrentlyintense
    ;miscutil.PrintConsole ("Playing Male Comments intense penetration")
    ;male say something
    if IsUnconcious()
      return
    elseif femaleisvictim()
      PlaySound(mainMaleVoice.Aggressive, mainMaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=False)
    else
      PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=False)
    endif

    ;female background moaning
    PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="NearOrgasmNoises")
  elseif CurrentPenetrationLvl() >= 2 && !ASLCurrentlyintense
    ;miscutil.PrintConsole ("Playing Male Comments non Intense Penetration")
    ;female background moaning
    PlaySound(mainMaleVoice.StrugglingEarly, mainMaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=False, debugtext="StrugglingEarly")
    if IsUnconcious()
      return
    elseif ASLisBroken()
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="AfterOrgasmExclamations")
    else
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, soundPriority=1, debugtext="PenetrativeGrunts")
    endif
  endif
endfunction

function PlayMoanonly()
  printdebug("Play Moan only")
  StorageUtil.SetIntValue(None, "ASLDoNotAllowFemaleOrgasmYet", 0)
  if ASLCurrentlyintense
    if IsSuckingoffOther()
      PlaySound(mainFemaleVoice.BlowjobActionIntense, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionIntense")
    elseif IsgettingPenetrated()
      PlaySound(mainFemaleVoice.NearOrgasmNoises, mainFemaleActor, requiredChemistry=0, debugtext="NearOrgasmNoises")
    elseif IsGettingStimulated()
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    else
      PlayBreathyorforeplaysound()
    endif
  else
    if IsSuckingoffOther()
      PlaySound(mainFemaleVoice.BlowjobActionSoft, mainFemaleActor, requiredChemistry=0, debugtext="BlowjobActionSoft")
    elseif IsgettingPenetrated()
      PlaySound(mainFemaleVoice.PenetrativeGrunts, mainFemaleActor, requiredChemistry=0, debugtext="PenetrativeGrunts")
    elseif isending()
      PlaySound(mainFemaleVoice.AfterOrgasmExclamations, mainFemaleActor, requiredChemistry=0, debugtext="AfterOrgasmExclamations")
    else
      PlayBreathyorforeplaysound()
    endif
  endif
endfunction

function PlaySound(Sound theSound, Actor actorMakingSound, Int requiredChemistry=0, Int soundPriority=0, Float maxQueueDuration=5.0, Bool waitForCompletion=True, string debugtext="None", Bool Force=false, Bool SkipWait=false)
  Sound soundToPlay = thesound
  if soundToPlay == None
    return
  endif

  ; male or other playing sound
  if actorMakingSound != mainFemaleActor && (currentlyPlayingSoundCountMale == 0 || soundpriority > 1) ;others playing sound.
    Printdebug("Non PC Playing voice : " + debugtext)
    currentlyPlayingSoundCountMale = currentlyPlayingSoundCountMale + 1

    ;lower down voice of female moan when male says something
    MasterScript.PlaySound(soundToPlay, actorMakingSound, waitForCompletion)
    currentlyPlayingSoundCountMale = currentlyPlayingSoundCountMale - 1

    ;female playing sound
  elseif actorMakingSound == mainFemaleActor && (currentlyPlayingSoundCount == 0 || soundpriority > 1) ;Female play sound
    Printdebug("PC Playing voice : " + debugtext)
    ChangePCExpressions(debugtext)
    currentlyPlayingSoundCount = currentlyPlayingSoundCount + 1
    if SoundPriority <= 1 && soundToPlay != PreviousSound && SkipWait == false
      if ASLcurrentlyIntense
        utility.wait(utility.randomint(0, 1))
      else
        utility.wait(utility.randomint(1, 2))
      endif
    endif

    ;track previous sound
    PreviousSound = soundToPlay
    if soundPriority > 2
      LowPrioritySounds.mute()
    endif
    if IsUnconcious()
      LowPrioritySounds.mute()
      HighPrioritySounds.mute()
    endif
    MasterScript.PlaySound(soundToPlay, actorMakingSound, waitForCompletion)
    currentlyPlayingSoundCount = currentlyPlayingSoundCount - 1
    if currentlyPlayingSoundCount == 0
      if !IsUnconcious()
        LowPrioritySounds.unmute()
        HighPrioritySounds.unmute()
      endif
    endif
  else
    Utility.Wait(Utility.RandomFloat(1, 2))
  endif
endfunction

function PlaySpankingSequence(Bool aggressiveLineAtStart=True)
  ;spanking scenario
  int spanksCompleted = 0
  int SpankTarget = 0
  SpankTarget = Utility.RandomInt(MinSpankCount, MaxSpankCount)
  if AllowMaleVoice()
    ;	miscutil.PrintConsole ("Playing Male Comments spanking sequence")
    PlaySound(mainMaleVoice.StrugglingSubtle, mainMaleActor, requiredChemistry=0, soundPriority=2, waitForCompletion=False, debugtext="StrugglingSubtle")
  endif
  while spanksCompleted < SpankTarget
    ASLIsinSpanking = true
    PlaySound(MasterScript.Sounds.Smack, mainFemaleActor, requiredChemistry=0, soundPriority=1, waitForCompletion=false)
    PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=1, SkipWait=true, debugtext="Oh")
    spanksCompleted += 1
  endwhile
  ASLIsinSpanking = false
  if Utility.RandomFloat(0.0, 1.0) < 0.7
    PlaySound(mainFemaleVoice.TeaseAggressivePartner, mainFemaleActor, requiredChemistry=0)
  endif
endfunction

function PlayStimulatedHard()
  printdebug("Play Stimulated Hard (Huge non Penile insertion)")
  if CommentedClosetoOrgasm
    PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, debugtext="SensitivePleasure")
  elseif femaleCloseToOrgasm()
    ASLPlayFemaleOrgasmHype()
  else
    if Utility.RandomFloat(0.0, 1.0) < 0.8
      PlaySound(mainFemaleVoice.SensitivePleasure, mainFemaleActor, requiredChemistry=0, debugtext="SensitivePleasure")
    else
      PlaySound(mainFemaleVoice.Oh, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="Oh")
      Utility.Wait(Utility.RandomFloat(1.0, 2.0))
      PlaySound(mainFemaleVoice.AfterGape, mainFemaleActor, requiredChemistry=0, soundPriority=3, debugtext="AfterGape")
    endif
  endif
endfunction

function PlayStimulatingOthers()
  printdebug("Play Stimulating Others")
  if ShouldPlayMaleOrgasmHype() && Utility.RandomFloat(0.0, 1.0) < ChanceToCommentWhenMaleCloseToOrgasm ;if male close or orgasm
    ASLPlayMaleClosetoOrgasmComments()
  else
    ;after close to orgasm handling
    if Utility.RandomFloat(0.0, 1.0) < ChanceToCommentononAttackingStage / 3 && !FemaleIsVictim()
      PlaySound(mainFemaleVoice.Amused, mainFemaleActor, requiredChemistry=0, debugtext="Amused")
    else
      PlayBreathyorforeplaysound()
    endif
  endif
endfunction

Bool function PossiblyAskForCumInSpecificLocation()
  if IsGettingDoublePenetrated()
    if Utility.RandomFloat(0.0, 1.0) < 0.3
      PlaySound(mainFemaleVoice.AskForAnalCum, mainFemaleActor, requiredChemistry=3, debugtext="AskForAnalCum")
    else
      PlaySound(mainFemaleVoice.AskForVaginalCum, mainFemaleActor, requiredChemistry=4, debugtext="AskForVaginalCum")
    endif
  elseif IsGettingVaginallyPenetrated()
    PlaySound(mainFemaleVoice.AskForVaginalCum, mainFemaleActor, requiredChemistry=4, debugtext="AskForVaginalCum")
  elseif IsGettingAnallyPenetrated()
    PlaySound(mainFemaleVoice.AskForAnalCum, mainFemaleActor, requiredChemistry=3, debugtext="AskForAnalCum")
  elseif IsSuckingoffOther()
    PlaySound(mainFemaleVoice.AskForOralCum, mainFemaleActor, requiredChemistry=2, debugtext="AskForOralCum")
  endif
endfunction

Bool function PossiblyRemarkOnCumLocation()
  ;Go ahead with remark
  if locationOfLastMaleOrgasm == 1
    PlaySound(mainFemaleVoice.CameInMouth, mainFemaleActor, requiredChemistry=0, debugtext="CameInMouth")
    Utility.Wait(Utility.RandomFloat(0.75, 1.75))
    return True
  elseif locationOfLastMaleOrgasm == 2
    PlaySound(mainFemaleVoice.CameInPussy, mainFemaleActor, requiredChemistry=0, debugtext="CameInPussy")
    Utility.Wait(Utility.RandomFloat(0.75, 1.75))
    return True
  elseif locationOfLastMaleOrgasm == 3
    PlaySound(mainFemaleVoice.CameInAss, mainFemaleActor, requiredChemistry=0, debugtext="CameInAss")
    Utility.Wait(Utility.RandomFloat(0.75, 1.75))
    return True
  else
    return False ;Can't figure out where the hell we came so just uh pass on remarking
  endif
endfunction

Bool function PreviousStageHasPenetration()
  return PreviouslyIsGettingAnallyPenetrated() || PreviouslyIsGettingVaginallyPenetrated()
endfunction

Bool function PreviouslyIsCowgirl()
  return (PrevPenetrationLabel == "SCG" || PrevPenetrationLabel == "FCG" || PrevPenetrationLabel == "SAC" || PrevPenetrationLabel == "FAC") && !femaleisvictim()
endfunction

Bool function PreviouslyIsFemdom()
  return PrevPenetrationLabel == "SCG" || PrevPenetrationLabel == "FCG"
endfunction

Bool function PreviouslyIsGettingAnallyPenetrated()
  return PrevPenetrationLabel == "SAP" || PrevPenetrationLabel == "FAP" || PrevPenetrationLabel == "SAC" || PrevPenetrationLabel == "FAC" || PrevPenetrationLabel == "SDP" || PrevPenetrationLabel == "FDP"
endfunction

Bool function PreviouslyIsGettingVaginallyPenetrated()
  return PrevPenetrationLabel == "SVP" || PrevPenetrationLabel == "FVP" || PrevPenetrationLabel == "SCG" || PrevPenetrationLabel == "FCG" || PrevPenetrationLabel == "SDP" || PrevPenetrationLabel == "FDP"
endfunction

Bool function PreviouslyIsGivingAnalPenetration()
  return PrevPenisActionLabel == "FDA" || PrevPenisActionLabel == "FDV"
endfunction

Bool function PreviouslyIsGivingVaginalPenetration()
  return PrevPenisActionLabel == "FDV" || PrevPenisActionLabel == "SDV"
endfunction

Bool function PreviouslyIsSuckingoffOther()
  return PrevOralLabel == "SBJ" || PrevOralLabel == "FBJ"
endfunction

Bool function PreviouslyIsgettingPenetrated()
  return PreviouslyIsGettingAnallyPenetrated() || PreviouslyIsGettingVaginallyPenetrated()
endfunction

function PrintDebug(string Contents="")
  if EnablePrintDebug == 1
    ;bool function WriteToFile(string fileName, string text, bool append = true, bool timestamp = false) global native
    miscutil.printconsole("HentaiRim IVDT : " + Contents)
  endif
endfunction

;This only pulls the settings that are polled commonly throughout the sex. Settings used only once or restricted to rare cases are not cached here but instead fetched real-time
function PullMCMConfigOptions()
  dialogueSpacingMultiplier = MasterScript.ConfigOptions.GetModSettingFloat("fSpacingMultiplier:DialogueOptions")
  generalIntensityThreshold = MasterScript.ConfigOptions.GetModSettingInt("iIntensityThreshold:DialogueOptions")
  analIntensityThreshold = MasterScript.ConfigOptions.GetModSettingInt("iAnalIntensityThreshold:DialogueOptions")

  ;generalIntensityThreshold = JsonUtil.GetIntValue("/SLSO/Config.json", "sl_hot_voice_strength", 75) ;This is how SLSO defines the intensity threshold
  femaleCloseToOrgasmThreshold = MasterScript.ConfigOptions.GetModSettingInt("iFemaleCloseThreshold:DialogueOptions")
  analAnimationFilter = MasterScript.ConfigOptions.GetModSettingInt("iAnalAnimationFilter:DialogueOptions")
  Volume = 0.01 * MasterScript.ConfigOptions.GetModSettingInt("iMasterVolume:VoiceSystemManagement")
endfunction

function RecordFemaleOrgasm()
  femaleRecordedOrgasmCount += 1
  timeOfLastRecordedFemaleOrgasm = sexLabThreadController.TotalTime
endfunction

function RecordMaleOrgasm()
  ;Ordering of some these statements matter because some depend on the others...
  if IsgettingPenetrated()
    CameInsideCount = CameInsideCount + 1
  endif
  locationOfLastMaleOrgasm = CurrentPenetrationLvl()
  maleOrgasmCount += 1
  timeOfLastMaleOrgasm = sexLabThreadController.TotalTime
endfunction

function RegisterForTheEventsWeNeed()
  ;For clean up after sex is done (important)
  RegisterForModEvent("AnimationEnd", "IVDTSceneEnd")

  ;For dirty talk while cumming (and new cum sounds!)
  RegisterForModEvent("SexLabOrgasmSeparate", "IVDTOnOrgasm") ; Requires SexLab Separate Orgasm (SLSO)

  ;For reactions to changing sex positions or holes or starting penetrative sex
  RegisterForModEvent("StageStart", "IVDTOnStageStart")

  ;For dirty talk on non-event topics like getting close to cumming (most topics don't have an event and fall under here)
  RegisterForSingleUpdate(Utility.RandomFloat(0.5, 1.0))
endfunction

function RemoveTracker()
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
endfunction

function ResetActorScale()
  if enabletagscaling == 1 && (currentAnimation.hasTag("Bigguy") || currentAnimation.hasTag("Big Guy") || currentAnimation.hasTag("Shota"))
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

function ResetGhostActor()
  if enableghostactors == 1
    Spell Ghost = Game.GetFormFromFile(0xd2056, "Skyrim.esm") as Spell
    int counter = 0
    while counter <= 5
      if ActorsInPlay[counter] != mainFemaleActor
        ActorsInPlay[counter].Removespell(Ghost)
        ActorsInPlay[counter].setalpha(1.0, true)
      endif
      counter = counter + 1
    endwhile
  endif
endfunction

function RestoreArmor()
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
    mainFemaleActor.EquipItem(BaseArmor, abSilent=true)

    ;miscutil.PrintConsole (slotindex + " Trying to remove  : "+ LewdArmor.getname())
    mainFemaleActor.RemoveItem(LewdArmor, abSilent=true)
    slotindex += 1
  endwhile
endfunction

function SetActorScale()
  Race MaleActorRace = mainMaleActor.GetRace()
  String MaleRaceName = mainMaleActor.GetName()
  float scalevalue = 1.0

  ;scaling frostbite spider to 1
  if MaleRaceName == "Frostbite Spider"
    if ActorOne != none
      ActorOne.setscale(1.0)
    endif
    if ActorTwo != none
      ActorTwo.setscale(1.0)
    endif
  endif
  if enabletagscaling == 1 && (currentAnimation.hasTag("Bigguy") || currentAnimation.hasTag("Big Guy") || currentAnimation.hasTag("Shota"))
    ;define scale value
    if currentAnimation.hasTag("Bigguy") || currentAnimation.hasTag("Big Guy")
      scalevalue = 1.15
      printdebug("Scaling to 1.15 for Bigguy Animation")
    elseif currentAnimation.hasTag("Shota")
      scalevalue = 0.8
      printdebug("Scaling to 0.8 for Shota Animation")
    else
      scalevalue = 1.0
    endif

    ;start scaling
    if ActorOne != none && !currentAnimation.hasTag("smFF") && !currentAnimation.hasTag("smFFF") ; &&  ActorOne.getscale()  != scalevalue
      ActorOne.setscale(scalevalue)
    endif
    if ActorTwo != none && !currentAnimation.hasTag("MsmF") && !currentAnimation.hasTag("smFFF") ;&& ActorTwo.getscale() != scalevalue
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

function SetGhostActor()
  if enableghostactors == 1
    Spell Ghost = Game.GetFormFromFile(0xd2056, "Skyrim.esm") as Spell
    int counter = 0
    while counter <= 5
      if ActorsInPlay[counter] != mainFemaleActor
        ActorsInPlay[counter].Addspell(Ghost)
      endif
      counter = counter + 1
    endwhile
  endif
endfunction

Bool function ShouldMakeRomanticComment()
  if femaleisvictim()
    return false
  elseif SexLabThreadController.TotalTime - timeOfLastRomanticRemark < 60 ;Too soon. Romantic comments should be spaced out and rare
    return False
  elseif !IsgettingPenetrated() && Currentstage <= 2
    return Utility.RandomFloat(0.0, 1.0) < 0.1
  else
    return false
  endif
endfunction

Bool function ShouldMovebackAStage()
  ;female is not satisfied
  if !MainMaleCanControl() && IsEnding() && (PreviouslyIsCowgirl() || PreviouslyIsGivingVaginalPenetration() || PreviouslyIsGivingAnalPenetration()) && mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment && isfemdom() && !FemaleIsSatisfied()
    printdebug("Moving back a stage as it is Ending. is femdom. female Enjoyment > Orgasm HYpe Enjoyment. female didnt orgasm Enough (random between 2-4)")
    return true

    ;rapist is not satisfied a
  elseif IsEnding() && PreviouslyIsgettingPenetrated() && FemaleIsVictim() && Utility.Randomint(0, 100) <= AggressiveChancetoMoveBackAStage
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

Bool function ShouldPlayMaleOrgasmHype()
  return mainMaleEnjoyment >= MaleOrgasmHypeEnjoyment && teasedClosetoorgasm == false
endfunction

function StopLactate()
  if EnableLactate == 0
    return
  endif
  if Game.GetModbyName("IVDTHentaiLactate.esp") != 255 && mainFemaleActor.IsEquipped(MilkL) || mainFemaleActor.IsEquipped(MilkR)
    mainFemaleActor.unEquipItem(MilkR, abSilent=true)
    mainFemaleActor.unEquipItem(MilkL, abSilent=true)
    mainFemaleActor.removeItem(MilkR, abSilent=true)
    mainFemaleActor.removeItem(MilkL, abSilent=true)
  endif
endfunction

function UpdateLabels(sslBaseAnimation anim, int stage, int actorpos=0)
  PrevStimulationlabel = Stimulationlabel
  PrevPenisActionLabel = PenisActionLabel
  PrevOralLabel = OralLabel
  PrevEndingLabel = EndingLabel
  PrevPenetrationLabel = PenetrationLabel
  Stimulationlabel = HentairimTags.StimulationLabel(anim, stage, actorpos)
  PenisActionLabel = HentairimTags.PenisActionLabel(anim, stage, actorpos)
  OralLabel = HentairimTags.OralLabel(anim, stage, actorpos)
  EndingLabel = HentairimTags.EndingLabel(anim, stage, actorpos)
  PenetrationLabel = HentairimTags.PenetrationLabel(anim, stage, actorpos)
  Labelsconcat = "1" + Stimulationlabel + "1" + PenisActionLabel + "1" + OralLabel + "1" + PenetrationLabel + "1" + EndingLabel
  PrintDebug("Stimulationlabel :" + Stimulationlabel + ", PenisActionLabel :" + PenisActionLabel + ", OralLabel :" + OralLabel + ", PenetrationLabel :" + PenetrationLabel + ", EndingLabel :" + EndingLabel)
  PrintDebug("PrevStimulationlabel :" + PrevStimulationlabel + ", PrevPenisActionLabel :" + PrevPenisActionLabel + ", PrevOralLabel :" + PrevOralLabel + ", PrevPenetrationLabel :" + PrevPenetrationLabel + ", PrevEndingLabel :" + PrevEndingLabel)

  ;find NPC getting tit fucked
  int counter = 0
  string Result
  isTitfuckOthers = false
  isHandjobOthers = false
  IsFootjobOthers = false
  IsGivingOthersIntenseStimulation = false
  while counter < ActorsInPlay.length && PCPosition == 0
    if counter != Actorpos ;ignore PC position
      Result = HentairimTags.PenisActionLabel(anim, stage, counter)
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

Bool function femaleCloseToOrgasm()
  return mainFemaleEnjoyment >= FemaleOrgasmHypeEnjoyment && CommentedClosetoOrgasm == false
endfunction

form function get_form(int id, string filename)
  if Game.GetModbyName(filename) == 255
    return None
  endif
  return Game.GetFormFromFile(id, filename)
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

Bool function isDependencyReady(String modname) Global
  int index = Game.GetModByName(modname)
  if index == 255 || index == -1
    return false
  else
    return true
  endif
endfunction
