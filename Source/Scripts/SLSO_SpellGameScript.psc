Scriptname SLSO_SpellGameScript extends activemagiceffect
import Debug 

String property File auto
Bool property Forced auto
float property GetModPartMag auto
float property GetModPartSta auto
float property GetModSelfMag auto
float property GetModSelfSta auto
Bool property IsAggressor auto
Bool property IsFemale auto
Bool property IsVictim auto
Bool property MentallyBroken auto
Actor property PartnerReference auto
Bool property PauseGame auto
int property Position auto
int property RelationshipRank auto
SexLabFramework property SexLab auto
Float property Vibrate auto
sslThreadController property controller auto

String[] ActorsPostoAttackarr
actor[] Actorsinplay
Bool AppliedRegenValues = false
actor[] Attackersarr
int EnablePrintDebug
string GameFile = "HentairimEnjoyment/HentairimGame.json"
Bool IsPlayer
Bool OnTimer = false
int PlayerPosition
actor[] Receiversarr
int autoplaymaxspeedstepswhenintense
int autoplaymaxspeedstepswhennonintense
int chancefornpctochangespeed
int chancefornpctomodselfenjoyment
int chanceforpctochangespeed
int chanceforpctomodselfenjoyment
int enablegame
int enablegameuserinput
int enablepcgameautoplay
int enablespeedchange
bool isprocessing = false
float keyCooldown = 0.5 ; seconds
float lastKeyTime = 0.0
Float magickregenmult
int npccanchangespeedwhennonvictim
int npccanchangespeedwhenvictim
int npccanmodselfenjoymentwhennonvictim
int npccanmodselfenjoymentwhenvictim
int npcconsumptiondatatype
Float npcmagickaconsumption
Float npcpartnerenjoymentmult
float npcreceiveenjoymentmultwhenattackingpartnerduringpenetration
Float npcselfenjoymentmod
int npcslowdownafterorgasm
Float npcstaminaconsumptionpersecond
float originalmagickaregen
float originalstaminaregen
int pcautoplayslowdownafterorgasm
int pccanchangespeedwhennonvictim
int pccanchangespeedwhenvictim
int pccanmodselfenjoymentwhennonvictim
int pccanmodselfenjoymentwhenvictim
int pcconsumptiondatatype
Float pcmagickaconsumption
Float pcpartnerenjoymentmult
float pcreceiveenjoymentmultwhenattackingpartnerduringpenetration
Float pcselfenjoymentmod
Float pcstaminaconsumptionpersecond
actor playerref
Float regenmultwhenintensepenetration
Float regenmultwhennonintensepenetration
Float secondstoreachtargetspeed
Float secondstoupdate
Float speedchangestep
Float staminaregenmult
int userinputignoreposition

event OnEffectFinish(Actor akTarget, Actor akCaster)
     Remove()
     HentairimGameReset()
endevent

event OnEffectStart(Actor akTarget, Actor akCaster)
  File = "/SLSO/Config.json"
  SexLab = Quest.GetQuest("SexLabQuestFramework") as SexLabFramework
  RegisterForModEvent("SLSO_Start_widget", "Start_widget")
  RegisterForModEvent("AnimationEnd", "OnSexLabEnd")
  RegisterKey(JsonUtil.GetIntValue(File, "hotkey_pausegame"))
endevent

event OnKeyDown(int keyCode)
  if !Utility.IsInMenuMode() && isplayer && enablegameuserinput == 1
    float now = Utility.GetCurrentRealTime()
    if now - lastKeyTime < keyCooldown
      return ; skip if cooldown not passed
    endif
    PrintDebug("OnKeyDown")
    lastKeyTime = now
    int hotkeyBonus = JsonUtil.GetIntValue(File, "hotkey_bonusenjoyment")
    int hotkeyEdge = JsonUtil.GetIntValue(File, "hotkey_edge")
    int hotkeyUtility = JsonUtil.GetIntValue(File, "hotkey_utility")
    PrintDebug("OnKeyDown-check:" + CheckifCanChangeSpeed(GetTargetActor()))
    if keyCode == hotkeyBonus && (CheckifCanChangeSpeed(GetTargetActor()) || userinputignoreposition == 1)
      if Input.IsKeyPressed(hotkeyUtility)
        ChangeSpeedGear(-1)
      else
        ChangeSpeedGear(1)
      endif
    elseif keyCode == hotkeyEdge && (CheckifCanmodselfenjoyment() || userinputignoreposition == 1)
      if Input.IsKeyPressed(hotkeyUtility)
        ModSelfEnjoyment(true)
      else
        ModSelfEnjoyment()
      endif
    endif
  endif
endevent

event OnPlayerLoadGame()
  Remove()
endevent

event OnSexLabEnd(string EventName, string argString, Float argNum, form sender)
  if controller == SexLab.GetController(argString as int)
    Remove()
    HentairimGameReset()
  endif
endevent

Event OnUpdate()
	printdebug("on update")

	if isplayer
		Findattackersandreceivers()

		; Run NPC speed change logic
		int f = 0
		while f < Attackersarr.length
			if Attackersarr[f] != playerref && CheckifCanChangeSpeed(Attackersarr[f])
				if Utility.RandomInt(1, 100) <= chancefornpctochangespeed && GetSpeedGear() <= 0 && Staminaisfull(Attackersarr[f])
					ChangeSpeedGear(Utility.RandomInt(1, GetSpeedsteps()))
				endif
			endif
			f += 1
		endwhile
	endif

	ApplyRegenvalues()

	; PC autoplay
	if isplayer && enablepcgameautoplay == 1
		if GetSpeedGear() == 0 && CheckifCanmodselfenjoyment() && Utility.RandomInt(1, 100) <= chanceforpctomodselfenjoyment
			ModSelfEnjoyment()
		endif

		if Utility.RandomInt(1, 100) <= chanceforpctochangespeed && CheckifCanChangeSpeed(GetTargetActor()) && GetSpeedGear() <= 0 && Staminaisfull(GetTargetActor())
			ChangeSpeedGear(Utility.RandomInt(1, GetSpeedsteps()))
		endif
	else
		; NPC autoplay
		if GetSpeedGear() == 0 && CheckifCanmodselfenjoyment() && Utility.RandomInt(1, 100) <= chancefornpctomodselfenjoyment
			ModSelfEnjoyment()
		endif
	endif

	;-------------------Speed Up Gear-----------------
	if Receiversarr.length > 0 && GetSpeedGear() > 0 && IsPlayer
		float SecondsCounter = 0.0
		printdebug(Attackersarr[0].GetDisplayName() + " stamina : " + Attackersarr[0].GetActorValue("Stamina"))
    int safeguard = 5
		while GetSpeedGear() != 0 && HaveStamina(Attackersarr[0]) && safeguard>0
			float Speed = 1 + (speedchangestep * GetSpeedGear())

			; Apply speed to actors
			if HasAnimSpeedHelper()
				int v = 0
				while v < Actorsinplay.length
					printdebug("apply speed : " + Speed + " to " + Actorsinplay[v].GetDisplayName())
					if Speed != AnimSpeedHelper.GetAnimationSpeed(Actorsinplay[v], 0)
						AnimSpeedHelper.SetAnimationSpeed(Actorsinplay[v], Speed, secondstoreachtargetspeed, 0)
					endif
					v += 1
				endwhile
			endif

			; Process attackers
			int s = 0
			while s < Attackersarr.length
				float attackingenjoymentmult = npcreceiveenjoymentmultwhenattackingpartnerduringpenetration
				if Attackersarr[s] == playerref
					attackingenjoymentmult = pcreceiveenjoymentmultwhenattackingpartnerduringpenetration
				endif
				float ConsumeStamina = GetStaminaDamage(Attackersarr[s]) * GetSpeedGear() * Attackersarr.length
				Attackersarr[s].DamageActorValue("Stamina", ConsumeStamina)
				ModEnjoyment(Attackersarr[s], 0, GetEnjoymentChanges(Attackersarr[s]) * attackingenjoymentmult * GetSpeedGear())
				s += 1
			endwhile

			; Process receivers
			int r = 0
			while r < Receiversarr.length
				float receiverenjoymentmult = npcpartnerenjoymentmult
				if r < Attackersarr.length && Attackersarr[r] == playerref
					receiverenjoymentmult = pcpartnerenjoymentmult
				endif
				ModEnjoyment(Receiversarr[r], 0, GetEnjoymentChanges(Receiversarr[r]) * receiverenjoymentmult * GetSpeedGear())
				r += 1
			endwhile

			Utility.WaitMenuMode(1.0)

			if GetSpeedGear() > 0 && ShouldSlowdown(Attackersarr[0])
				ChangeSpeedGear(0, true)
			endif
      safeguard-=1
		endwhile

		; Restore speed
		if HasAnimSpeedHelper()
			int y = 0
			while y < Actorsinplay.length
				ChangeSpeedGear(0, true)
				AnimSpeedHelper.SetAnimationSpeed(Actorsinplay[y], 1, secondstoreachtargetspeed, 0)
				y += 1
			endwhile
		endif
	endif

	RegisterForSingleUpdate(secondstoupdate)
EndEvent




event Start_widget(Int Widget_Id, Int Thread_Id)
  UnregisterForModEvent("SLSO_Start_widget")
  controller = SexLab.GetController(Thread_Id)
  Actorsinplay = controller.Positions
  InitializeHentairimGame()
  HentairimGameReset()

  ;check if game enabled
  if enablegame == 1
    printdebug("initialize game")
    PauseGame = false
    IsAggressor = controller.IsAggressor(GetTargetActor())
    IsVictim = controller.IsVictim(GetTargetActor())
    IsFemale = controller.ActorAlias(GetTargetActor()).GetGender() == 1
    IsPlayer = controller.ActorAlias(GetTargetActor()).GetActorRef() == Game.GetPlayer()
    playerref = game.GetPlayer()
    Position = controller.Positions.Find(GetTargetActor())
    PlayerPosition = controller.Positions.Find(Game.GetPlayer())
    RelationshipRank = controller.GetLowestPresentRelationshipRank(GetTargetActor())
    originalmagickaregen = GetTargetActor().GetActorValue("MagickaRate")
    originalstaminaregen = GetTargetActor().GetActorValue("StaminaRate")
    if IsPlayer
      ;			SexLab.Log(" SLSO Setup() Player, enabling hotkeys")
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_edge"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_orgasm"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_bonusenjoyment"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_select_actor_1"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_select_actor_2"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_select_actor_3"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_select_actor_4"))
      RegisterKey(JsonUtil.GetIntValue(File, "hotkey_select_actor_5"))
    endif

    ;Estrus, increase enjoyment
    ;;	if controller.Animation.HasTag("Estrus")\
    ;	|| controller.Animation.HasTag("Machine")\
    ;	|| controller.Animation.HasTag("Slime")\
    ;	|| controller.Animation.HasTag("Ooze")
    self.RegisterForModEvent("DeviceVibrateEffectStart", "OnVibrateStart")
    self.RegisterForModEvent("DeviceVibrateEffectStop", "OnVibrateStop")
    RegisterForSingleUpdate(1)
  else
    Remove()
  endif
endevent

bool function ActorIsInArray(Actor[] actorArr, Actor char)
  if !actorArr || !char
    return false
  endif
  int g = 0
  while g < actorArr.Length
    if actorArr[g] == char
      return true
    endif
    g += 1
  endwhile
  return false
endfunction

function ApplyRegenvalues()
  if enablegame == 1
    if !AppliedRegenValues
      actor char = GetTargetActor()
      float MagickaRegenValue = originalmagickaregen * magickregenmult
      float StaminaRegenValue = originalstaminaregen * staminaregenmult
      printdebug("originalmagickaregen : " + originalmagickaregen)
      printdebug("originalstaminaregen : " + originalstaminaregen)
      printdebug("MagickaRegenValue : " + MagickaRegenValue)
      printdebug("StaminaRegenValue : " + StaminaRegenValue)
      if (IsGivingPenetration(Char) || IsGettingPenetrated(Char)) && Isintense()
        printdebug("intense penetration ")
        MagickaRegenValue = MagickaRegenValue * regenmultwhenintensepenetration
        StaminaRegenValue = StaminaRegenValue * regenmultwhenintensepenetration
      elseif (IsGivingPenetration(Char) || IsGettingPenetrated(Char))
        printdebug("non intense penetration ")
        MagickaRegenValue = MagickaRegenValue * regenmultwhennonintensepenetration
        StaminaRegenValue = StaminaRegenValue * regenmultwhennonintensepenetration
      endif
      printdebug("Sexlab Magicka Regen Value : " + MagickaRegenValue)
      printdebug("Sexlab Stamina Regen Value : " + StaminaRegenValue)
      Char.SetActorValue("MagickaRate", MagickaRegenValue)
      Char.SetActorValue("StaminaRate", StaminaRegenValue)
      AppliedRegenValues = true
    endif
  endif
endfunction

function ChangeSpeedGear(int value, bool absolute=false)
  int Gear = GetSpeedGear()
  if absolute == true
    Gear = value
  else
    Gear += Value
  endif
  if Gear < 0
    Gear = 0
  endif
  StorageUtil.SetintValue(None, "HentairimSpeedGear", Gear)
  if EnablePrintDebug > 0
    Debug.Notification("Hentairim : Speed Gear : " + GetSpeedGear())
  endif
  printdebug("changing speed gear to : " + GetSpeedGear())
endfunction

Bool function CheckifCanChangeSpeed(actor char)
   if !ActorisinArray(attackersarr, char)
     return false
   endif
  if char == playerref
    if IsVictim && pccanchangespeedwhenvictim != 1
      return false
    elseif !IsVictim && pccanchangespeedwhennonvictim != 1
      return false
    else
      return true
    endif
  else
    if IsVictim && npccanchangespeedwhenvictim != 1
      return false
    elseif !IsVictim && npccanchangespeedwhennonvictim != 1
      return false
    else
      return true
    endif
  endif
endfunction

Bool function CheckifCanmodselfenjoyment()
  if IsPlayer
    if IsVictim && pccanmodselfenjoymentwhenvictim != 1
      ;skipping mod self enjoyment if is victim and not enabled
      return false
    elseif !IsVictim && pccanmodselfenjoymentwhennonvictim != 1
      return false
    else
      return true
    endif
  else
    if IsVictim && npccanmodselfenjoymentwhenvictim != 1
      ;skipping mod self enjoyment if is victim and not enabled
      return false
    elseif !IsVictim && npccanmodselfenjoymentwhennonvictim != 1
      return false
    else
      return true
    endif
  endif
endfunction

function Findattackersandreceivers()
  if Actorsinplay.length < 1 || isprocessing
    return
  endif
  isprocessing = true
  string ActorsPosToAttack
  Receiversarr = new actor[1]
  Attackersarr = new actor[1]
  int X = 0
  int actorcount = 0
  printdebug("Finding Attackers and Receivers")
  x = 0
  while x < Actorsinplay.length
    Actor receiver
    Actor Attacker

    ;printdebug("Enjoyment : " + Actorsinplay[x].getdisplayname() + " = " + GetEnjoyment(Actorsinplay[x]))
    ;	printdebug("PenisActionLabel : " + Actorsinplay[x].getdisplayname() + " = "+ PenisActionLabel(Actorsinplay[x]))
    ;	printdebug("OralLabel : " + Actorsinplay[x].getdisplayname() + " = "+ OralLabel(Actorsinplay[x]))
    ;printdebug("PenetrationLabel : "+ Actorsinplay[x].getdisplayname() + " = "+ PenetrationLabel(Actorsinplay[x]))
    printdebug(Actorsinplay[x].getdisplayname() + " penis label : " + PenisActionLabel(Actorsinplay[x]))

    ;if IsVictim
    ;	printdebug(Actorsinplay[x].getdisplayname() + "is victim. add to Receivers")
    ;	receiver = Actorsinplay[x]
    ;else
    if IsCowgirl(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is femdom/cowgirl. add to attackers")
      Attacker = Actorsinplay[x]
	    elseif IsMasturbation(Actorsinplay[x])
	     printdebug(Actorsinplay[x].getdisplayname() + " is masturbating. add to attackers and receivers")
	     Attacker = Actorsinplay[x]
	     receiver = Actorsinplay[x]
    elseif IsgettingPenetrated(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is getting penetrated.add to receivers")
      receiver = Actorsinplay[x]
    elseif IsGettingpenisforeplay(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is getting penis foreplay.add to receivers")
      receiver = Actorsinplay[x]
      if !ActorisinArray(Attackersarr, Actorsinplay[0])
        Attacker = Actorsinplay[0]
      endif
    elseif IsGettingSuckedoff(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is getting sucked off. add to receiver")
      receiver = Actorsinplay[x]
    elseif IsGivingPenetration(Actorsinplay[x]) && IsCowgirl(Actorsinplay[0])
      printdebug(Actorsinplay[x].getdisplayname() + " is getting femdommed. add to receiver")
      receiver = Actorsinplay[x]
    elseif IsGettingSuckedoff(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is getting sucked off . add to receiver")
      Attacker = Actorsinplay[x]
    elseif IsGivingPenetration(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is giving penetration. add to attackers")
      Attacker = Actorsinplay[x]
    elseif IsSuckingoffOther(Actorsinplay[x])
      printdebug(Actorsinplay[x].getdisplayname() + " is sucking off other. add to attackers")
      Attacker = Actorsinplay[x]
    endif

    ;	printdebug("Receiver : " + receiver)
    Receiversarr = papyrusutil.pushactor(Receiversarr, receiver)
    Attackersarr = papyrusutil.pushactor(Attackersarr, Attacker)
    x += 1
  endwhile
  Receiversarr = papyrusutil.RemoveActor(Receiversarr, none)
  Attackersarr = papyrusutil.RemoveActor(Attackersarr, none)
  Receiversarr = papyrusutil.MergeActorArray(Receiversarr, Receiversarr, true)
  Attackersarr = papyrusutil.MergeActorArray(Attackersarr, Attackersarr, true)
  printdebug("Attackers : " + Attackersarr + " length : " + Attackersarr.length)
  printdebug("Receivers : " + Receiversarr + " length : " + Receiversarr.length)
  isprocessing = false
endfunction

float function GetEnjoyment(actor char)
  return (controller.ActorAlias(char).GetFullEnjoyment() as float)
endfunction

float function GetEnjoymentChanges(actor char)
  printdebug("Enjoyment Changes : " + controller.ActorAlias(char).GetEnjoymentChanges())
  return controller.ActorAlias(char).GetEnjoymentChanges()
endfunction

float function GetMagickaDamage(actor char)
  float value
  if char == playerref
    if pcconsumptiondatatype == 1 ; percentage
      value = pcmagickaconsumption * char.GetBaseActorValue("Magicka")
    else ; absolute
      value = pcmagickaconsumption
    endif
  else
    if npcconsumptiondatatype == 1 ; percentage
      value = npcmagickaconsumption * char.GetBaseActorValue("Magicka")
    else ; absolute
      value = npcmagickaconsumption
    endif
  endif
  return value
endfunction

int function GetSpeedGear()
  return StorageUtil.GetintValue(None, "HentairimSpeedGear", 0)
endfunction

int function GetSpeedsteps()
  if Isintense()
    return autoplaymaxspeedstepswhenintense
  else
    return autoplaymaxspeedstepswhennonintense
  endif
endfunction

float function GetStaminaDamage(actor char)
  float value
  if char == playerref
    if pcconsumptiondatatype == 1 ; percentage
      value = pcstaminaconsumptionpersecond * char.GetBaseActorValue("Stamina")
    else ; absolute
      value = pcstaminaconsumptionpersecond
    endif
  else
    if npcconsumptiondatatype == 1 ; percentage
      value = npcstaminaconsumptionpersecond * char.GetBaseActorValue("Stamina")
    else ; absolute
      value = npcstaminaconsumptionpersecond
    endif
  endif
  return value
endfunction

bool function HasAnimSpeedHelper()
  int version = AnimSpeedHelper.GetVersion()
  return version > 0 && enablespeedchange > 0
endfunction

bool function HaveStamina(actor char)
  return char.GetActorValue("Stamina") > 0
endfunction

bool function HentairimGameReset()
  ChangeSpeedGear(0, true)
  if !ActorsInPlay
    return false
  endif
  int v = 0
  while v < ActorsInPlay.Length
    if ActorsInPlay[v]
      AnimSpeedHelper.SetAnimationSpeed(ActorsInPlay[v], 1, 1, 0)
    else
      printdebug("HentairimGameReset: ActorsInPlay[" + v + "] is None")
    endif
    v += 1
  endwhile
  return true
endfunction

function InitializeHentairimGame()
  ;float
  secondstoupdate = JsonUtil.GetFloatValue(GameFile, "secondstoupdate", 0.0)
  magickregenmult = JsonUtil.GetFloatValue(GameFile, "magickregenmult", 0.0)
  staminaregenmult = JsonUtil.GetFloatValue(GameFile, "staminaregenmult", 0.0)
  regenmultwhennonintensepenetration = JsonUtil.GetFloatValue(GameFile, "regenmultwhennonintensepenetration", 1.0)
  regenmultwhenintensepenetration = JsonUtil.GetFloatValue(GameFile, "regenmultwhenintensepenetration", 1.0)
  speedchangestep = JsonUtil.GetFloatValue(GameFile, "speedchangestep", 0.0)
  secondstoreachtargetspeed = JsonUtil.GetFloatValue(GameFile, "secondstoreachtargetspeed", 0.0)
  pcmagickaconsumption = JsonUtil.GetFloatValue(GameFile, "pcmagickaconsumption", 0.0)
  pcstaminaconsumptionpersecond = JsonUtil.GetFloatValue(GameFile, "pcstaminaconsumptionpersecond", 0.0)
  pcselfenjoymentmod = JsonUtil.GetFloatValue(GameFile, "pcselfenjoymentmod", 0.0)
  pcpartnerenjoymentmult = JsonUtil.GetFloatValue(GameFile, "pcpartnerenjoymentmult", 0.0)
  pcreceiveenjoymentmultwhenattackingpartnerduringpenetration = JsonUtil.GetFloatValue(GameFile, "pcreceiveenjoymentmultwhenattackingpartnerduringpenetration", 0.0)
  npcmagickaconsumption = JsonUtil.GetFloatValue(GameFile, "npcmagickaconsumption", 0.0)
  npcstaminaconsumptionpersecond = JsonUtil.GetFloatValue(GameFile, "npcstaminaconsumptionpersecond", 0.0)
  npcselfenjoymentmod = JsonUtil.GetFloatValue(GameFile, "npcselfenjoymentmod", 0.0)
  npcpartnerenjoymentmult = JsonUtil.GetFloatValue(GameFile, "npcpartnerenjoymentmult", 0.0)
  npcreceiveenjoymentmultwhenattackingpartnerduringpenetration = JsonUtil.GetFloatValue(GameFile, "npcreceiveenjoymentmultwhenattackingpartnerduringpenetration", 0.0)

  ;int
  enablegame = JsonUtil.GetIntValue(GameFile, "enablegame", 0)
  enablepcgameautoplay = JsonUtil.GetIntValue(GameFile, "enablepcgameautoplay", 0)
  enablegameuserinput = JsonUtil.GetIntValue(GameFile, "enablegameuserinput", 0)
  userinputignoreposition = JsonUtil.GetIntValue(GameFile, "userinputignoreposition", 0)
  enablespeedchange = JsonUtil.GetIntValue(GameFile, "enablespeedchange", 0)
  pcconsumptiondatatype = JsonUtil.GetIntValue(GameFile, "pcconsumptiondatatype", 0)
  npcconsumptiondatatype = JsonUtil.GetIntValue(GameFile, "npcconsumptiondatatype", 0)
  pcautoplayslowdownafterorgasm = JsonUtil.GetIntValue(GameFile, "pcautoplayslowdownafterorgasm", 0)
  npcslowdownafterorgasm = JsonUtil.GetIntValue(GameFile, "npcslowdownafterorgasm", 0)
  chanceforpctomodselfenjoyment = JsonUtil.GetIntValue(GameFile, "chanceforpctomodselfenjoyment", 0)
  chanceforpctochangespeed = JsonUtil.GetIntValue(GameFile, "chanceforpctochangespeed", 0)
  chancefornpctomodselfenjoyment = JsonUtil.GetIntValue(GameFile, "chancefornpctomodselfenjoyment", 0)
  chancefornpctochangespeed = JsonUtil.GetIntValue(GameFile, "chancefornpctochangespeed", 0)
  autoplaymaxspeedstepswhennonintense = JsonUtil.GetIntValue(GameFile, "autoplaymaxspeedstepswhennonintense", 1)
  autoplaymaxspeedstepswhenintense = JsonUtil.GetIntValue(GameFile, "autoplaymaxspeedstepswhenintense", 1)
  pccanmodselfenjoymentwhenvictim = JsonUtil.GetIntValue(GameFile, "pccanmodselfenjoymentwhenvictim", 0)
  pccanchangespeedwhenvictim = JsonUtil.GetIntValue(GameFile, "pccanchangespeedwhenvictim", 0)
  npccanmodselfenjoymentwhenvictim = JsonUtil.GetIntValue(GameFile, "npccanmodselfenjoymentwhenvictim", 0)
  npccanchangespeedwhenvictim = JsonUtil.GetIntValue(GameFile, "npccanchangespeedwhenvictim", 0)
  pccanmodselfenjoymentwhennonvictim = JsonUtil.GetIntValue(GameFile, "pccanmodselfenjoymentwhennonvictim", 0)
  pccanchangespeedwhennonvictim = JsonUtil.GetIntValue(GameFile, "pccanchangespeedwhennonvictim", 0)
  npccanmodselfenjoymentwhennonvictim = JsonUtil.GetIntValue(GameFile, "npccanmodselfenjoymentwhennonvictim", 0)
  npccanchangespeedwhennonvictim = JsonUtil.GetIntValue(GameFile, "npccanchangespeedwhennonvictim", 0)
  EnablePrintDebug = JsonUtil.GetIntValue(GameFile, "printdebug", 0)
  printdebug("Initializing Hentairim Game config")
  Printdebug("enablegame : " + enablegame)
  Printdebug("magickregenmult : " + magickregenmult)
  Printdebug("staminaregenmult : " + staminaregenmult)
  Printdebug("regenmultwhennonintensepenetration : " + regenmultwhennonintensepenetration)
  Printdebug("regenmultwhenintensepenetration : " + regenmultwhenintensepenetration)
  Printdebug("pcmagickaconsumption : " + pcmagickaconsumption)
  Printdebug("pcstaminaconsumptionpersecond : " + pcstaminaconsumptionpersecond)
  Printdebug("pcselfenjoymentmod : " + pcselfenjoymentmod)
  Printdebug("pcpartnerenjoymentmult : " + pcpartnerenjoymentmult)
  Printdebug("pcreceiveenjoymentmultwhenattackingpartnerduringpenetration : " + pcreceiveenjoymentmultwhenattackingpartnerduringpenetration)
  Printdebug("npcmagickaconsumption : " + npcmagickaconsumption)
  Printdebug("npcstaminaconsumptionpersecond : " + npcstaminaconsumptionpersecond)
  Printdebug("npcselfenjoymentmod : " + npcselfenjoymentmod)
  Printdebug("npcpartnerenjoymentmult : " + npcpartnerenjoymentmult)
  Printdebug("npcreceiveenjoymentmultwhenattackingpartnerduringpenetration : " + npcreceiveenjoymentmultwhenattackingpartnerduringpenetration)
  Printdebug("enablepcgameautoplay : " + enablepcgameautoplay)
  Printdebug("enablepcgameautoplay : " + enablepcgameautoplay)
  Printdebug("enablegameuserinput : " + enablegameuserinput)
  Printdebug("userinputignoreposition : " + userinputignoreposition)
  Printdebug("enablespeedchange : " + enablespeedchange)
  Printdebug("pcconsumptiondatatype : " + pcconsumptiondatatype)
  Printdebug("npcconsumptiondatatype : " + npcconsumptiondatatype)
  Printdebug("pcautoplayslowdownafterorgasm  : " + pcautoplayslowdownafterorgasm)
  Printdebug("npcslowdownafterorgasm  : " + npcslowdownafterorgasm)
  Printdebug("chanceforpctomodselfenjoyment : " + chanceforpctomodselfenjoyment)
  Printdebug("chanceforpctochangespeed : " + chanceforpctochangespeed)
  Printdebug("chancefornpctomodselfenjoyment : " + chancefornpctomodselfenjoyment)
  Printdebug("chancefornpctochangespeed : " + chancefornpctochangespeed)
  Printdebug("autoplaymaxspeedstepswhennonintense : " + autoplaymaxspeedstepswhennonintense)
  Printdebug("autoplaymaxspeedstepswhenintense : " + autoplaymaxspeedstepswhenintense)
  Printdebug("pccanmodselfenjoymentwhenvictim : " + pccanmodselfenjoymentwhenvictim)
  Printdebug("pccanchangespeedwhenvictim : " + pccanchangespeedwhenvictim)
  Printdebug("npccanmodselfenjoymentwhenvictim : " + npccanmodselfenjoymentwhenvictim)
  Printdebug("npccanchangespeedwhenvictim : " + npccanchangespeedwhenvictim)
  Printdebug("pccanmodselfenjoymentwhennonvictim : " + pccanmodselfenjoymentwhennonvictim)
  Printdebug("pccanchangespeedwhennonvictim : " + pccanchangespeedwhennonvictim)
  Printdebug("npccanmodselfenjoymentwhennonvictim : " + npccanmodselfenjoymentwhennonvictim)
  Printdebug("npccanchangespeedwhennonvictim : " + npccanchangespeedwhennonvictim)
endfunction

Bool function IsCowgirl(actor char)
  return PenetrationLabel(char) == "SCG" || PenetrationLabel(char) == "FCG" || PenetrationLabel(char) == "SAC" || PenetrationLabel(char) == "FAC"
endfunction

Bool function IsGettingAnallyPenetrated(actor char)
  return PenetrationLabel(char) == "SAP" || PenetrationLabel(char) == "FAP" || PenetrationLabel(char) == "SAC" || PenetrationLabel(char) == "FAC" || PenetrationLabel(char) == "SDP" || PenetrationLabel(char) == "FDP"
endfunction

Bool function IsGettingSuckedoff(actor char)
  return PenisActionLabel(char) == "SMF" || PenisActionLabel(char) == "FMF"
endfunction

Bool function IsGettingVaginallyPenetrated(actor char)
  return PenetrationLabel(char) == "SVP" || PenetrationLabel(char) == "FVP" || PenetrationLabel(char) == "SCG" || PenetrationLabel(char) == "FCG" || PenetrationLabel(char) == "SDP" || PenetrationLabel(char) == "FDP"
endfunction

Bool function IsGettingpenisforeplay(actor char)
  return PenisActionLabel(char) == "SFJ" || PenisActionLabel(char) == "FFJ" || PenisActionLabel(char) == "STF" || PenisActionLabel(char) == "FTF" || PenisActionLabel(char) == "SHJ" || PenisActionLabel(char) == "FHJ"
endfunction

Bool function IsGivingAnalPenetration(actor char)
  return PenisActionLabel(char) == "FDA" || PenisActionLabel(char) == "SDA"
endfunction

Bool function IsGivingPenetration(actor char)
  return IsGivingAnalPenetration(char) || IsGivingVaginalPenetration(char)
endfunction

Bool function IsGivingVaginalPenetration(actor char)
  return PenisActionLabel(char) == "FDV" || PenisActionLabel(char) == "SDV"
endfunction

Bool function IsSuckingoffOther(actor char)
  return OralLabel(char) == "SBJ" || OralLabel(char) == "FBJ"
endfunction

Bool function IsgettingPenetrated(actor char)
  return IsGettingAnallyPenetrated(char) || IsGettingVaginallyPenetrated(char)
endfunction

Bool function IsMasturbation(actor char)
  return controller.Animation.HasTag("Masturbation")
endfunction

Bool function Isintense()
  return controller.ActorAlias(playerref).Isintense()
endfunction

function ModEnjoyment(Actor PartnerRef, float mod=0.0, float FullEnjoymentMOD)
  controller.ActorAlias(PartnerRef).BonusEnjoyment(PartnerRef, math.ceiling(FullEnjoymentMOD), VerifiedCall=true)
  printdebug(GetTargetActor().GetDisplayName() + "is altering " + partnerref.GetDisplayName() + "'s Enjoyment " + FullEnjoymentMOD)
endfunction

function ModSelfEnjoyment(bool inverse=false) ;use magicka to mod self Enjoyment
  ;GetTargetActor().GetBaseActorValue("Magicka")
  if IsPlayer
    if inverse
      pcselfenjoymentmod = pcselfenjoymentmod * -1
    endif
    if GetMagickaDamage(GetTargetActor()) <= GetTargetActor().GetActorValue("Magicka")
      GetTargetActor().DamageActorValue("Magicka", GetMagickaDamage(GetTargetActor()))
      ModEnjoyment(GetTargetActor(), 0, pcselfenjoymentmod)
      printdebug(GetTargetActor().GetDisplayName() + " is modifying own enjoyment : " + pcselfenjoymentmod)
    endif
  else
    if inverse
      npcselfenjoymentmod = npcselfenjoymentmod * -1
    endif
    if GetMagickaDamage(GetTargetActor()) <= GetTargetActor().GetActorValue("Magicka")
      GetTargetActor().DamageActorValue("Magicka", GetMagickaDamage(GetTargetActor()))
      ModEnjoyment(GetTargetActor(), 0, npcselfenjoymentmod)
      printdebug(GetTargetActor().GetDisplayName() + " is modifying own enjoyment : " + npcselfenjoymentmod)
    endif
  endif
endfunction

String function OralLabel(actor char)
  return controller.ActorAlias(char).OralLabel()
endfunction

String function PenetrationLabel(actor char)
  return controller.ActorAlias(char).PenetrationLabel()
endfunction

String function PenisActionLabel(actor char)
  return controller.ActorAlias(char).GetPenisActionLabel()
endfunction

Function PrintDebug(String asMessage, Int aiPriority = 0)
	if EnablePrintDebug == 1
		hentairim_log.WriteLog(asMessage, aiPriority, "SLSO_SpellGameScript")
    miscutil.printconsole(asMessage)
	endif
EndFunction

; function PrintDebug(string Contents="")
;    String debugMessage 
;   if EnablePrintDebug > 0
;     if GetTargetActor()
;        debugMessage = "HentaiRim Game : (" + GetTargetActor().GetDisplayName() + " - " + ")" + Contents
;       miscutil.printconsole(debugMessage)
;       Debug.Trace(debugMessage, 0)
;     else
;        debugMessage = "HentaiRim Game : " + Contents
;       miscutil.printconsole(debugMessage)
;       Debug.Trace(debugMessage, 0)
;     endif

;     ;bool function WriteToFile(string fileName, string text, bool append = true, bool timestamp = false) global native
;   endif
; endfunction
;----------------------------------------------------------------------------
;Hotkeys
;----------------------------------------------------------------------------
function RegisterKey(int RKey=0)
  if (RKey != 0)
    self.RegisterForKey(RKey)
  endif
endfunction

function Remove()
  if GetTargetActor() != none
    ResetRegenValues()
    UnRegisterForUpdate()
    UnregisterForAllModEvents()
    UnregisterForAllKeys()
    SLSO_MCM SLSO = Quest.GetQuest("SLSO") as SLSO_MCM
    if GetTargetActor().HasSpell(SLSO.SLSO_SpellGame)
      GetTargetActor().RemoveSpell(SLSO.SLSO_SpellGame)
    endif
    printdebug("Remove Game")
  endif
endfunction

function ResetRegenValues()
  if enablegame == 1
    printdebug("Reset Regen ")
    GetTargetActor().SetActorValue("MagickaRate", originalmagickaregen)
    GetTargetActor().SetActorValue("StaminaRate", originalstaminaregen)
  endif
endfunction

Bool function ShouldSlowdown(actor char)
  if char == playerref && pcautoplayslowdownafterorgasm == 0
    return false
  elseif char != playerref && npcslowdownafterorgasm == 0
    return false
  else
    printdebug(" Slowing Down after Orgasm : " + controller.ActorAlias(char).GetSecondsSinceLastOrgasm() <= secondstoupdate + 3)
    return controller.ActorAlias(char).GetSecondsSinceLastOrgasm() <= secondstoupdate + 3
  endif
endfunction

bool function Staminaisfull(actor char)
  return char.GetActorValue("Stamina") >= char.GetBaseActorValue("Stamina")
endfunction
