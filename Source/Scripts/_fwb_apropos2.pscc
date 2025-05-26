Scriptname _fwb_apropos2 Hidden
{Interfaces with Apropos2 functions/state in a safe way.}

Bool Function IsAproposPresent() Global
    String aproposFile = "Apropos2.esp"
    Return 255 != Game.GetModByName(aproposFile)
EndFunction
    
    
; Return True on success - updates states as Float[] because we don't use Int values much in FWB.
Bool Function GetWearAndTear(Actor who, Float[] states) Global

    String aproposFile = "Apropos2.esp"
    Int actorLibraryId = 0x0002902C
    
    If 255 != Game.GetModByName(aproposFile)
    
        ;Form actorLibraryForm = Game.GetFormFromFile(actorLibraryId, aproposFile)
        Form actorLibraryForm = Quest.GetQuest("Apropos2Actors")
        If actorLibraryForm
        
            Apropos2Actors aproposActorLibrary = actorLibraryForm As Apropos2Actors
            
            If aproposActorLibrary
            
                _fw_utils.Info("FWB Apropos - Got Apropos Library")
            
                Apropos2ActorAlias aproposActorAlias = aproposActorLibrary.GetAproposActor(who)
                
                If aproposActorAlias
                
                    _fw_utils.Info("FWB Apropos - Got Apropos actor")
            
                    ; I put the average abuses first, because if you are only going to set-up one Apropos value, then Average Abuse makes most sense.
                    ; The others are for people who want to adjust for every little thing individually.
                    ; I always thought Apropos tracked whippings/beatings, but it seems it doesn't do that AT ALL :( Sad.
                    Float fixScale = 11.111111
                    
                    SetState(states, 0, aproposActorAlias.AverageAbuseState As Float)
                    SetState(states, 1, aproposActorAlias.AverageCreatureAbuseState As Float)
                    SetState(states, 2, aproposActorAlias.AverageDaedricAbuseState As Float)
                    SetState(states, 3, aproposActorAlias.VaginalWearTearState As Float)
                    SetState(states, 4, aproposActorAlias.AnalWearTearState As Float)
                    SetState(states, 5, aproposActorAlias.OralWearTearState As Float)
                    
                    Return True
                    
                EndIf
            EndIf
        EndIf
    EndIf
    
    _fw_utils.Info("FWB Apropos - fell through")

    states[0] = 0.0
    states[1] = 0.0
    states[2] = 0.0
    states[3] = 0.0
    states[4] = 0.0  
    states[5] = 0.0
    
    Return False

EndFunction

Function SetState(Float[] states, Int index, Float value) Global
    
    value *= 11.112 ; Magic value to convert 9 to 100.
    
    If value > 100.0
        value = 100.0
    EndIf
    
    states[index] = value
    
EndFunction

