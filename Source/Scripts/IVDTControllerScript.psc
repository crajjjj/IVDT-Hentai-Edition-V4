Scriptname IVDTControllerScript extends ReferenceAlias  
{This script is attached to a player alias on a quest that is always running. It is responsible for receiving the event for the start of a SexLab scene, and creating a IVDTSceneTrackerScript for it if applicable. It also holds common helper functions.}

SexLabFramework Property SexLab Auto
IVDTMCMConfigurationScript Property ConfigOptions Auto
IVDTSoundsScript Property Sounds Auto
Spell Property SceneTrackerSpell Auto
SoundCategory Property SexLabVoices Auto
SoundCategory Property IVDTVoices Auto
SoundCategory Property IVDTMCMAudio Auto
Race Property WerewolfRace Auto
Race Property VampireLordRace Auto

Int ivdtScenesCurrentlyRunning = 0
Int maleOnlyScenesCurrentlyRunning = 0

;Called first time ever the mod is loaded
Event OnInit()
	PerformInitialization()
EndEvent

;Called on subsequent reloads of the save
Event OnPlayerLoadGame()
	PerformInitialization()
	UnmuteSexLabVoices()
	UpdateMasterVolume()
EndEvent

Function PerformInitialization()
	; Register globally whenever the script is first initialized
	RegisterForTheEventsWeNeed()
EndFunction

Function RegisterForTheEventsWeNeed()
	RegisterForModEvent("AnimationStart", "IVDTSceneStart")
EndFunction

;When a sexlab scene starts, we want to attach our tracker script to an actor involved if one of the actors has a voice specified in our system
Event IVDTSceneStart(string eventName, string argString, float argNum, form sender)
	miscutil.printconsole("IVDT Scene start")
	AddTrackerToSceneIfApplicable(argString)
EndEvent

Function AddTrackerToSceneIfApplicable(string argString)
	Actor[] actorList = SexLab.HookActors(argString)
	
	Int totalActorCount = actorList.Length
;	If !PassesGroupSexRequirement(totalActorCount)
	;	Return
;	EndIf
	Actor PC = game.getplayer()
	Actor voicedFemale = None
	Actor voicedMale = None
	Int maleActorCount = 0
	Int femaleActorCount = 0
	Int voicedMaleActorCount = 0
	bool IsPlayerScene = false
	;First, go through the actors in the scene and determine if we have dirty talk configured to play for them
	Int x = 0
	While x < totalActorCount
	
		;Male
;		If IsMale(actorList[x])
;			maleActorCount += 1
;		
;			If GetVoiceForActor(actorList[x]) != None
;				voicedMaleActorCount += 1
;			
;				If voicedMale == None
;					voicedMale = actorList[x]
;				EndIf
;;			EndIf
	;	
	;	;Female
	;	Else
	;		femaleActorCount += 1
	;		
	;		If voicedFemale == None
	;			If GetVoiceForActress(actorList[x]) != None
	;				voicedFemale = actorList[x]
	;			EndIf
	;		EndIf
	;	EndIf
		if actorList[x] == PC
			IsPlayerScene = true
			x += 100 ;exit
		endif
		x += 1
	EndWhile
	
	;If so, then attach the scene tracker spell to the female voice actor (or the male voice actor if there's no female voice actor).
	;This spell has the scene tracker script which will track the events in the scene and play the dialogue for it.
	;If PassesOtherVoiceRequirements(totalActorCount, voicedFemale != None, voicedMaleActorCount)
	;	miscutil.printconsole("step 1")
	;	If voicedFemale != None && voicedFemale == game.getplayer()
	;		miscutil.printconsole("step 2")
			if PC.HasSpell(SceneTrackerSpell) ;Scene with female voice actor
				PC.RemoveSpell(SceneTrackerSpell)
			endif	
			PC.AddSpell(SceneTrackerSpell, abVerbose = False) ;Scene with female voice actor
	;		miscutil.printconsole("step 4")
	;		miscutil.printconsole("Adding female Spell")
	;	ElseIf voicedMale != None && maleOnlyScenesCurrentlyRunning == 0
	;		voicedMale.AddSpell(SceneTrackerSpell, abVerbose = False) ;Male-only scene (with male voice actor)
	;		miscutil.printconsole("step 5")
	;	EndIf
	;EndIf
		
	;IVDTVoiceFemaleScript f1 = GetOwningQuest().GetAliasByName("Slot1") as IVDTVoiceFemaleScript
	;f1.TestSound.PlayAndWait(actorList[0])
EndFunction

;Enforces the "solo masturation" and "require voice for both actors" requirements
Bool Function PassesOtherVoiceRequirements(Int totalActorCount, Bool sceneHasVoicedFemale, Int voicedMaleCount)
	return true
	;"solo masturation" requirement
;	If totalActorCount == 1
	;	Int soloMasturbationRequirement = ConfigOptions.GetModSettingInt("iAllowSoloMasturbation:VoiceSystemManagement")
		
	;	If soloMasturbationRequirement == 0 ;Never
	;		Return False
	;	ElseIf soloMasturbationRequirement == 1 ;Always
	;		Return True
	;	ElseIf soloMasturbationRequirement == 2 ;Female only
	;		Return sceneHasVoicedFemale
	;	Else ;Male only
	;		Return voicedMaleCount > 0
	;;	EndIf
	
	;"require voice for both actors" requirement
	;Else
	;	If !ConfigOptions.GetModSettingBool("bRequireVoiceForBothActors:VoiceSystemManagement")
		;	Return True
		;ElseIf sceneHasVoicedFemale
		;	Return voicedMaleCount >= 1
	;	Else
	;		Return voicedMaleCount >= 2
	;	EndIf
	;EndIf
EndFunction

Bool Function PassesGroupSexRequirement(Int actorsInScene)
	Int groupSexRequirement = ConfigOptions.GetModSettingInt("iAllowGroupSex:VoiceSystemManagement")
	
	If groupSexRequirement == 0
		Return actorsInScene <= 2
	ElseIf groupSexRequirement == 1
		Return True
	Else
		Return actorsInScene <= 3
	EndIf
EndFunction

Function RegisterThatSceneIsStarting(Bool maleOnlyScene)
	ivdtScenesCurrentlyRunning += 1
	
	If maleOnlyScene
		maleOnlyScenesCurrentlyRunning += 1
	EndIf
	
	If ivdtScenesCurrentlyRunning > 0 && ConfigOptions.GetModSettingBool("bMuteSexLabVoices:VoiceSystemManagement")
		SexLabVoices.Mute()
	EndIf
EndFunction

Function RegisterThatSceneIsEnding(Bool maleOnlyScene)
	ivdtScenesCurrentlyRunning -= 1
	
	If maleOnlyScene
		maleOnlyScenesCurrentlyRunning -= 1
	EndIf
	
	If ivdtScenesCurrentlyRunning <= 0
		SexLabVoices.UnMute()
	EndIf
EndFunction

Function PlaySound(Sound theSound, Actor actorMakingSound, Bool waitForCompletion = True)

	If waitForCompletion
		theSound.PlayAndWait(actorMakingSound)
	Else
		theSound.Play(actorMakingSound)
	EndIf
EndFunction

String Function GetNameOfVoiceType(Actor actorWithVoice)
	Race actorRace = actorWithVoice.GetRace()
	
	If actorRace == WerewolfRace ;Transformable creatures must have their voice type hardcoded, otherwise they would use their non-creature voice type
		If IsMale(actorWithVoice)
			Return "MaleWerewolf"
		Else
			Return "FemaleWerewolf"
		EndIf
	
	ElseIf actorRace == VampireLordRace
		If IsMale(actorWithVoice)
			Return "MaleVampireLord"
		Else
			Return "FemaleVampireLord"
		EndIf
	
	;ElseIf actorWithVoice.GetPlayerControls() ;Hardcoding the voicetype of PC because there appears to be a glitch where occassionally their voice type can't be pulled correctly
	;	If IsMale(actorWithVoice)
	;		Return "MaleEvenToned"
	;	Else
	;		Return "FemaleEvenToned"
	;	EndIf
		
	Else ;Normally, control will go to this else and the voicetype name will be parsed by casting the character's voice type as a string
		VoiceType voiceTypeToGetNameOf = actorWithVoice.GetLeveledActorBase().GetVoiceType()
		String voiceTypeAsString = voiceTypeToGetNameOf as String ;	A string representing the object in the format: "[ScriptName <EditorID (FormID)>]"
		Int startingIndex = StringUtil.Find(voiceTypeAsString, "<") + 1
		Int endingIndex = StringUtil.Find(voiceTypeAsString, " (")
		
		;Debug.MessageBox("got here with result: " + voiceTypeAsString + " - " + StringUtil.Substring(voiceTypeAsString, startingIndex, endingIndex - startingIndex))
		
		Return StringUtil.Substring(voiceTypeAsString, startingIndex, endingIndex - startingIndex) ;Grabs the EditorID section
	EndIf
EndFunction

Bool Function IsMale(Actor actorToAssess)
	Int actorGender = SexLab.GetGender(actorToAssess)
	Return actorGender == 0 || actorGender == 2 ;0 = human male, 2 = male creature
EndFunction

Bool Function IsCreature(Actor actorToAssess)
	Int actorGender = SexLab.GetGender(actorToAssess)
	Return actorGender == 2 || actorGender == 3 ;2 = male creature (or a creature of non-descript gender), 3 = female creature
EndFunction

IVDTVoiceFemaleScript Function GetVoiceForActress(Actor actressToVoice)
	IVDTVoiceFemaleScript herVoiceSlot = None
	string actressName = actressToVoice.GetLeveledActorBase().GetName()
	string actressVoiceType = GetNameOfVoiceType(actressToVoice)
	
	;Run through all voice slots and check if any have a matching actress or voice type
	Int currentSlot = 1
	Int femaleVoiceSlots = ConfigOptions.FemaleVoiceSlots
	String temp = ""
	While currentSlot <= femaleVoiceSlots
	
		;Check for actress match (can safely end search early if its a match)
		temp = ConfigOptions.GetModSettingString("sFemale" + currentSlot + "Actor:FemaleVoices")
		If actressName == temp
			herVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + currentSlot) as IVDTVoiceFemaleScript
			Return herVoiceSlot
		EndIf
		
		;Check for voice type match (if we get a match, remember it and keep going through rest in case we get a higher priority actress match later on)
		temp = ConfigOptions.GetModSettingString("sFemale" + currentSlot + "VoiceType:FemaleVoices")
		If actressVoiceType == temp
			herVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + currentSlot) as IVDTVoiceFemaleScript
		EndIf
	
		currentSlot += 1
	EndWhile
	
	;If there are no matching voice slots, use default if its been set
	If herVoiceSlot == None
		Int defaultSlot = 0
		If IsCreature(actressToVoice)
			defaultSlot = ConfigOptions.GetModSettingInt("iFemaleCreatureDefaultVoice:DefaultVoices")
		Else
			defaultSlot = ConfigOptions.GetModSettingInt("iFemaleDefaultVoice:DefaultVoices")
		EndIf
		
		If defaultSlot > 0 && defaultSlot <= femaleVoiceSlots
			herVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + defaultSlot) as IVDTVoiceFemaleScript
		EndIf
	EndIf
	
	Return herVoiceSlot
EndFunction

IVDTVoiceMaleScript Function GetVoiceForActor(Actor actorToVoice)
	IVDTVoiceMaleScript hisVoiceSlot = None
	string actorName = actorToVoice.GetLeveledActorBase().GetName()
	string actorVoiceType = GetNameOfVoiceType(actorToVoice)
	
	;Run through all voice slots and check if any have a matching actor or voice type
	Int currentSlot = 1
	Int maleVoiceSlots = ConfigOptions.MaleVoiceSlots
	String temp = ""
	int EnableReassigningMaleVoice

	
	EnableReassigningMaleVoice = JsonUtil.GetIntValue("IVDTHentai/Config.json","enablereassigningmalevoice",0) 
	
	;	miscutil.PrintConsole ("Male actorVoiceType  : "+ actorVoiceType )
	
	;reassign unused slots
if EnableReassigningMaleVoice == 1	
	if  actorVoiceType ==  "malecommander" || actorVoiceType ==  "malesoldier" 
		actorVoiceType = "malebrute"
	elseif actorVoiceType ==  "malecommoner" || actorVoiceType ==  "malecommoneraccented" || actorVoiceType ==  "maleeventonedaccented"|| actorVoiceType ==  "maleyoungeager"
		 actorVoiceType = "maleeventoned"
	elseif actorVoiceType ==  "maleelfhaughty"
		 actorVoiceType = "malecondescending"
	elseif actorVoiceType ==  "maleguard" || actorVoiceType ==  "malenordcommander"
		 actorVoiceType = "malenord"
;	elseif actorVoiceType ==  "maleslycynical"
;		 actorVoiceType = "maledarkelf"
	endif
endif	
	
	While currentSlot <= maleVoiceSlots
	
		;Check for actor match (can safely end search early if its a match)
		temp = ConfigOptions.GetModSettingString("sMale" + currentSlot + "Actor:MaleVoices")
		If actorName == temp
			hisVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + currentSlot) as IVDTVoiceMaleScript
			Return hisVoiceSlot
		EndIf
		
		;Check for voice type match (if we get a match, remember it and keep going through rest in case we get a higher priority actor match later on)
		temp = ConfigOptions.GetModSettingString("sMale" + currentSlot + "VoiceType:MaleVoices")
		If actorVoiceType == temp
			hisVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + currentSlot) as IVDTVoiceMaleScript
		EndIf
	
		currentSlot += 1
	EndWhile
	
	;If there are no matching voice slots, use default if its been set
;	If hisVoiceSlot == None
;		Int defaultSlot = 0
;		If IsCreature(actorToVoice)
;			defaultSlot = ConfigOptions.GetModSettingInt("iMaleCreatureDefaultVoice:DefaultVoices")
;		Else
;			defaultSlot = ConfigOptions.GetModSettingInt("iMaleDefaultVoice:DefaultVoices")
;;		EndIf
	;	
	;	If defaultSlot > 0 && defaultSlot <= maleVoiceSlots
	;		hisVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + defaultSlot) as IVDTVoiceMaleScript
	;	EndIf
	;EndIf
		
	Return hisVoiceSlot
EndFunction


IVDTVoiceMaleScript Function GetDefaultMaleVoice(Actor actorToVoice)
	IVDTVoiceMaleScript hisVoiceSlot = None
	
	;Run through all voice slots and check if any have a matching actor or voice type

	Int maleVoiceSlots = ConfigOptions.MaleVoiceSlots
	String temp = ""
	

	;If there are no matching voice slots, use default if its been set

		Int defaultSlot = 0
		If IsCreature(actorToVoice)
			defaultSlot = ConfigOptions.GetModSettingInt("iMaleCreatureDefaultVoice:DefaultVoices")
		Else
			defaultSlot = ConfigOptions.GetModSettingInt("iMaleDefaultVoice:DefaultVoices")
		EndIf
		
		If defaultSlot > 0 
			hisVoiceSlot = GetOwningQuest().GetAliasByName("Slot" + defaultSlot) as IVDTVoiceMaleScript
		EndIf

		
	Return hisVoiceSlot
EndFunction



IVDTVoiceFemaleScript Function GetFemaleVoiceAtSlot(Int slot)
	Return GetOwningQuest().GetAliasByName("Slot" + slot) as IVDTVoiceFemaleScript
EndFunction

IVDTVoiceMaleScript Function GetMaleVoiceAtSlot(Int slot)
	Return GetOwningQuest().GetAliasByName("Slot" + slot) as IVDTVoiceMaleScript
EndFunction

Function UpdateMasterVolume()
	Float newVolume = 0.01 * ConfigOptions.GetModSettingInt("iMasterVolume:VoiceSystemManagement")
	IVDTVoices.SetVolume(newVolume)
	IVDTMCMAudio.SetVolume(newVolume)
EndFunction

Function UnmuteSexLabVoices()
	SexLabVoices.UnMute()
EndFunction
