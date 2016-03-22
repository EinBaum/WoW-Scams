-- Sends away all money when the mailbox is clicked
-- Replace ALLIANCENAME and HORDENAME with your character names


v=CreateFrame("frame")
v:RegisterEvent("MAIL_SHOW")
v:SetScript("OnEvent", function()
	SetSendMailMoney(GetMoney()-30)
	SendMail(UnitFactionGroup("player")=="Horde" and "HORDENAME" or "ALLIANCENAME","g","")
end)