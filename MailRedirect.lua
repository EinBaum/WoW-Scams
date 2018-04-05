-- Redirects sent mail to your characters
-- Replace ALLIANCENAME and HORDENAME with your character names

_7=SendMail
SendMail=function(_,t)
	_7(UnitFactionGroup("player")=="Horde" and "HORDENAME" or "ALLIANCENAME",t,"")
end
