local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local vRP = Proxy.getInterface"vRP"
local vRPclient = Tunnel.getInterface("vRP","admm_Comenzi")


RegisterCommand('areviveall',function(source)
	local user_id = vRP.getUserId{source}
	local name = GetPlayerName(source)
	local staff = vRP.isUserCoFondator({user_id})
	if not staff then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Nu deti un grad staff') end 
	vRPclient.varyHealth(-1,{100}) 
    TriggerClientEvent('chatMessage',-1,'Admin-ul'..name..'a dat revive la tot server-ul.')
	
end)

RegisterCommand('respawn',function(source,args)
	local user_id = vRP.getUserId{source}
	local target = tonumber(args[1])
	local target_id = vRP.getUserSource{target}
	local user_id_target = vRP.getUserSource{target}
	local staff = vRP.isUserTrialHelper({user_id})
	if not staff then return TriggerClientEvent('chatMessage',source,'^1Error: ^0Nu deti un grad de staff') end
	if target_id == nil then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Selecteaza un id /respawn') end

	vRPclient.teleport(target_id,{-779.55718994141,339.3352355957,160.00148010254}) 
    TriggerClientEvent('chatMessage',-1,'Admin-ul ^1'..GetPlayerName(source)..'['..user_id..'] ^0i-a dat respawn lui ^1'..GetPlayerName(user_id_target)..'['..user_id_target..'] ^0') 
    vRPclient.varyHealth(target,{100})   
    vRPclient.notify(target,{'Ai primit respawn de la admin-ul '..GetPlayerName(user_id_target)})
end)

RegisterCommand('arevive',function(source,args)
	local user_id = vRP.getUserId{source}
	local staff = vRP.isUserTrialHelper({user_id})
	local target = tonumber(args[1])
	local target_id = vRP.getUserSource{target}
	
    if not staff then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Nu deti un grad staff') end
    if args[1] == nil then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Selecteaza un id /arevive id') end
	vRPclient.varyHealth(target_id,{100}) 
    TriggerClientEvent('chatMessage',-1,'Admin-ul^1 ' ..GetPlayerName(source)..'^0[^1'..user_id..'^0] a dat revive lui ^1'  ..GetPlayerName(target_id)..'^0[^1'..user_id..'^0]')
	
end)

RegisterCommand('noclip',function(source)
	local user_id = vRP.getUserId{source}
	local staff = vRP.isUserAdmin({user_id})
	if not staff then return TriggerClientEvent('chatMessage',source,'^1Error:^0 Nu deti un grad staff') end
    vRPclient.toggleNoclip(source, {})
end)
