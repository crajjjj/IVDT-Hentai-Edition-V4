Scriptname SLSO_Widget3Update Extends ReferenceAlias

SLSO_WidgetCoreScript3 Property Widget Auto

SexLabFramework SexLab
sslThreadController controller

String File
String widgetid
String ActorName
String EnjoymentValue
Float LastTimeFlash
Int BaseColor = 0xFFFFFF	 	; white
Int Gender = 0
Bool Display_widget = true
String HentaiActorName
;----------------------------------------------------------------------------
;Widget Setup
;----------------------------------------------------------------------------

Event OnInit()
	HideWidget()
	File = "/SLSO/Config.json"
	widgetid = "widget" + self.GetID()
EndEvent

Event Start_widget(Int Widget_Id, Int Thread_Id)
	if Widget_Id == self.GetID()
		UnregisterForModEvent("SLSO_Start_widget")

		SexLab = Quest.GetQuest("SexLabQuestFramework") as SexLabFramework
		controller = SexLab.GetController(Thread_Id)
		if controller.HasPlayer
			StartWidget()
		else
			StopWidget()
		endif
		self.RegisterForModEvent("SLSO_Change_Partner", "Change_Partner")
	endif
EndEvent

Event Change_Partner(Form ActorRef)
	;SexLab.Log(GetActorRef().GetDisplayName() + " changed widget recieved:" + ActorRef as Actor + " ref:" + self.GetActorRef())
	if ActorRef as Actor == self.GetActorRef()
		Widget.LabelTextColor = JsonUtil.GetFloatValue(File, "widget_selectedactorcolor", 16768768) as int
		;SexLab.Log(" changed widget BorderColor - yellow:" + Widget.BorderColor)
	else
		Widget.LabelTextColor = JsonUtil.GetFloatValue(File, "widget_labelcolor", 16777215) as int
		;SexLab.Log(" changed widget BorderColor - black:"+ Widget.BorderColor)
	endif
	GetHentaiActorName()
EndEvent

Event Stop_widget(Int Widget_Id)
	if Widget_Id == self.GetID()
		StopWidget()
	endif
EndEvent

Function StartWidget()
	GetHentaiActorName()
	UpdateWidgetPosition()
	
EndFunction

Function StopWidget()
	UnRegisterForUpdate()
	UnregisterForAllModEvents()
	UnregisterForAllKeys()
	HideWidget()
	(self as ReferenceAlias).Clear()
EndFunction

Function ShowWidget()
	Widget.Alpha = 100.0
EndFunction

Function HideWidget()
	Widget.Alpha = 0.0
EndFunction

Function UpdateWidgetPosition()
	Actor ActorRef = self.GetActorRef() 
	If ActorRef != none
		;female
		If controller.ActorAlias(ActorRef).GetGender() == 1
			BaseColor = JsonUtil.StringListGet(File, "widgetcolors", 5) as int
			Gender = 1
		;male
		Else
			BaseColor = JsonUtil.StringListGet(File, "widgetcolors", 4) as int
			Gender = 0
		EndIf
	Else
		BaseColor = 0xFFFFFF
	EndIf
	Widget.BorderColor = JsonUtil.GetFloatValue(File, "widget_bordercolor", 0) as int
	Widget.BorderWidth = 0
	if ((JsonUtil.GetIntValue(File, "widget_player_only") == 1 && self.GetActorRef() == Game.Getplayer()) || JsonUtil.GetIntValue(File, "widget_player_only") != 1)
		Display_widget = true
	else
		Display_widget = false
	endif
	;Widget.Width = JsonUtil.GetFloatValue(File, "widget_width")
	;Widget.Height = JsonUtil.GetFloatValue(File, "widget_height")
	Widget.X = JsonUtil.StringListGet(File, widgetid, 1) as Float
	Widget.Y = JsonUtil.StringListGet(File, widgetid, 2) as Float
	Widget.MeterFillMode = JsonUtil.StringListGet(File, widgetid, 3)
	Widget.SetMeterPercent(0.0)
	Widget.BorderAlpha = JsonUtil.GetFloatValue(File, "widget_borderalpha")
	Widget.BackgroundAlpha = JsonUtil.GetFloatValue(File, "widget_backgroundalpha")
	Widget.MeterAlpha = JsonUtil.GetFloatValue(File, "widget_meteralpha")
	Widget.MeterScale = JsonUtil.GetFloatValue(File, "widget_meterscale")
	Widget.LabelTextSize = JsonUtil.GetFloatValue(File, "widget_labeltextsize")
	Widget.ValueTextSize = JsonUtil.GetFloatValue(File, "widget_valuetextsize")
	Widget.LabelTextColor = JsonUtil.GetFloatValue(File, "widget_labelcolor", 16777215) as int
	ActorName = self.GetActorRef().GetDisplayName()
	if JsonUtil.GetIntValue(File, "widget_show_enjoymentmodifier") == 1
		EnjoymentValue = "0.00%"
	else
		EnjoymentValue = ""
	endif
	;Widget.SetTexts(ActorName, EnjoymentValue)
	Widget.SetTexts(HentaiActorName, EnjoymentValue)
	LastTimeFlash = game.GetRealHoursPassed()
	RegisterForSingleUpdate(1)
EndFunction

;----------------------------------------------------------------------------
;Widget update Loop
;----------------------------------------------------------------------------

Event OnUpdate()
	If JsonUtil.StringListGet(File, widgetid, 0) == "on"\
	&& JsonUtil.GetIntValue(File, "widget_enabled") == 1\
	&& Display_widget
		ShowWidget()
	Else
		HideWidget()
	EndIf
	
	Actor ActorRef = self.GetActorRef() 
	If ActorRef != none
		if controller.ActorAlias(ActorRef).GetActorRef() != none
			if controller.ActorAlias(ActorRef).GetState() == "Animating"
				If JsonUtil.GetIntValue(File, "widget_enabled") == 1
					UpdateWidget(ActorRef, controller.ActorAlias(ActorRef).GetFullEnjoyment() as float , controller.ActorAlias(ActorRef).GetResistancePercentage())
				EndIf
				If JsonUtil.GetIntValue(File, "game_passive_enjoyment_reduction") == 1
					controller.ActorAlias(ActorRef).BonusEnjoyment(self.GetActorRef(), -1)
				EndIf
				RegisterForSingleUpdate(1)
			else
				StopWidget()
			endif
		else
			StopWidget()
		endif
	endif
	;cant be like in SLSO_Game cuz widget is should be shown after mcm XY edit 
	;StopWidget()
EndEvent

Function UpdateWidget(Actor akActor, Float Enjoyment , int Resistance)
	If akActor == none
		return
	EndIf
	If Display_widget == true && akActor == Game.Getplayer()
		Game.EnablePlayerControls()
	EndIf
	;EnjoymentValue = "E:" + StringUtil.Substring(controller.ActorAlias(self.GetActorRef()).GetFullEnjoymentMod(), 0, 5) + "%"
	EnjoymentValue = math.ceiling(Enjoyment) + "%"
	;Widget.SetTexts(ActorName, EnjoymentValue)
	Widget.SetTexts(HentaiActorName, EnjoymentValue)
		;hentairim change
	;Enjoyment /= 100
	If Resistance <= 25
		Widget.SetMeterColors(BaseColor, JsonUtil.StringListGet(File, "widgetcolors", 1) as int)
	ElseIf Resistance <= 50
		Widget.SetMeterColors(BaseColor, JsonUtil.StringListGet(File, "widgetcolors", 2) as int)
	ElseIf Resistance <= 75
		Widget.SetMeterColors(BaseColor, JsonUtil.StringListGet(File, "widgetcolors", 3) as int)
	Else
		Widget.SetMeterColors(BaseColor, BaseColor)
	EndIf
;	If Enjoyment > 1
	;	Enjoyment = 1
;	EndIf
	;Widget.SetMeterPercent(Enjoyment*100)
	Widget.SetMeterPercent(Resistance)
	;If Enjoyment >= 0.90
	;	GetCurrentHourOfDay()		;flash
	;EndIf
	
	;hentairim change end
EndFunction

Function GetCurrentHourOfDay()
	float Time = game.GetRealHoursPassed() 		; days spend in game
;	Time *= 24 									; hours spend in game
;	Time *= 60 									; minutes spend in game
;	Time *= 60 									; seconds spend in game
;	Time += x 									; x seconds delay so Flash() can play

	;Debug.Notification(Math.Floor(Time*24*60*60) + " | " + Math.Floor(LastTimeFlash*24*60*60 + 10))
	if Math.Floor(Time*86400) >= Math.Floor(LastTimeFlash*86410)
		Widget.StartMeterFlash()
		LastTimeFlash = Time
	endif
EndFunction


Function GetHentaiActorName()

Faction Aggressive 
Faction Cowgirl 
Faction Cumbuckets 
Faction Epic 
Faction InHeat 
Faction Masochist 
Faction MissCumalot 
Faction Normal 
Faction FutaLoving 
Faction Sadistic 
Faction SexuallyFrustrated 
Faction ShortFused 
Faction SirCumalot 
Faction Skilled 
Faction Strong 
Faction ThiccLoving 
Faction Timid 
Faction Uncummanable 
Faction Weak
Faction DualShot
Faction Impatient
Faction RapeLoving
Faction ClothingFetishist
Faction LightArmorFetishist
Faction HeavyArmorFetishist
Faction NutGobbler
Faction ThePenetrator
Faction PussyLoving
Faction AnalLoving
Faction TheMilker
Faction TheBreaker
Faction TheGifter
Faction TheNouveauRiche
Faction OralLoving
Faction NPCTrait = none

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
TheBreaker = Game.GetFormFromFile(0x84E, "Hentairim Enjoyment Expressions Traits.esp") As Faction;Epic trait
TheGifter = Game.GetFormFromFile(0x84F, "Hentairim Enjoyment Expressions Traits.esp") As Faction;Epic trait
TheNouveauRiche = Game.GetFormFromFile(0x850, "Hentairim Enjoyment Expressions Traits.esp") As Faction;Epic trait
SexuallyFrustrated = Game.GetFormFromFile(0x83D, "Hentairim Enjoyment Expressions Traits.esp") As Faction
NutGobbler = Game.GetFormFromFile(0x847, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
Cowgirl = Game.GetFormFromFile(0x83F, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
MissCumalot = Game.GetFormFromFile(0x83C, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait
InHeat = Game.GetFormFromFile(0x83E, "Hentairim Enjoyment Expressions Traits.esp") As Faction
SirCumalot = Game.GetFormFromFile(0x830, "Hentairim Enjoyment Expressions Traits.esp") As Faction ;Epic trait


;find existing hentai trait

	if self.GetActorRef().IsInFaction(Normal)
		NPCTrait = Normal
	elseif self.GetActorRef().IsInFaction(Aggressive)
		NPCTrait = Aggressive
	elseif self.GetActorRef().IsInFaction(Cumbuckets)
		NPCTrait = Cumbuckets
	elseif self.GetActorRef().IsInFaction(InHeat)
		NPCTrait = InHeat
	elseif self.GetActorRef().IsInFaction(Masochist)
		NPCTrait = Masochist
	elseif self.GetActorRef().IsInFaction(MissCumalot)
		NPCTrait = MissCumalot
	elseif self.GetActorRef().IsInFaction(Normal)
		NPCTrait = Normal
	elseif self.GetActorRef().IsInFaction(FutaLoving)
		NPCTrait = FutaLoving
	elseif self.GetActorRef().IsInFaction(Sadistic)
		NPCTrait = Sadistic
	elseif self.GetActorRef().IsInFaction(SexuallyFrustrated)
		NPCTrait = SexuallyFrustrated
	elseif self.GetActorRef().IsInFaction(ShortFused)
		NPCTrait = ShortFused
	elseif self.GetActorRef().IsInFaction(SirCumalot)
		NPCTrait = SirCumalot	
	elseif self.GetActorRef().IsInFaction(Skilled)
		NPCTrait = Skilled	
	elseif self.GetActorRef().IsInFaction(Strong)
		NPCTrait = Strong	
	elseif self.GetActorRef().IsInFaction(ThiccLoving)
		NPCTrait = ThiccLoving
	elseif self.GetActorRef().IsInFaction(Timid)
		NPCTrait = Timid
	elseif self.GetActorRef().IsInFaction(Uncummanable)
		NPCTrait = Uncummanable
	elseif self.GetActorRef().IsInFaction(Weak)
		NPCTrait = Weak
	elseif self.GetActorRef().IsInFaction(Impatient)
		NPCTrait = Impatient
	elseif self.GetActorRef().IsInFaction(RapeLoving)
		NPCTrait = RapeLoving
	elseif self.GetActorRef().IsInFaction(ClothingFetishist)
		NPCTrait = ClothingFetishist
	elseif self.GetActorRef().IsInFaction(LightArmorFetishist)
		NPCTrait = LightArmorFetishist
	elseif self.GetActorRef().IsInFaction(HeavyArmorFetishist)
		NPCTrait = HeavyArmorFetishist
	elseif self.GetActorRef().IsInFaction(PussyLoving)
		NPCTrait = PussyLoving
	elseif self.GetActorRef().IsInFaction(AnalLoving)
		NPCTrait = AnalLoving
	elseif self.GetActorRef().IsInFaction(TheMilker)
		NPCTrait = TheMilker
	elseif self.GetActorRef().IsInFaction(DualShot)
		NPCTrait = DualShot
	elseif self.GetActorRef().IsInFaction(ThePenetrator)
		NPCTrait = ThePenetrator
	elseif self.GetActorRef().IsInFaction(OralLoving)
		NPCTrait = OralLoving
	elseif self.GetActorRef().IsInFaction(TheBreaker)
		NPCTrait = TheBreaker
	elseif self.GetActorRef().IsInFaction(TheGifter)
		NPCTrait = TheGifter
	elseif self.GetActorRef().IsInFaction(TheNouveauRiche)
		NPCTrait = TheNouveauRiche
	elseif self.GetActorRef().IsInFaction(NutGobbler)
		NPCTrait = NutGobbler
	elseif self.GetActorRef().IsInFaction(Cowgirl)
		NPCTrait = Cowgirl
	endif


string NPCTraitName = ""
if NPCTrait
	NPCTraitName = NPCTrait.GetName()
endif
if stringutil.find(NPCTraitName,"+") < 0
	HentaiActorName = self.GetActorRef().GetDisplayName()
elseif stringutil.find(NPCTraitName,"+") <= 1
	HentaiActorName =  self.GetActorRef().GetDisplayName() + " " + stringutil.Substring(NPCTraitName,1)
elseif	stringutil.find(NPCTraitName,"+") > 1
	int traitlength = stringutil.getlength(NPCTraitName)
	HentaiActorName =  stringutil.Substring(NPCTraitName,0,traitlength - 1) + " " +  self.GetActorRef().GetDisplayName()

endif
endfunction