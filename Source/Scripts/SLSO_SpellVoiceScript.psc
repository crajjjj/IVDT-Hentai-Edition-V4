	Scriptname SLSO_SpellVoiceScript extends activemagiceffect

SexLabFramework Property SexLab auto
sslThreadController Property controller auto

String Property File auto
Bool Property IsVictim auto
Bool Property IsPlayer auto
Bool Property IsSilent auto
Bool Property IsFemale auto
Int Property Voice auto
FormList Property SoundContainer auto
float ASLsecondstodelay
string stagelabel
int stage 
Bool ASLCurrentlyintense 
int ASLSoundPosition 
sslBaseAnimation anim 
actor player
Actor[] actorList
string ASLSFX

Event OnEffectStart( Actor akTarget, Actor akCaster )
	
	
	
	IsPlayer = akTarget == Game.GetPlayer()
	File = "/SLSO/Config.json"
	if IsPlayer ;((JsonUtil.GetIntValue(File, "sl_voice_player") != 0 && IsPlayer) || (JsonUtil.GetIntValue(File, "sl_voice_npc") != 0 && !IsPlayer))
		SexLab = Quest.GetQuest("SexLabQuestFramework") as SexLabFramework
		RegisterForModEvent("SLSO_Start_widget", "Start_widget")
		RegisterForModEvent("AnimationEnd", "OnSexLabEnd")
	else
		Remove()
	endif
EndEvent

Event Start_widget(Int Widget_Id, Int Thread_Id)
	string tid = Thread_Id as string
	UnregisterForModEvent("SLSO_Start_widget")
	controller = SexLab.GetController(Thread_Id)
	
	IsVictim = controller.IsVictim(GetTargetActor())
	IsSilent = controller.ActorAlias(GetTargetActor()).IsSilent()
	IsFemale = controller.ActorAlias(GetTargetActor()).GetGender() == 1


	actorList = SexLab.HookActors(tid)
	
		SoundContainer = (Game.GetFormFromFile(0x535D, "SLSO.esp") as formlist).GetAt(1) as formlist
																							;PC selected voice
				Voice = 1
		
			SoundContainer = SoundContainer.GetAt(Voice - 1) as formlist
	

	RegisterForSingleUpdate(1)
EndEvent

Event OnSexLabEnd(string EventName, string argString, Float argNum, form sender)
	if controller == SexLab.GetController(argString as int)
		Remove()
	endif
EndEvent

Event OnUpdate()
	sound mySFX
	ASLRefreshSoundPosition()
	player = game.getplayer()

	if controller.ActorAlias(GetTargetActor()).GetActorRef() != none || SexLab.FindPlayerController() != -1
		
		if controller.ActorAlias(player).GetState() == "Animating"

				if SoundContainer != none

					while controller.ActorAlias(player).GetState() == "Animating"
						;miscutil.PrintConsole ("ASL SFX still animating" ) 
						ASLRefreshSoundPosition()
						printdebug("ASLSoundPosition " + ASLSoundPosition)
						mySFX = (SoundContainer.GetAt(0) As formlist).GetAt(ASLSoundPosition) As Sound

						mySFX.Playandwait(player)

					endwhile
					RegisterForSingleUpdate(1)
					return
				else
					miscutil.PrintConsole(" smthn wrong " + GetTargetActor().GetDisplayName() + " Voice " + Voice + " SoundContainer " + SoundContainer)
				endif
		endif
	endif
	Remove()
EndEvent

Event OnPlayerLoadGame()
	Remove()
EndEvent

Event OnEffectFinish( Actor akTarget, Actor akCaster )
EndEvent

function Remove()

	If GetTargetActor() != none
		UnRegisterForUpdate()
		UnregisterForAllModEvents()
		UnregisterForAllKeys()
		SLSO_MCM SLSO = Quest.GetQuest("SLSO") as SLSO_MCM
		If GetTargetActor().HasSpell(SLSO.SLSO_SpellVoice)
			GetTargetActor().RemoveSpell(SLSO.SLSO_SpellVoice)
		EndIf
	EndIf
endFunction

String Stimulationlabel
string OralLabel
string PenetrationLabel
String Labelsconcat


Function ASLRefreshSoundPosition()


stage =  controller.stage
anim = controller.animation

 Stimulationlabel = HentairimTags.StimulationLabel(anim , stage , 0)
 OralLabel  = HentairimTags.OralLabel(anim , stage , 0)
 PenetrationLabel = HentairimTags.PenetrationLabel(anim , stage , 0)
 
Labelsconcat = "1" +Stimulationlabel + "1" + OralLabel + "1" + PenetrationLabel

ASLSFX = HentaiRimTags.GetSFX(anim, stage)
;Play from ASL SFX Tags If Any
if ASLSFX != "None" && ASLSFX != ""

	while ASLSFX == "NA" 	; wait until NA SFX stage is finish
		Utility.Wait(3.0)
		stage =  controller.stage
		anim = controller.animation	
		ASLSFX = HentairimTags.GetSFX(anim, stage)

	endwhile

	if ASLSFX == "SS"
		ASLSoundPosition = 3 ; SOFT SLUSHING
	elseif ASLSFX == "MS"
		ASLSoundPosition = 4 ; MEDIUM SLUSHING
	elseif ASLSFX == "FS"
		ASLSoundPosition = 2 ; HEAVY SLUSHING
	elseif ASLSFX == "RS"
		ASLSoundPosition = 7 ; RAPID SLUSHING
	elseif ASLSFX == "SC"
		ASLSoundPosition = 1 ; SLOW CLAPPING
	elseif ASLSFX == "MC"
		ASLSoundPosition = 6 ; SEMI FAST CLAPPING
	elseif ASLSFX == "FC"
		ASLSoundPosition = 5 ; FAST CLAPPING
	elseif ASLSFX == "KS"
		ASLSoundPosition = 8 ; KISSING SOUND
	else
		ASLSoundPosition = 4 ;default to 4 if for some reason ASL SFX tag is not recognized
	endif

elseif IsKissing()
printdebug("IsKissing" )

	ASLSoundPosition = 8 ; Kissinh

elseif IsGettingDoublePenetrated()
printdebug("IsGettingDoublePenetrated" )
	if	Isintense()
		
		ASLSoundPosition = 2 ; HEAVY SLUSHING
	else
		ASLSoundPosition = 7 ; RAPID SLUSHING
	endif
elseif IsgettingPenetrated()
printdebug("IsgettingPenetrated" )
	if Isintense() 
		printdebug("Isintense" )
		if	ishugepp()
			ASLSoundPosition = 3 ; HEAVY SLUSHING
		else
			ASLSoundPosition = 4 ; MEDIUM SLUSHING
		endif
	else
		if	ishugepp()
			ASLSoundPosition = 4 ; MEDIUM SLUSHING
		else
			ASLSoundPosition = 4 ; SOFT SLUSHING
		endif
	endif
elseif IsGettingStimulated()
printdebug("IsGettingStimulated" )
	if Isintense() 
		ASLSoundPosition = 4 ; MEDIUM SLUSHING
	else
		ASLSoundPosition = 3 ; SOFT SLUSHING
	endif

elseif IsCunnilingus()
printdebug("IsCunnilingus" )
	ASLSoundPosition = 3 ; SOFT slushing

elseif !Shouldplaysound()
printdebug("Dont play sound" )
	
	ASLSoundPosition = 0
endif
endfunction

Bool Function IsLeadIN()
	return stringutil.find(Labelsconcat ,"1F") == -1 || stringutil.find(Labelsconcat ,"1S") == -1
endfunction 


Bool Function IshugePP()
string MaleRaceName = 	actorList[1].GetRace().getName()

;miscutil.PrintConsole ("Male Race Name : " + MaleRaceName)

if stringutil.find(MaleRaceName ,"Brute") > -1 || stringutil.find(MaleRaceName ,"Spider") > -1 || stringutil.find(MaleRaceName ,"Lurker") > -1 || stringutil.find(MaleRaceName ,"Daedroth") > -1  ||  stringutil.find(MaleRaceName ,"Horse") > -1 || stringutil.find(MaleRaceName ,"Bear") > -1 || stringutil.find(MaleRaceName ,"Chaurus") > -1 || stringutil.find(MaleRaceName ,"Dragon") > -1 || MaleRaceName ==  "Frost Atronach" || stringutil.find(MaleRaceName ,"Giant") > -1 || MaleRaceName ==  "Mammoth" || MaleRaceName ==  "Sabre Cat" || stringutil.find(MaleRaceName ,"Troll") > -1 || MaleRaceName ==  "Werewolf" || stringutil.find(MaleRaceName ,"Gargoyle") > -1 || MaleRaceName ==  "Dwarven Centurion" || stringutil.find(MaleRaceName ,"Ogre") > -1 ||  MaleRaceName ==  "Ogrim" || MaleRaceName ==  "Nest Ant Flier" || stringutil.find(MaleRaceName ,"OGrim") > -1

Return True 
else 
Return False
endif
EndFunction

Bool Function Isintense()
	return stringutil.find(Labelsconcat ,"1F") > -1 || stringutil.find(Labelsconcat ,"BST") > -1
endfunction

Bool Function IsGettingStimulated()
	return Stimulationlabel == "SST" ||  Stimulationlabel == "FST"
endfunction

Bool Function IsSuckingoffOther()
	return OralLabel == "SBJ" ||  OralLabel == "FBJ"	
endfunction

Bool Function IsGettingDoublePenetrated()

return PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction 

Bool Function IsgettingPenetrated()
	return IsGettingAnallyPenetrated() || IsGettingVaginallyPenetrated()
endfunction

Bool Function IsGettingVaginallyPenetrated()
	return PenetrationLabel == "SVP" || PenetrationLabel == "FVP" || PenetrationLabel == "SCG" || PenetrationLabel == "FCG" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool Function IsGettingAnallyPenetrated()
	return PenetrationLabel == "SAP" || PenetrationLabel == "FAP"  || PenetrationLabel == "SAC" || PenetrationLabel == "FAC" || PenetrationLabel == "SDP" || PenetrationLabel == "FDP"
endfunction

Bool Function IsKissing()
	return OralLabel == "KIS"
endfunction

Bool Function IsCunnilingus()
	return OralLabel == "CUN"
endfunction

Function PrintDebug(string Contents = "")

;miscutil.printconsole("HentaiRim sound effect " + Contents)

endfunction 

Bool Function Shouldplaysound()

return IsCunnilingus() || IsKissing() || IsgettingPenetrated() || IsGettingStimulated()

endfunction