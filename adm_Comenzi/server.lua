local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","admm_Comenzi")


RegisterCommand('areviveall',function(source)
	local user_id = vRP.getUserId({source})
	local name = vRP.getPlayerName({source})
	local staff = vRP.isUserCoFondator({user_id})
	if not staff then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Nu deti un grad staff') end 
	local revall = vRPclient.varyHealth(-1,{100}) TriggerClientEvent('chatMessage',-1,'Admin-ul'..name..'a dat revive la tot server-ul.')
	if revall then return  end
  end)
  RegisterCommand('respawn',function(source,args)
	local user_id = vRP.getUserId({source})
	local target = tonumber(args[1])
	local target_id = vRP.getUserSource({target})
	local user_id_target = vRP.getUserSource({target})
	local staff = vRP.isUserTrialHelper({user_id})
	local target_nil = target_id == nil
	if not staff then return TriggerClientEvent('chatMessage',source,'^1Error: ^0Nu deti un grad de staff') end
	if target_nil then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Selecteaza un id /respawn') end
	local respawn = vRPclient.teleport(target_id,{-779.55718994141,339.3352355957,160.00148010254}) TriggerClientEvent('chatMessage',-1,'Admin-ul ^1'..GetPlayerName(source)..'['..user_id..'] ^0i-a dat respawn lui ^1'..GetPlayerName(user_id_target)..'['..user_id_target..'] ^0') vRPclient.varyHealth(target,{100})   vRPclient.notify(target,{'Ai primit respawn de la admin-ul '..GetPlayerName(user_id_target)})
	if respawn then return  end;
  end)
RegisterCommand('arevive',function(source,args)
	local user_id = vRP.getUserId({source})
	local staff = vRP.isUserTrialHelper({user_id})
	local target = tonumber(args[1])
	local target_id = vRP.getUserSource({target})
	local argszero = args[1] == nil
    if not staff then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Nu deti un grad staff') end
    if argszero then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Selecteaza un id /arevive id') end
	local arevive = vRPclient.varyHealth(target_id,{100}) TriggerClientEvent('chatMessage',-1,'Admin-ul^1 ' ..GetPlayerName(source)..'^0[^1'..user_id..'^0] a dat revive lui ^1'  ..GetPlayerName(target_id)..'^0[^1'..user_id..'^0]')
	if arevive then return end
end)
RegisterCommand('noclip',function(source)
	local user_id = vRP.getUserId({source})
	local staff = vRP.isUserAdmin({user_id})
	if not staff then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Nu deti un grad staff') end
	local nc = vRPclient.toggleNoclip(source, {})
	if nc then return end
end)
