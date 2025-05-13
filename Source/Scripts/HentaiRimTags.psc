Scriptname HentaiRimTags extends ReferenceAlias hidden

;References
SexLabFramework Property SexLab Auto 


;New 2.0 Tags
;#LI leadin
;#FA Getting Big or very fast anal Penetration by penis
;#FA Getting intense anal Penetration by penis
;#SA Getting Slow anal Penetration by penis
;#BV getting Big or very fast vaginal penetration by penis
;#FV getting intense vaginal penetration by penis
;#SV getting slow vaginal penetration by penis
;#DP double penetration
;#EN end or penis end outside
;#FB fast blowjob
;#SB slow blowjob
;#SR spitroast
;#KS = KISS
;#ST = Taking it Small non penile stimulation. slow cunnilingus, eg fingering etc
;#FT = Taking it fast non penile stimulation, fast cunnilingus , eg fingering etc
;#BT = Taking it Big or very fast non penile stimulation, eg fistingor huge toy
;#SG = giving slow penetration with penis
;#FG = giving intense penetration with penis
;#BG = Giving Big or very fast, penetration with penis
;#EI = end with penis still inside
;#SH = Getting Slow Blowjob
;#FH = Getting Fast blowjob


string Function GetLabel(sslBaseAnimation anim , int stage , String actorpos = "0" ) Global

string ActorPosition = ""
	
	if ActorPos == 0
		ActorPosition = "A"
	elseif ActorPos == 1
		ActorPosition = "B"
	elseif ActorPos == 2
		ActorPosition = "C"
	elseif ActorPos == 3
		ActorPosition = "D"
	elseif ActorPos == 4
		ActorPosition = "E"
	endif


	if anim.HasTag(stage+"LI") || anim.HasTag(stage+ActorPosition+"LDI")
		return "LI"
	elseif anim.HasTag(stage+"FA") || anim.HasTag(stage+ActorPosition+"FAP")
		return "FA"
	elseif anim.HasTag(stage+"SA") || anim.HasTag(stage+ActorPosition+"SAP")
		return "SA"
	elseif anim.HasTag(stage+"BA") 
		return "BA"
	elseif anim.HasTag(stage+"BV")
		return "BV"
	elseif anim.HasTag(stage+"FV") || anim.HasTag(stage+ActorPosition+"FVP")
		return "FV"	
	elseif anim.HasTag(stage+"SV") || anim.HasTag(stage+ActorPosition+"SVP")
		return "SV"	
	elseif anim.HasTag(stage+"DP") || anim.HasTag(stage+ActorPosition+"SDP") || anim.HasTag(stage+ActorPosition+"FDP")
		return "DP"
	elseif anim.HasTag(stage+"FB") || anim.HasTag(stage+ActorPosition+"FBJ")
		return "FB"	
	elseif anim.HasTag(stage+"SB") || anim.HasTag(stage+ActorPosition+"SBJ")
		return "SB"	
	elseif anim.HasTag(stage+"EN") || anim.HasTag(stage+ActorPosition+"ENO") || anim.HasTag(stage+ActorPosition+"ENI")
		return "EN"
	elseif anim.HasTag(stage+"TP") || ((anim.HasTag(stage+ActorPosition+"SDP") || anim.HasTag(stage+ActorPosition+"FDP")) && (anim.HasTag(stage+ActorPosition+"SBJ") || anim.HasTag(stage+ActorPosition+"FBJ")))
		return "TP"
	elseif anim.HasTag(stage+"SR") || (anim.HasTag(stage+ActorPosition+"SVP") && anim.HasTag(stage+ActorPosition+"SBJ")) || (anim.HasTag(stage+ActorPosition+"FVP") && anim.HasTag(stage+ActorPosition+"FBJ")) || (anim.HasTag(stage+ActorPosition+"FAP") && anim.HasTag(stage+ActorPosition+"FBJ"))  || (anim.HasTag(stage+ActorPosition+"SAP") && anim.HasTag(stage+ActorPosition+"SBJ"))   
		return "SR"
	else
		return "LI" ;default lead in if no stimulating actions
	endif

endfunction

string Function StimulationLabel(sslBaseAnimation anim , int stage , Int ActorPos) Global

		string ActorPosition = ""
	
	if ActorPos == 0
		ActorPosition = "A"
	elseif ActorPos == 1
		ActorPosition = "B"
	elseif ActorPos == 2
		ActorPosition = "C"
	elseif ActorPos == 3
		ActorPosition = "D"
	elseif ActorPos == 4
		ActorPosition = "E"
	endif
	
	if anim.HasTag(stage+ActorPosition + "SST")
		return "SST"	
	elseif anim.HasTag(stage+ActorPosition + "FST")
		returN "FST"	
	elseif anim.HasTag(stage+ActorPosition + "BST")
		return "BST"	
	else
		return "LDI" ;default lead in if no stimulating actions
	endif

endfunction

string Function PenetrationLabel(sslBaseAnimation anim , int stage , Int ActorPos) Global

	string ActorPosition = ""
	
	if ActorPos == 0
		ActorPosition = "A"
	elseif ActorPos == 1
		ActorPosition = "B"
	elseif ActorPos == 2
		ActorPosition = "C"
	elseif ActorPos == 3
		ActorPosition = "D"
	elseif ActorPos == 4
		ActorPosition = "E"
	endif
	
	if anim.HasTag(stage+ ActorPosition + "SVP")
		return "SVP"
	elseif anim.HasTag(stage+ActorPosition + "SAP")
		return "SAP"
	elseif anim.HasTag(stage+ActorPosition + "FVP")
		return "FVP"
	elseif anim.HasTag(stage+ActorPosition + "FAP")
		return "FAP"
	elseif anim.HasTag(stage+ActorPosition + "SCG")
		return "SCG"
	elseif anim.HasTag(stage+ActorPosition + "FCG")
		return "FCG"
	elseif anim.HasTag(stage+ActorPosition + "SAC")
		return "SAC"
	elseif anim.HasTag(stage+ActorPosition + "FAC")
		return "FAC"
	elseif anim.HasTag(stage+ActorPosition + "SDP")
		return "SDP"
	elseif anim.HasTag(stage+ActorPosition + "FDP")
		return "SDP"
	else
		return "LDI" ;Default lead in if no stimulating actions
	endif
endfunction

string Function PenisActionLabel(sslBaseAnimation anim , int stage , Int ActorPos) Global
	
	string ActorPosition = ""
	
	if ActorPos == 0
		ActorPosition = "A"
	elseif ActorPos == 1
		ActorPosition = "B"
	elseif ActorPos == 2
		ActorPosition = "C"
	elseif ActorPos == 3
		ActorPosition = "D"
	elseif ActorPos == 4
		ActorPosition = "E"
	endif
	
	if anim.HasTag(stage+ActorPosition + "SDV")
		return "SDV"
	elseif anim.HasTag(stage+ActorPosition + "FDV")
		return "FDV"	
	elseif anim.HasTag(stage+ActorPosition + "SDA")
		retuRN "SDA"
	elseif anim.HasTag(stage+ActorPosition + "FDA")
		return "FDA"
	elseif anim.HasTag(stage+ActorPosition + "SHJ")
		reTURN "SHJ"
	elseif anim.HasTag(stage+ActorPosition + "FHJ")
		return "FHJ"
	elseif anim.HasTag(stage+ActorPosition + "STF")
		reTURN "STF"
	elseif anim.HasTag(stage+ActorPosition + "FTF")
		return "FTF"
	elseif anim.HasTag(stage+ActorPosition + "SMF")
		RETURN "SMF"
	elseif anim.HasTag(stage+ActorPosition + "FMF")
		return "FMF"
	elseif anim.HasTag(stage+ActorPosition + "SFJ")
		reTURN "SFJ"
	elseif anim.HasTag(stage+ActorPosition + "SFJ")
		returN "FFJ"
	else
		reTURN "LDI" ;default lead in if no stimulating actions
	endif
endfunction


String Function OralLabel(sslBaseAnimation anim , int stage , Int ActorPos) Global
	
	string ActorPosition = ""
	
	if ActorPos == 0
		ActorPosition = "A"
	elseif ActorPos == 1
		ActorPosition = "B"
	elseif ActorPos == 2
		ActorPosition = "C"
	elseif ActorPos == 3
		ActorPosition = "D"
	elseif ActorPos == 4
		ActorPosition = "E"
	endif
	
	if anim.HasTag(stage+ ActorPosition + "KIS")
		return "KIS"
	elseif anim.HasTag(stage+ ActorPosition + "CUN")
		return "CUN"
	elseif anim.HasTag(stage+ ActorPosition + "FBJ")
		return "FBJ"
	elseif anim.HasTag(stage+ ActorPosition + "SBJ")
		returN "SBJ"
	else
		reTURN "LDI"
	endif

endfunction

String Function EndingLabel(sslBaseAnimation anim , int stage , Int ActorPos) Global
	;Labels that identify actions on partners
	
	string ActorPosition = ""
	
	if ActorPos == 0
		ActorPosition = "A"
	elseif ActorPos == 1
		ActorPosition = "B"
	elseif ActorPos == 2
		ActorPosition = "C"
	elseif ActorPos == 3
		ActorPosition = "D"
	elseif ActorPos == 4
		ActorPosition = "E"
	endif
	
	if anim.HasTag(stage+ ActorPosition + "ENO")
		return "ENO"
	elseif anim.HasTag(stage+ ActorPosition + "ENI")
		return "ENI"
	else
		Return "LDI"
	endif

endfunction

string Function GetSFX(sslBaseAnimation anim , int stage) Global
if anim.HasTag(stage+"SC")
		return "SC"
	elseif anim.HasTag(stage+"MC")
		return "MC"
	elseif anim.HasTag(stage+"FC")
		return "FC"
	elseif anim.HasTag(stage+"SS")
		return "SS"	
	elseif anim.HasTag(stage+"MS")
		return "MS"
	elseif anim.HasTag(stage+"FS")
		return "FS"	
	elseif anim.HasTag(stage+"RS")
		return "RS"	
	elseif anim.HasTag(stage+"NA")
		return "NA"
	endif
	return ""
endfunction
