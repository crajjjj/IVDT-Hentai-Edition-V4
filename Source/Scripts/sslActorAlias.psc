Scriptname sslActorAlias extends ReferenceAlias

; Actor Info
Actor property ActorRef auto hidden

; Animation Position/Stage flags
bool property ForceOpenMouth auto hidden

int property kPrepareActor=0 autoreadonly hidden
int property kRefreshActor=3 autoreadonly hidden
int property kResetActor=2 autoreadonly hidden
int property kStartup=4 autoreadonly hidden
int property kSyncActor=1 autoreadonly hidden

float AccumulatedResistanceDamage = 0.0
int ActorFullEnjoyment
string ActorKey
sslActorLibrary ActorLib
string ActorName
String ActorRaceKey
float ActorScale
VoiceType ActorVoice
Actor[] ActorsInPlay
string AdjustKey
Faction Aggressive
string AggressorResistanceFile = "HentairimEnjoyment/AggressionAndResistance.json"
Faction AnalLoving
string[] AnimEvents
float AnimScale
Faction AnimatingFaction
sslBaseAnimation Animation
Bool AppliedStarterEnjoyment
float BaseDelay
int BaseEnjoyment
ActorBase BaseRef
int BaseSex
;int[] BedStatus
int BestRelation
int BlockFemaleOrgasmBeforeHentaiHype
String[] Blowjoboverride
int BonusEnjoyment
String[] BrokenOverride
float[] Center
int ChanceToAssignEpicHentaiTrait
int ChancetoAssignHentaiTrait
Faction ClothingFetishist

; Framework access
sslSystemConfig Config
Faction Cowgirl
Faction Cumbuckets
string CurrentAE
string CurrentSA

; Thread/alias shares
bool DebugMode
bool DisableChanceforAutotongue = false
Faction DualShot
int EnableAhegao
String EnableErinMFEE = "HentairimEnjoyment/ErinMFEEConfig.json"
int EnablePrintDebug
int EnableTongue
int EnabledMFEEAhegao = 0
int EnabledMFEETongue = 0
string EndAnimEvent
String EndingLabel
Faction Epic
Form[] Equipment
Bool EstrusForcedEnjoymentMods
float ExhibitionistMod

; Expression
sslBaseExpression Expression
float ExpressionDelay

;FUNCTIONS FOR HENTAI EXPRESSION NG
string ExpressionGroup = "a"
int ExpressionPhase
sslBaseExpression[] Expressions
String ExpressionsFile = ""
int FHUTongueType
armor FHUTongueTypeArmor
form[] BaseArmorArr
form[] LewdArmorArr
Int EnableArmorSwapping
String ConfigFile  = "IVDTHentai/Config.json"
String ArmorSwappingFile  = "IVDTHentai/ArmorSwapping.json"
String[] ArmorSlotsToSwitch

; Storage
int[] Flags
int FullEnjoyment
Faction FutaLoving
int Gender
float GenderMod
Spell HDTHeelSpell
Form HadBoots
Form HadStrapon
Bool HasMFEE = false
Bool HasMFEEVanillaRace = false
Faction HeavyArmorFetishist
float HentaiEnjoyment
String HentaiEnjoymentConfigFile = "HentairimEnjoyment/Config.json"

;-------------------others-------------------------
int HentaiExpressions
int HentaiNPCExpressions
Faction HentairimBroken
Faction HentairimResistance
Faction Impatient
Faction InHeat
bool IsAggressor
bool IsCreature
bool IsFemale
bool IsForcedSilent
bool IsMale
Bool IsOrgasming = false
bool IsPlayer
bool IsSkilled
bool IsTracked
bool[] IsType
bool IsVictim
string LabelGroup
string Labelsconcat
float LastOrgasm
Float LastOrgasmtime

;--------------------custom variabless---------------
sslBaseAnimation LastUpdatedAnimation = none
int LastUpdatedStage
bool LeadIn
Faction LightArmorFetishist
float[] Loc
float LoopDelay
float LoopExpressionDelay
bool MFEEAddAhegao = false
bool MFEEAddTongue = false
Faction MainNPCTrait = none

; Positioning
ObjectReference MarkerRef
String[] Masks
String MasksFile = "HentairimEnjoyment/Masks.json"
String[] Maskslots
Faction Masochist
float MasturbationMod

;Exposed Storageutils
;StorageUtil.GetintValue(None, "PCEnjoymentMod", 0.0)
;StorageUtil.GetintValue(None, "PCResistanceMod", 0)
int MaxResistance
Faction MissCumalot
float NPCEnjoymentChanges
string NPCTongueFile = "HentairimEnjoyment/NPCTongue.json"
Faction NPCTrait = none
float NioScale
bool NoOrgasm
bool NoRagdoll
bool NoRedress
bool NoUndress
Faction Normal
int NpcTraitRandomAssignment
int NthTranslation
Faction NutGobbler
float[] Offsets
String OralLabel
Faction OralLoving
Sound OrgasmFX
float OrgasmingSeconds = 5.0
int Orgasms
float[] OwnSkills
float PCEnjoymentChanges
int PathingFlag
String PenetrationLabel
String PenisActionLabel
int Phase = 1

;SLGP
String[] PhaseExpressionsArr
string PhaseLookup
Actor PlayerRef
string PlayingAE
string PlayingSA
int Position
bool Prepared ; TODO: Find better Solution
int PrevStage
Faction PussyLoving
int QuitEnjoyment
string RaceBaseResistance = "HentairimEnjoyment/RaceBaseResistance.json"
string RaceCumResistanceDamage = "HentairimEnjoyment/RaceCumResistanceDamage.json"
string RaceEditorID
String RaceFile = "HentairimEnjoyment/RaceEnjoymentModifier.json"
String RaceFuckingPCFile = "HentairimEnjoyment/RaceFuckingPCEnjoymentModifier.json"
string RaceOrgasmResistanceDamage = "HentairimEnjoyment/RaceOrgasmResistanceDamage.json"
Faction RapeLoving
float[] RealTime
float RefreshExpressionDelay
int Resistance
string Role = "c"

;SLGP
bool SLGP_Angle_reposition
float SLGP_Time1
float SLGP_Time2
float SLGP_Time3

;SLGP
bool SLGP_locked_executed
Bool SLSOGetEnjoymentCheck1
Bool SLSOGetEnjoymentCheck2
Faction Sadistic

;-------------------FACTIONS-----------------
Faction SchlongFaction
bool SeparateOrgasms
Faction SexuallyFrustrated
Faction ShortFused
Faction SirCumalot
float[] SkillBonus
Faction Skilled
float[] Skills
int Stage
int StageCount
string StartAnimEvent
float StartWait
float StartedAt
bool StartedUp ; TODO: Find better Solution
float StarterEnjoyment
sslActorStats Stats
String Stimulationlabel
Form Strapon
bool[] StripOverride
Faction Strong

;TNG
Keyword TNG_Gentlewoman
Keyword TNG_L
Keyword TNG_XL
Faction TheBreaker
Faction TheGifter
Faction TheMilker
Faction TheNouveauRiche
Faction ThePenetrator
Faction ThiccLoving

; Current Thread state
sslThreadController Thread
float TimertoUpdate = 0.0
Faction Timid
String[] TongueOutOverride
Faction Uncummanable
bool UseLipSync
bool UseScale

; Voice
sslBaseVoice Voice
float VoiceDelay
Faction Weak
int ahegaolookupmodifier
int ahegaophonemebigaah
string[] blocknpcorgasmtags
string[] blockpcorgasmtags
Bool bslaExhibitionist
int chancetostickouttongueduringattacking
int chancetostickouttongueduringintense
String[] cunoverride
int cunusetongue
int enableaggressionresistance
int enablecreaturenpcresistancedamage
int enablefemalenpcresistancedamage
int enablemalenpcresistancedamage
int enablenpctongue = 0
int enablepcresistancedamage
int hugeppresistancedamagemultiplier
bool isRealFemale
bool ishugePPmale = false
String[] kisoverride
int lookdirection = 9
float npcafterorgasmmultiplier
int npcbrokenpointsfromresistancebreak
float npcbst
float npccun
float npceni
float npcenjoymentarousalmodifierweight
float npceno
float npcfac
float npcfap
float npcfbj
float npcfcg
float npcfda
float npcfdp
float npcfdv
float npcffj
float npcfhj
float npcfmf
float npcfst
float npcftf
float npcfvp
float npcintenseexpressionupdateinseconds
float npcintensesecondspertick
float npcisbrokenmultiplier
float npcisvictimmultiplier
float npckis

;---------------------------NPC float configs------------------------------
float npcldi
float npcldisecondspertick
int npcmaintainresistancepercentagewhencontrolling
float npcnonintenseexpressionupdateinseconds
float npcnonintensesecondspertick
int npcnonvictimresistancedamagemultiplier
int npcorgasmresistancedamage
int npcrecoverresistancepercentageperhour
float npcsac
float npcsap
float npcsbj
float npcscg
float npcsda
float npcsdp
float npcsdv
float npcsfj
float npcshj
float npcsmf
float npcsst
float npcstartingenjoyment
float npcstf
float npcsvp
int npcvictimresistancedamagemultiplier = 100
float npcwithhugeppmultiplier
float pcafterorgasmmultiplier
int pcbrokenpointsfromresistancebreak
float pcbst
float pccun
float pceni
float pcenjoymentarousalmodifierweight
float pceno
float pcfac
float pcfap
float pcfbj
float pcfcg
float pcfda
float pcfdp
float pcfdv
float pcffj
float pcfhj
float pcfmf
float pcfst
float pcftf
float pcfvp
float pcintenseexpressionupdateinseconds
float pcintensesecondspertick
float pcisbrokenmultiplier
float pcisvictimmultiplier
float pckis

;--------------------------HENTAI ENJOYMENT------------------------------
;------------------------------PC float configs----------------------------
float pcldi
float pcldisecondspertick
int pcleadinenjoymentcap
int pcmaintainresistancepercentagewhencontrolling
int pcmaxresistance
float pcnonintenseexpressionupdateinseconds
float pcnonintensesecondspertick
int pcnonvictimresistancedamagemultiplier
int pcorgasmresistancedamage
float pcreceivehugeppmultiplier
int pcrecoverresistancepercentageperhour
float pcsac
float pcsap
float pcsbj
float pcscg
float pcsda
float pcsdp
float pcsdv
float pcsfj
float pcshj
float pcsmf
float pcsst
float pcstartingenjoyment
float pcstf
float pcsvp
int pcvictimresistancedamagemultiplier = 100
String racename
int removetongueonblowjob
int sceneID
float sl_enjoymentrate
int slaActorArousal
float slaActorArousalMod

; function AdjustCoords(float[] Output, float[] CenterCoords, ) global native
; function AdjustOffset(int i, float amount, bool backwards, bool adjustStage)
; 	Animation.
; endFunction
; function OffsetBed(float[] Output, float[] BedOffsets, float CenterRot) global native
; bool function _SetActor(Actor ProspectRef) native
; function _ApplyExpression(Actor ProspectRef, int[] Presets) global native
; function GetVars()
; 	IntShare = Thread.IntShare
; 	FloatShare = Thread.FloatS1hare
; 	StringShare = Thread.StringShare
; 	BoolShare
; endFunction
; int[] property IntShare auto hidden ; Stage, ActorCount, BedStatus[1]
; float[] property FloatShare auto hidden ; RealTime, StartedAt
; string[] property StringShare auto hidden ; AdjustKey
; bool[] property BoolShare auto hidden ;
; sslBaseAnimation[] property _Animation auto hidden ; Animation
; SLSO shit
Faction slaArousal
Faction slaExhibitionist

;Int AllowNonAggressorOrgasm
Int slaExhibitionistNPCCount
float speed = 0.50
string stagelabel
int tonguephonemebigaah
int tonguephonemeoh
int variance
int victimresistancedamagemultiplier
Keyword zadDeviousBelt

;SLU+ block
bool AmmoChecked
int ExpressionType
string[] ForbiddenTags
ObjectReference FurnitureRef
int[] FurnitureStatus

bool IsFuta
bool IsLipFixed

bool IsStripping
bool NiOHeelLock

int OldStrength
float OpenMouthScale

string[] RequiredTags
bool Restricted
bool UseFaceItems


; Devious Devices & ZBF Keywords
Keyword zad_DeviousArmbinder
Keyword zad_DeviousArmbinderElbow
Keyword zad_DeviousBelt
Keyword zad_DeviousBra
Keyword zad_DeviousGag
Keyword zad_DeviousGagPanel
Keyword zad_DeviousHeavyBondage
Keyword zad_DeviousPetSuit
Keyword zad_DeviousPlugAnal
Keyword zad_DeviousPlugVaginal
Keyword zad_DeviousStraitJacket
Keyword zad_DeviousSuit
Keyword zad_DeviousYoke
Keyword zad_DeviousYokeBB

; SLU+ Keywords
Keyword zad_Lockable
Keyword zad_PermitAnal
Keyword zad_PermitOral
Keyword zad_PermitVaginal
Keyword zbfAnimHandsArmbinder
Keyword zbfAnimHandsElbows
Keyword zbfAnimHandsWrists
Keyword zbfAnimHandsYoke
Keyword zbfWornBelt
Keyword zbfWornBra
Keyword zbfWornDevice
Keyword zbfWornGag
Keyword zbfWornHood
Keyword zbfWornPermitOral
Keyword zbfWornPreventAnal
Keyword zbfWornPreventBreast
Keyword zbfWornPreventOral
Keyword zbfWornPreventVaginal


bool property DoPathToCenter
  bool function get()
    return (PathingFlag == 0 && Config.DisableTeleport) || PathingFlag == 1
  endfunction
endproperty

bool property DoRagdoll hidden
  bool function get()
    if NoRagdoll
      return false
    endif
    return !NoRagdoll && Config.RagdollEnd
  endfunction

  function set(bool value)
    NoRagdoll = !value
  endfunction
endproperty

bool property DoRedress hidden
  bool function get()
    if NoRedress || (IsVictim && !Config.RedressVictim)
      return false
    endif
    return !IsVictim || (IsVictim && Config.RedressVictim)
  endfunction

  function set(bool value)
    NoRedress = !value
  endfunction
endproperty

bool property DoUndress hidden
  bool function get()
    if NoUndress
      return false
    endif
    return Config.UndressAnimation
  endfunction

  function set(bool value)
    NoUndress = !value
  endfunction
endproperty

bool property IsSilent hidden
  bool function get()
    return !Voice || IsForcedSilent || Flags[0] == 1 || Flags[1] == 1
  endfunction
endproperty

bool property MalePosition hidden
  bool function get()
    return Flags[4] == 0
  endfunction
endproperty

bool property OpenMouth hidden
  bool function get()
    return Flags[1] == 1 || ForceOpenMouth == true ; This is for compatibility reasons because mods like DDi realy need it.
  endfunction
endproperty

int property Schlong hidden
  int function get()
    return Flags[3]
  endfunction
endproperty

bool property UseStrapon hidden
  bool function get()
    return Flags[2] == 1 && Flags[4] == 0
  endfunction
endproperty

;/ function RefreshActor()
endFunction /;
event OnOrgasm()
  OrgasmEffect()
endevent

event OnTranslationComplete()
endevent

event OrgasmStage()
  OrgasmEffect()
endevent

event OnActorRefreshExpression(form akTarget)
endevent

event OnActorStrip(form akTarget)
  if akTarget && akTarget == ActorRef as form
    Log("OnActorStrip(" + akTarget + ")")
    Strip()
  endif
endevent

Function BodySwitchtoLewdArmor()
; this is meant for slot 32 body armor switching only at the beginning of the stage.
PrintDebug("EnableArmorSwapping:" + EnableArmorSwapping)
if EnableArmorSwapping != 1 || gender == 0 || Gender >= 2
        return
endif

int slotlength = ArmorSlotsToSwitch.length
int slotindex = 0
Armor BaseArmor
Armor LewdArmor
	;miscutil.PrintConsole ("wearing lewd armor...")
	while slotindex < slotlength
		BaseArmor = ActorRef.GetWornForm(Armor.GetMaskForSlot(ArmorSlotsToSwitch[slotindex] as int)) as armor
		;miscutil.PrintConsole ("BaseArmor : " + BaseArmor.getname())
		if BaseArmor
			LewdArmor = jsonutil.GetFormValue(ArmorSwappingFile, BaseArmor.getname(), none)	as armor
		endif
	;	miscutil.PrintConsole ("LewdArmor : " + LewdArmor.getname())
		if LewdArmor != none && BaseArmor!=none
	;	miscutil.PrintConsole (slotindex + " Trying to add  : "+ LewdArmor.getname())
			ActorRef.addItem(LewdArmor , abSilent=true)
		  printdebug(ActorRef.GetLeveledActorBase().getName() + ":Added LewdArmor: " + LewdArmor.GetName())	
		;miscutil.PrintConsole (slotindex + " Trying to unequip  : "+ BaseArmor.getname())
			ActorRef.unEquipItem(BaseArmor , abSilent=true)
		  printdebug(ActorRef.GetLeveledActorBase().getName() + ":Unequipped BaseArmor: " + BaseArmor.GetName())	
	;	miscutil.PrintConsole (slotindex + " Trying to equip  : "+ LewdArmor.getname())
			ActorRef.EquipItemEx(LewdArmor , equipsound=false)
		  printdebug(ActorRef.GetLeveledActorBase().getName() + ":Equipped LewdArmor: " + LewdArmor.GetName())
			BaseArmorArr = papyrusutil.pushform(BaseArmorArr , BaseArmor)
			LewdArmorArr = papyrusutil.pushform(LewdArmorArr , LewdArmor)
		endif
	
	slotindex += 1
	endwhile
	if BaseArmorArr && BaseArmorArr.Length > 0
		printdebug("SwitchtoLewdArmoreArmor-swapped: " + BaseArmorArr.Length + ".Character:" +ActorRef.GetLeveledActorBase().GetName())
	else
		printdebug("SwitchtoLewdArmoreArmor-swapped 0" + ".Character:" +ActorRef.GetLeveledActorBase().GetName())
	endif
	
endfunction

Function RestoreArmor()
  if EnableArmorSwapping != 1 || gender == 0 || Gender >= 2
        return
  endif
  Armor BaseArmor
  Armor LewdArmor
	int slotLength = BaseArmorArr.Length
	
	if BaseArmorArr
		printdebug("RestoreArmor-BaseArmorArr: " + BaseArmorArr.Length + ".Character" + ActorRef.GetLeveledActorBase().GetName())
	endif
	if LewdArmorArr
		printdebug("RestoreArmor-LewdArmorArr: " + LewdArmorArr.Length + ".Character" + ActorRef.GetLeveledActorBase().GetName())
	endif

	int slotIndex = 0

	while slotIndex < slotLength
		baseArmor = BaseArmorArr[slotIndex] as Armor
		lewdArmor = LewdArmorArr[slotIndex] as Armor
		
		if baseArmor
			ActorRef.EquipItemEx(baseArmor, equipsound=false)
      printdebug(ActorRef.GetLeveledActorBase().getName() + ":Equipped BaseArmor: " + baseArmor.GetName())	
		
		endif

		if lewdArmor
			ActorRef.RemoveItem(lewdArmor, abSilent=true)
      printdebug(ActorRef.GetLeveledActorBase().getName() + ":Removed LewdArmor: " + lewdArmor.GetName())
			
		endif
		slotIndex += 1
	endwhile
  ;clean up
  BaseArmorArr = new Form[1]
	LewdArmorArr = new Form[1]
EndFunction

; Event received when an item is removed from this object's inventory. If the item is a persistant reference, akItemReference
; will point at it - otherwise the parameter will be None
event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
  if !IsStripping && Config.RemoveHeelEffect && akBaseItem && akBaseItem.GetType() == 26
    Armor akBaseArmor = akBaseItem as Armor
    if akBaseArmor && Math.LogicalAnd(akBaseArmor.GetSlotMask(), 0x00000080) == 0x00000080
      UpdateNiOHeelEffect()
    endif
  endif
endevent

; Event received when this actor equips something - akReference may be None if object is not persistent
event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
  if akBaseObject && akBaseObject.GetType() == 26
    Armor akBaseArmor = akBaseObject as Armor
    if akBaseArmor
      if Config.RemoveHeelEffect && Math.LogicalAnd(akBaseArmor.GetSlotMask(), 0x00000080) == 0x00000080
        HDTHeelSpell = Config.GetHDTSpell(ActorRef)
        if HDTHeelSpell
          Log(HDTHeelSpell, "RemoveHeelEffect (HDTHeelSpell)")
          ActorRef.RemoveSpell(HDTHeelSpell)
        endif
        UpdateNiOHeelEffect(True)
      elseif Strapon
        if (Strapon == akBaseObject || Math.LogicalAnd(akBaseArmor.GetSlotMask(), (Strapon as armor).GetSlotMask()) != 0)
          Debug.SendAnimationEvent(ActorRef, "SOSFastErect")
          if GetState() == "Animating"
            Utility.Wait(0.2)
            Debug.SendAnimationEvent(ActorRef, "SOSBend" + Schlong)
          endif
        endif
      else
        Form SomeStrapon = Config.GetStrapon()
        if SomeStrapon && (SomeStrapon == akBaseObject || Math.LogicalAnd(akBaseArmor.GetSlotMask(), (SomeStrapon as armor).GetSlotMask()) != 0)
          Debug.SendAnimationEvent(ActorRef, "SOSFastErect")
          if GetState() == "Animating"
            Utility.Wait(0.2)
            Debug.SendAnimationEvent(ActorRef, "SOSBend" + Schlong)
          endif
        endif
      endif
    endif
  endif
endevent

; Event received when this actor unequips something - akReference may be None if object is not persistent
event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
  if !IsStripping && Config.RemoveHeelEffect && akBaseObject && akBaseObject.GetType() == 26
    Armor akBaseArmor = akBaseObject as Armor
    if akBaseArmor && Math.LogicalAnd(akBaseArmor.GetSlotMask(), 0x00000080) == 0x00000080
      UpdateNiOHeelEffect()
    endif
  endif
endevent

event TravelToCenter()
  ;/	Outfit StandardOutfit = BaseRef.GetOutfit(false)
	Outfit SleepOutfit = BaseRef.GetOutfit(true)
	Log("StandardOutfit:"+StandardOutfit+" SleepOutfit:"+SleepOutfit)
	
	Outfit EmptyOutfit = Game.GetFormFromFile(0x0830, "SexLab UtilityPlus.esp") as Outfit
	
	if StandardOutfit && StandardOutfit.GetNumParts() > 0
		StorageUtil.SetFormValue(ActorRef, "Sexlab.StandardOutfit", StandardOutfit as form)
		ActorRef.SetOutfit(EmptyOutfit, false)
	endIf
	if SleepOutfit && SleepOutfit.GetNumParts() > 0
		StorageUtil.SetFormValue(ActorRef, "Sexlab.SleepOutfit", SleepOutfit as form)
		ActorRef.SetOutfit(EmptyOutfit, true) 
	endIf
	Log("StandardOutfit:"+BaseRef.GetOutfit(false)+" SleepOutfit:"+BaseRef.GetOutfit(true))
/;
  ; Remove any unwanted combat effects
  ClearEffects()
  if IsPlayer
    sslThreadController Control = Config.GetThreadControlled()
    if Control && Control != none
      Config.DisableThreadControl(Control)
    endif
    Game.SetPlayerAIDriven()
  endif
  ActorRef.SetFactionRank(AnimatingFaction, 1)
  ActorRef.EvaluatePackage()

  ; Starting Information
  LoadShares()
  if DoPathToCenter
    PathToCenter()
  endif

  ; Remove HDT High Heels
  if Config.RemoveHeelEffect && ActorRef.GetWornForm(0x00000080)
    HDTHeelSpell = Config.GetHDTSpell(ActorRef)
    if HDTHeelSpell
      Log(HDTHeelSpell, "RemoveHeelEffect (HDTHeelSpell)")
      ActorRef.RemoveSpell(HDTHeelSpell)
    endif
  endif

  ; Start Wait Idle
  StartWaitIdle()
endevent

event ResetActor()
endevent

bool function ASLalloworgasm()
  int x = 0
  bool AllowOrgasm = true
  if isplayer
    while x < blockpcorgasmtags.length
      if GetPrimaryLabel() == blockpcorgasmtags[x] && PenetrationLabel == "LDI" && StimulationLabel == "LDI" && PenisActionLabel == "LDI"
        AllowOrgasm = false
      endif
      x += 1
    endwhile
  else
    while x < blockpcorgasmtags.length
      if GetPrimaryLabel() == blocknpcorgasmtags[x] && PenetrationLabel == "LDI" && StimulationLabel == "LDI" && PenisActionLabel == "LDI"
        AllowOrgasm = false
      endif
      x += 1
    endwhile
  endif
  if AllowOrgasm == false
    PrintDebug("Orgasming block due to : Tags")
    return false
  elseif StorageUtil.GetIntValue(None, "HentaiBlockPCOrgasm") > 0 && isplayer ;Expose variable for external
    PrintDebug("Orgasming block due to : StorageUtil HentaiBlockPCOrgasm > 0")
    return false
  elseif StorageUtil.GetIntValue(None, "HentaiBlockNPCOrgasm") > 0 && !isplayer ;Expose variable for external
    PrintDebug("Orgasming block due to HentaiBlockNPCOrgasm > 0")
    return false
  elseif StorageUtil.getIntValue(None, "ASLDoNotAllowFemaleOrgasmYet") == 1 && isfemale && isplayer && BlockFemaleOrgasmBeforeHentaiHype == 1 ;Compatibility with IVDT Hentai
    PrintDebug("Orgasming block due to Hentai IVDT Orgasm Hype Hasnt Played Yet")
    return false
  else
    return true
  endif
endfunction

float function AddArousalModifier(float Enjoyment)
  float arousal
  if isplayer
    arousal = PCEnjoymentArousalModifierWeight
  else
    arousal = NPCEnjoymentArousalModifierWeight
  endif
  Float arousalmodifier = 1 + ((slaActorArousal as float / 100) * arousal)
  return Enjoyment * arousalmodifier
endfunction

function AddLactatingSpelltoPC()
  Spell Lactating = Game.GetFormFromFile(0x851, "Hentairim Enjoyment Expressions Traits.esp") as Spell
  if !playerref.hasspell(Lactating)
    Debug.notification("You Body Has been affected by The Milker's Cum to Lactate!")
    playerref.AddSpell(Lactating, abVerbose=False)
  endif
endfunction

float function AddRaceEnjoymentModifier(float Enjoyment)
  float RaceModifier = jsonUtil.GetFloatValue(RaceFile, racename, 1.0)
  return Enjoyment * RaceModifier
endfunction

float function AddRaceFuckingPCEnjoymentModifier(float Enjoyment)
  float RaceFuckingPCModifier = jsonUtil.GetFloatValue(RaceFuckingPCFile, NPCRace(), 1.0)
  return Enjoyment * RaceFuckingPCModifier
endfunction

function AddResistanceDamage(float value)
  float Damage = GetPercentageofMaxResistance(value) * GetResistanceDamageMultiplier()
  if MainNPCTrait() == "+The Penetrator"
    damage = damage * 2
  endif
  printdebug("add resistance damege :" + value)
  printdebug("damage percentage of max resistance :" + Damage)
  if isplayer
    if enablepcresistancedamage != 1
      return
    endif
  elseif !isplayer
    if (enablemalenpcresistancedamage != 1 && gender == 0) || (enablefemalenpcresistancedamage != 1 && gender == 1) || (enablecreaturenpcresistancedamage != 1 && gender > 1)
      return
    endif
  endif
  if !IsGettingFucked() && GetResistance() <= getminresistance()
    Damage = 0
    return
  endif
  AccumulatedResistanceDamage += Damage
  printdebug("AccumulatedResistanceDamage :" + AccumulatedResistanceDamage)
  if AccumulatedResistanceDamage >= 0.01
    printdebug("do damage :" + AccumulatedResistanceDamage)
    SetResistance(GetResistance() - math.floor((AccumulatedResistanceDamage * 100)))
    AccumulatedResistanceDamage = 0
    if GetResistance() < 0
      SetResistance(0)
    endif
  endif
  if GetResistance() <= 0 && !isbroken()
    if isplayer
      SetBrokenPoints(pcbrokenpointsfromresistancebreak)
    else
      SetBrokenPoints(npcbrokenpointsfromresistancebreak)
    endif
  endif
endfunction

function EquipTongue()
  if MFEEAddAhegao || WearingMask(actorref) != none || IsSuckingoffOther() || EnableTongue != 1 || HasDeviousGag(actorref) || IsUnconcious() || EquippedTongue()
    return
  endif

  if HasMFEE && EnabledMFEETongue == 1 ;erin tongue expression
    MFEEAddTongue = true
  else
    if Game.GetModbyName("sr_fillherup.esp") != 255
      armor temptongue
      If (FHUTongueTypeArmor)
         actorref.EquipItemEx(FHUTongueTypeArmor, equipsound=false)
        else
          FHUTongueTypeArmor = GetTongueType()
          if FHUTongueTypeArmor
             actorref.EquipItemEx(FHUTongueTypeArmor, equipsound=true)
          endif
      EndIf
    endif
  endif
endfunction

function AdjustEnjoyment(int AdjustBy)
  BaseEnjoyment += AdjustBy
endfunction

function ApplyCum()
  if ActorRef && ActorRef.Is3DLoaded()
    Cell ParentCell = ActorRef.GetParentCell()
    int CumID = Animation.GetCumID(Position, Stage)
    if CumID > 0 && ParentCell && ParentCell.IsAttached() ; Error treatment for Spells out of Cell
      ActorLib.ApplyCum(ActorRef, CumID)
    endif
  endif
endfunction

function AssignNPCHentaiTrait()
  if Actorref == playerref || NpcTraitRandomAssignment != 1
    return
  endif

  ;all
  Aggressive = Game.GetFormFromFile(0x82F, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Masochist = Game.GetFormFromFile(0x82C, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Normal = Game.GetFormFromFile(0x840, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Sadistic = Game.GetFormFromFile(0x82D, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  ShortFused = Game.GetFormFromFile(0x835, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Skilled = Game.GetFormFromFile(0x836, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Strong = Game.GetFormFromFile(0x838, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  ThiccLoving = Game.GetFormFromFile(0x839, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Timid = Game.GetFormFromFile(0x82E, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Weak = Game.GetFormFromFile(0x837, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  Impatient = Game.GetFormFromFile(0x842, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  RapeLoving = Game.GetFormFromFile(0x843, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  ClothingFetishist = Game.GetFormFromFile(0x844, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  LightArmorFetishist = Game.GetFormFromFile(0x845, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  HeavyArmorFetishist = Game.GetFormFromFile(0x846, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  PussyLoving = Game.GetFormFromFile(0x84A, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  AnalLoving = Game.GetFormFromFile(0x84B, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  TheMilker = Game.GetFormFromFile(0x84D, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  FutaLoving = Game.GetFormFromFile(0x834, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  DualShot = Game.GetFormFromFile(0x841, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  Uncummanable = Game.GetFormFromFile(0x832, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  Cumbuckets = Game.GetFormFromFile(0x831, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  ThePenetrator = Game.GetFormFromFile(0x849, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  OralLoving = Game.GetFormFromFile(0x84C, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  TheBreaker = Game.GetFormFromFile(0x84E, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  TheGifter = Game.GetFormFromFile(0x84F, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  TheNouveauRiche = Game.GetFormFromFile(0x850, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait

  ;Female only
  SexuallyFrustrated = Game.GetFormFromFile(0x83D, "Hentairim Enjoyment Expressions Traits.esp") As Faction
  NutGobbler = Game.GetFormFromFile(0x847, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  Cowgirl = Game.GetFormFromFile(0x83F, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
  MissCumalot = Game.GetFormFromFile(0x83C, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait

  ;Creature only
  InHeat = Game.GetFormFromFile(0x83E, "Hentairim Enjoyment Expressions Traits.esp") As Faction

  ;male human only
  SirCumalot = Game.GetFormFromFile(0x830, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait

  ;find existing hentai trait
  if actorref.IsInFaction(Normal)
    NPCTrait = Normal
  elseif actorref.IsInFaction(Aggressive)
    NPCTrait = Aggressive
  elseif actorref.IsInFaction(Cumbuckets)
    NPCTrait = Cumbuckets
  elseif actorref.IsInFaction(InHeat)
    NPCTrait = InHeat
  elseif actorref.IsInFaction(Masochist)
    NPCTrait = Masochist
  elseif actorref.IsInFaction(MissCumalot)
    NPCTrait = MissCumalot
  elseif actorref.IsInFaction(FutaLoving)
    NPCTrait = FutaLoving
  elseif actorref.IsInFaction(Sadistic)
    NPCTrait = Sadistic
  elseif actorref.IsInFaction(SexuallyFrustrated)
    NPCTrait = SexuallyFrustrated
  elseif actorref.IsInFaction(ShortFused)
    NPCTrait = ShortFused
  elseif actorref.IsInFaction(SirCumalot)
    NPCTrait = SirCumalot
  elseif actorref.IsInFaction(Skilled)
    NPCTrait = Skilled
  elseif actorref.IsInFaction(Strong)
    NPCTrait = Strong
  elseif actorref.IsInFaction(ThiccLoving)
    NPCTrait = ThiccLoving
  elseif actorref.IsInFaction(Timid)
    NPCTrait = Timid
  elseif actorref.IsInFaction(Uncummanable)
    NPCTrait = Uncummanable
  elseif actorref.IsInFaction(Weak)
    NPCTrait = Weak
  elseif actorref.IsInFaction(Impatient)
    NPCTrait = Impatient
  elseif actorref.IsInFaction(RapeLoving)
    NPCTrait = RapeLoving
  elseif actorref.IsInFaction(ClothingFetishist)
    NPCTrait = ClothingFetishist
  elseif actorref.IsInFaction(LightArmorFetishist)
    NPCTrait = LightArmorFetishist
  elseif actorref.IsInFaction(HeavyArmorFetishist)
    NPCTrait = HeavyArmorFetishist
  elseif actorref.IsInFaction(PussyLoving)
    NPCTrait = PussyLoving
  elseif actorref.IsInFaction(AnalLoving)
    NPCTrait = AnalLoving
  elseif actorref.IsInFaction(TheMilker)
    NPCTrait = TheMilker
  elseif actorref.IsInFaction(DualShot)
    NPCTrait = DualShot
  elseif actorref.IsInFaction(ThePenetrator)
    NPCTrait = ThePenetrator
  elseif actorref.IsInFaction(OralLoving)
    NPCTrait = OralLoving
  elseif actorref.IsInFaction(TheBreaker)
    NPCTrait = TheBreaker
  elseif actorref.IsInFaction(TheGifter)
    NPCTrait = TheGifter
  elseif actorref.IsInFaction(TheNouveauRiche)
    NPCTrait = TheNouveauRiche
  elseif actorref.IsInFaction(NutGobbler)
    NPCTrait = NutGobbler
  elseif actorref.IsInFaction(Cowgirl)
    NPCTrait = Cowgirl
  else
    ;if no hentai trait can be found, assign one
    if utility.randomint(1, 100) <= ChancetoAssignHentaiTrait
      int rand = 0

      ;0 = male , 1 = female , 2 = male creature , 3 = female creature
      if actorref.isplayerteammate()
        ActorRef.AddToFaction(Normal)
        NPCTrait = Normal
      elseif Gender == 0 ;male
        if utility.randomint(1, 100) <= ChanceToAssignEpicHentaiTrait ;roll for a chance for hentai epic trait
          Faction[] HentaiEpicTraitList = new faction[8]

          ;Epic Trait list
          HentaiEpicTraitList[0] = Uncummanable
          HentaiEpicTraitList[1] = TheGifter
          HentaiEpicTraitList[2] = TheNouveauRiche
          HentaiEpicTraitList[3] = SirCumalot
          HentaiEpicTraitList[4] = TheMilker
          HentaiEpicTraitList[5] = ThePenetrator
          HentaiEpicTraitList[6] = DualShot
          HentaiEpicTraitList[7] = TheBreaker
          rand = utility.randomint(0, 7)
          ActorRef.AddToFaction(HentaiEpicTraitList[rand])
          NPCTrait = HentaiEpicTraitList[rand]
        else
          Faction[] HentaiNormalTraitList = new faction[19]

          ;Trait List for Male
          HentaiNormalTraitList[0] = Aggressive
          HentaiNormalTraitList[1] = Masochist
          HentaiNormalTraitList[2] = OralLoving
          HentaiNormalTraitList[3] = Sadistic
          HentaiNormalTraitList[4] = ShortFused
          HentaiNormalTraitList[5] = Skilled
          HentaiNormalTraitList[6] = Strong
          HentaiNormalTraitList[7] = ThiccLoving
          HentaiNormalTraitList[8] = Timid
          HentaiNormalTraitList[9] = Weak
          HentaiNormalTraitList[10] = Impatient
          HentaiNormalTraitList[11] = RapeLoving
          HentaiNormalTraitList[12] = ClothingFetishist
          HentaiNormalTraitList[13] = LightArmorFetishist
          HentaiNormalTraitList[14] = HeavyArmorFetishist
          HentaiNormalTraitList[15] = PussyLoving
          HentaiNormalTraitList[16] = AnalLoving
          HentaiNormalTraitList[17] = FutaLoving
          HentaiNormalTraitList[18] = Cumbuckets
          rand = utility.randomint(0, 18)
          ActorRef.AddToFaction(HentaiNormalTraitList[rand])
          NPCTrait = HentaiNormalTraitList[rand]
        endif
      elseif Gender == 1 ;female
        if utility.randomint(1, 100) <= ChanceToAssignEpicHentaiTrait ;roll for a chance for hentai epic trait
          Faction[] HentaiEpicTraitList = new faction[9]

          ;Epic Trait list
          HentaiEpicTraitList[0] = Uncummanable
          HentaiEpicTraitList[1] = TheGifter
          HentaiEpicTraitList[2] = TheNouveauRiche
          HentaiEpicTraitList[3] = MissCumalot
          HentaiEpicTraitList[4] = TheMilker
          HentaiEpicTraitList[5] = ThePenetrator
          HentaiEpicTraitList[6] = DualShot
          HentaiEpicTraitList[7] = TheBreaker
          HentaiEpicTraitList[8] = NutGobbler
          rand = utility.randomint(0, 8)
          ActorRef.AddToFaction(HentaiEpicTraitList[rand])
          NPCTrait = HentaiEpicTraitList[rand]
        else
          Faction[] HentaiNormalTraitList = new faction[21]

          ;Trait List for Male
          HentaiNormalTraitList[0] = Aggressive
          HentaiNormalTraitList[1] = Masochist
          HentaiNormalTraitList[2] = OralLoving
          HentaiNormalTraitList[3] = Sadistic
          HentaiNormalTraitList[4] = ShortFused
          HentaiNormalTraitList[5] = Skilled
          HentaiNormalTraitList[6] = Strong
          HentaiNormalTraitList[7] = ThiccLoving
          HentaiNormalTraitList[8] = Timid
          HentaiNormalTraitList[9] = Weak
          HentaiNormalTraitList[10] = Impatient
          HentaiNormalTraitList[11] = RapeLoving
          HentaiNormalTraitList[12] = ClothingFetishist
          HentaiNormalTraitList[13] = LightArmorFetishist
          HentaiNormalTraitList[14] = HeavyArmorFetishist
          HentaiNormalTraitList[15] = PussyLoving
          HentaiNormalTraitList[16] = AnalLoving
          HentaiNormalTraitList[17] = FutaLoving
          HentaiNormalTraitList[18] = Cumbuckets
          HentaiNormalTraitList[19] = SexuallyFrustrated
          HentaiNormalTraitList[20] = Cowgirl
          rand = utility.randomint(0, 20)
          ActorRef.AddToFaction(HentaiNormalTraitList[rand])
          NPCTrait = HentaiNormalTraitList[rand]
        endif
      elseif Gender >= 2 ;Creature
        if utility.randomint(1, 100) <= ChanceToAssignEpicHentaiTrait ;roll for a chance for hentai epic trait
          Faction[] HentaiEpicTraitList = new faction[5]

          ;Epic Trait list
          HentaiEpicTraitList[0] = Uncummanable
          HentaiEpicTraitList[1] = TheMilker
          HentaiEpicTraitList[2] = TheBreaker
          HentaiEpicTraitList[3] = DualShot
          HentaiEpicTraitList[4] = ThePenetrator
          if ishugePP()
            rand = utility.randomint(0, 4)
          else
            rand = utility.randomint(0, 3)
          endif
          ActorRef.AddToFaction(HentaiEpicTraitList[rand])
          NPCTrait = HentaiEpicTraitList[rand]
        else
          Faction[] HentaiNormalTraitList = new faction[12]

          ;Trait List for Creature
          HentaiNormalTraitList[0] = Aggressive
          HentaiNormalTraitList[1] = OralLoving
          HentaiNormalTraitList[2] = ShortFused
          HentaiNormalTraitList[3] = Skilled
          HentaiNormalTraitList[4] = Strong
          HentaiNormalTraitList[5] = Timid
          HentaiNormalTraitList[6] = Weak
          HentaiNormalTraitList[7] = Impatient
          HentaiNormalTraitList[8] = PussyLoving
          HentaiNormalTraitList[9] = AnalLoving
          HentaiNormalTraitList[10] = Cumbuckets
          HentaiNormalTraitList[11] = InHeat
          rand = utility.randomint(0, 11)
          ActorRef.AddToFaction(HentaiNormalTraitList[rand])
          NPCTrait = HentaiNormalTraitList[rand]
        endif
      endif
    else
      ;Normal Trait if no hentai trait
      ActorRef.AddToFaction(Normal)
      NPCTrait = Normal
    endif
  endif

  ;reAssign TeamMate to Normal
  if ActorRef.isplayerteammate() && NPCTrait != Normal
    ActorRef.Removefromfaction(NPCTrait)
    ActorRef.AddToFaction(Normal)
    NPCTrait = Normal
  endif

  ;Store main NPC trait
  if Position <= 1
    StorageUtil.SetStringValue(None, "MainNPCTrait", NPCTrait.getname())
  endif
endfunction

function AttachMarker()
  ActorRef.SetVehicle(MarkerRef)
  if UseScale && AnimScale > 0.1 ;SLGP && AnimScale != 1.0
    ActorRef.SetScale(AnimScale)
  endif
endfunction

string[] function GetForbiddenTags()
  return PapyrusUtil.ClearEmpty(ForbiddenTags)
endfunction

function BonusEnjoyment(actor Ref=none, int fixedvalue=0, bool VerifiedCall=false)
  if ref == none && self.GetState() != "Animating"
    return
  endif
  HentaiEnjoyment += fixedvalue
  AddResistanceDamage(fixedvalue)
  printdebug(actorname + "enjoyment is being affected by game! mod value : " + fixedvalue)
endfunction

int function CalcReaction()
  if !ActorRef
    Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "CalcReaction()")
    return 0
  endif
  return PapyrusUtil.ClampInt(Math.Abs(GetFullEnjoyment()) as int, 0, 100)
endfunction

int function CalculateFullEnjoyment()
  String File = "/SLSO/Config.json"
  slaActorArousal = ActorRef.GetFactionRank(slaArousal)
  if slaActorArousal < 0
    slaActorArousal = 0
  endif
  if AppliedStarterEnjoyment == false
    if ActorRef == PlayerRef
      printdebug("PCStartingEnjoyment : " + PCStartingEnjoyment * 100)
      StarterEnjoyment = math.ceiling(AddArousalModifier(utility.Randomfloat(1, PCStartingEnjoyment * 100)))
      printdebug("Starting Enjoyment After Arousal Mod: " + StarterEnjoyment)
      if StarterEnjoyment >= pcleadinenjoymentcap
        StarterEnjoyment = pcleadinenjoymentcap
      endif
    else
      StarterEnjoyment = math.ceiling(AddArousalModifier(utility.Randomfloat(1, NPCStartingEnjoyment * 100)))
    endif
    HentaiEnjoyment = HentaiEnjoyment + StarterEnjoyment
    HentaiEnjoyment = NPCTraitStartingEnjoyementOverride(HentaiEnjoyment)
    printdebug("Starting Enjoyment After NPC Trait Mod: " + HentaiEnjoyment)
    AppliedStarterEnjoyment = true
  endif

  ;Add Hentai Enjoyment per tick
  if ActorRef == PlayerRef
    if StorageUtil.GetFloatValue(none, "HentaiPCEnjoymentOverride", 0) != 0
      HentaiEnjoyment = HentaiEnjoyment + StorageUtil.GetFloatValue(none, "HentaiPCEnjoymentOverride", 0)
    else
      if IsLeadin() && HentaiEnjoyment > pcleadinenjoymentcap
        HentaiEnjoyment = HentaiEnjoyment - 1
      else
        Printdebug("Enjoyment Before : " + HentaiEnjoyment)
        HentaiEnjoyment = HentaiEnjoyment + PCEnjoymentChanges
        printdebug("Enjoyment Changes: " + PCEnjoymentChanges)
        Printdebug("Enjoyment After : " + HentaiEnjoyment)
      endif
    endif
    AddResistanceDamage(PCEnjoymentChanges)
  else
    if StorageUtil.GetFloatValue(none, "HentaiNPCEnjoymentOverride", 0) != 0
      HentaiEnjoyment = HentaiEnjoyment + StorageUtil.GetFloatValue(none, "HentaiNPCEnjoymentOverride", 0)
    else
      HentaiEnjoyment = HentaiEnjoyment + NPCEnjoymentChanges
    endif
    AddResistanceDamage(NPCEnjoymentChanges)
  endif
  ActorFullEnjoyment = math.floor(HentaiEnjoyment) ;the variable that gets sent to widget and orgasm

  ;Log("SLSO_ActorFullEnjoyment with modifiers ["+ActorFullEnjoyment+"] = (SLSO_FullEnjoyment ["+SLSO_FullEnjoyment+"] * Modifiers ["+MasturbationMod / ExhibitionistMod / GenderMod * sl_enjoymentrate * slaActorArousalMod+"])")
  return ActorFullEnjoyment
endfunction

function CalculateStartupResistance()
  int ResistancetoRecover = 0
  printdebug("hours since last sex : " + Stats.HoursSinceLastSex(actorref))
  if IsBroken()
    SetBrokenpoints(GetBrokenpoints() - math.floor(Stats.HoursSinceLastSex(actorref)))
    if IsBroken() ;still broken. 0 resistance
      resistance = 0
    else
      ;recover resistance
      SetResistance(100)
      return
    endif
  endif
  if isplayer
    ;start pc recover resistance
    SetResistance(GetResistance() + math.floor((Stats.HoursSinceLastSex(actorref) * pcrecoverresistancepercentageperhour) as int))
  else
    ;start npc recover resistance
    SetResistance(GetResistance() + math.floor(Stats.HoursSinceLastSex(actorref) * npcrecoverresistancepercentageperhour))
  endif
endfunction

function CheckHasMFEE()
  ;check if has MFEE
  if MuFacialExpressionExtended.GetVersion() > 0 && (actorref.GetRace().getname() == "Erin" || actorref.GetRace().getname() == "Elin")
    HasMFEE = true
    EnabledMFEETongue = JsonUtil.GetIntValue(EnableErinMFEE, "enablemfeetongue", 0)
    EnabledMFEEAhegao = JsonUtil.GetIntValue(EnableErinMFEE, "enablemfeeahegao", 0)
    ahegaophonemebigaah = JsonUtil.GetIntValue(EnableErinMFEE, "ahegaophonemebigaah", 0)
    tonguephonemebigaah = JsonUtil.GetIntValue(EnableErinMFEE, "tonguephonemebigaah", 0)
    tonguephonemeoh = JsonUtil.GetIntValue(EnableErinMFEE, "tonguephonemeoh", 0)
    ahegaolookupmodifier = JsonUtil.GetIntValue(EnableErinMFEE, "ahegaolookupmodifier", 0)
  elseif MuFacialExpressionExtended.GetVersion() > 0
    HasMFEEVanillaRace = true
  endif
endfunction

function ClearAlias()
  ; Maybe got here prematurely, give it 10 seconds before forcing the clear
  if GetState() == "Resetting"
    float Failsafe = Utility.GetCurrentRealTime() + 10.0
    while GetState() == "Resetting" && Utility.GetCurrentRealTime() < Failsafe
      Utility.WaitMenuMode(0.2)
    endwhile
  endif

  ; Make sure actor is reset
  if GetReference() && GetReference() as Actor != none
    ; Init variables needed for reset
    ActorRef = GetReference() as Actor
    BaseRef = ActorRef.GetLeveledActorBase()
    ActorName = BaseRef.GetName()
    BaseSex = BaseRef.GetSex()
    isRealFemale = BaseSex == 1
    Gender = ActorLib.GetGender(ActorRef)
    IsMale = Gender == 0
    IsFemale = Gender == 1
    IsCreature = Gender >= 2
    IsFuta = ActorLib.GetTrans(ActorRef) != -1
    if !RaceEditorID || RaceEditorID == ""
      RaceEditorID = MiscUtil.GetRaceEditorID(BaseRef.GetRace())
    endif
    if IsCreature
      ActorRaceKey = sslCreatureAnimationSlots.GetRaceKeyByID(RaceEditorID)
    endif
    IsPlayer = ActorRef == PlayerRef
    Log("Actor present during alias clear! This is usually harmless as the alias and actor will correct itself, but is usually a sign that a thread did not close cleanly.", "ClearAlias(" + ActorRef + " / " + self + ")")

    ; Reset actor back to default
    ClearEvents()

    ;SLGP Events
    UnRegisterForModEvent("SLGP_Voice_" + self)
    UnRegisterForModEvent("SLGP_Strip_" + self)
    UnRegisterForModEvent("SLGP_SLSO_Start_" + self)
    UnRegisterForModEvent("SLGP_Expression_" + self)

    ;SLGP Events
    ClearEffects()
    StopAnimating(true)
    UnlockActor()
    RestoreActorDefaults()
    Unstrip()
    ;Config.ClearActorFaceItems(ActorRef)
  endif
  Initialize()
  GoToState("")
endfunction

function ClearEffects()
  if IsPlayer && GetState() != "Animating"
    ; MiscUtil.SetFreeCameraState(false)
    if Game.GetCameraState() == 0
      Game.ForceThirdPerson()
    endif
  endif
  ;Config.UnequipActorFaceItems(ActorRef)
  ;	if ActorRef.IsInCombat();SLGP Not need = one check minus
  ActorRef.StopCombat()

  ;	endIf
  ;	if ActorRef.IsWeaponDrawn();SLGP Not need = one check minus
  ActorRef.SheatheWeapon()

  ;	endIf
  if ActorRef.IsSneaking() ;SLGP STRICLY NECESARY
    ActorRef.StartSneaking()
  endif
  ActorRef.ClearKeepOffsetFromActor()
  if ActorRef.Is3DLoaded() && !ActorRef.IsDisabled() && !ActorRef.IsDead() && !ActorRef.IsUnconscious()
    ActorRef.ClearLookAt()
  endif
endfunction

function ClearEvents()
  UnregisterForUpdate()
  string e = Thread.Key("")

  ; Quick Events
  UnregisterForModEvent(e + "Animate")
  UnregisterForModEvent(e + "Orgasm")
  UnregisterForModEvent(e + "TravelToCenter")
  UnregisterForModEvent(e + "Strip")
  UnregisterForModEvent(e + "StripActor")
  UnregisterForModEvent(e + "RefreshActorExpression")

  ; Sync Events
  UnregisterForModEvent(e + "Prepare")
  UnregisterForModEvent(e + "Sync")
  UnregisterForModEvent(e + "Reset")
  UnregisterForModEvent(e + "Refresh")
  UnregisterForModEvent(e + "Startup")
endfunction

bool function ContinueStrip(Form ItemRef, bool DoStrip=true)
  if !ItemRef
    return False
  endif
  if StorageUtil.FormListHas(none, "AlwaysStrip", ItemRef) || SexLabUtil.HasKeywordSub(ItemRef, "AlwaysStrip")
    if StorageUtil.GetIntValue(ItemRef, "SometimesStrip", 100) < 100
      if !DoStrip
        return (StorageUtil.GetIntValue(ItemRef, "SometimesStrip", 100) >= Utility.RandomInt(76, 100))
      endif
      return (StorageUtil.GetIntValue(ItemRef, "SometimesStrip", 100) >= Utility.RandomInt(1, 100))
    endif
    return True
  endif
  return (DoStrip && !(StorageUtil.FormListHas(none, "NoStrip", ItemRef) || SexLabUtil.HasKeywordSub(ItemRef, "NoStrip")))
endfunction

function DisableOrgasm(bool bNoOrgasm)
  if ActorRef
    NoOrgasm = bNoOrgasm
  endif
endfunction

function DisablePathToCenter(bool disabling)
  PathingFlag = IntIfElse(disabling, -1, (PathingFlag == 1) as int)
endfunction

function DoOrgasm(bool Forced=false)
endfunction

function EquipStrapon()
  if Strapon && !ActorRef.IsEquipped(Strapon)
    ActorRef.EquipItem(Strapon, true, true)
  endif
endfunction

Bool function EquippedTongue()
  if FHUTongueTypeArmor
    return actorref.IsEquipped(FHUTongueTypeArmor)
  endif
  return false
endfunction

float function ExpressionSpeed()
  if Isintense()
    return 0.2
  else
    return 0.4
  endif
endfunction

function ForcePathToCenter(bool forced)
  PathingFlag = (forced as int)
endfunction

string function GetActorKey()
  return ActorKey
endfunction

string function GetActorName()
  return ActorName
endfunction

float function GetBodyScale()
  float output = 1.0
  if ActorRef
    output = ActorRef.GetScale()
  endif
  if NioScale > 0.0 ;&& NioScale != 1.0
    output = output * NioScale
  endif

  ;	Log(self, "GetScale()")
  return output
endfunction

int function GetBrokenPoints()
  return actorref.GetFactionRank(HentairimBroken)
endfunction

Float function GetEndingEnjoyment()
  float labelenjoyment
  if EndingLabel == "ENO"
    if IsPlayer
      labelenjoyment = pceno
    else
      labelenjoyment = npceno
    endif
  elseif EndingLabel == "ENI"
    if IsPlayer
      labelenjoyment = pceni
    else
      labelenjoyment = npceni
    endif
  else
    labelenjoyment = 0
  endif
  return labelenjoyment
endfunction

int function GetEnjoyment()
  return SLSO_GetEnjoyment()
endfunction

float function GetEnjoymentChanges()
  if IsPlayer
    return PCEnjoymentChanges
  else
    return NPCEnjoymentChanges
  endif
endfunction

sslBaseExpression function GetExpression()
  return Expression
endfunction

string function GetExpressionLabel()
  if PenetrationLabel != "LDI"
    return PenetrationLabel
  elseif PenisActionLabel != "LDI"
    return PenisActionLabel
  elseif StimulationLabel != "LDI"
    return StimulationLabel
  elseif EndingLabel != "LDI"
    return EndingLabel
  else
    return "LDI"
  endif
endfunction

float function GetExpressionUpdateSeconds()
  if IsPlayer
    if Isintense()
      return pcintenseexpressionupdateinseconds
    else
      return pcnonintenseexpressionupdateinseconds
    endif
  else
    if Isintense()
      return npcintenseexpressionupdateinseconds
    else
      return npcnonintenseexpressionupdateinseconds
    endif
  endif
endfunction

;SLSO enjoyment calc
int function GetFullEnjoyment()
  return ActorFullEnjoyment
endfunction

float function GetFullEnjoymentMod()
  return 100 * MasturbationMod / ExhibitionistMod / GenderMod * slaActorArousalMod
endfunction

ObjectReference function GetFurnitureRef()
  return FurnitureRef
endfunction

; ------------------------------------------------------- ;
; --- Data Accessors                                  --- ;
; ------------------------------------------------------- ;
int function GetGender()
  return Gender
endfunction

String function GetHentaiExpression()
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
  string HentaiScenario = StorageUtil.GetStringValue(None, "HentaiScenario", "")
  if !isplayer || (isplayer && HentaiScenario == "")
    if IsOrgasming
      HentaiScenario = "orgasm"
    elseif (IsGivingAnalPenetration() || IsGivingVaginalPenetration() || IsGettingSuckedoff()) && !Isintense()
      HentaiScenario = "grunt"
    elseif (IsGivingAnalPenetration() || IsGivingVaginalPenetration() || IsGettingSuckedoff()) && Isintense()
      HentaiScenario = "intensegrunt"
    elseif GetFullEnjoyment() > 70 && !Isintense() && gender == 0
      HentaiScenario = "closetoorgasm"
    elseif GetFullEnjoyment() > 70 && Isintense() && gender == 0
      HentaiScenario = "closetoorgasmintense"
    elseif (IsCowgirl() || IsGivingAnalPenetration() || IsGivingVaginalPenetration()) && !IsVictim
      HentaiScenario = "attacking"
    elseif IsGettingStimulated()
      if Isintense()
        HentaiScenario = "grunt"
      else
        HentaiScenario = "Leadin"
      endif
    elseif IsEnding()
      if IsVictim()
        HentaiScenario = "unamusedending"
      else
        HentaiScenario = "Panting"
      endif
    else
      if Isintense()
        HentaiScenario = "intensegrunt"
      else
        HentaiScenario = "grunt"
      endif
    endif
  endif
  return HentaiScenario
endfunction

bool function GetIsFuta()
  return IsFuta
endfunction

float function GetOpenMouthScale()
  return OpenMouthScale
endfunction

int function GetOrgasmCount()
  if !ActorRef
    Orgasms = 0
  endif
  return Orgasms
endfunction

int function GetMaxResistanceAbsolute()
  if IsPlayer
    return pcmaxresistance
  else
    return jsonUtil.GetIntValue(RaceBaseResistance, racename, 100)
  endif
endfunction

Float function GetOralEnjoyment()
  float labelenjoyment
  if OralLabel == "KIS"
    if IsPlayer
      labelenjoyment = pckis
    else
      labelenjoyment = npckis
    endif
  elseif OralLabel == "CUN"
    if IsPlayer
      labelenjoyment = pccun
    else
      labelenjoyment = npccun
    endif
  elseif OralLabel == "SBJ"
    if IsPlayer
      labelenjoyment = pcsbj
    else
      labelenjoyment = npcsbj
    endif
  elseif OralLabel == "FBJ"
    if IsPlayer
      labelenjoyment = pcfbj
    else
      labelenjoyment = npcfbj
    endif
  else
    labelenjoyment = 0
  endif
  return labelenjoyment
endfunction

int function GetOrgasmDamage()
  if IsPlayer
    return math.floor(pcorgasmresistancedamage as float * GetResistanceDamageMultiplier())
  else
    return math.floor(npcorgasmresistancedamage as float * GetResistanceDamageMultiplier())
  endif
endfunction

String function GetPCBodyArmorType()
  Armor PCWornBodyArmor = playerref.GetWornForm(Armor.GetMaskForSlot(32)) as armor

  if PCWornBodyArmor && PCWornBodyArmor.getweightclass() == 0
    return "Light"
  elseif PCWornBodyArmor && PCWornBodyArmor.getweightclass() == 1
    return "Heavy"
  elseif PCWornBodyArmor != None
    return "Clothing"
  else
    return "Naked"
  endif
endfunction

int function GetPain()
  if !ActorRef
    Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "GetPain()")
    return 0
  endif
  return PapyrusUtil.ClampInt(Math.Abs(GetFullEnjoyment()) as int, 0, 100)
endfunction

Float function GetPenetrationEnjoyment()
  float labelenjoyment
  if PenetrationLabel == "FAP"
    if IsPlayer
      labelenjoyment = pcfap
    else
      labelenjoyment = npcfap
    endif
  elseif PenetrationLabel == "SAP"
    if IsPlayer
      labelenjoyment = pcsap
    else
      labelenjoyment = npcsap
    endif
  elseif PenetrationLabel == "FVP"
    if IsPlayer
      labelenjoyment = pcfvp
    else
      labelenjoyment = npcfvp
    endif
  elseif PenetrationLabel == "SVP"
    if IsPlayer
      labelenjoyment = pcsvp
    else
      labelenjoyment = npcsvp
    endif
  elseif PenetrationLabel == "SDP"
    if IsPlayer
      labelenjoyment = pcsdp
    else
      labelenjoyment = npcsdp
    endif
  elseif PenetrationLabel == "FDP"
    if IsPlayer
      labelenjoyment = pcfdp
    else
      labelenjoyment = npcfdp
    endif
  elseif PenetrationLabel == "SCG"
    if IsPlayer
      labelenjoyment = pcscg
    else
      labelenjoyment = npcscg
    endif
  elseif PenetrationLabel == "FCG"
    if IsPlayer
      labelenjoyment = pcfcg
    else
      labelenjoyment = npcfcg
    endif
  elseif PenetrationLabel == "SAC"
    if IsPlayer
      labelenjoyment = pcsac
    else
      labelenjoyment = npcsac
    endif
  elseif PenetrationLabel == "FAC"
    if IsPlayer
      labelenjoyment = pcfac
    else
      labelenjoyment = npcfac
    endif
  else
    labelenjoyment = 0
  endif
  return labelenjoyment
endfunction

Float function GetPenisActionEnjoyment()
  float labelenjoyment
  if PenisActionLabel == "SDV"
    if IsPlayer
      labelenjoyment = pcsdv
    else
      labelenjoyment = npcsdv
    endif
  elseif PenisActionLabel == "FDV"
    if IsPlayer
      labelenjoyment = pcfdv
    else
      labelenjoyment = npcfdv
    endif
  elseif PenisActionLabel == "SDA"
    if IsPlayer
      labelenjoyment = pcsda
    else
      labelenjoyment = npcsda
    endif
  elseif PenisActionLabel == "FDA"
    if IsPlayer
      labelenjoyment = pcfda
    else
      labelenjoyment = npcfda
    endif
  elseif PenisActionLabel == "SHJ"
    if IsPlayer
      labelenjoyment = pcshj
    else
      labelenjoyment = npcshj
    endif
  elseif PenisActionLabel == "FHJ"
    if IsPlayer
      labelenjoyment = pcfhj
    else
      labelenjoyment = npcfhj
    endif
  elseif PenisActionLabel == "STF"
    if IsPlayer
      labelenjoyment = pcstf
    else
      labelenjoyment = npcstf
    endif
  elseif PenisActionLabel == "FTF"
    if IsPlayer
      labelenjoyment = pcftf
    else
      labelenjoyment = npcftf
    endif
  elseif PenisActionLabel == "SMF"
    if IsPlayer
      labelenjoyment = pcsmf
    else
      labelenjoyment = npcsmf
    endif
  elseif PenisActionLabel == "FMF"
    if IsPlayer
      labelenjoyment = pcfmf
    else
      labelenjoyment = npcfmf
    endif
  elseif PenisActionLabel == "SFJ"
    if IsPlayer
      labelenjoyment = pcsfj
    else
      labelenjoyment = npcsfj
    endif
  elseif PenisActionLabel == "FFJ"
    if IsPlayer
      labelenjoyment = pcffj
    else
      labelenjoyment = npcffj
    endif
  else
    return 0
  endif
  return labelenjoyment
endfunction

String function GetPenisActionLabel()
  return PenisActionLabel
endfunction

float function GetPercentageofMaxResistance(float value)
  return value / GetMaxResistanceAbsolute()
endfunction

function GetPositionInfo()
  if ActorRef
    if AdjustKey != Thread.AdjustKey
      SetAdjustKey(Thread.AdjustKey)
    endif
    LeadIn = Thread.LeadIn
    Stage = Thread.Stage
    PrevStage = stage - 1
    Animation = Thread.Animation
    StageCount = Animation.StageCount
    if Stage < 1 || Stage > StageCount
      Log("Invalid stage: " + Stage + " of " + StageCount)
      return
    endif
    Log("Animation:" + Animation.Name + " AdjustKey:" + AdjustKey + " Position:" + Position + " Stage:" + Stage)
    Flags = Animation.PositionFlags(Flags, AdjustKey, Position, Stage)
    Offsets = new float[4]
    Offsets = Animation.PositionOffsets(Offsets, AdjustKey, Position, Stage, FurnitureStatus[1])
    CurrentSA = Animation.Registry

    ; AnimEvents[Position] = Animation.FetchPositionStage(Position, Stage)
  endif
endfunction

string[] function GetRequiredTags()
  return PapyrusUtil.ClearEmpty(RequiredTags)
endfunction

bool function GetRestricted()
  return Restricted
endfunction

float function GetScale()
  float output = 1.0
  if Config.RaceAdjustments && BaseRef ; TODO: Make some native function to get the real diference bettewen the current Actor Scale and the Race Height
    output = BaseRef.GetHeight() ; Incompatible with actor that are being scaled iside the played game but there is none way to know the real Race Height of the actor to know the real diference with its current actor scale
    if JSONUtil.IsGood("../SexLab/RaceGenderScales.json") ;&& ActorRaceScale != 1.0 && ActorRaceScale > 0.0
      float ActorRaceScale = 1.0
      if isRealFemale ; Try to deal with the lack of native functions geting this from a JSON file
        ActorRaceScale = JSONUtil.GetFloatValue("../SexLab/RaceGenderScales.json", RaceEditorID + ".FemaleHeigth", 1.0)
      else
        ActorRaceScale = JSONUtil.GetFloatValue("../SexLab/RaceGenderScales.json", RaceEditorID + ".MaleHeigth", 1.0)
      endif
      if ActorRaceScale > 0.0
        output = ActorRef.GetScale() / ActorRaceScale
      endif
      Log(self, "GetScale(): " + output + ", BaseHeight:" + BaseRef.GetHeight() + ", ActorScale:" + ActorRef.GetScale() + " , ActorRaceScale:" + ActorRaceScale)
    endif
  elseif ActorRef
    output = ActorRef.GetScale()
  endif
  if NioScale > 0.0 ;&& NioScale != 1.0
    output = output * NioScale
  endif

  ;	Log(self, "GetScale()")
  return output
endfunction

bool function HasAllForbiddenTag(string[] TagList)
  int i = TagList.Length
  while i
    i -= 1
    if TagList[i] != "" && ForbiddenTags.Find(TagList[i]) == -1
      return false
    endif
  endwhile
  return true
endfunction

bool function HasAllRequiredTag(string[] TagList)
  int i = TagList.Length
  while i
    i -= 1
    if TagList[i] != "" && RequiredTags.Find(TagList[i]) == -1
      return false
    endif
  endwhile
  return true
endfunction

bool function HasForbiddenTag(string Tag)
  return Tag != "" && ForbiddenTags.Find(Tag) != -1
endfunction

bool function HasOneForbiddenTag(string[] TagList)
  int i = TagList.Length
  while i
    i -= 1
    if TagList[i] != "" && ForbiddenTags.Find(TagList[i]) != -1
      return true
    endif
  endwhile
  return false
endfunction

bool function HasOneRequiredTag(string[] TagList)
  int i = TagList.Length
  while i
    i -= 1
    if TagList[i] != "" && RequiredTags.Find(TagList[i]) != -1
      return true
    endif
  endwhile
  return false
endfunction

bool function HasRequiredTag(string Tag)
  return Tag != "" && RequiredTags.Find(Tag) != -1
endfunction

function HoldOut(float experience=0.0)
endfunction

String function GetPrimaryLabel()
  if OralLabel != "LDI"
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

int function GetResistance()
  return actorref.GetFactionRank(HentairimResistance)
endfunction

Float function GetResistanceDamageMultiplier()
  float ResistanceDamageMultiplier = 1
  if IsPlayer
    ;set victim / non victim resistance Multiplier
    if IsVictim
      ResistanceDamageMultiplier = ResistanceDamageMultiplier * pcvictimresistancedamagemultiplier / 100 as float
    else
      ResistanceDamageMultiplier = ResistanceDamageMultiplier * pcnonvictimresistancedamagemultiplier / 100 as float
    endif
    if ishugepp()
      ResistanceDamageMultiplier = ResistanceDamageMultiplier * hugeppresistancedamagemultiplier / 100 as float
    endif
  else
    if IsVictim
      ResistanceDamageMultiplier = ResistanceDamageMultiplier * npcvictimresistancedamagemultiplier / 100 as float
    else
      ResistanceDamageMultiplier = ResistanceDamageMultiplier * npcnonvictimresistancedamagemultiplier / 100 as float
    endif
  endif
  printdebug("ResistanceDamageMultiplier :" + ResistanceDamageMultiplier)
  return ResistanceDamageMultiplier
endfunction

int function GetResistancePercentage()
  if enableaggressionresistance == 0
    return 100
  else
    int res = GetResistance()
    if res < 0
      res = 0
    endif
    return res
  endif
endfunction

Float function GetSecondsSinceLastOrgasm()
  return Thread.totaltime - LastOrgasmtime
endfunction

Float function GetStimulationEnjoyment()
  float labelenjoyment
  if Stimulationlabel == "SST"
    if IsPlayer
      labelenjoyment = pcsst
    else
      labelenjoyment = npcsst
    endif
  elseif Stimulationlabel == "FST"
    if IsPlayer
      labelenjoyment = pcfst
    else
      labelenjoyment = npcfst
    endif
  elseif Stimulationlabel == "BST"
    if IsPlayer
      labelenjoyment = pcbst
    else
      labelenjoyment = npcbst
    endif
  else
    labelenjoyment = 0
  endif
  return labelenjoyment
endfunction

Form function GetStrapon()
  return Strapon
endfunction

Armor function GetTongueType()
  if FHUTongueType == 0
    FHUTongueType = Utility.RandomInt(1, 10)
  endif
  string name = actorref.getdisplayname()
  int TongueType
  armor Tongue
  if isplayer
    TongueType = FHUTongueType
  elseif enablenpctongue == 1
    TongueType = JsonUtil.GetIntValue(NPCTongueFile, name, FHUTongueType)
    If (!TongueType)
      TongueType = FHUTongueType
    EndIf
  endif
  if TongueType == 1
    Tongue = Game.GetFormFromFile(0x263B2, "sr_fillherup.esp") as Armor
  elseif TongueType == 2
    Tongue = Game.GetFormFromFile(0x263B3, "sr_fillherup.esp") as Armor
  elseif TongueType == 3
    Tongue = Game.GetFormFromFile(0x263B4, "sr_fillherup.esp") as Armor
  elseif TongueType == 4
    Tongue = Game.GetFormFromFile(0x263B5, "sr_fillherup.esp") as Armor
  elseif TongueType == 5
    Tongue = Game.GetFormFromFile(0x263B6, "sr_fillherup.esp") as Armor
  elseif TongueType == 6
    Tongue = Game.GetFormFromFile(0x263B7, "sr_fillherup.esp") as Armor
  elseif TongueType == 7
    Tongue = Game.GetFormFromFile(0x263B8, "sr_fillherup.esp") as Armor
  elseif TongueType == 8
    Tongue = Game.GetFormFromFile(0x263B9, "sr_fillherup.esp") as Armor
  elseif TongueType == 9
    Tongue = Game.GetFormFromFile(0x263BA, "sr_fillherup.esp") as Armor
  else
    Tongue = Game.GetFormFromFile(0x263BB, "sr_fillherup.esp") as Armor
  endif
  printdebug("GetTongueType : " + TongueType)
  FHUTongueTypeArmor = Tongue
  return Tongue
endfunction

sslBaseVoice function GetVoice()
  return Voice
endfunction

Bool function HasDeviousGag(Actor char)
  if has_MagicEffect(char, 0x2b077, "Devious Devices - Integration.esm")
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
  endif
  return char.GetActorBase().GetSex() == 0
endfunction

float function HentaiEnjoymentGetUpdateSeconds()
  float UpdateSeconds
  if isplayer
    if Isintense()
      UpdateSeconds = PCIntenseSecondsPerTick
    elseif Isnotintense()
      UpdateSeconds = PCNonIntenseSecondsPerTick
    else
      UpdateSeconds = PCLDISecondsPerTick
    endif
  else
    if Isintense()
      UpdateSeconds = NPCIntenseSecondsPerTick
    elseif Isnotintense()
      UpdateSeconds = NPCNonIntenseSecondsPerTick
    else
      UpdateSeconds = NPCLDISecondsPerTick
    endif
  endif
  return UpdateSeconds
endfunction

function Initialize()
  ; Clear actor
  if ActorRef && ActorRef != none
    ; Stop events
    ClearEvents()

    ; RestoreActorDefaults()
    ; Remove nudesuit if present
    int n = ActorRef.GetItemCount(Config.NudeSuit)
    if n > 0
      ActorRef.RemoveItem(Config.NudeSuit, n, true)
    endif
  endif

  ; Delete positioning marker
  if MarkerRef
    MarkerRef.Disable()
    MarkerRef.Delete()
  endif

  ; Forms
  ActorRef = none
  FurnitureRef = none
  MarkerRef = none
  HadStrapon = none
  Strapon = none
  HDTHeelSpell = none

  ; Voice
  Voice = none
  ActorVoice = none
  IsForcedSilent = false

  ; Expression
  Expression = none
  Expressions = sslUtility.ExpressionArray(0)
  OpenMouthScale = 1.0
 ; Flags
  NoRagdoll = false
  NoUndress = false
  NoRedress = false
  NoOrgasm = false
  ForceOpenMouth = false
  Restricted = false
  AmmoChecked = false ; Temporal to low the stress of strip ammo
  IsStripping = false ; Temporal to skip the OnObjectUnequipped while stripping
  Prepared = false
  StartedUp = false

  ; Integers
  Orgasms = 0
  BestRelation = 0
  BaseEnjoyment = 0
  QuitEnjoyment = 0
  FullEnjoyment = 0
  PathingFlag = 0

  ; Floats
  LastOrgasm = 0.0
  ActorScale = 1.0
  AnimScale = 1.0
  NioScale = 1.0
  StartWait = 0.1

  ; Strings
  EndAnimEvent = "IdleForceDefaultState"
  StartAnimEvent = ""
  ActorKey = ""
  PlayingSA = ""
  CurrentSA = ""
  PlayingAE = ""
  CurrentAE = ""
  ForbiddenTags = Utility.CreateStringArray(0)
  RequiredTags = Utility.CreateStringArray(0)

  ; Storage
  StripOverride = Utility.CreateBoolArray(0)
  Equipment = Utility.CreateFormArray(0)
  ;Make sure alias is emptied
  ;SLU+ ---BEGIN-----------------------------------
  if Config.HasZadDevice
    if !zad_Lockable
      zad_Lockable = Keyword.GetKeyword("zad_Lockable")
    endif
    if !zad_DeviousYoke
      zad_DeviousYoke = Keyword.GetKeyword("zad_DeviousYoke")
    endif
    if !zad_DeviousYokeBB
      zad_DeviousYokeBB = Keyword.GetKeyword("zad_DeviousYokeBB")
    endif
    if !zad_DeviousArmbinder
      zad_DeviousArmbinder = Keyword.GetKeyword("zad_DeviousArmbinder")
    endif
    if !zad_DeviousArmbinderElbow
      zad_DeviousArmbinderElbow = Keyword.GetKeyword("zad_DeviousArmbinderElbow")
    endif
    if !zad_DeviousHeavyBondage
      zad_DeviousHeavyBondage = Keyword.GetKeyword("zad_DeviousHeavyBondage")
    endif
    if !zad_DeviousStraitJacket
      zad_DeviousStraitJacket = Keyword.GetKeyword("zad_DeviousStraitJacket")
    endif
    if !zad_DeviousBelt
      zad_DeviousBelt = Keyword.GetKeyword("zad_DeviousBelt")
    endif
    if !zad_DeviousSuit
      zad_DeviousSuit = Keyword.GetKeyword("zad_DeviousSuit")
    endif
    if !zad_DeviousPlugAnal
      zad_DeviousPlugAnal = Keyword.GetKeyword("zad_DeviousPlugAnal")
    endif
    if !zad_DeviousPlugVaginal
      zad_DeviousPlugVaginal = Keyword.GetKeyword("zad_DeviousPlugVaginal")
    endif
    if !zad_PermitAnal
      zad_PermitAnal = Keyword.GetKeyword("zad_PermitAnal")
    endif
    if !zad_PermitVaginal
      zad_PermitVaginal = Keyword.GetKeyword("zad_PermitVaginal")
    endif
    if !zad_DeviousGag
      zad_DeviousGag = Keyword.GetKeyword("zad_DeviousGag")
    endif
    if !zad_DeviousGagPanel
      zad_DeviousGagPanel = Keyword.GetKeyword("zad_DeviousGagPanel")
    endif
    if !zad_PermitOral
      zad_PermitOral = Keyword.GetKeyword("zad_PermitOral")
    endif
    if !zad_DeviousBra
      zad_DeviousBra = Keyword.GetKeyword("zad_DeviousBra")
    endif
    if !zad_DeviousPetSuit
      zad_DeviousPetSuit = Keyword.GetKeyword("zad_DeviousPetSuit")
    endif
  endif
  if Config.HasZazDevice
    if !zbfWornDevice
      zbfWornDevice = Keyword.GetKeyword("zbfWornDevice")
    endif
    if !zbfAnimHandsYoke
      zbfAnimHandsYoke = Keyword.GetKeyword("zbfAnimHandsYoke")
    endif
    if !zbfAnimHandsArmbinder
      zbfAnimHandsArmbinder = Keyword.GetKeyword("zbfAnimHandsArmbinder")
    endif
    if !zbfAnimHandsElbows
      zbfAnimHandsElbows = Keyword.GetKeyword("zbfAnimHandsElbows")
    endif
    if !zbfAnimHandsWrists
      zbfAnimHandsWrists = Keyword.GetKeyword("zbfAnimHandsWrists")
    endif
    if !zbfWornBelt
      zbfWornBelt = Keyword.GetKeyword("zbfWornBelt")
    endif
    if !zbfWornPreventAnal
      zbfWornPreventAnal = Keyword.GetKeyword("zbfWornPreventAnal")
    endif
    if !zbfWornPreventVaginal
      zbfWornPreventVaginal = Keyword.GetKeyword("zbfWornPreventVaginal")
    endif
    if !zbfWornHood
      zbfWornHood = Keyword.GetKeyword("zbfWornHood")
    endif
    if !zbfWornGag
      zbfWornGag = Keyword.GetKeyword("zbfWornGag")
    endif
    if !zbfWornPermitOral
      zbfWornPermitOral = Keyword.GetKeyword("zbfWornPermitOral")
    endif
    if !zbfWornPreventOral
      zbfWornPreventOral = Keyword.GetKeyword("zbfWornPreventOral")
    endif
    if !zbfWornBra
      zbfWornBra = Keyword.GetKeyword("zbfWornBra")
    endif
    if !zbfWornPreventBreast
      zbfWornPreventBreast = Keyword.GetKeyword("zbfWornPreventBreast")
    endif
  endif
  EnableArmorSwapping = JsonUtil.GetIntValue(ConfigFile,"enablearmorswapping",0)
  if EnableArmorSwapping
    ArmorSlotsToSwitch = papyrusutil.stringsplit(JsonUtil.GetStringValue(ArmorSwappingFile,"armorslots","") ,",")
  endif
  ;SLU+ ---END------------------------------------
  ; Make sure alias is emptied
  SLSO_Initialize()
  TryToClear()
endfunction

function InitializeAddNPCTongue()
  printdebug("enablenpctongue : " + enablenpctongue)
  enablenpctongue = JsonUtil.GetIntValue(NPCTongueFile, "enablenpctongue", 0)
  FHUTongueTypeArmor = GetTongueType()
  if FHUTongueTypeArmor && EnableTongue != 0
     printdebug("Adding tongue")
     ActorRef.addItem(FHUTongueTypeArmor, abSilent=true)
  endif
endfunction

function InitializeAggressorResistanceConfigValues()
  HentairimResistance = Game.GetFormFromFile(0x854, "Hentairim Enjoyment Expressions Traits.esp") as Faction
  HentairimBroken = Game.GetFormFromFile(0x853, "Hentairim Enjoyment Expressions Traits.esp") as Faction
  enableaggressionresistance = JsonUtil.GetIntValue(AggressorResistanceFile, "enableaggressionresistance", 0)
  enablepcresistancedamage = JsonUtil.GetIntValue(AggressorResistanceFile, "enablepcresistancedamage", 0)
  pcnonvictimresistancedamagemultiplier = JsonUtil.GetIntValue(AggressorResistanceFile, "pcnonvictimresistancedamagemultiplier", 100)
  npcnonvictimresistancedamagemultiplier = JsonUtil.GetIntValue(AggressorResistanceFile, "npcnonvictimresistancedamagemultiplier", 100)
  pcvictimresistancedamagemultiplier = JsonUtil.GetIntValue(AggressorResistanceFile, "pcvictimresistancedamagemultiplier", 100)
  npcvictimresistancedamagemultiplier = JsonUtil.GetIntValue(AggressorResistanceFile, "npcvictimresistancedamagemultiplier", 100)
  pcmaxresistance = JsonUtil.GetIntValue(AggressorResistanceFile, "pcmaxresistance", 300)
  pcrecoverresistancepercentageperhour = JsonUtil.GetIntValue(AggressorResistanceFile, "pcrecoverresistancepercentageperhour", 20)
  npcrecoverresistancepercentageperhour = JsonUtil.GetIntValue(AggressorResistanceFile, "npcrecoverresistancepercentageperhour", 20)
  pcbrokenpointsfromresistancebreak = JsonUtil.GetIntValue(AggressorResistanceFile, "pcbrokenpointsfromresistancebreak", 0)
  npcbrokenpointsfromresistancebreak = JsonUtil.GetIntValue(AggressorResistanceFile, "npcbrokenpointsfromresistancebreak", 0)
  pcorgasmresistancedamage = JsonUtil.GetIntValue(AggressorResistanceFile, "pcorgasmresistancedamage", 0)
  hugeppresistancedamagemultiplier = JsonUtil.GetIntValue(AggressorResistanceFile, "hugeppresistancedamagemultiplier", 100)
  pcmaintainresistancepercentagewhencontrolling = JsonUtil.GetIntValue(AggressorResistanceFile, "pcmaintainresistancepercentagewhencontrolling", 0)
  npcmaintainresistancepercentagewhencontrolling = JsonUtil.GetIntValue(AggressorResistanceFile, "npcmaintainresistancepercentagewhencontrolling", 0)
  enablemalenpcresistancedamage = JsonUtil.GetIntValue(AggressorResistanceFile, "enablemalenpcresistancedamage", 0)
  enablefemalenpcresistancedamage = JsonUtil.GetIntValue(AggressorResistanceFile, "enablefemalenpcresistancedamage", 0)
  enablecreaturenpcresistancedamage = JsonUtil.GetIntValue(AggressorResistanceFile, "enablecreaturenpcresistancedamage", 0)

  ;initialize faction
  if !Actorref.IsInFaction(HentairimResistance)
    SetResistance(100)
  endif
  if !Actorref.IsInFaction(HentairimBroken)
    SetBrokenPoints(0)
  endif
endfunction

function InitializeHentaiEnjoymentConfigValues()
  BlockFemaleOrgasmBeforeHentaiHype = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "blockfemaleorgasmbeforehentaihype", 0)
  ChancetoAssignHentaiTrait = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "chancetoassignhentaitrait", 0)
  NpcTraitRandomAssignment = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "npctraitrandomassignment", 0)
  ChanceToAssignEpicHentaiTrait = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "chancetoassignepichentaitrait", 0)
  HentaiExpressions = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "enableexpressions", 0)
  HentaiNPCExpressions = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "enablenpcexpressions", 0)
  EnableTongue = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "enabletongue", 0)
  FHUTongueType = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "fhutonguetype", 0)
  removetongueonblowjob = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "removetongueonblowjob", 0)
  cunusetongue = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "cunusetongue", 0)
  enableahegao = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "enableahegao", 0)
  chancetostickouttongueduringintense = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "chancetostickouttongueduringintense", 0)
  chancetostickouttongueduringattacking = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "chancetostickouttongueduringattacking", 0)
  pcleadinenjoymentcap = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "pcleadinenjoymentcap", 0)
  EnablePrintDebug = JsonUtil.GetIntValue(HentaiEnjoymentConfigFile, "printdebug", 0)
  pcldi = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcldi", 0.0)
  pcsst = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsst", 0.0)
  pcfst = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfst", 0.0)
  pcbst = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcbst", 0.0)
  pckis = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pckis", 0.0)
  pccun = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pccun", 0.0)
  pcsbj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsbj", 0.0)
  pcfbj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfbj", 0.0)
  pcsap = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsap", 0.0)
  pcsvp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsvp", 0.0)
  pcfap = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfap", 0.0)
  pcfvp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfvp", 0.0)
  pcsdp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsdp", 0.0)
  pcfdp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfdp", 0.0)
  pcscg = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcscg", 0.0)
  pcsac = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsac", 0.0)
  pcfcg = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfcg", 0.0)
  pcfac = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfac", 0.0)
  pcsdv = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsdv", 0.0)
  pcsda = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsda", 0.0)
  pcfdv = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfdv", 0.0)
  pcfda = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfda", 0.0)
  pcshj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcshj", 0.0)
  pcfhj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfhj", 0.0)
  pcstf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcstf", 0.0)
  pcftf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcftf", 0.0)
  pcsmf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsmf", 0.0)
  pcfmf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcfmf", 0.0)
  pcsfj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcsfj", 0.0)
  pcffj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcffj", 0.0)
  pceno = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pceno", 0.0)
  pceni = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pceni", 0.0)
  pcldisecondspertick = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcldisecondspertick", 5.0)
  pcnonintensesecondspertick = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcnonintensesecondspertick", 5.0)
  pcintensesecondspertick = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcintensesecondspertick", 5.0)
  pcstartingenjoyment = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcstartingenjoyment", 0.0)
  pcenjoymentarousalmodifierweight = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcenjoymentarousalmodifierweight", 0.0)
  pcisvictimmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcisvictimmultiplier", 0.0)
  pcisbrokenmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcisbrokenmultiplier", 0.0)
  pcafterorgasmmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcafterorgasmmultiplier", 0.0)
  pcreceivehugeppmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcreceivehugeppmultiplier", 0.0)
  pcnonintenseexpressionupdateinseconds = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcnonintenseexpressionupdateinseconds", 1.0)
  pcintenseexpressionupdateinseconds = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "pcintenseexpressionupdateinseconds", 0.5)
  npcstartingenjoyment = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcstartingenjoyment", 0.0)
  blockpcorgasmtags = papyrusutil.stringsplit(JsonUtil.GetStringValue(HentaiEnjoymentConfigFile, "blockpcorgasmtags", ""), ",")
  npcldi = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcldi", 0.0)
  npcsst = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsst", 0.0)
  npcfst = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfst", 0.0)
  npcbst = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcbst", 0.0)
  npckis = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npckis", 0.0)
  npccun = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npccun", 0.0)
  npcsbj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsbj", 0.0)
  npcfbj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfbj", 0.0)
  npcsap = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsap", 0.0)
  npcsvp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsvp", 0.0)
  npcfap = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfap", 0.0)
  npcfvp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfvp", 0.0)
  npcsdp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsdp", 0.0)
  npcfdp = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfdp", 0.0)
  npcscg = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcscg", 0.0)
  npcsac = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsac", 0.0)
  npcfcg = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfcg", 0.0)
  npcfac = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfac", 0.0)
  npcsdv = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsdv", 0.0)
  npcsda = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsda", 0.0)
  npcfdv = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfdv", 0.0)
  npcfda = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfda", 0.0)
  npcshj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcshj", 0.0)
  npcfhj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfhj", 0.0)
  npcstf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcstf", 0.0)
  npcftf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcftf", 0.0)
  npcsmf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsmf", 0.0)
  npcfmf = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcfmf", 0.0)
  npcsfj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcsfj", 0.0)
  npcffj = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcffj", 0.0)
  npceno = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npceno", 0.0)
  npceni = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npceni", 0.0)
  npcldisecondspertick = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcldisecondspertick", 5.0)
  npcnonintensesecondspertick = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcnonintensesecondspertick", 5.0)
  npcintensesecondspertick = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcintensesecondspertick", 5.0)
  npcenjoymentarousalmodifierweight = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcenjoymentarousalmodifierweight", 1.0)
  npcwithhugeppmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcwithhugeppmultiplier", 1.0)
  npcisbrokenmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcisbrokenmultiplier", 1.0)
  npcisvictimmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcisvictimmultiplier", 1.0)
  npcafterorgasmmultiplier = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcafterorgasmmultiplier", 1.0)
  npcnonintenseexpressionupdateinseconds = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcnonintenseexpressionupdateinseconds", 1.0)
  npcintenseexpressionupdateinseconds = jsonUtil.GetFloatValue(HentaiEnjoymentConfigFile, "npcintenseexpressionupdateinseconds", 0.5)
  blocknpcorgasmtags = papyrusutil.stringsplit(JsonUtil.GetStringValue(HentaiEnjoymentConfigFile, "blocknpcorgasmtags", ""), ",")
  npcorgasmresistancedamage = JsonUtil.GetIntValue(RaceOrgasmResistanceDamage, racename, 200)

endfunction

function InitializeHentaiExpressionconfig()
  if IsPlayer
    ExpressionsFile = "HentairimEnjoyment/PCExpressions.json"
  elseif gender == 0 ;Male
    ExpressionsFile = "HentairimEnjoyment/MaleExpressions.json"
  elseif gender == 1 ;female
    ExpressionsFile = "HentairimEnjoyment/FemaleExpressions.json"
  endif
  Blowjoboverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, "blowjobphonemeoverride", ""), ",")
  BrokenOverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, "brokenmodifieroverride", ""), ",")
  TongueOutOverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, "tongueoutphonemeoverride", ""), ",")
  kisoverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, "kisphonemeoverride", ""), ",")
  cunoverride = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, "cunphonemeoverride", ""), ",")
  Masks = papyrusutil.stringsplit(JsonUtil.GetStringValue(MasksFile, "masks", ""), ",")
  Maskslots = papyrusutil.stringsplit(JsonUtil.GetStringValue(MasksFile, "maskslots", ""), ",")
endfunction

int function IntIfElse(bool check, int isTrue, int isFalse)
  if check
    return isTrue
  endif
  return isFalse
endfunction

bool function IsAggressor()
  return IsAggressor
endfunction

Bool function IsBroken()
  return GetBrokenPoints() > 0
endfunction

Bool function IsCowgirl()
  return PenetrationLabel == "SCG" || PenetrationLabel == "FCG" || PenetrationLabel == "SAC" || PenetrationLabel == "FAC"
endfunction

bool function IsCreature()
  return IsCreature
endfunction

Bool function IsCunnilingus()
  return OralLabel == "CUN"
endfunction

Bool function IsEnding()
  return EndingLabel == "ENI" || EndingLabel == "ENO"
endfunction

Bool function IsGettingAnallyPenetrated()
  return PenetrationLabel == "SAP" || PenetrationLabel == "FAP" || PenetrationLabel == "SAC" || PenetrationLabel == "FAC" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

bool function IsGettingFucked()
  string penetrationlbl1
  penetrationlbl1 = HentaiRimTags.PenetrationLabel(animation, stage, 0)
  if isvictim
    ;always getting fucked if victim
    return true
  elseif position > 0 && (penetrationlbl1 == "SCG" || penetrationlbl1 == "FCG" || penetrationlbl1 == "SAC" || penetrationlbl1 == "FAC")
    ;npc getting cowgirl ride
    return true
  elseif iscowgirl()
    return false
  elseif IsgettingPenetrated()
    return true
  elseif IsGettingSuckedoff() && !animation.HasTag("aggressive")
    return true
  else
    return false
  endif
endfunction

Bool function IsGettingStimulated()
  return Stimulationlabel != "LDI"
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

bool function IsOrgasmAllowed()
  return !NoOrgasm && !Thread.DisableOrgasms
endfunction

bool function IsSilent()
  return IsSilent
endfunction

Bool function IsSuckingoffOther()
  return OralLabel == "SBJ" || OralLabel == "FBJ"
endfunction

Bool function IsUnconcious()
  if (animation.HasTag("faint") || animation.HasTag("sleep") || animation.HasTag("necro")) && position == 0
    return true
  else
    return false
  endif
endfunction

bool function IsUsingStrapon()
  return Strapon && ActorRef.IsEquipped(Strapon)
endfunction

bool function IsVictim()
  return IsVictim
endfunction

Bool function IsgettingPenetrated()
  return IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()
endfunction

Bool function IshugePP()
  if stringutil.find(Racename, "Brute") > -1 || stringutil.find(Racename, "Spider") > -1 || stringutil.find(Racename, "Lurker") > -1 || stringutil.find(Racename, "Daedroth") > -1 || stringutil.find(Racename, "Horse") > -1 || stringutil.find(Racename, "Bear") > -1 || stringutil.find(Racename, "Chaurus") > -1 || stringutil.find(Racename, "Dragon") > -1 || Racename == "Frost Atronach" || stringutil.find(Racename, "Giant") > -1 || Racename == "Mammoth" || Racename == "Sabre Cat" || stringutil.find(Racename, "Troll") > -1 || Racename == "Werewolf" || stringutil.find(Racename, "Gargoyle") > -1 || Racename == "Dwarven Centurion" || stringutil.find(Racename, "Ogre") > -1 || Racename == "Ogrim" || Racename == "Nest Ant Flier" || stringutil.find(Racename, "OGrim") > -1
    return True
  endif
  return false
endfunction

Bool function Isintense()
  return stringutil.find(Labelsconcat, "1F") > -1
endfunction

Bool function Isnotintense()
  return !Isintense()
endfunction

function LoadShares()
  DebugMode = Config.DebugMode
  UseLipSync = Config.UseLipSync && !IsCreature
  UseScale = !Config.DisableScale
  racename = actorref.GetRace().GetName()
  Center = Thread.CenterLocation
  Position = Thread.Positions.Find(ActorRef)
  FurnitureStatus = Thread.FurnitureStatus
  RealTime = Thread.RealTime
  SkillBonus = Thread.SkillBonus
  AdjustKey = Thread.AdjustKey
  IsType = Thread.IsType
  LeadIn = Thread.LeadIn
  AnimEvents = Thread.AnimEvents
  SeparateOrgasms = Config.SeparateOrgasms

  ; AnimatingFaction = Config.AnimatingFaction ; TEMP
endfunction

function LockActor()
  if !ActorRef || ActorRef.IsDisabled()
    Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "LockActor()")
    return
  endif

  ; Stop whatever they are doing
  ; SendDefaultAnimEvent()
  ; Start DoNothing package
  ActorUtil.AddPackageOverride(ActorRef, Config.DoNothing, 100, 1)
  ActorRef.SetFactionRank(AnimatingFaction, 1)
  ActorRef.EvaluatePackage()

  ; Remove any unwanted combat effects
  if SKSE.GetPluginVersion("Precision") >= 2000000
    Precision_Utility.ToggleDisableActor(ActorRef, true)
  endif
  ClearEffects()

  ; Attach positioning marker
  if !MarkerRef
    MarkerRef = ActorRef.PlaceAtMe(Config.BaseMarker)
    int cycle
    while !MarkerRef.Is3DLoaded() && cycle < 50
      Utility.Wait(0.1)
      cycle += 1
    endwhile
    if cycle
      Log("Waited [" + cycle + "] cycles for MarkerRef[" + MarkerRef + "]")
    endif
  endif

  ; Disable movement
  if IsPlayer
    int CameraState = Game.GetCameraState()
    Log("- CameraState: " + CameraState, "LockActor()")
    if CameraState < 8 && CameraState != 3
      ;	if Game.GetCameraState() < 8 && Game.GetCameraState() != 3
      Game.ForceThirdPerson()
    endif
    bool CanActivate = Game.IsActivateControlsEnabled()
    Game.DisablePlayerControls(false, false, true, false, false, false, CanActivate, false, 0)

    ; abMovement = true, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = true, abJournalTabs = false, aiDisablePOVType = 0
    ;if !Config.HasSLSO ;SLSO: SexLab disables UI and SLSO don't.
     ; Game.DisablePlayerControls(true, true, true, false, false, false, false, false, 0)
   ; endif
    Game.SetPlayerAIDriven()
    Game.EnablePlayerControls(false, false, true, true, false, false, CanActivate, false, 0)

    ; Enable hotkeys if needed, and disable autoadvance if not needed
    if IsVictim && Config.DisablePlayer
      Thread.AutoAdvance = true
    else
      Thread.AutoAdvance = Config.AutoAdvance
      Thread.EnableHotkeys()
    endif
  else ; ToDo: Find a way to fix the rotation issue of some the dead actors to be able to avoid resurrect them with this.
    ;	If !ActorRef.IsDead()
    ActorRef.SetDontMove(true)
    ActorRef.SetRestrained(true)

    ;	endIf
  endif
  Loc[0] = ActorRef.GetPositionX()
  Loc[1] = ActorRef.GetPositionY()
  Loc[2] = ActorRef.GetPositionZ()
  Loc[3] = ActorRef.GetAngleX()
  Loc[4] = ActorRef.GetAngleY()
  Loc[5] = ActorRef.GetAngleZ()
  ObjectReference CenterRef = Thread.CenterAlias.GetReference()
  if CenterRef != none
    ; Move if actor out of cell
    if CenterRef != ActorRef as ObjectReference
      if ActorRef.GetDistance(CenterRef) > 3000
        Loc[0] = Thread.CenterLocation[0] ; One by one to avoid issues with the arrays
        Loc[1] = Thread.CenterLocation[1]
        Loc[2] = Thread.CenterLocation[2]
        Loc[3] = Thread.CenterLocation[3]
        Loc[4] = Thread.CenterLocation[4]
        Loc[5] = Thread.CenterLocation[5]
        ActorRef.StopTranslation() ; StopTranslation as side effect allow the actor move by the collisions but is required to stop any previous Translation and avoid the OnTranslationComplete.
        ActorRef.MoveTo(CenterRef)
        ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
      endif
    endif
    Log(ActorName + "-CenterRef- Angle:[X:" + CenterRef.GetAngleX() + "Y:" + CenterRef.GetAngleY() + "Z:" + CenterRef.GetAngleZ() + "] Position:[X:" + CenterRef.GetPositionX() + "Y:" + CenterRef.GetPositionY() + "Z:" + CenterRef.GetPositionZ() + "]", "LockActor()")
  endif
  MarkerRef.MoveTo(ActorRef)
  MarkerRef.Enable()
  AttachMarker()

  ; Begin very slowly rotating a small amount to hold position
  if !IsInPosition(ActorRef, MarkerRef, 2.0)
    ActorRef.StopTranslation() ; StopTranslation as side effect allow the actor move by the collisions but is required to stop any previous Translation and avoid the OnTranslationComplete.
    ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
  endif
  Log(ActorName + "-MarkerRef- Angle:[X:" + MarkerRef.GetAngleX() + "Y:" + MarkerRef.GetAngleY() + "Z:" + MarkerRef.GetAngleZ() + "] Position:[X:" + MarkerRef.GetPositionX() + "Y:" + MarkerRef.GetPositionY() + "Z:" + MarkerRef.GetPositionZ() + "]", "LockActor()")
  Log(ActorName + "-ActorRef- Angle:[X:" + ActorRef.GetAngleX() + "Y:" + ActorRef.GetAngleY() + "Z:" + ActorRef.GetAngleZ() + "] Position:[X:" + ActorRef.GetPositionX() + "Y:" + ActorRef.GetPositionY() + "Z:" + ActorRef.GetPositionZ() + "]", "LockActor()")
endfunction

function Log(string msg, string src="")
  msg = "ActorAlias[" + ActorName + "] " + src + " - " + msg
  Debug.Trace("SEXLAB - " + msg)
  if DebugMode
    SexLabUtil.PrintConsole(msg)
    Debug.TraceUser("SexLabDebug", msg)
  endif
endfunction

String function MainNPCTrait()
  return StorageUtil.GetStringValue(None, "MainNPCTrait")
endfunction

String function NPCRace(int posi=1)
  string actorrace = ActorsInPlay[posi].GetRace().getname()
  printdebug("Primary Race Fucking pC : " + actorrace)
  return actorrace
endfunction

Int function NPCTraitEnjoymentChangesOverride(Float value)
  if NPCTrait == Aggressive
    if Isintense() && (IsGivingAnalPenetration() || IsGivingVaginalPenetration() || IsGettingSuckedoff())
      value = value * 1.8
    else
      value = value * 0.8
    endif
  elseif NPCTrait == Masochist
    if (animation.hastag("Cowgirl") || animation.hastag("femdom") || animation.hastag("amazon")) && (IsGivingAnalPenetration() || IsGivingVaginalPenetration() || IsGettingSuckedoff())
      value = value * 2.3
    else
      value = value * 0.7
    endif
  elseif NPCTrait == Sadistic
    if (IsGivingAnalPenetration() || IsGivingVaginalPenetration() || IsGettingSuckedoff()) && (Animation.hastag("Forced") || Animation.hastag("Dirty") || Animation.hastag("Rape") || Animation.hastag("Molag"))
      value = value * 2
    else
      value = value * 0.8
    endif
  elseif NPCTrait == ShortFused
    if Orgasms >= 1
      value = value * 0.5
    endif
  elseif NPCTrait == ThiccLoving
    if playerref.getweight() >= 70
      value = value * 1.5
    endif
  elseif NPCTrait == Timid
    value = value * 0.9
  elseif NPCTrait == Weak
    if IsGivingAnalPenetration() || IsGivingVaginalPenetration()
      value = value * 0.8
    endif
  elseif NPCTrait == RapeLoving
    if PCIsVictim() && (IsGivingAnalPenetration() || IsGivingVaginalPenetration() || IsGettingSuckedoff())
      value = value * 1.7
    endif
  elseif NPCTrait == ClothingFetishist
    if GetPCBodyArmorType() == "Clothing"
      value = value * 1.4
    endif
  elseif NPCTrait == LightArmorFetishist
    if GetPCBodyArmorType() == "Light"
      value = value * 1.4
    endif
  elseif NPCTrait == HeavyArmorFetishist
    if GetPCBodyArmorType() == "Heavy"
      value = value * 1.4
    endif
  elseif NPCTrait == PussyLoving
    if IsGivingAnalPenetration() || IsGivingVaginalPenetration()
      value = value * 1.4
    endif
  elseif NPCTrait == AnalLoving
    if IsGettingAnallyPenetrated() || IsGivingAnalPenetration()
      value = value * 1.4
    endif
  elseif NPCTrait == TheMilker
    if PCIsLactating()
      value = value * 2.4
    endif
  elseif NPCTrait == FutaLoving
    if HasSchlong(PlayerRef)
      value = value * 1.5
    endif
  elseif NPCTrait == Uncummanable
    value = 0
  elseif NPCTrait == OralLoving
    if IsGettingSuckedoff() || IsSuckingoffOther()
      Value = Value * 1.7
    endif
  elseif NPCTrait == SexuallyFrustrated
    Value = Value * 1.3
  elseif NPCTrait == NutGobbler
    if IsSuckingoffOther()
      Value = Value * 1.2
    endif
  elseif NPCTrait == Cowgirl
    if iscowgirl()
      Value = Value * 2
    endif
  elseif NPCTrait == MissCumalot || NPCTrait == SirCumalot
    if IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated() || IsGettingSuckedoff()
      Value = Value * 2.3
    else
      Value = Value * 1.5
    endif
  elseif NPCTrait == InHeat
    Value = Value * 1.5
  endif
  return math.ceiling(Value)
endfunction

Int function NPCTraitStartingEnjoyementOverride(Float value)
  if NPCTrait == ShortFused
    value = value * 2
  elseif NPCTrait == Strong
    value = value * 1.2
  elseif NPCTrait == Weak
    value = value * 0.8
  elseif NPCTrait == Impatient
    value = value * 1.2
  endif
  return math.ceiling(Value)
endfunction

function MoveToStartingPosition()
  if FurnitureStatus[1] <= 1
    int RelativePosition = Position
    Actor CenterActor = Thread.CenterRef as actor
    if CenterActor
      int CenterPosition = Thread.Positions.Find(CenterActor)
      if CenterPosition != -1
        RelativePosition = Position - CenterPosition
        if RelativePosition < 0
          RelativePosition = Thread.Positions.length + RelativePosition
        endif
      endif
      Log("Position:" + Position + "; RelativePosition:" + RelativePosition + "; CenterPosition:" + CenterPosition, "MoveToStartingPosition()")
    endif

    ; pre-move to starting position near other actors
    Offsets[0] = 0.0
    Offsets[1] = 0.0
    Offsets[2] = 5.0
    Offsets[3] = 0.0
    float ActorLength = ActorRef.GetLength()

    ; Starting position
    if RelativePosition == 1
      Offsets[0] = (ActorLength * 0.75)
      Offsets[3] = 180.0
    elseif RelativePosition == 2
      Offsets[1] = -(ActorLength * 0.75)
      Offsets[3] = 90.0
    elseif RelativePosition == 3
      Offsets[1] = (ActorLength * 0.75)
      Offsets[3] = -90.0
    elseif RelativePosition == 4
      Offsets[0] = -(ActorLength * 0.75)
    endif
  endif
  OffsetCoords(Loc, Center, Offsets)
  if MarkerRef
    MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
    MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])
    if MarkerRef.GetDistance(ActorRef) > 80
      Thread.ApplyFade()
    endif

    ;	ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
    ;	ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
    AttachMarker()
  endif
  if !MarkerRef || !IsInPosition(ActorRef, MarkerRef, 2.0)
    ActorRef.StopTranslation()
    ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
  endif
  if !IsPlayer || !ActorRef.IsOnMount()
    ActorRef.QueueNiNodeUpdate()
  endif
endfunction

bool function NeedsOrgasm()
  return GetFullEnjoyment() >= 100
endfunction

String function OralLabel()
  return OralLabel
endfunction

;orgasm stuff
function Orgasm(float experience=0.0)
  if experience == -2
    LastOrgasm = Math.Abs(RealTime[0] - 11)
    DoOrgasm(true)
  elseif ActorFullEnjoyment >= 90
    if experience == -1
      LastOrgasm = Math.Abs(RealTime[0] - 11)
    endif
    if Math.Abs(RealTime[0] - LastOrgasm) > 10.0
      OrgasmEffect()
    endif
  endif
endfunction

function OrgasmEffect()
endfunction

function OverrideStrip(bool[] SetStrip)
  if SetStrip.Length != 33
    Thread.Log("Invalid strip override bool[] - Must be length 33 - was " + SetStrip.Length, "OverrideStrip()")
  else
    StripOverride = SetStrip
  endif
endfunction

bool function ParseForbiddenTags(string[] TagList, bool RequireAll=true)
  return (RequireAll && HasAllForbiddenTag(TagList)) || (!RequireAll && HasOneForbiddenTag(TagList))
endfunction

bool function ParseRequiredTags(string[] TagList, bool RequireAll=true)
  return (RequireAll && HasAllRequiredTag(TagList)) || (!RequireAll && HasOneRequiredTag(TagList))
endfunction

Bool function PCIsLactating()
  if isDependencyReady("IVDTHentaiLactate.esp")
    Armor MilkR = Game.GetFormFromFile(0x812, "IVDTHentaiLactate.esp") as Armor
    Armor MilkL = Game.GetFormFromFile(0x813, "IVDTHentaiLactate.esp") as Armor
    return playerref.IsEquipped(MilkL) || playerref.IsEquipped(MilkR)
  endif
  return false
endfunction

Bool function PCIsVictim()
  return playerref == thread.VictimRef
endfunction

;PC Trait Enjoyment Modifiers from main npc trait
Int function PCTraitEnjoymentChangesOverride(float value)
  if MainNPCTrait() == "Skilled+"
    if IsGettingAnallyPenetrated() || IsGettingSuckedoff() || IsGettingVaginallyPenetrated()
      value = value * 1.4
    endif
  elseif MainNPCTrait() == "Strong+"
    if IsGettingAnallyPenetrated() || IsGettingSuckedoff() || IsGettingVaginallyPenetrated()
      value = value * 1.3
    endif
  elseif MainNPCTrait() == "Weak+"
    if IsGettingAnallyPenetrated() || IsGettingSuckedoff() || IsGettingVaginallyPenetrated()
      value = value * 0.8
    endif
  elseif MainNPCTrait() == "+The Penetrator"
    if IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()
      value = value * 1.7
    endif
  elseif MainNPCTrait() == "+The Nut Gobbler"
    if IsGettingSuckedoff()
      value = value * 2
    endif
  elseif MainNPCTrait() == "+Cowgirl"
    if (IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()) && animation.hastag("Cowgirl")
      value = value * 1.8
    endif
  endif
  return math.ceiling(Value)
endfunction

function PathToCenter()
endfunction

String function PenetrationLabel()
  return PenetrationLabel
endfunction

function PlayLouder(Sound SFX, ObjectReference FromRef, float Volume)
  if SFX && FromRef && FromRef.Is3DLoaded() && Volume > 0.0
    if Volume > 0.5
      Sound.SetInstanceVolume(SFX.Play(FromRef), 1.0)
    else
      Sound.SetInstanceVolume(SFX.Play(FromRef), Volume)
    endif
  endif
endfunction

bool function PregnancyRisk()
  int cumID = Animation.GetCumID(Position, Stage)
  return cumID > 0 && (cumID == 1 || cumID == 4 || cumID == 5 || cumID == 7) && IsFemale && !MalePosition && Thread.IsVaginal
endfunction

; ------------------------------------------------------- ;
; --- State Restricted                                --- ;
; ------------------------------------------------------- ;
; Ready
function PrepareActor()
endfunction

function PrintDebug(string Contents="")
  if EnablePrintDebug > 0
    hentairim_log.WriteLog("(" + Actorname + ")" + Contents, 0, "hentairim_sslActor")
    miscutil.printconsole("hentairim_sslActor  : (" + Actorname + ")" + Contents)
  endif
endfunction

function RefreshActor()
endfunction

function RefreshExpression()
  if !ActorRef || IsCreature || !ActorRef.Is3DLoaded() || ActorRef.IsDisabled()
    RefreshExpressionDelay = 0.0
    return
  endif

  ;SLGP - Moved to expresion because sometimes only this line need 0.5 seconds
  Debug.SendAnimationEvent(ActorRef, "SOSBend" + Schlong) ;SLGP - Moved to expresion because sometimes only this line need 0.5 seconds

  ;SLGP - Moved to expresion because sometimes only this line need 0.5 seconds
  if StorageUtil.GetIntValue(PlayerRef, "Sexlab.ManualMouthOpen", Missing=0) >= 1 || StorageUtil.GetIntValue(None, "DisableSLSOExpression") == 1
    Utility.Wait(1.0)
  elseif OpenMouth
    sslBaseExpression.OpenMouth(ActorRef)
    Utility.Wait(1.0)
    if Config.RefreshExpressions && Expression && Expression != none && !ActorRef.IsDead() && !ActorRef.IsUnconscious() ;SLGP - && ActorRef.GetActorValue("Health") > 1.0
      int Strength = CalcReaction()
      Expression.Apply(ActorRef, Strength, BaseSex)
      Log("Expression.Applied(" + Expression.Name + ") Strength:" + Strength + "; OpenMouth:" + OpenMouth)
    endif
  else
    if Expression && Expression != none && !ActorRef.IsDead() && !ActorRef.IsUnconscious() ;SLGP - && ActorRef.GetActorValue("Health") > 1.0
      int Strength = CalcReaction()
      sslBaseExpression.CloseMouth(ActorRef)
      Expression.Apply(ActorRef, Strength, BaseSex)
      Log("Expression.Applied(" + Expression.Name + ") Strength:" + Strength + "; OpenMouth:" + OpenMouth)
    elseif sslBaseExpression.IsMouthOpen(ActorRef)
      sslBaseExpression.CloseMouth(ActorRef)
    endif
  endif
  RefreshExpressionDelay = 0.0
endfunction

function RefreshLoc()
endfunction

function RegisterEvents()
  string e = Thread.Key("")

  ; Quick Events
  RegisterForModEvent(e + "Animate", "SendAnimation")
  RegisterForModEvent(e + "Orgasm", "OrgasmEffect")
  RegisterForModEvent(e + "TravelToCenter", "TravelToCenter")
  RegisterForModEvent(e + "Strip", "Strip")
  RegisterForModEvent(e + "StripActor", "OnActorStrip")
  RegisterForModEvent(e + "RefreshActorExpression", "OnActorRefreshExpression")

  ; Sync Events
  RegisterForModEvent(e + "Prepare", "PrepareActor")
  RegisterForModEvent(e + "Sync", "SyncActor")
  RegisterForModEvent(e + "Reset", "ResetActor")
  RegisterForModEvent(e + "Refresh", "RefreshActor")
  RegisterForModEvent(e + "Startup", "StartAnimating")
endfunction

function UnEquipTongue()
  if !isplayer
    return
  endif
  if HasMFEE && MFEEAddTongue
    MFEEAddTongue = false
  else
    if EquippedTongue()
      actorref.unEquipItem(FHUTongueTypeArmor, abSilent=true)
    endif
  endif
endfunction

function ResetHentaiExpressionGroup()
  int type
  Type = Utility.Randomint(1, 3)
  if type == 1
    ExpressionGroup = "a"
  elseif type == 2
    ExpressionGroup = "b"
  elseif type == 3
    ExpressionGroup = "c"
  endif
  lookdirection = utility.Randomint(8, 10)
endfunction

function ResolveStrapon(bool force=false)
  if Strapon
    if UseStrapon && !ActorRef.IsEquipped(Strapon)
      ActorRef.EquipItem(Strapon, true, true)
    elseif !UseStrapon && ActorRef.IsEquipped(Strapon)
      ActorRef.UnequipItem(Strapon, true, true)
    endif
  endif
endfunction

function RestoreActorDefaults()
  ; Make sure  have actor, can't afford to miss this block
  resetexpressions()
  if !ActorRef
    ActorRef = GetReference() as Actor
    if !ActorRef
      Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "RestoreActorDefaults()")
      return ; No actor, reset prematurely or bad call to alias
    endif
  endif

  ; Reset to starting scale
  if UseScale ;SLGP && ActorScale > 0.0 && (ActorScale != 1.0 || AnimScale != 1.0)
    ActorRef.SetScale(ActorScale)
  endif
  if !IsCreature
    ; Reset voicetype
    ; if ActorVoice && ActorVoice != BaseRef.GetVoiceType()
    ; 	BaseRef.SetVoiceType(ActorVoice)
    ; endIf
    ; Remove strapon
    if Strapon && !HadStrapon ; && Strapon != HadStrapon
      ActorRef.RemoveItem(Strapon, 1, true)
    endif

    ; Reset expression
    if ActorRef.Is3DLoaded() && !(ActorRef.IsDisabled() || ActorRef.IsDead() || ActorRef.GetActorValue("Health") < 1.0)
      if Expression
        sslBaseExpression.CloseMouth(ActorRef)
      elseif sslBaseExpression.IsMouthOpen(ActorRef)
        sslBaseExpression.CloseMouth(ActorRef)
      endif

      ;ActorRef.ClearExpressionOverride()
      ;ActorRef.ResetExpressionOverrides()
      ;sslBaseExpression.ClearMFG(ActorRef)
    endif
  endif

  ; Player specific actions
  if IsPlayer
    ; Remove player from frostfall exposure exception
    FormList FrostExceptions = Config.FrostExceptions
    if FrostExceptions
      FrostExceptions.RemoveAddedForm(Config.BaseMarker)
    endif
    Thread.RemoveFade()
  endif

  ; Remove SOS erection
  Debug.SendAnimationEvent(ActorRef, "SOSFlaccid")

  ; Clear from animating faction
  ActorRef.SetFactionRank(AnimatingFaction, -1)
  ActorRef.RemoveFromFaction(AnimatingFaction)
  ActorUtil.RemovePackageOverride(ActorRef, Config.DoNothing)
  ActorRef.EvaluatePackage()

  ;	Log(ActorName +"- Angle:[X:"+ActorRef.GetAngleX()+"Y:"+ActorRef.GetAngleY()+"Z:"+ActorRef.GetAngleZ()+"] Position:[X:"+ActorRef.GetPositionX()+"Y:"+ActorRef.GetPositionY()+"Z:"+ActorRef.GetPositionZ()+"]", "RestoreActorDefaults()")
endfunction

; ------------------------------------------------------- ;
; --- Actor Manipulation                              --- ;
; ------------------------------------------------------- ;
function SLGP_Voice()
  if ActorRef && ActorRef.Is3DLoaded()
    if IsCreature
      SetVoice(Config.VoiceSlots.PickByRaceKey(sslCreatureAnimationSlots.GetRaceKey(BaseRef.GetRace())), IsForcedSilent)
    else
      SetVoice(Config.VoiceSlots.PickVoice(ActorRef), IsForcedSilent)
    endif
    if Voice
      log("Voice[" + Voice.Name + "]")
    endif
  endif
endfunction

function SLSO_Animating_Moan()
  String File = "/SLSO/Config.json"
  if voice != none
    if !IsFemale
      Voice.PlayMoan(ActorRef, math.ceiling(ActorFullEnjoyment), IsVictim, UseLipSync)

      ;Log("  !IsFemale " + ActorName)
    elseif ((JsonUtil.GetIntValue(File, "sl_voice_player") == 0 && IsPlayer) || (JsonUtil.GetIntValue(File, "sl_voice_npc") == 0 && !IsPlayer))
      Voice.PlayMoan(ActorRef, math.ceiling(ActorFullEnjoyment), IsVictim, UseLipSync)

      ;Log("  IsFemale " + ActorName)
    endif
  endif
endfunction

;Sexlab "patching", for interaluse only
int function SLSO_DoOrgasm_Conditions(bool Forced)
  String File = "/SLSO/Config.json"
  if LeadIn && JsonUtil.GetIntValue(File, "condition_leadin_orgasm") == 0
    Log(ActorName + " Orgasm blocked, orgasms disabled at LeadIn/Foreplay Stage")
    return -1
  endif
  if IsPlayer && (JsonUtil.GetIntValue(File, "condition_player_orgasm") == 0)
    Log("Orgasm blocked, player is forbidden to orgasm")
    return -2
  endif
  if JsonUtil.GetIntValue(File, "condition_ddbelt_orgasm") == 0
    if zadDeviousBelt != none
      if ActorRef.WornHasKeyword(zadDeviousBelt)
        Log("Orgasm blocked, " + ActorName + " has DD belt prevent orgasming")
        return -3
      endif
    endif
  endif
  if !Animation.HasTag("Estrus")
    if IsVictim
      if JsonUtil.GetIntValue(File, "condition_victim_orgasm") == 0
        Log("Orgasm blocked, " + ActorName + " is victim, victim forbidden to orgasm")
        return -4
      elseif JsonUtil.GetIntValue(File, "condition_victim_orgasm") == 2
        if (OwnSkills[Stats.kLewd] * 10) as int < Utility.RandomInt(0, 100)
          Log("Orgasm blocked, " + ActorName + " is victim, victim didn't pass lewd check to orgasm")
          return -5
        endif
      endif
    endif
    if !IsAggressor
      if !(Animation.HasTag("69") || Animation.HasTag("Masturbation")) || Thread.Positions.Length == 2
        if !IsCreature && BaseRef.GetSex() != Gender
          if JsonUtil.GetIntValue(File, "condition_futa_orgasm") == 1
            if Position == 0 && !(Animation.HasTag("Vaginal") || Animation.HasTag("Anal") || Animation.HasTag("Cunnilingus") || Animation.HasTag("Fisting") || Animation.HasTag("Lesbian"))
              Log(ActorName + " Orgasm blocked, female pos 0, conditions not met, no HasTag(Vaginal,Anal,Cunnilingus,Fisting)")
              return -11
            elseif Position != 0 && !(Animation.HasTag("Vaginal") || Animation.HasTag("Anal") || Animation.HasTag("Boobjob") || Animation.HasTag("Blowjob") || Animation.HasTag("Handjob") || Animation.HasTag("Footjob"))
              Log(ActorName + " Orgasm blocked, male pos > 0, conditions not met, no HasTag(Vaginal,Anal,Boobjob,Blowjob,Handjob,Footjob)")
              return -12
            endif
          endif
        elseif IsFemale
          if JsonUtil.GetIntValue(File, "condition_female_orgasm") == 1
            if Position == 0 && !(Animation.HasTag("Vaginal") || Animation.HasTag("Anal") || Animation.HasTag("Cunnilingus") || Animation.HasTag("Fisting") || Animation.HasTag("Lesbian"))
              Log(ActorName + " Orgasm blocked, female pos 0, conditions not met, no HasTag(Vaginal,Anal,Cunnilingus,Fisting)")
              return -6
            endif
          endif
        elseif IsMale
          if JsonUtil.GetIntValue(File, "condition_male_orgasm") == 1
            if Position == 0 && !(Animation.HasTag("Anal") || Animation.HasTag("Fisting"))
              Log(ActorName + " Orgasm blocked, male pos 0, conditions not met, no HasTag(Anal,Fisting)")
              return -7
            elseif Position != 0 && !(Animation.HasTag("Vaginal") || Animation.HasTag("Anal") || Animation.HasTag("Boobjob") || Animation.HasTag("Blowjob") || Animation.HasTag("Handjob") || Animation.HasTag("Footjob"))
              Log(ActorName + " Orgasm blocked, male pos > 0, conditions not met, no HasTag(Vaginal,Anal,Boobjob,Blowjob,Handjob,Footjob)")
              return -8
            endif
          endif
        endif
      endif
    endif
    if StorageUtil.GetIntValue(ActorRef, "slso_forbid_orgasm") == 1
      Log("Orgasm blocked, " + ActorName + " is forbidden to orgasm (by other mod)")
      return -9
    endif
  endif
  if StorageUtil.GetIntValue(ActorRef, "slso_forbid_orgasm") == 1
    int Seid = ModEvent.Create("SexLabOrgasmSeparateDenied")
    if Seid
      ModEvent.PushForm(Seid, ActorRef)
      ModEvent.PushInt(Seid, Thread.tid)
      ModEvent.Send(Seid)
    endif
    Log("Orgasm blocked, " + ActorName + " is forbidden to orgasm")
    return -10
  endif
  return 0
endfunction

function SLSO_DoOrgasm_Moan()
  String File = "/SLSO/Config.json"
  if !IsSilent
    if !IsFemale
      PlayLouder(Voice.GetSound(100, false), ActorRef, Config.VoiceVolume)

      ;replace SL actor voice with SLSO, if voice options enabled in SLSO
    elseif ((JsonUtil.GetIntValue(File, "sl_voice_player") == 0 && IsPlayer) || (JsonUtil.GetIntValue(File, "sl_voice_npc") == 0 && !IsPlayer))
      PlayLouder(Voice.GetSound(100, false), ActorRef, Config.VoiceVolume)
    endif
  endif
  PlayLouder(OrgasmFX, MarkerRef, Config.SFXVolume)
endfunction

function SLSO_DoOrgasm_Multiorgasm()
  String File = "/SLSO/Config.json"
  if BaseSex == 0
    if JsonUtil.GetIntValue(File, "condition_male_orgasm_penalty") == 1
      ;male wont be able to orgasm 2nd time if slso game() and sla disabled
      ;Log("male FullEnjoyment MOD["+(FullEnjoyment-FullEnjoyment / (1 + GetOrgasmCount()*2)) as int+"]")
      if (Position == 0 && !(Animation.HasTag("Anal") || Animation.HasTag("Fisting"))) || Position != 0
        if (!IsAggressor || IsPlayer)
          GenderMod = (1 + GetOrgasmCount() * 2)
        endif
      endif
    endif
  endif

  ;if (Utility.RandomInt(0, 100) > (JsonUtil.GetIntValue(File, "sl_multiorgasmchance") + ((OwnSkills[Stats.kLewd]*10) as int) - 10 * Orgasms)) || BaseSex != 1
  if (Utility.RandomInt(0, 100) > (JsonUtil.GetIntValue(File, "sl_multiorgasmchance") + ((OwnSkills[Stats.kLewd] * JsonUtil.GetIntValue(File, "sl_multiorgasmchance_curve")) as int) - 10 * Orgasms)) || BaseSex != 1
    ;orgasm
    LastOrgasm = Math.Abs(SexLabUtil.GetCurrentGameRealTime())

    ; Reset enjoyment build up, if using separate orgasms option
    if IsSkilled
      if IsVictim
        BaseEnjoyment += ((BestRelation - 3) + PapyrusUtil.ClampInt((OwnSkills[Stats.kLewd] - OwnSkills[Stats.kPure]) as int, -6, 6)) * Utility.RandomInt(5, 10)
      else
        if IsAggressor
          BaseEnjoyment += (-1 * ((BestRelation - 4) + PapyrusUtil.ClampInt(((Skills[Stats.kLewd] - Skills[Stats.kPure]) - (OwnSkills[Stats.kLewd] - OwnSkills[Stats.kPure])) as int, -6, 6))) * Utility.RandomInt(5, 10)
        else
          BaseEnjoyment += (BestRelation + PapyrusUtil.ClampInt((((Skills[Stats.kLewd] + OwnSkills[Stats.kLewd]) * 0.5) - ((Skills[Stats.kPure] + OwnSkills[Stats.kPure]) * 0.5)) as int, 0, 6)) * Utility.RandomInt(5, 10)
        endif
      endif
    else
      if IsVictim
        BaseEnjoyment += (BestRelation - 3) * Utility.RandomInt(5, 10)
      else
        if IsAggressor
          BaseEnjoyment += (-1 * (BestRelation - 4)) * Utility.RandomInt(5, 10)
        else
          BaseEnjoyment += (BestRelation + 3) * Utility.RandomInt(5, 10)
        endif
      endif
    endif

    ;reset slso enjoyment build up
    BonusEnjoyment = 0
  else
    ;slso multiorgasm for females (rnd + lewdness), reset timer
    LastOrgasm = Math.Abs(SexLabUtil.GetCurrentGameRealTime() - 9)
  endif
endfunction

function SLSO_DoOrgasm_SexLabOrgasmSeparate()
  if SeparateOrgasms
    String File = "/SLSO/Config.json"
    if !IsPlayer && (IsAggressor || (!IsAggressor && JsonUtil.GetIntValue(File, "condition_consensual_orgasm") == 1))
      if JsonUtil.GetIntValue(File, "game_enabled") == 1
        if GetOrgasmCount() == Thread.Get_minimum_aggressor_orgasm_Count()
          if Utility.RandomInt(0, 100) < JsonUtil.GetIntValue(File, "condition_chance_minimum_aggressor_orgasm_increase")
            Thread.Set_minimum_aggressor_orgasm_Count(Thread.Get_minimum_aggressor_orgasm_Count() + 1)
            Log("Aggressor - " + ActorName + " increased required orgasms to: " + Thread.Get_minimum_aggressor_orgasm_Count())
          endif
        endif
      endif
    endif
    int Seid = ModEvent.Create("SexLabOrgasmSeparate")
    if Seid
      ModEvent.PushForm(Seid, ActorRef)
      ModEvent.PushInt(Seid, Thread.tid)
      ModEvent.Send(Seid)
    endif
  endif
endfunction

int function SLSO_GetEnjoyment()
  if !ActorRef
    Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "GetEnjoyment()")
    FullEnjoyment = 0
    return 0
  elseif !IsSkilled
    ;run default sexlab enjoyment if: enabled in slso mcm, more than 2 actors, thread has no player or npc_game(), game() disabled
    if SLSOGetEnjoymentCheck1
      if SLSOGetEnjoymentCheck2
        FullEnjoyment = (PapyrusUtil.ClampFloat(((RealTime[0] - StartedAt) + 1.0) / 5.0, 0.0, 40.0) + ((Stage as float / StageCount as float) * 60.0)) as int
      else
        FullEnjoyment = (PapyrusUtil.ClampFloat(((RealTime[0] - StartedAt) + 1.0) / 5.0, 0.0, 40.0)) as int
      endif
    endif
  else
    if Position == 0
      Thread.RecordSkills()
      Thread.SetBonuses()
    endif
    if SLSOGetEnjoymentCheck1
      if SLSOGetEnjoymentCheck2
        FullEnjoyment = BaseEnjoyment + CalcEnjoyment(SkillBonus, Skills, LeadIn, IsFemale, (RealTime[0] - StartedAt), Stage, StageCount)
      else
        FullEnjoyment = BaseEnjoyment + CalcEnjoyment(SkillBonus, Skills, LeadIn, IsFemale, (RealTime[0] - StartedAt), 1, StageCount)
      endif
      if FullEnjoyment < 0
        FullEnjoyment = 0

        ;elseIf FullEnjoyment > 100
        ;	FullEnjoyment = 100
      endif
    endif
  endif
  int SLSO_Enjoyment = FullEnjoyment - QuitEnjoyment

  ;int SLSO_Enjoyment = FullEnjoyment - BaseEnjoyment
  ;Log("SLSO_GetEnjoyment: SLSO_Enjoyment["+SLSO_Enjoyment+"] / FullEnjoyment["+FullEnjoyment+"] / QuitEnjoyment["+QuitEnjoyment+"] / BaseEnjoyment["+BaseEnjoyment+"]")
  if SLSO_Enjoyment > 0
    return SLSO_Enjoyment
  endif
  return 0

  ;return SLSO_Enjoyment - BaseEnjoyment
endfunction

function SLSO_Initialize()
  ;SLSO
  ; Flags
  EstrusForcedEnjoymentMods = false
  bslaExhibitionist = false

  ; Integers
  BonusEnjoyment = 0
  ActorFullEnjoyment = 0
  slaExhibitionistNPCCount = 0

  ; Floats
  MasturbationMod = 1.0
  slaActorArousalMod = 1.0
  ExhibitionistMod = 1.0
  GenderMod = 1.0

  ; Factions
  slaArousal = None
  slaExhibitionist = None

  ; Keywords
  zadDeviousBelt = None
  thread.Set_minimum_aggressor_orgasm_Count(-1)
endfunction

function SLSO_StartAnimating()
  if !(ActorRef && ActorRef.Is3DLoaded())
    log("SLSO_StartAnimating FAILED by invalid actor or no3D")
    return
  endif
  String File = "/SLSO/Config.json"
  BonusEnjoyment = 0
  if Game.GetModByName("SexLabAroused.esm") != 255
    slaArousal = Game.GetFormFromFile(0x3FC36, "SexLabAroused.esm") As Faction
  endif
  if Game.GetModByName("Devious Devices - Assets.esm") != 255
    zadDeviousBelt = Game.GetFormFromFile(0x3330, "Devious Devices - Assets.esm") As Keyword
  endif
  bool SLSO_GAME_enabled = (JsonUtil.GetIntValue(File, "game_enabled") == 1 && Thread.HasPlayer) || (JsonUtil.GetIntValue(File, "game_npc_enabled", 0) == 1 && !Thread.HasPlayer)

  ;GetEnjoyment() condi checks
  ;to enable default sexlab enjoyment gains if true
  if JsonUtil.GetIntValue(File, "sl_passive_enjoyment") == 1 || !SLSO_GAME_enabled
    SLSOGetEnjoymentCheck1 = true
  else
    SLSOGetEnjoymentCheck1 = false
  endif
  if JsonUtil.GetIntValue(File, "sl_stage_enjoyment") == 1 || !SLSO_GAME_enabled
    SLSOGetEnjoymentCheck2 = true
  else
    SLSOGetEnjoymentCheck2 = false
  endif
  if utility.randomfloat(0, 0.5) >= 0.5 && chancetostickouttongueduringattacking < 10 && chancetostickouttongueduringintense < 10
    DisableChanceforAutotongue = true
  endif
endfunction

; ------------------------------------------------------- ;
; --- Animation Loop                                  --- ;
; ------------------------------------------------------- ;
function SendAnimation()
endfunction

function SendDefaultAnimEvent(bool Exit=False)
  Debug.SendAnimationEvent(ActorRef, "AnimObjectUnequip")
  if !IsCreature
    Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
  elseif ActorRaceKey != ""
    if ActorRaceKey == "Dragons"
      Debug.SendAnimationEvent(ActorRef, "FlyStopDefault") ; for Dragons only
      Utility.Wait(0.1)
      Debug.SendAnimationEvent(ActorRef, "Reset") ; for Dragons only
    elseif ActorRaceKey == "Hagravens"
      Debug.SendAnimationEvent(ActorRef, "ReturnToDefault") ; for Dragons only
      if Exit
        Utility.Wait(0.1)
        Debug.SendAnimationEvent(ActorRef, "Reset") ; for Dragons only
      endif
    elseif ActorRaceKey == "Chaurus" || ActorRaceKey == "ChaurusReapers"
      Debug.SendAnimationEvent(ActorRef, "FNISDefault") ; for dwarvenspider and chaurus without time bettwen.
      if Exit
        ;		Utility.Wait(0.1)
        ;		Debug.SendAnimationEvent(ActorRef, "ReturnToDefault")
      endif
    elseif ActorRaceKey == "DwarvenSpiders"
      Debug.SendAnimationEvent(ActorRef, "ReturnToDefault")
      if Exit
        ;		Utility.Wait(0.1)
        ;		Debug.SendAnimationEvent(ActorRef, "FNISDefault") ; for dwarvenspider and chaurus
      endif
    elseif ActorRaceKey == "Draugrs" || ActorRaceKey == "Seekers" || ActorRaceKey == "DwarvenBallistas" || ActorRaceKey == "DwarvenSpheres" || ActorRaceKey == "DwarvenCenturions"
      Debug.SendAnimationEvent(ActorRef, "ForceFurnExit") ; for draugr, trolls daedras and all dwarven exept spiders
    elseif ActorRaceKey == "Trolls"
      Debug.SendAnimationEvent(ActorRef, "ReturnToDefault")
      if Exit
        Utility.Wait(0.1)
        Debug.SendAnimationEvent(ActorRef, "ForceFurnExit") ; the troll need this afther "ReturnToDefault" to allow the attack idles
      endif
    elseif ActorRaceKey == "Chickens" || ActorRaceKey == "Rabbits" || ActorRaceKey == "Slaughterfishes"
      Debug.SendAnimationEvent(ActorRef, "ReturnDefaultState") ; for chicken, hare and slaughterfish
      if Exit
        Utility.Wait(0.1)
        Debug.SendAnimationEvent(ActorRef, "ReturnToDefault")
      endif
    elseif ActorRaceKey == "Werewolves" || ActorRaceKey == "VampireLords"
      Debug.SendAnimationEvent(ActorRef, "IdleReturnToDefault") ; for Werewolves and VampirwLords
    else
      Debug.SendAnimationEvent(ActorRef, "ReturnToDefault") ; the rest creature-animal
    endif
  elseif Exit
    Debug.SendAnimationEvent(ActorRef, "ReturnDefaultState") ; for chicken, hare and slaughterfish before the "ReturnToDefault"
    Debug.SendAnimationEvent(ActorRef, "ReturnToDefault") ; the rest creature-animal
    Debug.SendAnimationEvent(ActorRef, "FNISDefault") ; for dwarvenspider and chaurus
    Debug.SendAnimationEvent(ActorRef, "IdleReturnToDefault") ; for Werewolves and VampirwLords
    Debug.SendAnimationEvent(ActorRef, "ForceFurnExit") ; for Trolls afther the "ReturnToDefault" and draugr, daedras and all dwarven exept spiders
    Debug.SendAnimationEvent(ActorRef, "Reset") ; for Hagravens afther the "ReturnToDefault" and Dragons
  endif
  Utility.Wait(0.2)
endfunction

; ------------------------------------------------------- ;
; --- Load/Clear Alias For Use                        --- ;
; ------------------------------------------------------- ;
bool function SetActor(Actor ProspectRef)
  if !ProspectRef || ProspectRef != GetReference()
    Log("ERROR: SetActor(" + ProspectRef + ") on State:'Ready' is not allowed")
    return false ; Failed to set prospective actor into alias
  endif
  Float Start_time = Utility.GetCurrentRealTime()

  ; Init actor alias information
  ActorRef = ProspectRef
  BaseRef = ActorRef.GetLeveledActorBase()
  ActorName = BaseRef.GetName()

  ; ActorVoice = BaseRef.GetVoiceType()
  BaseSex = BaseRef.GetSex()
  isRealFemale = BaseSex == 1
  Gender = ActorLib.GetGender(ActorRef)
  IsMale = Gender == 0
  IsFemale = Gender == 1
  IsFuta = ActorLib.GetTrans(ActorRef) != -1
  IsCreature = Gender >= 2
  IsTracked = Config.ThreadLib.IsActorTracked(ActorRef)
  IsPlayer = ActorRef == PlayerRef
  RaceEditorID = MiscUtil.GetRaceEditorID(BaseRef.GetRace())
  ;avoid conflict
  UseFaceItems = false
  ; Player and creature specific
  if IsPlayer
    Thread.HasPlayer = true
  endif
  if IsCreature
    Thread.CreatureRef = BaseRef.GetRace()
    if sslCreatureAnimationSlots.HasRaceKey("Canines") && sslCreatureAnimationSlots.HasRaceID("Canines", RaceEditorID)
      ActorRaceKey = "Canines"
    else
      ActorRaceKey = sslCreatureAnimationSlots.GetRaceKeyByID(RaceEditorID)
    endif
  elseif !IsPlayer
    Stats.SeedActor(ActorRef)
  endif

  ; Actor's Adjustment Key
  ActorKey = RaceEditorID
  if !Config.RaceAdjustments
    if IsCreature
      if ActorRaceKey
        ActorKey = ActorRaceKey
      endif
    else
      ActorKey = "Humanoid"
    endif
  endif
  if IsCreature
    ActorKey += "C"
  endif
  if !IsCreature || Config.UseCreatureGender
    if isRealFemale
      ActorKey += "F"
    else
      ActorKey += "M"
    endif
  endif
  NioScale = 1.0
  float TempScale
  String Node = "NPC"
  if NetImmerse.HasNode(ActorRef, Node, False)
    ; Remove SexLab "NPC" node if present by error
    if Config.HasNiOverride
      Log(self, Node + ":TransformKeys " + NiOverride.GetNodeTransformKeys(ActorRef, False, isRealFemale, Node))
      if NiOverride.RemoveNodeTransformScale(ActorRef, False, isRealFemale, "NPC", "SexLab.esm")
        NiOverride.UpdateNodeTransform(ActorRef, False, isRealFemale, "NPC")
        Log("UpdateNodeTransform")
      endif
    endif
    TempScale = NetImmerse.GetNodeScale(ActorRef, Node, False)
    if TempScale > 0
      ;	Log(self, "NPC:NodeScale("+TempScale+")")
      NioScale = NioScale * TempScale
    endif

    ;	float[] Rotation = new float[3]
    ;	if NetImmerse.GetNodeLocalRotationEuler(ActorRef, Node, Rotation, False)
    ;		Log(Node +" Rotation:"+Rotation+" Rotate:"+NetImmerse.SetNodeLocalRotationEuler(ActorRef, Node, Utility.CreateFloatArray(3, 0.0), False))
    ;	endIf
  endif
  Node = "NPC Root [Root]"
  if NetImmerse.HasNode(ActorRef, Node, False)
    TempScale = NetImmerse.GetNodeScale(ActorRef, Node, False)
    if TempScale > 0
      ;	Log(self, "NPC Root [Root]:NodeScale("+TempScale+")")
      NioScale = NioScale * TempScale
    endif

    ;	float[] Rotation = new float[3]
    ;	if NetImmerse.GetNodeLocalRotationEuler(ActorRef, Node, Rotation, False)
    ;		Log(Node +" Rotation:"+Rotation+" Rotate:"+NetImmerse.SetNodeLocalRotationEuler(ActorRef, Node, Utility.CreateFloatArray(3, 0.0), False))
    ;	endIf
  endif
  
if !Config.ScaleActors
    float ActorScalePlus
    ActorScalePlus = ((GetScale() * 25) + 0.5) as int

    ;	Log(self, "ActorScalePlus("+ActorScalePlus+")")
    if ActorScalePlus != 25.0
      ActorKey += ActorScalePlus as int
    endif
  endif
  if !IsCreature
    ; Detect Actors Tags
    if ActorRef.IsDead() || ActorRef.IsUnconscious() || ActorRef.GetActorValue("Health") <= 1.0
      AddRequiredTag("Necro")
      SetRestricted(true)
    endif
    if Config.ManageZadFilter
      if ActorRef.WornHasKeyword(zad_Lockable)
        if ActorRef.WornHasKeyword(zad_DeviousYoke)
          AddRequiredTag("Yoke")
          SetRestricted(true)
        elseif ActorRef.WornHasKeyword(zad_DeviousYokeBB)
          AddRequiredTag("BBYoke")
          SetRestricted(true)
        elseif ActorRef.WornHasKeyword(zad_DeviousArmbinder) || ActorRef.WornHasKeyword(zad_DeviousArmbinderElbow)
          AddRequiredTag("Armbinder")
          SetRestricted(true)
        elseif ActorRef.WornHasKeyword(zad_DeviousPetSuit)
          AddRequiredTag("PetSuit")
          SetRestricted(true)
        elseif ActorRef.WornHasKeyword(zad_DeviousHeavyBondage) || ActorRef.WornHasKeyword(zad_DeviousStraitJacket)
          AddRequiredTag("Bound")
          SetRestricted(true)
        endif
        if !ActorRef.WornHasKeyword(zad_PermitAnal) && (ActorRef.WornHasKeyword(zad_DeviousBelt) || ActorRef.WornHasKeyword(zad_DeviousSuit) || ActorRef.WornHasKeyword(zad_DeviousPlugAnal))
          AddForbiddenTag("Anal")
        endif
        if !ActorRef.WornHasKeyword(zad_PermitVaginal) && (ActorRef.WornHasKeyword(zad_DeviousBelt) || ActorRef.WornHasKeyword(zad_DeviousSuit) || ActorRef.WornHasKeyword(zad_DeviousPlugVaginal))
          AddForbiddenTag("Vaginal")
        endif
        if ActorRef.WornHasKeyword(zad_DeviousGag)
          ForceOpenMouth = true
          if !ActorRef.WornHasKeyword(zad_DeviousGagPanel) && !ActorRef.WornHasKeyword(zad_PermitOral)
            AddForbiddenTag("Oral")
            AddForbiddenTag("Blowjob")
          endif
        endif
        if ActorRef.WornHasKeyword(zad_DeviousBra) || ActorRef.WornHasKeyword(zad_DeviousSuit)
          AddForbiddenTag("Breast")
        endif
      endif
    endif
    if Config.ManageZazFilter
      if ActorRef.WornHasKeyword(zbfWornDevice)
        if ActorRef.WornHasKeyword(zbfAnimHandsYoke)
          AddRequiredTag("Yoke")
          SetRestricted(true)
        elseif ActorRef.WornHasKeyword(zbfAnimHandsArmbinder) || ActorRef.WornHasKeyword(zbfAnimHandsElbows)
          AddRequiredTag("Armbinder")
          SetRestricted(true)
        elseif ActorRef.WornHasKeyword(zbfAnimHandsWrists)
          AddRequiredTag("Bound")
          SetRestricted(true)
        endif
        if ActorRef.WornHasKeyword(zbfWornBelt) || ActorRef.WornHasKeyword(zbfWornPreventAnal)
          AddForbiddenTag("Anal")
        endif
        if ActorRef.WornHasKeyword(zbfWornBelt) || ActorRef.WornHasKeyword(zbfWornPreventVaginal)
          AddForbiddenTag("Vaginal")
        endif
        if ActorRef.WornHasKeyword(zbfWornGag)
          ForceOpenMouth = true
        endif
        if ActorRef.WornHasKeyword(zbfWornPreventOral) || (!ActorRef.WornHasKeyword(zbfWornPermitOral) && (ActorRef.WornHasKeyword(zbfWornHood) || ActorRef.WornHasKeyword(zbfWornGag)))
          AddForbiddenTag("Oral")
          AddForbiddenTag("Blowjob")
        endif
        if ActorRef.WornHasKeyword(zbfWornBra) || ActorRef.WornHasKeyword(zbfWornPreventBreast)
          AddForbiddenTag("Breast")
        endif
      endif
    endif
  endif
  ; Set base voice/loop delay
  if IsCreature
    BaseDelay = 3.0
  elseif IsFemale
    BaseDelay = Config.FemaleVoiceDelay
  else
    BaseDelay = Config.MaleVoiceDelay
  endif
  VoiceDelay = BaseDelay
  ExpressionDelay = Config.ExpressionDelay * BaseDelay
  if OpenMouthScale < 0.1 
    OpenMouthScale = 1.0
  endif
  ; Init some needed arrays
  Flags = new int[5]
  Offsets = new float[4]
  Loc = new float[6]

  ; Ready
  RegisterEvents()

  ;SLGP Events
  RegisterForModEvent("SLGP_Voice_" + self, "SLGP_Voice")
  RegisterForModEvent("SLGP_Strip_" + self, "Strip")
  RegisterForModEvent("SLGP_SLSO_Start_" + self, "SLSO_StartAnimating")
  RegisterForModEvent("SLGP_Expression_" + self, "RefreshExpression")

  ;SLGP Events
  ;SLGP Move LockActor() to SetActor()
  ;LockActor() ;SLGP Move LockActor() to SetActor()

  ;SLGP Move LockActor() to SetActor()
  TrackedEvent("Added")
  GoToState("Ready")
  Log(self, "SetActor(" + ActorRef + ")")

  ;log("SLGP SetActor+LockActor Total Time:" + (Utility.GetCurrentRealTime() - Start_time) )
  return true
endfunction

function SetAdjustKey(string KeyVar)
  if ActorRef
    AdjustKey = KeyVar
    Position = Thread.Positions.Find(ActorRef)
  endif
endfunction

function SetBrokenPoints(int value)
  if !actorref.isinfaction(HentairimBroken)
    actorref.addtofaction(HentairimBroken)
  endif
  int NewBrokenValue = Value
  if NewBrokenValue <= 0
    NewBrokenValue = 0
  elseif NewBrokenValue > 127
    NewBrokenValue = 127
  endif
  actorref.SetFactionRank(HentairimBroken, NewBrokenValue)
endfunction

function SetEndAnimationEvent(string EventName)
  EndAnimEvent = EventName
endfunction

function SetExpression(sslBaseExpression ToExpression)
  if ToExpression
    Expression = ToExpression
  endif
endfunction

function SetForbiddenTags(string TagList)
  AddForbiddenTags(PapyrusUtil.StringSplit(TagList))
endfunction

bool function AddForbiddenTag(string Tag)
  if Tag != "" && ForbiddenTags.Find(Tag) == -1
    int i = ForbiddenTags.Find("")
    if i != -1
      ForbiddenTags[i] = Tag
    else
      ForbiddenTags = PapyrusUtil.PushString(ForbiddenTags, Tag)
    endif
    return true
  endif
  return false
endfunction

function AddForbiddenTags(string[] TagList)
  int i = TagList.Length
  while i
    i -= 1
    AddForbiddenTag(TagList[i])
  endwhile
endfunction

bool function AddRequiredTag(string Tag)
  if Tag != "" && RequiredTags.Find(Tag) == -1
    int i = RequiredTags.Find("")
    if i != -1
      RequiredTags[i] = Tag
    else
      RequiredTags = PapyrusUtil.PushString(RequiredTags, Tag)
    endif
    return true
  endif
  return false
endfunction

function AddRequiredTags(string[] TagList)
  int i = TagList.Length
  while i
    i -= 1
    AddRequiredTag(TagList[i])
  endwhile
endfunction

function SetFurnitureRef(ObjectReference akFurniture, bool Restrictive=true)
  FurnitureRef = akFurniture
  if FurnitureRef != none
    NoUndress = Restrictive
    NoRedress = Restrictive
    Restricted = Restrictive
  endif
endfunction

function SetOpenMouthScale(float ToScale=1.0)
  OpenMouthScale = PapyrusUtil.ClampFloat(ToScale, 0.1, 2.0)
  Log("OpenMouthScale:" + OpenMouthScale, "SetOpenMouthScale(" + ToScale + ")")
endfunction

function SetOrgasmCount(int SetOrgasms=0)
  if SetOrgasms >= 0
    Orgasms = SetOrgasms
  endif
endfunction

function SetResistance(int value)
  printdebug("setting resistance : " + value)
  if enableaggressionresistance != 1 || IsBroken() ; dont need to add resistance damage after broken
    return
  endif
  int NewResistance = value
  if !actorref.isinfaction(HentairimResistance)
    actorref.addtofaction(HentairimResistance)
    actorref.SetFactionRank(HentairimResistance, 100)
  endif
  if NewResistance > 100
    printdebug("Resistance reached cap")
    NewResistance = 100
  endif
  Actorref.SetFactionRank(HentairimResistance, NewResistance)
endfunction

function SetRequiredTags(string TagList)
  AddRequiredTags(PapyrusUtil.StringSplit(TagList))
endfunction

Bool function SetRestricted(bool value=true)
  NoUndress = value
  NoRedress = value
  if Restricted != value
    Restricted = value
    return true
  endif
  return false
endfunction

function SetStartAnimationEvent(string EventName, float PlayTime)
  StartAnimEvent = EventName
  StartWait = PapyrusUtil.ClampFloat(PlayTime, 0.1, 10.0)
endfunction

function SetStrapon(Form ToStrapon)
  if Strapon && !HadStrapon && Strapon != ToStrapon
    ActorRef.RemoveItem(Strapon, 1, true)
  endif
  Strapon = ToStrapon
  if GetState() == "Animating"
    SyncThread()
  endif
endfunction

function SetVictim(bool Victimize)
  Actor[] Victims = Thread.Victims

  ; Make victim
  if Victimize && (!Victims || Victims.Find(ActorRef) == -1)
    Victims = PapyrusUtil.PushActor(Victims, ActorRef)
    Thread.Victims = Victims
    Thread.IsAggressive = true

    ; Was victim but now isn't, update thread
  elseif IsVictim && !Victimize
    Victims = PapyrusUtil.RemoveActor(Victims, ActorRef)
    Thread.Victims = Victims
    if !Victims || Victims.Length < 1
      Thread.IsAggressive = false
    endif
  endif
  IsVictim = Victimize
endfunction

function SetVoice(sslBaseVoice ToVoice=none, bool ForceSilence=false)
  IsForcedSilent = ForceSilence
  if ToVoice && IsCreature == ToVoice.Creature
    Voice = ToVoice
  endif
endfunction

function Setup()
  ; Reset function Libraries - SexLabQuestFramework
  if !Config || !ActorLib || !Stats
    Form SexLabQuestFramework = Game.GetFormFromFile(0xD62, "SexLab.esm")
    if SexLabQuestFramework
      Config = SexLabQuestFramework as sslSystemConfig
      ActorLib = SexLabQuestFramework as sslActorLibrary
      Stats = SexLabQuestFramework as sslActorStats
    endif
  endif
  PlayerRef = Game.GetPlayer()
  Thread = GetOwningQuest() as sslThreadController
  OrgasmFX = Config.OrgasmFX
  DebugMode = Config.DebugMode
  AnimatingFaction = Config.AnimatingFaction
endfunction

function Snap()
endfunction

; Animating
function StartAnimating()
endfunction

function StartWaitIdle(string ResetAnim="IdleForceDefaultState")
  if Config.WaitIdles && !IsCreature && !Restricted
    float Distance = 3000
    ObjectReference WaitRef = Thread.CenterAlias.GetReference()
    if WaitRef == ActorRef as ObjectReference && Thread.ActorCount > 1
      WaitRef = Thread.Positions[IntIfElse(Position != 0, 0, 1)]
    endif
    if WaitRef
      Distance = ActorRef.GetDistance(WaitRef)
    endif
    int Chance = Utility.RandomInt(0, 10)
    if IsType[0] && IsVictim && Distance < 3000.0
      if Chance > 4 && Distance > 800.0
        ActorRef.PushActorAway(ActorRef, 0.001)
      elseif Chance > 6 && Distance > 200.0
        Debug.SendAnimationEvent(ActorRef, "IdleNervous")
      elseif Chance > 4 && Distance > 200.0
        Debug.SendAnimationEvent(ActorRef, "IdleCowering")
      elseif Chance > 8 && Distance < 80.0
        Debug.SendAnimationEvent(ActorRef, "IdleCowering")
      elseif Chance > 6 && Distance < 80.0
        Debug.SendAnimationEvent(ActorRef, "IdleWarmArms")
      elseif Chance > 4 && Distance < 80.0
        Debug.SendAnimationEvent(ActorRef, "ZapKneelDisplay")
      else
        Debug.SendAnimationEvent(ActorRef, "IdleSurrender")
      endif
    elseif Config.HasZazDevice && IsType[0] && Distance < 80.0
      if Chance > 4
        Debug.SendAnimationEvent(ActorRef, "ZapDomHandHips")
      endif
    elseif Config.HasSLAroused && Chance > 4
      if IsFemale && (!IsFuta || ActorRef.GetWornForm(Armor.GetMaskForSlot(32)) != none)
        Debug.SendAnimationEvent(ActorRef, "Aroused_Idle1")
      elseif ActorRef.GetWornForm(Armor.GetMaskForSlot(32)) == none
        Debug.SendAnimationEvent(ActorRef, "Aroused_Idle2")
      endif
    elseif Config.HasZazDevice && (IsFemale || IsFuta) && Distance < 80.0
      if Chance > 8
        Debug.SendAnimationEvent(ActorRef, "ZapWriHorny01")
      elseif Chance > 6
        Debug.SendAnimationEvent(ActorRef, "ZapWriHorny02")
      elseif Chance > 4
        Debug.SendAnimationEvent(ActorRef, "ZapWriHorny03")
      else
        Debug.SendAnimationEvent(ActorRef, ResetAnim)
      endif
    else
      Debug.SendAnimationEvent(ActorRef, ResetAnim)
    endif
  endif
endfunction

function StopAnimating(bool Quick=false, string ResetAnim="IdleForceDefaultState")
  if !ActorRef || !ActorRef.Is3DLoaded()
    Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "StopAnimating(" + Quick + ")")
    return
  endif

  ; Disable free camera, if in it
  ; if IsPlayer
  ; 	MiscUtil.SetFreeCameraState(false)
  ; endIf
  ; Clear possibly troublesome effects
  bool Resetting = GetState() == "Resetting" || !Quick
  if Resetting
    int StageOffset = Stage
    if StageOffset > StageCount
      StageOffset = StageCount
    endif
    if AdjustKey && AdjustKey != ""
      Offsets = Animation.PositionOffsets(Offsets, AdjustKey, Position, StageOffset, FurnitureStatus[1])
    endif
    float OffsetZ = 10.0
    if Offsets[2] < 1.0 ; Fix for animation default missaligned
      Offsets[2] = OffsetZ ; hopefully prevents some users underground/teleport to giant camp problem?
    endif
    OffsetCoords(Loc, Center, Offsets)
    float PositionX = ActorRef.GetPositionX()
    float PositionY = ActorRef.GetPositionY()
    float AngleZ = ActorRef.GetAngleZ()
    float Rotate = AngleZ
    String Node = "NPC Root [Root]"
    if !IsCreature
      Node = "MagicEffectsNode"
    endif
    if NetImmerse.HasNode(ActorRef, Node, False)
      PositionX = NetImmerse.GetNodeWorldPositionX(ActorRef, Node, False)
      PositionY = NetImmerse.GetNodeWorldPositionY(ActorRef, Node, False)
      float[] Rotation = new float[3]
      if NetImmerse.GetNodeLocalRotationEuler(ActorRef, Node, Rotation, False)
        Rotate = AngleZ + Rotation[2]
        if Rotate >= 360.0
          Rotate = Rotate - 360.0
        elseif Rotate < 0.0
          Rotate = Rotate + 360.0
        endif
        Log(Node + " Rotation:" + Rotation + " AngleZ:" + AngleZ + " Rotate:" + Rotate)
      endif
    endif
    ActorRef.SetVehicle(none)
    if ActorRef.Is3DLoaded() && (!IsPlayer || Game.GetCameraState() > 3)
      ActorRef.SetAnimationVariableBool("bHumanoidFootIKDisable", true)
    endif
    MarkerRef.SetPosition(PositionX, PositionY, Loc[2])
    MarkerRef.SetAngle(Loc[3], Loc[4], Rotate)

    ;	ActorRef.SetPosition(PositionX, PositionY, Loc[2])
    ActorRef.StopTranslation() ; StopTranslation as side effect allow the actor move by the collisions but is required to stop any previous Translation and avoid the OnTranslationComplete.
    ActorRef.TranslateTo(PositionX, PositionY, Loc[2], Loc[3], Loc[4], Rotate, 50000, 0.0)
  else
    ActorRef.SetVehicle(none)
    if ActorRef.Is3DLoaded() && (!IsPlayer || Game.GetCameraState() > 3)
      ActorRef.SetAnimationVariableBool("bHumanoidFootIKDisable", true)
    endif
  endif

  ; Stop animevent
  if IsCreature
    ; Reset creature idle
    SendDefaultAnimEvent(Resetting)
    Utility.Wait(0.1)
    if ResetAnim != "IdleForceDefaultState" && ResetAnim != ""
      Debug.SendAnimationEvent(ActorRef, ResetAnim)
      Utility.Wait(0.1)
      if DoRagdoll && (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3))
        ActorRef.PushActorAway(ActorRef, 0.001)
      endif
    elseif Resetting && ResetAnim == "IdleForceDefaultState"
      if ActorRef.IsDead() || ActorRef.IsUnconscious()
        if (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3))
          ActorRef.SetDontMove(true)

          ;	ActorRef.SetRestrained(true)
          ActorRef.KillSilent()

          ;	Utility.Wait(0.1)
          ;	Debug.SendAnimationEvent(ActorRef, "DeathAnimation")
          ;	Utility.Wait(0.1)
          ;	Debug.SendAnimationEvent(ActorRef, "ragdoll")
        else
          Debug.SendAnimationEvent(ActorRef, "DeathAnimation")
          Utility.Wait(0.1)
          Debug.SendAnimationEvent(ActorRef, "ragdoll")
        endif
      elseif DoRagdoll && (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3))
        if ActorRef.GetActorValue("Health") <= 1.0
          ActorRef.KillSilent()
        elseif (ActorRaceKey == "Spiders" || ActorRaceKey == "LargeSpiders" || ActorRaceKey == "GiantSpiders")
          ActorRef.PushActorAway(ActorRef, 0.001) ; Temporal Fix TODO:
        endif
      endif
    endif
  else
    ; Reset NPC/PC Idle Quickly
    if ResetAnim != "IdleForceDefaultState" && ResetAnim != ""
      Debug.SendAnimationEvent(ActorRef, ResetAnim)
      Utility.Wait(0.1)

      ; Ragdoll NPC/PC if enabled and not in TFC
      if Resetting && DoRagdoll && (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3))
        ActorRef.PushActorAway(ActorRef, 0.001)
      endif
    elseif !Resetting
      Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
    else
      if FurnitureRef != none
        Thread.SetFurnitureIgnored(false)
        Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
        Utility.Wait(0.1)
      elseif ActorRef.IsDead() || ActorRef.IsUnconscious()
        Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
        Utility.Wait(0.1)
        if (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3))
          ;	ActorRef.SetDontMove(true)
          ActorRef.SetRestrained(true)
          ActorRef.KillSilent()

          ;	Utility.Wait(0.1)
          ;	Debug.SendAnimationEvent(ActorRef, "IdleSoupDeath")
          ;	Utility.Wait(0.1)
          ;	Debug.SendAnimationEvent(ActorRef, "ragdoll")
        else
          Debug.SendAnimationEvent(ActorRef, "IdleSoupDeath")
          Utility.Wait(0.1)
          Debug.SendAnimationEvent(ActorRef, "ragdoll")
        endif
      elseif DoRagdoll && (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3))
        ;TODO: Detect the real actor position based on Node property intead of the Animation Tags
        if ActorRef.GetActorValue("Health") <= 1.0
          ;TODO: chek the inventory items to make sure that will be the same once be killed
          ActorRef.KillSilent()
        elseif Animation && (Animation.HasTag("Furniture") || (Animation.HasTag("Standing") && !IsType[0]))
          Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
        elseif IsType[0] && IsVictim && Animation && Animation.HasTag("Rape") && !Animation.HasTag("Standing") && (!IsPlayer || (IsPlayer && Game.GetCameraState() != 3)) && (Animation.HasTag("DoggyStyle") || Animation.HasTag("Missionary") || Animation.HasTag("Laying"))
          ActorRef.PushActorAway(ActorRef, 0.001)
        ;/	elseIf Animation.HasTag("DoggyStyle") && IsVictim
					Debug.SendAnimationEvent(ActorRef, "IdleCowering")
					Utility.Wait(1.0)
					Debug.SendAnimationEvent(ActorRef, "IdleChairExitStart")
				elseIf Animation.HasTag("Kneeling") && IsVictim
					Debug.SendAnimationEvent(ActorRef, "IdleCowering")
					Utility.Wait(1.0)
					Debug.SendAnimationEvent(ActorRef, "IdleChairExitStart")
				elseIf IsType[0] && IsVictim
					Debug.SendAnimationEvent(ActorRef, "IdleWarmArms")
					Utility.Wait(1.0)
					Debug.SendAnimationEvent(ActorRef, "IdleChairExitStart")
					Utility.Wait(1.0)
					Debug.SendAnimationEvent(ActorRef, "IdleBedExitStart")	
					Utility.Wait(1.0)
					Debug.SendAnimationEvent(ActorRef, "IdleSurrender")
				elseIf Animation.HasTag("Laying") || (Animation.HasTag("Cowgirl") && !IsVictim) || (Animation.HasTag("Missionary") && !IsVictim)
					Debug.SendAnimationEvent(ActorRef, "IdleSleepNod")
					Utility.Wait(1.0)
					Debug.SendAnimationEvent(ActorRef, "IdleBedExitStart")	
				elseIf Animation.HasTag("Cowgirl") || Animation.HasTag("Missionary")
					Debug.SendAnimationEvent(ActorRef, "IdleLayDown")	
			/; else
          Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
        endif
      else
        Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
      endif
    endif
  endif

  ;	Log(ActorName +"-MarkerRef- Angle:[X:"+MarkerRef.GetAngleX()+"Y:"+MarkerRef.GetAngleY()+"Z:"+MarkerRef.GetAngleZ()+"] Position:[X:"+MarkerRef.GetPositionX()+"Y:"+MarkerRef.GetPositionY()+"Z:"+MarkerRef.GetPositionZ()+"]", "StopAnimating("+Quick+")")
  ;	Log(ActorName +"-ActorRef- Angle:[X:"+ActorRef.GetAngleX()+"Y:"+ActorRef.GetAngleY()+"Z:"+ActorRef.GetAngleZ()+"] Position:[X:"+ActorRef.GetPositionX()+"Y:"+ActorRef.GetPositionY()+"Z:"+ActorRef.GetPositionZ()+"]", "StopAnimating("+Quick+")")
  PlayingSA = "SexLabSequenceExit2"
  PlayingAE = "SexLabSequenceExit2"
endfunction

function Strip()
  if !ActorRef || IsCreature || IsStripping
    Log("Strip skipped: ActorRef=" + ActorRef + " IsCreature=" + IsCreature + " IsStripping=" + IsStripping)
    return
  endif
  Log("Strip flags: DoUndress=" + DoUndress + " NoUndress=" + NoUndress + " Config.UndressAnimation=" + Config.UndressAnimation)
  while IsStripping
    Utility.WaitMenuMode(2.0)
  endwhile
  IsStripping = True
  Log("Strip start: " + ActorRef)
  ;LogWornArmor("Strip start")
  BodySwitchtoLewdArmor()
  InitializeAddNPCTongue()
  ; Select stripping array
  bool[] Strip
  if StripOverride.Length == 33 && !AmmoChecked
    Strip = StripOverride
    Strip = PapyrusUtil.PushBool(Strip, Config.GetStrip(IsFemale, Thread.UseLimitedStrip(), IsType[0], IsVictim)[33])
  elseif StripOverride.Length == 34
    Strip = StripOverride
  else
    Strip = Config.GetStrip(IsFemale, Thread.UseLimitedStrip(), IsType[0], IsVictim)
  endif
  Log("Strip: " + Strip)

  ; Ammo
  if Strip.Length > 33 && Strip[33]
    if !AmmoChecked
      AmmoChecked = true
    else
      ;	Strip[33] = False
      Strip = PapyrusUtil.ResizeBoolArray(Strip, 33)
    endif
  endif

  ; Strip and store stripped items
  Equipment = PapyrusUtil.MergeFormArray(Equipment, ActorLib.StripSlots(ActorRef, Strip, DoUndress, true), true)
  Log("Equipment: " + Equipment)
  ForceUnequipBodySlot("Strip post")
  IsStripping = False
  ;LogWornArmor("Strip end")
  Log("Strip end: " + ActorRef)

  ; Suppress NiOverride High Heels
  if Config.RemoveHeelEffect && ActorRef.GetWornForm(0x00000080)
    UpdateNiOHeelEffect()
  endif
  
endfunction

function LogWornArmor(string context)
  if !ActorRef
    return
  endif
  int[] slots = new int[22]
  slots[0] = 30
  slots[1] = 31
  slots[2] = 32
  slots[3] = 33
  slots[4] = 34
  slots[5] = 35
  slots[6] = 36
  slots[7] = 37
  slots[8] = 38
  slots[9] = 39
  slots[10] = 40
  slots[11] = 41
  slots[12] = 42
  slots[13] = 43
  slots[14] = 44
  slots[15] = 45
  slots[16] = 46
  slots[17] = 47
  slots[18] = 48
  slots[19] = 49
  slots[20] = 50
  slots[21] = 52
  int i = 0
  while i < slots.Length
    Armor worn = ActorRef.GetWornForm(Armor.GetMaskForSlot(slots[i])) as Armor
    if worn
      Log("Worn[" + context + "]: slot " + slots[i] + " -> " + worn)
    endif
    i += 1
  endwhile
endfunction

function ForceUnequipBodySlot(string context)
  if !ActorRef || IsCreature || IsPlayer || !(IsMale || IsFuta)
    Log("ForceUnequip skipped[" + context + "]: ActorRef=" + ActorRef + " IsCreature=" + IsCreature + " IsPlayer=" + IsPlayer + " IsMale=" + IsMale + " IsFuta=" + IsFuta + " NoUndress=" + NoUndress + " Config.UndressAnimation=" + Config.UndressAnimation)
    return
  endif
  Armor worn = ActorRef.GetWornForm(Armor.GetMaskForSlot(32)) as Armor
  if worn && worn != Config.NudeSuit
    Log("ForceUnequip[" + context + "]: slot 32 -> " + worn)
    ActorRef.UnEquipItem(worn, abSilent=true)
  endif
  Utility.WaitMenuMode(0.1)
  Armor wornRetry = ActorRef.GetWornForm(Armor.GetMaskForSlot(32)) as Armor
  if wornRetry && wornRetry != Config.NudeSuit
    Log("ForceUnequip retry[" + context + "]: slot 32 -> " + wornRetry)
    ActorRef.UnEquipItem(wornRetry, abSilent=true)
  endif
endfunction

bool function HasBodyClothesEquipped()
  if !ActorRef
    return false
  endif
  Armor body = ActorRef.GetWornForm(Armor.GetMaskForSlot(32)) as Armor
  if body
    ;Log("Strip check body slot: " + body + " NudeSuit=" + Config.NudeSuit)
  endif
  if body && body != Config.NudeSuit
    return true
  endif
  Armor underwear = ActorRef.GetWornForm(Armor.GetMaskForSlot(52)) as Armor
  if underwear
    ;Log("Strip check underwear slot: " + underwear + " NudeSuit=" + Config.NudeSuit)
  endif
  if underwear && underwear != Config.NudeSuit
    return true
  endif
  return false
endfunction

bool function UpdateNiOHeelEffect(bool Forced=false)
  if Config.HasNiOverride && (Forced || !NiOHeelLock)
    while NiOHeelLock
      Log("NiOHeelLock", "UpdateNiOHeelEffect(" + Forced + ")")
      Utility.WaitMenuMode(0.2)
    endwhile
    NiOHeelLock = True

    ; Remove NiOverride High Heels and any other position offset
    float[] NioPos = new float[3]
    string[] MOD_OVERRIDE_KEY = NiOverride.GetNodeTransformKeys(ActorRef, False, isRealFemale, "NPC")
    int idx = 0
    bool UpdateNiOPosition = False
    while idx < MOD_OVERRIDE_KEY.Length
      if NiOverride.HasNodeTransformPosition(ActorRef, false, isRealFemale, "NPC", MOD_OVERRIDE_KEY[idx])
        if MOD_OVERRIDE_KEY[idx] == "SexLab.esm"
          ; Remove SexLab Node if present by error
          NiOverride.RemoveNodeTransformPosition(ActorRef, False, isRealFemale, "NPC", MOD_OVERRIDE_KEY[idx])
        else
          float[] KeyPos = NiOverride.GetNodeTransformPosition(ActorRef, False, isRealFemale, "NPC", MOD_OVERRIDE_KEY[idx])
          NioPos[0] = -KeyPos[0]
          NioPos[1] = -KeyPos[1]
          NioPos[2] = -KeyPos[2]
          Log(self, "KeyPos:" + KeyPos + "; MOD_OVERRIDE_KEY:" + MOD_OVERRIDE_KEY[idx])
        endif
        UpdateNiOPosition = True
      endif
      idx += 1
    endwhile
    if UpdateNiOPosition
      if GetState() && GetState() != "Resetting" && PapyrusUtil.CountFloat(NioPos, 0.0) != 3
        Log(NioPos, "UpdateNiOHeelEffect(" + Forced + ")")
        NiOverride.AddNodeTransformPosition(ActorRef, false, isRealFemale, "NPC", "SexLab.esm", NioPos)
      endif
      NiOverride.UpdateNodeTransform(ActorRef, false, isRealFemale, "NPC")
      Log("UpdateNodeTransform")
    endif
    NiOHeelLock = False
    return UpdateNiOPosition
  endif
  return false
endfunction

function SyncActor()
endfunction

function SyncAll(bool Force=false)
endfunction

function SyncLocation(bool Force=false)
endfunction

function SyncThread()
endfunction

; ------------------------------------------------------- ;
; --- System Use                                      --- ;
; ------------------------------------------------------- ;
function TrackedEvent(string EventName)
  if IsTracked
    Thread.SendTrackedEvent(ActorRef, EventName)
  endif
endfunction

function UnStrip()
  if !ActorRef || IsCreature 
    return
  endif
  printdebug("UnStrip: Character" + ActorRef.GetLeveledActorBase().GetName())

  if AnimatingFaction && ActorRef.IsInFaction(AnimatingFaction) 
    printdebug("UnStrip skipped by faction: Character" + ActorRef.GetLeveledActorBase().GetName())
    return
  endif
 
  RestoreArmor()
  UnEquipTongue()
  If (FHUTongueTypeArmor)
     actorref.removeItem(FHUTongueTypeArmor, abSilent=true)
  EndIf

  if Equipment.Length == 0
    return
  endif
  ; Remove nudesuit if present
  int n = ActorRef.GetItemCount(Config.NudeSuit)
  if n > 0
    ActorRef.RemoveItem(Config.NudeSuit, n, true)
  endif

  ; Continue with undress, or am I disabled?
  if !DoRedress
    return ; Fuck clothes, bitch.
  endif

  ; Equip Stripped
  int i = Equipment.Length
  while i
    i -= 1
    if Equipment[i]
      int hand = StorageUtil.GetIntValue(Equipment[i], "Hand", 0)
      if hand != 0
        StorageUtil.UnsetIntValue(Equipment[i], "Hand")
      endif
      ActorRef.EquipItemEx(Equipment[i], hand, false)
    endif
  endwhile
  
endfunction

function UnequipStrapon()
  if Strapon && ActorRef.IsEquipped(Strapon)
    ActorRef.UnequipItem(Strapon, true, true)
  endif
endfunction

function UnlockActor()
  if !ActorRef
    Log(ActorName + "- WARNING: ActorRef if Missing or Invalid", "UnlockActor()")
    return
  endif

  ; Remove from animation faction
  ActorRef.RemoveFromFaction(AnimatingFaction)
  ActorUtil.RemovePackageOverride(ActorRef, Config.DoNothing)
  ActorRef.SetFactionRank(AnimatingFaction, 0)
  ActorRef.EvaluatePackage()
  if SKSE.GetPluginVersion("Precision") >= 2000000
    Precision_Utility.ToggleDisableActor(ActorRef, false)
  endif

  ; Detach positioning marker
  ActorRef.SetVehicle(none)
  if ActorRef.Is3DLoaded() && (!IsPlayer || Game.GetCameraState() > 3)
    ActorRef.SetAnimationVariableBool("bHumanoidFootIKDisable", False)
  endif
  MarkerRef && MarkerRef.Disable()
  ActorRef.StopTranslation()

  ; Enable movement
  if IsPlayer
    Thread.RemoveFade()
    Thread.DisableHotkeys()
    MiscUtil.SetFreeCameraState(false)
    if Config.HasUtilityPlus && !Thread.FastEnd && FurnitureRef != none
      Thread.SetFurnitureIgnored(false)
      ActorUtil.AddPackageOverride(ActorRef, Thread.UseFurniturePackage, 100, 1)
      ActorRef.EvaluatePackage()
      Utility.Wait(2.0)
    endif
    Game.EnablePlayerControls(true, true, true, true, false, false, false, false, 0)
    Game.SetPlayerAIDriven(false)
  else
    ;	If !ActorRef.IsDead()
    ActorRef.SetRestrained(false)
    ActorRef.SetDontMove(false)

    ;	endIf
    if Config.HasUtilityPlus && !Thread.FastEnd && FurnitureRef != none
      Thread.SetFurnitureIgnored(false)
      ActorUtil.AddPackageOverride(ActorRef, Thread.UseFurniturePackage, 100, 1)
      ActorRef.EvaluatePackage()
      Utility.Wait(2.0)
    endif
  endif
  MarkerRef && Log(ActorName + "-MarkerRef- Angle:[X:" + MarkerRef.GetAngleX() + "Y:" + MarkerRef.GetAngleY() + "Z:" + MarkerRef.GetAngleZ() + "] Position:[X:" + MarkerRef.GetPositionX() + "Y:" + MarkerRef.GetPositionY() + "Z:" + MarkerRef.GetPositionZ() + "]", "UnlockActor()")
  Log(ActorName + "-ActorRef- Angle:[X:" + ActorRef.GetAngleX() + "Y:" + ActorRef.GetAngleY() + "Z:" + ActorRef.GetAngleZ() + "] Position:[X:" + ActorRef.GetPositionX() + "Y:" + ActorRef.GetPositionY() + "Z:" + ActorRef.GetPositionZ() + "]", "UnlockActor()")
endfunction

function UpdateEnjoymentandOrgasms()
  ;run this multiple times during update because expressions take time to move
  ;reset orgasm NPC expressions
  printdebug(ActorName + "-ActorRef- TimertoUpdate:" + TimertoUpdate + "Thread.totaltime:" + Thread.totaltime)
  if IsOrgasming && LastOrgasmtime + utility.randomfloat(3.0, 6.0) <= Thread.totaltime
    IsOrgasming = false
  endif
  if TimertoUpdate <= Thread.totaltime
    UpdateHentaiEnjoyment()
    SLSO_Animating_Moan()

    ; Trigger orgasm
    if CalculateFullEnjoyment() >= 100 && ASLalloworgasm() && !NoOrgasm && SeparateOrgasms
      IsOrgasming = true
      OrgasmEffect()
      if NPCTrait == DualShot && !isplayer
        utility.wait(3)
        OrgasmEffect()
      endif
      LastOrgasmtime = Thread.totaltime
    endif
    TimertoUpdate = Thread.totaltime + HentaiEnjoymentGetUpdateSeconds()
  endif
endfunction

function UpdateHentaiEnjoyment()
  ;update variables only if the stage or animation is different
  if LastUpdatedAnimation != Animation || LastUpdatedStage != Stage || LastUpdatedAnimation == none || LastUpdatedStage == 0
    LastUpdatedAnimation = Animation
    LastUpdatedStage = Stage
    ResetHentaiExpressionGroup()
    UpdateLabels(animation, stage, position)
    if IsPlayer
      if IsLeadIN()
        PCEnjoymentChanges = pcldi
      else
        PCEnjoymentChanges = GetEndingEnjoyment() + GetOralEnjoyment() + GetPenetrationEnjoyment() + GetPenisActionEnjoyment() + GetStimulationEnjoyment()
        printdebug("Ending Enjoyment Changes: " + GetEndingEnjoyment())
        printdebug("Oral Enjoyment Changes: " + GetOralEnjoyment())
        printdebug("Penetration Enjoyment Changes: " + GetPenetrationEnjoyment())
        printdebug("Penis Action Enjoyment Changes: " + GetPenisActionEnjoyment())
        printdebug("Stimulation Enjoyment Changes: " + GetStimulationEnjoyment())
        printdebug("Total Enjoyment changes : " + PCEnjoymentChanges)
      endif
    else
      NPCEnjoymentChanges = GetEndingEnjoyment() + GetOralEnjoyment() + GetPenetrationEnjoyment() + GetPenisActionEnjoyment() + GetStimulationEnjoyment()
      if NPCEnjoymentChanges == 0
        NPCEnjoymentChanges = npcldi
      endif
    endif

    ;Apply Broken Multipliers
    if IsBroken() && IsPlayer
      PCEnjoymentChanges = PCEnjoymentChanges * PCisBrokenMultiplier
      printdebug("Broken Multiplier: " + PCEnjoymentChanges)
    endif
    if !IsPlayer && IsBroken()
      NPCEnjoymentChanges = NPCEnjoymentChanges * npcisbrokenmultiplier
    endif

    ;Apply Victim Multipliers
    if IsVictim
      if isplayer
        PCEnjoymentChanges = PCEnjoymentChanges * PCisVictimMultiplier
        printdebug("Victim Multiplier: " + PCEnjoymentChanges)
      else
        NPCEnjoymentChanges = NPCEnjoymentChanges * NPCisVictimMultiplier
      endif
    endif

    ;Apply Huge PP Multipliers.
    if ishugePP() && IsgettingPenetrated()
      if isplayer
        PCEnjoymentChanges = PCEnjoymentChanges * PCReceiveHugePPMultiplier
        printdebug("huge pp Multiplier: " + PCEnjoymentChanges)
      else
        NPCEnjoymentChanges = NPCEnjoymentChanges * NPCWithHugePPMultiplier
      endif
    endif
    int counter = 0

    ;After Orgasms Multiplier
    while counter < Orgasms && NPCTrait != Strong && NPCTrait != CumBuckets ;Cumbuckets and Strong dont lose After Orgasm Enjoyment changes
      if isplayer
        PCEnjoymentChanges = PCEnjoymentChanges * PCafterOrgasmMultiplier
        printdebug("After Orgasm Multiplier: " + PCEnjoymentChanges)
      else
        NPCEnjoymentChanges = NPCEnjoymentChanges * NPCafterOrgasmMultiplier
      endif
      counter = counter + 1
    endwhile

    ;allow arousal changes to update enjoyment despite within same stage
    ;Apply Arousal Modifier
    if isplayer
      PCEnjoymentChanges = AddArousalModifier(PCEnjoymentChanges)
      printdebug("Arousal Orgasm Multiplier: " + PCEnjoymentChanges)
    else
      NPCEnjoymentChanges = AddArousalModifier(NPCEnjoymentChanges)
    endif

    ;Apply Race modifier
    if Thread.Positions.Length > 1
      if isplayer
        PCEnjoymentChanges = AddRaceFuckingPCEnjoymentModifier(PCEnjoymentChanges)
        printdebug("Race Multiplier: " + PCEnjoymentChanges)
      else
        NPCEnjoymentChanges = AddRaceEnjoymentModifier(NPCEnjoymentChanges)
      endif
    endif

    ;Apply NPC Trait Modifiers
    if Thread.Positions.Length > 1
      if NpcTraitRandomAssignment == 1
        if isplayer
          PCEnjoymentChanges = PCTraitEnjoymentChangesOverride(PCEnjoymentChanges)
          printdebug("NPC Trait Multiplier: " + PCEnjoymentChanges)
        else
          NPCEnjoymentChanges = NPCTraitEnjoymentChangesOverride(NPCEnjoymentChanges)
        endif
      endif
    endif
  else
  endif
endfunction

function UpdateLabels(sslBaseAnimation anim, int stageno, int actorpos)
  Stimulationlabel = HentaiRimTags.StimulationLabel(anim, stageno, actorpos)
  PenisActionLabel = HentaiRimTags.PenisActionLabel(anim, stageno, actorpos)
  OralLabel = HentaiRimTags.OralLabel(anim, stageno, actorpos)
  EndingLabel = HentaiRimTags.EndingLabel(anim, stageno, actorpos)
  PenetrationLabel = HentaiRimTags.PenetrationLabel(anim, stageno, actorpos)
  Labelsconcat = "1" + Stimulationlabel + "1" + PenisActionLabel + "1" + OralLabel + "1" + PenetrationLabel + "1" + EndingLabel
endfunction

Armor Function WearingMask(Actor char)
	if MaskSlots.Length == 0
		return None
	endif

	int slotIndex = 0
	while slotIndex < MaskSlots.Length
		Armor wornItem = char.GetWornForm(MaskSlots[slotIndex] as int) as Armor
		if wornItem
			string maskName = wornItem.GetName()
			
			int maskIndex = 0
			while maskIndex < Masks.Length
				if StringUtil.Find(maskName, Masks[maskIndex]) > -1
					return wornItem ; Found matching mask, return it immediately
				endif
				maskIndex += 1
			endwhile
		endif
		slotIndex += 1
	endwhile

	return None ; No mask matched
EndFunction

form function get_form(int id, string filename)
  if Game.GetModbyName(filename) == 255
    return None
  endif
  return Game.GetFormFromFile(id, filename)
endfunction

int function getminresistance()
  if IsPlayer
    return pcmaintainresistancepercentagewhencontrolling
  else
    return npcmaintainresistancepercentagewhencontrolling
  endif
endfunction

bool function has_MagicEffect(actor a, int id, string filename)
  MagicEffect ME = get_form(id, filename) as MagicEffect
  if !ME
    return false
  endif
  return a.HasMagicEffect(ME)
endfunction

bool function has_spell(actor a, int id, string filename)
  spell sp = get_form(id, filename) as spell
  if !sp
    return false
  endif
  return a.HasSpell(sp)
endfunction

Bool function isDependencyReady(String modname)
  int index = Game.GetModByName(modname)
  if index == 255 || index == -1
    return false
  else
    return true
  endif
endfunction

function resetexpressions()
  printdebug("Reset Expressions")
  MfgConsoleFuncExt.resetmfg(actorref)
  if hasmfee || HasMFEEVanillaRace
    MuFacialExpressionExtended.RevertExpression(actorref)
  endif
endfunction

state Animating
  event OnTranslationComplete()
    ;SLGP - Sometimes the TranslateTo NOT put the correct angles and I need verify the angles to correct it
    if IsPlayer && SLGP_Angle_reposition == FALSE
      float difX = Math.Abs(ActorRef.GetAngleX() - Loc[3])
      float difY = Math.Abs(ActorRef.GetAngleY() - Loc[4])
      float difZ = Math.Abs(ActorRef.GetAngleZ() - Loc[5])
      if difX > 1 || difY > 1 || difZ > 1
        SLGP_Angle_reposition = TRUE
        Log("OnTranslationComplete Angle reposition difX:" + difX + " difY:" + difY + " difZ:" + difZ)

        ;SLGP - Sometimes the TranslateTo NOT put the correct angles and execute ANOTHER TranslateTo NOT solve the problem because NOT correct the angles
        ActorRef.SetAngle(Loc[3], Loc[4], Loc[5]) ;SLGP - The only solution i find is call SetAngle and lost some frames
        Utility.Wait(0.1)
      endif
    endif

    ;		Log("OnTranslationComplete")
    Snap()
  endevent

  event OnUpdate()
    if IsVictim
      Role = "v"
    else
      Role = "c"
    endif
    while Utility.IsInMenuMode()
      Utility.WaitMenuMode(1.5)
      StartedAt += 1.2
    endwhile
    if !IsBroken() && HasMFEE && EnabledMFEEAhegao == 1
      MFEEAddAhegao = false
    endif
    if IsSuckingoffOther() && removetongueonblowjob == 1
      UnEquipTongue()
    elseif IsBroken() && HasMFEE && EnabledMFEEAhegao == 1
      UnEquipTongue()
      MFEEAddAhegao = true
    elseif !EquippedTongue()
      int rand = utility.randomint(1, 100)

      ;isplayer
      if (IsBroken() && enableahegao == 1) || (IsCunnilingus() && cunusetongue == 1) || (Isintense() && IsgettingPenetrated() && rand <= chancetostickouttongueduringintense && DisableChanceforAutotongue == false) || ((IsCowgirl() || IsGivingAnalPenetration() || IsGivingVaginalPenetration()) && !IsVictim && rand <= chancetostickouttongueduringattacking && DisableChanceforAutotongue == false)
        EquipTongue()
      endif
    endif

    ; Check if still among the living and able.
    if !ActorRef || ActorRef == none || ActorRef.IsDisabled() || (ActorRef.IsDead() && ActorRef.GetActorValue("Health") < 1.0)
      Thread.EndAnimation(true)
    elseif !ActorRef.Is3DLoaded()
      Log("Actor is out of cell or 3D unloaded - Unable to be animated will be ignored for now")
      ; Loop
      RegisterForSingleUpdate(VoiceDelay * 0.35)
    else
      if GetState() == "Animating"
        UpdateEnjoymentandOrgasms()

        ;-----------------------------START Looking Up Expression Array------------------------------
        if IsUnconcious() && ((HentaiExpressions == 1 && IsPlayer) || (!IsPlayer && HentaiNPCExpressions == 1))
          MfgConsoleFunc.SetModifier(actorref, 0, 100) ;left blink
          MfgConsoleFunc.SetModifier(actorref, 1, 100) ;right blink
          MfgConsoleFunc.SetPhoneme(actorref, 0, 60) ; aah
        elseif ((HentaiExpressions == 1 && IsPlayer) || (!IsPlayer && HentaiNPCExpressions == 1)) && !IsCreature
          LabelGroup = Role + GetHentaiExpression() + ExpressionGroup
          int ExpressionIndex = 0

          ;printdebug(ActorName + " : " + OralTagGroup + " - " + PenetrationTagGroup + " - " + PenisActionTagGroup + " - " + StimulationTagGroup + " - " + EndingTagGroup
          Speed = ExpressionSpeed()
          PhaseLookup = LabelGroup + Phase
          printdebug("Expression Looking up : " + PhaseLookup)
          PhaseExpressionsArr = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, Phaselookup, ""), ",")

          ;-----------------------------START CYCLE RUNNING EXPRESSION PHASES------------------------------
          PhaseExpressionsArr = papyrusutil.stringsplit(JsonUtil.GetStringValue(ExpressionsFile, Phaselookup, ""), ",")
          variance = PhaseExpressionsArr[32] as int
          if PhaseExpressionsArr.length < 32
            miscutil.printconsole(" Expressions :" + phaselookup + " only has " + phaseExpressionsArr.length + "items . it is either incorrectly formatted or missing in the json file.")
          endif

          ;begin updating expressions
          ;-----------------------------------------Set EXPRESSION-----------------------------------------
          ;MFEE is applied differently from the array for MFG values, and overrides the MFG array if have Ahegao and tongue out phoneme for Erin
          if MFEEAddAhegao ;MFEE ahegao also includes broken condition. uses array's expression for variety of face movements
            ;if MfgConsoleFunc.GetExpressionValue(actorref) != 0
            ;	MfgConsoleFuncExt.SetExpression(actorref,0,0)
            ;endif
            if MuFacialExpressionExtended.GetExpressionValueByNumber(actorref, 0, 1) != 100
              MuFacialExpressionExtended.SetExpressionByNumber(actorref, 0, 0, 100) ;ahegao 1
            endif

            ;make sure tongue out and tongue down is not applied to as ahegao already has tongue out and down
            if MuFacialExpressionExtended.GetExpressionValueByNumber(actorref, 8, 0) != 0 || MuFacialExpressionExtended.GetExpressionValueByNumber(actorref, 2, 0) != 0
              MuFacialExpressionExtended.SetExpressionByNumber(actorref, 8, 0, 0) ;tongueout
              MuFacialExpressionExtended.SetExpressionByNumber(actorref, 8, 2, 0) ;tongue down
            endif
          elseif IsBroken() || (IsgettingPenetrated() && MainNPCTrait() == "+The Penetrator")
            PhaseExpressionsArr[31] = BrokenOverride[31]

            ;Apply Craigg's changes
            ;PhaseExpressionsArr[31] = BrokenOverride[31]
            ;if MfgConsoleFunc.GetExpressionValue(actorref) != BrokenOverride[31] as int
            ;	MfgConsoleFuncExt.SetExpression(actorref,BrokenOverride[30] as int,BrokenOverride[31] as int)
            ;	endif
            ;	else ;run with other expression
            ;	if MfgConsoleFunc.GetExpressionValue(actorref) != PhaseExpressionsArr[31] as int
            ;	MfgConsoleFuncExt.SetExpression(actorref,PhaseExpressionsArr[30] as int,PhaseExpressionsArr[31] as int) ;
            ;	endif
          endif

          ;UpdateEnjoymentandOrgasms()
          ;------------------------------------------------Set PHONEME-------------------------------------------------
          ;miscutil.printconsole("ExpressionIndex : "+ ExpressionIndex + "/ IsUnconcious() : " + IsUnconcious() + "/ CurrentPenetrationLvl() : " + CurrentPenetrationLvl())
          while ExpressionIndex <= 15 && (!IsUnconcious() || EquippedTongue())
            int upperlimit = PhaseExpressionsArr[ExpressionIndex] as int * (100 + variance) / 100
            int lowerlimit = PhaseExpressionsArr[ExpressionIndex] as int * (100 - variance) / 100

            ;avoid out of bounds
            if upperlimit > 100
              upperlimit = 100
            endif
            if lowerlimit < 0
              lowerlimit = 0
            endif
            if MFEEAddAhegao
              if ExpressionIndex != 1 ;&& MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != 0
                ;	MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex,0 , 0)
                PhaseExpressionsArr[ExpressionIndex] = 0 ;non big aah default to 0
              else
                PhaseExpressionsArr[ExpressionIndex] = ahegaophonemebigaah ; phoneme 1 big aah
              endif

              ;if MfgConsoleFunc.GetPhoneme(actorref, 1) != ahegaophonemebigaah
              ;	MfgConsoleFuncExt.SetPhoneme(actorref, 1 , ahegaophonemebigaah , 0.1) ; ;big aah 30
              ;endif
            elseif IsSuckingoffOther() || HasDeviousGag(actorref)
              PhaseExpressionsArr[ExpressionIndex] = Blowjoboverride[ExpressionIndex]

              ;if MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != Blowjoboverride[ExpressionIndex] as int
              ;	MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex,Blowjoboverride[ExpressionIndex] as int , 0.1) ;
              ;endif
            elseif MFEEAddTongue
              ;if MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != 0 &&
              if ExpressionIndex != 1 && ExpressionIndex != 11
                PhaseExpressionsArr[ExpressionIndex] = 0

                ;MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex,0 , 0) ;
              elseif ExpressionIndex == 1
                PhaseExpressionsArr[ExpressionIndex] = tonguephonemebigaah
              elseif ExpressionIndex == 11
                PhaseExpressionsArr[ExpressionIndex] = tonguephonemeoh
              endif

              ; apply MFEE tongue out and down
              if MuFacialExpressionExtended.GetExpressionValueByNumber(actorref, 8, 0) != 100 || MuFacialExpressionExtended.GetExpressionValueByNumber(actorref, 2, 0) != 100
                MuFacialExpressionExtended.SetExpressionByNumber(actorref, 8, 0, 100) ;tongueout
                MuFacialExpressionExtended.SetExpressionByNumber(actorref, 8, 2, 100) ;tongue down
              endif

              ;if MfgConsoleFunc.GetPhoneme(actorref, 1) != tonguephonemebigaah || MfgConsoleFunc.GetPhoneme(actorref, 11) != tonguephonemeoh
              ;		MfgConsoleFuncExt.SetPhoneme(actorref, 1 , tonguephonemebigaah , 0.1) ; ;big aah
              ;		MfgConsoleFuncExt.SetPhoneme(actorref, 11 , tonguephonemeoh , 0.1) ; ;oh
              ;	endif
              ;MFEE tongue out
              ;if MuFacialExpressionExtended.GetExpressionValueByNumber(actorref,8,0) != 100 || MuFacialExpressionExtended.GetExpressionValueByNumber(actorref,2,0) != 100
              ;	MuFacialExpressionExtended.SetExpressionByNumber(actorref,8,0,100) ;tongueout
              ;	MuFacialExpressionExtended.SetExpressionByNumber(actorref,8,2,100) ;tongue down
              ;	endif
            elseif EquippedTongue()
              PhaseExpressionsArr[ExpressionIndex] = TongueoutOverride[ExpressionIndex]

              ;if MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != TongueoutOverride[ExpressionIndex] as int
              ;	MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex,TongueoutOverride[ExpressionIndex] as int , 0.05) ;
              ;endif
            elseif IsKissing()
              PhaseExpressionsArr[ExpressionIndex] = kisOverride[ExpressionIndex]

              ;if MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != kisOverride[ExpressionIndex] as int
              ;	MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex,kisOverride[ExpressionIndex] as int , 0.05) ;
              ;endif
            elseif IsCunnilingus()
              PhaseExpressionsArr[ExpressionIndex] = cunOverride[ExpressionIndex]

              ;if MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != cunOverride[ExpressionIndex] as int
              ;	MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex,cunOverride[ExpressionIndex] as int , 0.05) ;
              ;endif
            elseif !IsUnconcious()
              PhaseExpressionsArr[ExpressionIndex] = Utility.Randomint(lowerlimit, upperlimit)

              ;if MfgConsoleFunc.GetPhoneme(actorref, ExpressionIndex) != PhaseExpressionsArr[ExpressionIndex] as int ;ignore if phoneme and existing phoneme is the same
              ;	MfgConsoleFuncExt.SetPhoneme(actorref,ExpressionIndex, Utility.Randomint( lowerlimit,upperlimit ) ,speed) ;
              ;	endif
            endif
            ExpressionIndex = ExpressionIndex + 1
          endwhile

          ;	UpdateEnjoymentandOrgasms()
          ExpressionIndex = 0

          ;----------------------------------------------Set MODIFIERS-----------------------------------------
          while ExpressionIndex <= 13 && !IsUnconcious() ;&& !MFEEAddAhegao
            ;avoid out of bounds
            int modifier = PhaseExpressionsArr[ExpressionIndex + 16] as int
            float modifierspeed
            if expressionindex == 8 && expressionindex == 11
              modifierspeed = 0
            else
              modifierspeed = Speed
            endif

            ;run modifiers
            if MFEEAddAhegao
              if ExpressionIndex != 11 ;&& MfgConsoleFunc.GetModifier(actorref, ExpressionIndex) != 0
                PhaseExpressionsArr[ExpressionIndex + 16] = 0

                ;MfgConsoleFuncExt.SetModifier(actorref,ExpressionIndex,0 , 0)
              endif
              if MfgConsoleFunc.GetModifier(actorref, 11) != 50
                MfgConsoleFunc.SetModifier(actorref, 11, ahegaolookupmodifier) ;look up 50
              endif
            elseif enableahegao == 1 && (IsBroken() || ishugepp() || ((IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()) && MainNPCTrait() == "+The Penetrator"))
              PhaseExpressionsArr[ExpressionIndex + 16] = BrokenOverride[ExpressionIndex + 16] as int
              if MuFacialExpressionExtended.GetExpressionValueByNumber(actorref, 0, 0) != 100 && HasMFEEVanillaRace
                MuFacialExpressionExtended.SetExpressionByNumber(actorref, 0, 0, 100) ;ahegao 1
              endif

              ;if MfgConsoleFunc.GetModifier(actorref, ExpressionIndex) != BrokenOverride[ExpressionIndex + 16] as int
              ;	MfgConsoleFuncExt.SetModifier(actorref,ExpressionIndex,BrokenOverride[ExpressionIndex+16] as int , modifierspeed) ;
              ;endif
              ExpressionIndex = ExpressionIndex + 1
            elseif IsCowgirl() && expressionindex == 8 ;look downwards if riding override
              PhaseExpressionsArr[24] = "100"

              ;MfgConsoleFuncExt.SetModifier(actorref,8,100, modifierspeed) ;
              ExpressionIndex = 12
            elseif (Animation.HasTag("Doggy") || Animation.HasTag("Doggystyle") || Animation.HasTag("Doggy Style")) && (IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()) && expressionindex == 8
              PhaseExpressionsArr[lookdirection + 16] = "100"

              ;MfgConsoleFuncExt.SetModifier(actorref,lookdirection,100, modifierspeed) ; look left or right or down
              ExpressionIndex = 12
            else
              ;if MfgConsoleFunc.GetModifier(actorref, ExpressionIndex) != PhaseExpressionsArr[ExpressionIndex + 16] as int
              ;	MfgConsoleFuncExt.SetModifier(actorref,ExpressionIndex, modifier , modifierspeed)
              ;endif
              ExpressionIndex = ExpressionIndex + 1
            endif
          endwhile
          UpdateEnjoymentandOrgasms()
          MfgConsoleFuncExt.ApplyExpressionPresetSmooth(actorref, StringArrayToMFGNGArray(PhaseExpressionsArr), false)
        endif
      endif
      if phase >= 5
        phase = 1
      else
        phase += 1
      endif
      RegisterForSingleUpdate(utility.randomfloat(GetExpressionUpdateSeconds() * 0.7, GetExpressionUpdateSeconds() * 1.3))
    endif
  endevent

  event ResetActor()
    UnEquipTongue()
    if MarkerRef && ActorRef.GetDistance(MarkerRef) > 3000
      ActorRef.MoveTo(MarkerRef)
    endif
    resetexpressions()
    ClearEvents()
    GoToState("Resetting")
    Log("Resetting!")

    ; Clear TFC
    if IsPlayer
      Thread.ApplyFade()
      MiscUtil.SetFreeCameraState(false)
    endif

    ; Update stats
    if IsSkilled
      Actor VictimRef = Thread.VictimRef
      if IsVictim
        VictimRef = ActorRef
      endif
      sslActorStats.RecordThread(ActorRef, Gender, BestRelation, StartedAt, Utility.GetCurrentRealTime(), Utility.GetCurrentGameTime(), Thread.HasPlayer, VictimRef, Thread.Genders, Thread.SkillXP)
      Stats.AddPartners(ActorRef, Thread.Positions, Thread.Victims)
      if IsType[6]
        Stats.AdjustSkill(ActorRef, "VaginalCount", 1)
      endif
      if IsType[7]
        Stats.AdjustSkill(ActorRef, "AnalCount", 1)
      endif
      if IsType[8]
        Stats.AdjustSkill(ActorRef, "OralCount", 1)
      endif
    endif

    ; Apply cum
    ;/ int CumID = Animation.GetCum(Position)
		if CumID > 0 && !Thread.FastEnd && Config.UseCum && (Thread.Males > 0 || Config.AllowFFCum || Thread.HasCreature)
			ActorLib.ApplyCum(ActorRef, CumID)
		endIf /;
    ; Make sure of play the last animation stage to prevet AnimObject issues
    CurrentAE = Animation.FetchPositionStage(Position, StageCount)
    if PlayingAE != CurrentAE
      Debug.SendAnimationEvent(ActorRef, CurrentAE)

      ;	Utility.WaitMenuMode(0.2)
      PlayingAE = CurrentAE
    endif
    StopAnimating(Thread.FastEnd, EndAnimEvent)
    UnlockActor()
    RestoreActorDefaults()

    ; Tracked events
    TrackedEvent("End")

    ; Unstrip items in storage, if any
    if !IsCreature
      if !(ActorRef.IsDead() || ActorRef.GetActorValue("Health") <= 1.0)
        Unstrip()

        ; Add back high heel effects
        if Config.RemoveHeelEffect
          ; HDT High Heel
          if HDTHeelSpell && ActorRef.GetWornForm(0x00000080) && !ActorRef.HasSpell(HDTHeelSpell)
            ActorRef.AddSpell(HDTHeelSpell)
          endif

          ; NiOverride High Heels move out to prevent isues and add NiOverride Scale for race menu compatibility
        endif
        if Config.HasNiOverride
          bool UpdateNiOPosition = NiOverride.RemoveNodeTransformPosition(ActorRef, false, isRealFemale, "NPC", "SexLab.esm")
          bool UpdateNiOScale = NiOverride.RemoveNodeTransformScale(ActorRef, false, isRealFemale, "NPC", "SexLab.esm")
          if UpdateNiOPosition || UpdateNiOScale ; I make the variables because not sure if execute both funtion in OR condition.
            NiOverride.UpdateNodeTransform(ActorRef, false, isRealFemale, "NPC")
            Log("UpdateNodeTransform")
          endif
        endif
      else
        if Config.HasNiOverride && NiOverride.RemoveNodeTransformScale(ActorRef, False, isRealFemale, "NPC", "SexLab.esm")
          NiOverride.UpdateNodeTransform(ActorRef, False, isRealFemale, "NPC")
          Log("UpdateNodeTransform")
        endif
      endif
    endif
    ;Config.ClearActorFaceItems(ActorRef)

    ; Free alias slot
    TryToClear()
    GoToState("")
    Thread.SyncEventDone(kResetActor)
  endevent

  function DoOrgasm(bool Forced=false)
    if !ActorRef
      return
    endif
    float Enjoyment = GetFullEnjoyment()
    int i
    UnregisterForUpdate()
    LastOrgasm = RealTime[0]
    Orgasms += 1

    ; reset timers
    SLSO_DoOrgasm_Multiorgasm()

    ; Send an orgasm event hook with actor and orgasm count
    int eid = ModEvent.Create("SexLabOrgasm")
    ModEvent.PushForm(eid, ActorRef)
    ModEvent.PushInt(eid, FullEnjoyment)
    ModEvent.PushInt(eid, Orgasms)
    ModEvent.Send(eid)

    ; Send an slso separate orgasm event hook with actor and thread id
    SLSO_DoOrgasm_SexLabOrgasmSeparate()
    TrackedEvent("Orgasm")
    Log(ActorName + "- Orgasms[" + Orgasms + "] Enjoyment [" + Enjoyment + "] BaseEnjoyment[" + BaseEnjoyment + "] FullEnjoyment[" + FullEnjoyment + "]")
    if Config.OrgasmEffects
      ; Shake camera for player
      if IsPlayer && Config.ShakeStrength > 0 && Game.GetCameraState() >= 8
        Game.ShakeCamera(none, Config.ShakeStrength, Config.ShakeStrength + 1.0)
      endif
      SLSO_DoOrgasm_Moan()
    endif

    ; Apply cum to female positions from male position orgasm
    i = Thread.ActorCount
    if i > 1 && Config.UseCum && (MalePosition || IsCreature) && (IsMale || IsCreature || (Config.AllowFFCum && IsFemale))
      if i == 2
        Thread.PositionAlias(IntIfElse(Position == 1, 0, 1)).ApplyCum()
      else
        while i > 0
          i -= 1
          if Position != i && Position < Animation.PositionCount && Animation.IsCumSource(Position, i, Stage)
            Thread.PositionAlias(i).ApplyCum()
          endif
        endwhile
      endif
    endif
    Utility.WaitMenuMode(0.2)

    ; Reset enjoyment build up, if using multiple orgasms
    ;printdebug(ActorRef.GetLeveledActorBase().getname() + "After Orgasm Enjoyment : " + HentaiEnjoyment)
    ;QuitEnjoyment = FullEnjoyment
    ; VoiceDelay = 0.8
    RegisterForSingleUpdate(0.8)
  endfunction

  ;/ event OnTranslationFailed()
		Log("OnTranslationFailed")
		; SyncLocation(false)
	endEvent /;
    function OrgasmEffect()
    ;give gifts NPC trait
    if !isplayer && NpcTraitRandomAssignment == 1
      if NPCtrait == TheNouveauRiche
        Playerref.additem(Game.GetFormFromFile(0xF, "Skyrim.esm"), utility.Randomint(1, 100))
      elseif NPCtrait == TheGifter
        Playerref.additem(Game.GetFormFromFile(0x2E4E3, "Skyrim.esm"), 1)
      endif
    endif
    printdebug("Orgasm!")

    ;reset Hentai Enjoyment
    if actorref == playerref
      HentaiEnjoyment = 0
    else
      if NPCtrait == CumBuckets || NPCTrait == MissCumalot || NPCTrait == SirCumalot
        HentaiEnjoyment = utility.randomint(50, 80)
      else
        HentaiEnjoyment = 0
      endif
    endif

    ;The Milker Body Milker Modifications
    if NPCtrait == TheMilker && ActorRef != playerref
      AddLactatingSpelltoPC()
    endif
    AddResistanceDamage(GetOrgasmDamage())
    DoOrgasm()
  endfunction

  function RefreshActor()
    UnregisterForUpdate()
    SyncThread()
    StopAnimating(true)
    SyncLocation(false)
    CurrentSA = "SexLabSequenceExit1"
    CurrentAE = PlayingSA
    Debug.SendAnimationEvent(ActorRef, CurrentAE)
    SendDefaultAnimEvent()
    Utility.WaitMenuMode(0.2)
    CurrentSA = Animation.Registry
    CurrentAE = Animation.FetchPositionStage(Position, 1)
    Debug.SendAnimationEvent(ActorRef, CurrentAE)
    PlayingSA = CurrentSA
    PlayingAE = CurrentAE
    SyncLocation(true)
    SendAnimation()
    RegisterForSingleUpdate(1.0)
    Thread.SyncEventDone(kRefreshActor)
  endfunction

  function RefreshLoc()
    Offsets = Animation.PositionOffsets(Offsets, AdjustKey, Position, Stage, FurnitureStatus[1])
    SyncLocation(true)
  endfunction

  function SendAnimation()
    ;SLGP
    SLGP_Angle_reposition = FALSE ;SLGP Reset everytime the animation change

    ;SLGP
    CurrentAE = AnimEvents[Position]

    ; Reenter SA - On stage 1 while animation hasn't changed since last call
    if Stage == 1 && (PlayingAE != CurrentAE || PlayingSA == CurrentSA)

      SendDefaultAnimEvent()

      ;	Utility.WaitMenuMode(0.2)
      Debug.SendAnimationEvent(ActorRef, Animation.FetchPositionStage(Position, 1))

      ; Debug.SendAnimationEvent(ActorRef, Animation.FetchPositionStage(Position, 1)+"_REENTER")
    else
      ; Enter a new SA - Not necessary on stage 1 since both events would be the same
      if Stage != 1 && PlayingSA != CurrentSA
        SendDefaultAnimEvent() ; To unequip the AnimObject TODO: Find better solution
        Debug.SendAnimationEvent(ActorRef, Animation.FetchPositionStage(Position, 1))
        Utility.Wait(0.2)

        ; Log("NEW SA - "+Animation.FetchPositionStage(Position, 1))
      endif

      ; Play the primary animation
      Debug.SendAnimationEvent(ActorRef, CurrentAE)

      ; Log(CurrentAE)
    endif

    ; Save id of last SA played
    PlayingSA = Animation.Registry

    ; Save id of last AE played
    PlayingAE = CurrentAE
    Debug.SendAnimationEvent(ActorRef, "SOSBend" + Schlong)
  endfunction

  function Snap()
    if !(ActorRef && ActorRef.Is3DLoaded())
      return
    endif

    ; Quickly move into place and angle if actor is off by a lot
    float distance = ActorRef.GetDistance(MarkerRef)
    if distance > 125.0 || (Math.Abs(ActorRef.GetAngleZ() - Loc[5]) > 2.0) ;|| !IsInPosition(ActorRef, MarkerRef, 75.0)
      ActorRef.SetVehicle(none)
      MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
      MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])
      ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
      ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
      AttachMarker()
      Log(ActorName + "-Loc- Angle:[X:" + Loc[3] + "Y:" + Loc[4] + "Z:" + Loc[5] + "] Position:[X:" + Loc[0] + "Y:" + Loc[1] + "Z:" + Loc[2] + "]", "Snap()")
      Log(ActorName + "-MarkerRef- Angle:[X:" + MarkerRef.GetAngleX() + "Y:" + MarkerRef.GetAngleY() + "Z:" + MarkerRef.GetAngleZ() + "] Position:[X:" + MarkerRef.GetPositionX() + "Y:" + MarkerRef.GetPositionY() + "Z:" + MarkerRef.GetPositionZ() + "]", "Snap()")
      Log(ActorName + "-ActorRef- Angle:[X:" + ActorRef.GetAngleX() + "Y:" + ActorRef.GetAngleY() + "Z:" + ActorRef.GetAngleZ() + "] Position:[X:" + ActorRef.GetPositionX() + "Y:" + ActorRef.GetPositionY() + "Z:" + ActorRef.GetPositionZ() + "]", "Snap()")
    elseif distance > 2.0
      ActorRef.StopTranslation() ; StopTranslation as side effect allow the actor move by the collisions but is required to stop any previous Translation and avoid the OnTranslationComplete.
      ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
      return ; OnTranslationComplete() will take over when in place
    endif

    ; Begin very slowly rotating a small amount to hold position
    ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5] + 0.01, 500.0, 0.0001)
  endfunction

  function SyncActor()
    SyncThread()
    SyncLocation(false)
    ;SLGP Not necesary and Consume time
    ;		SyncLocation(false);SLGP Not necesary and Consume time
    ;SLGP Not necesary and Consume time
    Thread.SyncEventDone(kSyncActor)
  endfunction

  function SyncAll(bool Force=false)
    if !ActorRef
      return
    endif
    SyncThread()
    SyncLocation(Force)
    if Force
      Debug.SendAnimationEvent(ActorRef, "SOSBend" + Schlong)
    endif
  endfunction

  function SyncLocation(bool Force=false)
    if !ActorRef || !MarkerRef
      return
    endif
    OffsetCoords(Loc, Center, Offsets)
    MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
    MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])

    ; Avoid forcibly setting on player coords if avoidable - causes annoying graphical flickering
    ;	if Force
    ;		if IsPlayer && IsInPosition(ActorRef, MarkerRef, 40.0)
    ;			AttachMarker()
    ;			ActorRef.StopTranslation()
    ;			ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0)
    ;			return ; OnTranslationComplete() will take over when in place
    ;		else
    ;			ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
    ;			ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
    ;		endIf
    ;	endIf
    AttachMarker()
    if Force || !IsInPosition(ActorRef, MarkerRef, 2.0)
      ActorRef.StopTranslation() ; StopTranslation as side effect allow the actor move by the collisions but is required to stop any previous Translation and avoid the OnTranslationComplete.
      ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
    endif
  endfunction

  function SyncThread()
    ; Sync with thread info
    GetPositionInfo()
    VoiceDelay = BaseDelay
    ExpressionDelay = Config.ExpressionDelay * BaseDelay
    Float RandomValue = 0.2
    if !IsSilent && Stage > 1
      ;	VoiceDelay -= (Stage * 0.8) + Utility.RandomFloat(-0.2, 0.4)
      RandomValue = Utility.RandomFloat(-0.2, 0.4)
      VoiceDelay = (BaseDelay - ((CalcReaction() / 100) * BaseDelay)) + RandomValue
    endif
    if VoiceDelay < 0.8
      ;	VoiceDelay = Utility.RandomFloat(0.8, 1.4) ; Can't have delay shorter than animation update loop
      VoiceDelay = RandomValue + 1.0 ; Can't have delay shorter than animation update loop
    endif

    ; Update alias info
    ;	GetEnjoyment()
    ; Sync status
    if ActorRef && !IsCreature
      ResolveStrapon()
      ;sslBaseExpression.UnequipWornFaceItem(ActorRef, Expression)
      int Seid = ModEvent.Create(Thread.Key("RefreshActorExpression"))
      if Seid
        ModEvent.PushForm(Seid, ActorRef)
        ModEvent.Send(Seid)
      else
        RefreshExpression()
      endif
    endif

    ;	Debug.SendAnimationEvent(ActorRef, "SOSBend"+Schlong)
    ; SyncLocation(false)
  endfunction
endstate

state Prepare
  event OnBeginState()
    if StartWait < 0.1
      StartWait = 0.1
    endif
    if DoPathToCenter ; Check if is done with the walk before continue
      float Failsafe = SexLabUtil.GetCurrentGameRealTime() + 10.0
      while SexLabUtil.GetCurrentGameRealTime() < Failsafe && !(MarkerRef && MarkerRef.IsEnabled() && IsInPosition(ActorRef, MarkerRef, 75.0))
        Utility.Wait(1.0)
      endwhile
      if !(MarkerRef && MarkerRef.IsEnabled() && IsInPosition(ActorRef, MarkerRef, 75.0))
        LockActor()
        MoveToStartingPosition()
        if ActorRef.Is3DLoaded() && !ActorRef.IsDisabled() && !ActorRef.IsDead() && !ActorRef.IsUnconscious()
          ActorRef.ClearLookAt()
        endif
      endif
    endif

    ; Play custom starting animation event
    if StartAnimEvent != ""
      Debug.SendAnimationEvent(ActorRef, StartAnimEvent)
    endif
    RegisterForSingleUpdate(StartWait)
  endevent

  event OnTranslationComplete()
    Log(GetState(), "OnTranslationComplete()")
    if MarkerRef && MarkerRef.IsEnabled()
      if (Math.Abs(ActorRef.GetAngleZ() - Loc[5]) > 2.0) ; If the TranslateTo can't rotate it
        ActorRef.SetVehicle(none)
        MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
        MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])
        ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
        ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
        AttachMarker()
        ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
        Log(ActorName + "-Loc- Angle:[X:" + Loc[3] + "Y:" + Loc[4] + "Z:" + Loc[5] + "] Position:[X:" + Loc[0] + "Y:" + Loc[1] + "Z:" + Loc[2] + "]", "OnTranslationComplete()")
        Log(ActorName + "-MarkerRef- Angle:[X:" + MarkerRef.GetAngleX() + "Y:" + MarkerRef.GetAngleY() + "Z:" + MarkerRef.GetAngleZ() + "] Position:[X:" + MarkerRef.GetPositionX() + "Y:" + MarkerRef.GetPositionY() + "Z:" + MarkerRef.GetPositionZ() + "]", "OnTranslationComplete()")
        Log(ActorName + "-ActorRef- Angle:[X:" + ActorRef.GetAngleX() + "Y:" + ActorRef.GetAngleY() + "Z:" + ActorRef.GetAngleZ() + "] Position:[X:" + ActorRef.GetPositionX() + "Y:" + ActorRef.GetPositionY() + "Z:" + ActorRef.GetPositionZ() + "]", "OnTranslationComplete()")
      elseif IsInPosition(ActorRef, MarkerRef, 2.0)
        ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5] + 0.01, 500.0, 0.0001)
      endif
    endif
  endevent

  event OnUpdate()
    ; Check if still among the living and able.
    if !ActorRef || ActorRef.IsDisabled() || (ActorRef.IsDead() && ActorRef.GetActorValue("Health") <= 0) ; Dead + Health for the Necro Mods compatibility
      Log("Actor is undefined, disabled, or has no health - Unable to continue animating")
      Thread.EndAnimation(true)
    else
      ClearEffects()

      ;	if IsPlayer
      Thread.ApplyFade()

      ;	endIf
      GetPositionInfo()

      ; Starting position
      OffsetCoords(Loc, Center, Offsets)
      if MarkerRef
        MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
        MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])

        ;	ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
        ;	ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
        AttachMarker()
      endif
      if !MarkerRef || IsInPosition(ActorRef, MarkerRef, 40.0)
        ActorRef.StopTranslation() ; StopTranslation as side effect allow the actor move by the collisions but is required to stop any previous Translation and avoid the OnTranslationComplete.
        ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
      endif
      if !IsPlayer || !ActorRef.IsOnMount()
        ActorRef.QueueNiNodeUpdate()
      endif
      Debug.SendAnimationEvent(ActorRef, "SOSFastErect")

      ; Notify thread prep is done
      if Thread.GetState() == "Prepare"
        if !Prepared
          Prepared = True
          Thread.SyncEventDone(kPrepareActor)
        endif
      else
        StartAnimating()
      endif
    endif
  endevent

  event ResetActor()
    ClearEvents()
    GoToState("Resetting")
    Log("Resetting!")

    ; Clear TFC
    Thread.ApplyFade()
    if IsPlayer
      MiscUtil.SetFreeCameraState(false)
    endif
    StopAnimating(true)
    UnlockActor()
    RestoreActorDefaults()

    ; Tracked events
    TrackedEvent("End")

    ; Unstrip items in storage, if any
    if !IsCreature
      if !(ActorRef.IsDead() || ActorRef.GetActorValue("Health") <= 1.0)
        Unstrip()

        ; Add back high heel effects
        if Config.RemoveHeelEffect
          ; HDT High Heel
          if HDTHeelSpell && ActorRef.GetWornForm(0x00000080) && !ActorRef.HasSpell(HDTHeelSpell)
            ActorRef.AddSpell(HDTHeelSpell)
          endif

          ; NiOverride High Heels move out to prevent isues and add NiOverride Scale for race menu compatibility
        endif
        if Config.HasNiOverride
          bool UpdateNiOPosition = NiOverride.RemoveNodeTransformPosition(ActorRef, false, isRealFemale, "NPC", "SexLab.esm")
          bool UpdateNiOScale = NiOverride.RemoveNodeTransformScale(ActorRef, false, isRealFemale, "NPC", "SexLab.esm")
          if UpdateNiOPosition || UpdateNiOScale ; I make the variables because not sure if execute both funtion in OR condition.
            NiOverride.UpdateNodeTransform(ActorRef, false, isRealFemale, "NPC")
            Log("UpdateNodeTransform")
          endif
        endif
      else
        if Config.HasNiOverride && NiOverride.RemoveNodeTransformScale(ActorRef, False, isRealFemale, "NPC", "SexLab.esm")
          NiOverride.UpdateNodeTransform(ActorRef, False, isRealFemale, "NPC")
          Log("UpdateNodeTransform")
        endif
      endif
    endif
    ;Config.ClearActorFaceItems(ActorRef)

    ; Free alias slot
    TryToClear()
    GoToState("")
    Thread.SyncEventDone(kResetActor)
  endevent

  function StartAnimating()
    if !ActorRef
      return
    endif
    TimertoUpdate = 0
    TrackedEvent("Start")
    ;sceneID = SexLab.FindActorController(game.getplayer())
    InitializeAggressorResistanceConfigValues()
    CheckHasMFEE()
    InitializeHentaiEnjoymentConfigValues()
    InitializeHentaiExpressionconfig()
    CalculateStartupResistance()
    if !SchlongFaction && isDependencyReady("Schlongs of Skyrim.esp")
      SchlongFaction = Game.GetFormFromFile(0xAFF8, "Schlongs of Skyrim.esp") as Faction
    endif

    ;TNG
    if !TNG_Gentlewoman && isDependencyReady("TheNewGentleman.esp")
      TNG_XL = Game.GetFormFromFile(0xFE5, "TheNewGentleman.esp") as Keyword
      TNG_L = Game.GetFormFromFile(0xFE4, "TheNewGentleman.esp") as Keyword
      TNG_Gentlewoman = Game.GetFormFromFile(0xFF8, "TheNewGentleman.esp") as Keyword
    endif
    AssignNPCHentaiTrait()
    ActorsInPlay = Thread.Positions
    Float Start_time = Utility.GetCurrentRealTime()
    SLGP_Time2 = Start_time - SLGP_Time2
    TrackedEvent("Start")

    ; Remove from bard audience if in one
    Config.CheckBardAudience(ActorRef, true)

    ; Prepare for loop
    ;SLGP Why call StopAnimating(true) BEFORE start the animation???
    ;		StopAnimating(true)
    ;SLGP Why call StopAnimating(true) BEFORE start the animation???
    StartedAt = SexLabUtil.GetCurrentGameRealTime()
    LastOrgasm = StartedAt
    GoToState("Animating")
    SyncAll(true)
    PlayingSA = Animation.Registry

    ;	if Stage == 1
    ;		CurrentSA = PlayingSA
    ;	endIf
    if ActorRef.GetActorValue("Paralysis") != 0.0
      Debug.SendAnimationEvent(ActorRef, "Ragdoll")
      Utility.Wait(0.1)
      SendDefaultAnimEvent()
      ActorRef.SetActorValue("Paralysis", 0.0)
      Utility.WaitMenuMode(0.2)
    endif
    SendDefaultAnimEvent()

    ;SLGP - Another big time because make a Cell Scan then i make it with Event
    ModEvent.Send(ModEvent.Create("SLGP_SLSO_Start_" + self)) ;SLSO_StartAnimating()

    ; If enabled, start Auto TFC for player
      if IsPlayer && Config.AutoTFC
        int CameraState = Game.GetCameraState()
        Log("- CameraState: " + CameraState, "StartAnimating()")
        if CameraState < 8 && CameraState != 3
          ;	if Game.GetCameraState() < 8 && Game.GetCameraState() != 3
          Game.ForceThirdPerson()
        endif
        MiscUtil.SetFreeCameraState(true, Config.AutoSUCSM)

        ;	MiscUtil.SetFreeCameraSpeed(Config.AutoSUCSM)
      endif

    ; Start update loop
    if Thread.GetState() == "Prepare"
      if !StartedUp
        StartedUp = True
        Thread.SyncEventDone(kStartUp)
      endif
    else
      SyncLocation(true)
      SendAnimation()
    endif
    RegisterForSingleUpdate(Utility.RandomFloat(0.1, 0.3))
    SLGP_Time3 = Utility.GetCurrentRealTime() - Start_time
    Log("SLGP Prepare:" + SLGP_Time1 + " Prepare_sync:" + SLGP_Time2 + " StartAnimating:" + SLGP_Time3 + " FINAL TIME:" + (SLGP_Time1 + SLGP_Time2 + SLGP_Time3) + " on TH:" + thread.TID + " Actors:" + thread.ActorCount)
  endfunction
endstate

; ------------------------------------------------------- ;
; --- Actor Prepartion                                --- ;
; ------------------------------------------------------- ;
state Ready

  event OnTranslationComplete()
    Log(GetState(), "OnTranslationComplete()")
    if MarkerRef && MarkerRef.IsEnabled()
      if (Math.Abs(ActorRef.GetAngleZ() - Loc[5]) > 2.0) ; If the TranslateTo can't rotate it
        ActorRef.SetVehicle(none)
        MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
        MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])
        ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
        ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
        AttachMarker()
        ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0.0)
        Log(ActorName + "-Loc- Angle:[X:" + Loc[3] + "Y:" + Loc[4] + "Z:" + Loc[5] + "] Position:[X:" + Loc[0] + "Y:" + Loc[1] + "Z:" + Loc[2] + "]", "OnTranslationComplete()")
        Log(ActorName + "-MarkerRef- Angle:[X:" + MarkerRef.GetAngleX() + "Y:" + MarkerRef.GetAngleY() + "Z:" + MarkerRef.GetAngleZ() + "] Position:[X:" + MarkerRef.GetPositionX() + "Y:" + MarkerRef.GetPositionY() + "Z:" + MarkerRef.GetPositionZ() + "]", "OnTranslationComplete()")
        Log(ActorName + "-ActorRef- Angle:[X:" + ActorRef.GetAngleX() + "Y:" + ActorRef.GetAngleY() + "Z:" + ActorRef.GetAngleZ() + "] Position:[X:" + ActorRef.GetPositionX() + "Y:" + ActorRef.GetPositionY() + "Z:" + ActorRef.GetPositionZ() + "]", "OnTranslationComplete()")
      elseif IsInPosition(ActorRef, MarkerRef, 2.0)
        ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5] + 0.01, 500.0, 0.0001)
      endif
    endif
  endevent
  event OnUpdate()
   ;	if StartWait < 0.1
    ;		StartWait = 0.1
    ;	endIf
    ;	string CurrentState = Thread.GetState()
    ;	if CurrentState == "Ready"
    ;		Log("WARNING: OnUpdate Event ON State:'Ready' FOR State:'"+CurrentState+"'")
    ;		GoToState("Prepare")
    ;		RegisterForSingleUpdate(StartWait)
    ;	else
    ;		Log("ERROR: OnUpdate Event ON State:'Ready' FOR State:'"+CurrentState+"'")
    ;		RegisterForSingleUpdate(StartWait)
    ;	endIf
    Log("ERROR: OnUpdate Event ON State:'Ready' FOR State:'" + Thread.GetState() + "'")
  endevent

  function PathToCenter()
    ObjectReference CenterRef = Thread.CenterAlias.GetReference()
    if CenterRef && ActorRef && (Thread.ActorCount > 1 || CenterRef != ActorRef)
      ObjectReference WaitRef = CenterRef
      if CenterRef == ActorRef
        WaitRef = Thread.Positions[IntIfElse(Position != 0, 0, 1)]
      endif
      float Distance = ActorRef.GetDistance(WaitRef)
      if WaitRef && Distance < 8000.0 && Distance > 135.0
        if CenterRef != ActorRef
          ActorRef.SetFactionRank(AnimatingFaction, 2)
          ActorRef.EvaluatePackage()
        endif
        ActorRef.SetLookAt(WaitRef, false)
        if IsPlayer
          Thread.RemoveFade()
        endif

        ; Start wait loop for actor pathing.
        int StuckCheck = 0
        float Failsafe = SexLabUtil.GetCurrentGameRealTime() + 30.0
        while Distance > 100.0 && SexLabUtil.GetCurrentGameRealTime() < Failsafe
          Utility.Wait(1.0)
          float Previous = Distance
          Distance = ActorRef.GetDistance(WaitRef)
          Log("Current Distance From WaitRef[" + WaitRef + "]: " + Distance + " // Moved: " + (Previous - Distance))

          ; Check if same distance as last time.
          if Math.Abs(Previous - Distance) < 1.0
            if StuckCheck > 2 ; Stuck for 2nd time, end loop.
              Distance = 0.0
            endif
            StuckCheck += 1 ; End loop on next iteration if still stuck.
            Log("StuckCheck(" + StuckCheck + ") No progress while waiting for [" + WaitRef + "]")
          else
            StuckCheck -= 1 ; Reset stuckcheck if progress was made.
          endif
        endwhile
        ActorRef.ClearLookAt()
        if CenterRef != ActorRef
          ActorRef.SetFactionRank(AnimatingFaction, 1)
          ActorRef.EvaluatePackage()
        endif
      endif
    endif
  endfunction

  function PrepareActor()
    Float Start_time = Utility.GetCurrentRealTime()

    ; Remove any unwanted combat effects
    ClearEffects()
    if IsPlayer
      sslThreadController Control = Config.GetThreadControlled()
      if Control && Control != none
        Config.DisableThreadControl(Control)
      endif
      Game.SetPlayerAIDriven()
    endif
    ActorRef.SetFactionRank(AnimatingFaction, 1)
    ActorRef.EvaluatePackage()

    ; Starting Information
    LoadShares()
    GetPositionInfo()
    IsAggressor = Thread.VictimRef && Thread.Victims.Find(ActorRef) == -1
    string LogInfo

    ; Calculate scales
    if IsPlayer && config.UseFade < 1
      Thread.ApplyFade()
    endif
    if UseScale
      float display = ActorRef.GetScale()
      ActorRef.SetScale(1.0)
      float base = ActorRef.GetScale()
      ActorScale = (display / base)
      AnimScale = ActorScale
      if ActorScale > 0.0 && ActorScale != 1.0
        ActorRef.SetScale(ActorScale)
      endif
      float FixNioScale = 1.0
      if (Thread.ActorCount > 1 || FurnitureStatus[1] >= 4) && Config.ScaleActors
        if Config.HasNiOverride && !IsCreature && NioScale > 0.0 && NioScale != 1.0
          FixNioScale = (FixNioScale / NioScale)
          NiOverride.AddNodeTransformScale(ActorRef, False, isRealFemale, "NPC", "SexLab.esm", FixNioScale)
          NiOverride.UpdateNodeTransform(ActorRef, False, isRealFemale, "NPC")
        endif
        AnimScale = (1.0 / base)
      endif
      LogInfo = "Scales[" + display + "/" + base + "/" + ActorScale + "/" + AnimScale + "/" + NioScale + "] "
    else
      AnimScale = 1.0
      LogInfo = "Scales[" + ActorRef.GetScale() + "/DISABLED/DISABLED/DISABLED/DISABLED/" + NioScale + "] "
    endif

   if DoPathToCenter
      PathToCenter()
    else
      LockActor()
      MoveToStartingPosition()

      ; Start Wait Idle
      StartWaitIdle()
    endif
  
    ;SLGP Move LockActor() to SetActor()
    ;		LockActor();SLGP Move LockActor() to SetActor()
    ;SLGP Move LockActor() to SetActor()

    ; Player specific actions
    if IsPlayer
      
      FormList FrostExceptions = Config.FrostExceptions
      if FrostExceptions
        FrostExceptions.AddForm(Config.BaseMarker)
      endif
    endif
    SLGP_Voice()

    ; Pick a voice if needed
    if !Voice && !IsForcedSilent
      ;SLGP This need from 0.5 to 1 second because scan and filter ALL voices then i made it with event
      ModEvent.Send(ModEvent.Create("SLGP_Voice_" + self))

      ;SLGP This need from 0.5 to 1 second because scan and filter ALL voices then i made it with event
    endif

    ; Extras for non creatures
    if !IsCreature
      ; Decide on strapon for female, default to worn, otherwise pick random.
      if IsFemale && !IsFuta && Config.UseStrapons
        HadStrapon = Config.WornStrapon(ActorRef)
        Strapon = HadStrapon
        if !HadStrapon
          Strapon = Config.GetStrapon()
        endif
        LogInfo += "Strapon[" + sslUtility.GetItemName(Strapon) + "] "
      endif

      ; Strip actor
      ;SLGP This need a gigantic amount of time then i make it with event
     ; ModEvent.Send(ModEvent.Create("SLGP_Strip_" + self)) ;Strip()

      ;SLGP This need a gigantic amount of time then i make it with event
      ;ResolveStrapon()

      ;SLGP - this is NOT necesary
      ;			Debug.SendAnimationEvent(ActorRef, "SOSFastErect");SLGP - this is NOT necesary
      ;SLGP - this is NOT necesary
      ; Remove HDT High Heels
      if Config.RemoveHeelEffect && ActorRef.GetWornForm(0x00000080)
        HDTHeelSpell = Config.GetHDTSpell(ActorRef)
        if HDTHeelSpell
          Log(HDTHeelSpell, "RemoveHeelEffect (HDTHeelSpell)")
          ActorRef.RemoveSpell(HDTHeelSpell)
        endif
      endif
      ; Strip actor
      Thread.RemoveFade()
      int Seid = ModEvent.Create(Thread.Key("StripActor"))
      if Seid
        ModEvent.PushForm(Seid, ActorRef)
        ModEvent.Send(Seid)
        Utility.Wait(1.0)
      else
        Strip()
      endif
      ResolveStrapon()

      ; Pick an expression if needed
      if !Expression && Config.UseExpressions
        Expressions = Config.ExpressionSlots.GetByStatus(ActorRef, IsVictim, IsType[0] && !IsVictim)
        if Expressions && Expressions.Length > 0
          Expression = Expressions[Utility.RandomInt(0, (Expressions.Length - 1))]
        endif
      endif
      if Expression
        LogInfo += "Expression[" + Expression.Name + "] "
      endif
      if ActorRef.Is3DLoaded() && !(ActorRef.IsDisabled() || ActorRef.IsDead() || ActorRef.GetActorValue("Health") <= 1.0)
        ActorRef.ClearExpressionOverride()
        ActorRef.ResetExpressionOverrides()
        sslBaseExpression.ClearMFG(ActorRef)
      endif
    endif
    IsSkilled = !IsCreature || sslActorStats.IsSkilled(ActorRef)
    if IsSkilled
      ; Always use players stats for NPCS if present, so players stats mean something more
      Actor SkilledActor = ActorRef
      if !IsPlayer && Thread.HasPlayer
        SkilledActor = PlayerRef

        ; If a non-creature couple, base skills off partner
      elseif Thread.ActorCount > 1 && !Thread.HasCreature
        SkilledActor = Thread.Positions[sslUtility.IndexTravel(Position, Thread.ActorCount)]
      endif

      ; Get sex skills of partner/player
      Skills = Stats.GetSkillLevels(SkilledActor)
      OwnSkills = Stats.GetSkillLevels(ActorRef)

      ; Try to prevent orgasms on fist stage resting enjoyment
      float FirsStageTime
      if LeadIn
        FirsStageTime = Config.StageTimerLeadIn[0]
      elseif IsType[0]
        FirsStageTime = Config.StageTimerAggr[0]
      else
        FirsStageTime = Config.StageTimer[0]
      endif
      BaseEnjoyment -= Math.Abs(CalcEnjoyment(SkillBonus, Skills, LeadIn, IsFemale, FirsStageTime, 1, StageCount)) as int
      if BaseEnjoyment < -5
        BaseEnjoyment += 10
      endif

      ; Add Bonus Enjoyment
      if IsVictim
        BestRelation = Thread.GetLowestPresentRelationshipRank(ActorRef)
        BaseEnjoyment += ((BestRelation - 3) + PapyrusUtil.ClampInt((OwnSkills[Stats.kLewd] - OwnSkills[Stats.kPure]) as int, -6, 6)) * Utility.RandomInt(1, 10)
      else
        BestRelation = Thread.GetHighestPresentRelationshipRank(ActorRef)
        if IsAggressor
          BaseEnjoyment += (-1 * ((BestRelation - 4) + PapyrusUtil.ClampInt(((Skills[Stats.kLewd] - Skills[Stats.kPure]) - (OwnSkills[Stats.kLewd] - OwnSkills[Stats.kPure])) as int, -6, 6))) * Utility.RandomInt(1, 10)
        else
          BaseEnjoyment += (BestRelation + PapyrusUtil.ClampInt((((Skills[Stats.kLewd] + OwnSkills[Stats.kLewd]) * 0.5) - ((Skills[Stats.kPure] + OwnSkills[Stats.kPure]) * 0.5)) as int, 0, 6)) * Utility.RandomInt(1, 10)
        endif
      endif
    else
      if IsVictim
        BestRelation = Thread.GetLowestPresentRelationshipRank(ActorRef)
        BaseEnjoyment += (BestRelation - 3) * Utility.RandomInt(1, 10)
      else
        BestRelation = Thread.GetHighestPresentRelationshipRank(ActorRef)
        if IsAggressor
          BaseEnjoyment += (-1 * (BestRelation - 4)) * Utility.RandomInt(1, 10)
        else
          BaseEnjoyment += (BestRelation + 3) * Utility.RandomInt(1, 10)
        endif
      endif
    endif
    LogInfo += "BaseEnjoyment[" + BaseEnjoyment + "]"
    Log(LogInfo)

    ; Play custom starting animation event
    if StartAnimEvent != ""
      Debug.SendAnimationEvent(ActorRef, StartAnimEvent)
    endif
    if StartWait < 0.1
      StartWait = 0.1
    endif
    GoToState("Prepare")
    ;RegisterForSingleUpdate(StartWait)
    SLGP_Time1 = Utility.GetCurrentRealTime() - Start_time
  endfunction

  bool function SetActor(Actor ProspectRef)
    Log("ERROR: SetActor(" + ActorRef.GetLeveledActorBase().GetName() + ") on State:'Ready' is not allowed")
    return false
  endfunction
endstate

state Resetting
  event OnUpdate()
  endevent

  function ClearAlias()
  endfunction

  function Initialize()
  endfunction
endstate

int function CalcEnjoyment(float[] XP, float[] SkillsAmounts, bool IsLeadin, bool IsFemaleActor, float Timer, int OnStage, int MaxStage) global native
bool function IsInPosition(Actor CheckActor, ObjectReference CheckMarker, float maxdistance=30.0) global native
function OffsetCoords(float[] Output, float[] CenterCoords, float[] OffsetBy) global native

Float[] function StringArrayToMFGNGArray(String[] values)
  float[] result = new float[32]
  if values.length < 32
    printdebug("Expressions array only has " + values.length + "items. it is either incorrectly formatted or missing in the json file")
  endif
  Int i = 0
  while i < 32
    if i == 30 && values[i]
      result[i] = values[i] as float
    elseif values[i]
      result[i] = (values[i] as float) / 100
    else
      result[i] = 0
    endif
    i = i + 1
  endwhile
  return result
endfunction
