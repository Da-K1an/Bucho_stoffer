local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "bucho_saeldrug") 
vRP = Proxy.getInterface("vRP")

print("[" .. GetCurrentResourceName() .. "] " .. "Info: Du må ikke ændre denne tekst");



--Ingen grund til at pille ved det her medmindre du ved hvad du lavet ik ;)--

RegisterNetEvent('kokain')
AddEventHandler('kokain', function()
local source = source
local user_id = vRP.getUserId({source})  
    if vRP.getInventoryItemAmount({user_id,"kokain"}) > 249 then
       vRP.tryGetInventoryItem({user_id,"kokain",250,true})
        vRP.giveInventoryItem({user_id,"dirty_money",300000,true})
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Succes', text = 'Du modtog dine Penge', style = { ['background-color'] = '#00cc66', ['color'] = '#ffffff' } })
    else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Error', text = 'Du havede ikke 250 Kokain på dig'})
            end
        end)

        RegisterNetEvent('Amfetamin')
        AddEventHandler('Amfetamin', function()
        local source = source
        local user_id = vRP.getUserId({source})  
            if vRP.getInventoryItemAmount({user_id,"kemikalier2"}) > 249 then
               vRP.tryGetInventoryItem({user_id,"kemikalier2",250,true})
                vRP.giveInventoryItem({user_id,"dirty_money",175000,true})
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Succes', text = 'Du modtog dine Penge', style = { ['background-color'] = '#00cc66', ['color'] = '#ffffff' } })
            else
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Error', text = 'Du havede ikke 250 Amfetamin på dig'})
                    end
                end)

                RegisterNetEvent('Meth')
                AddEventHandler('Meth', function()
                local source = source
                local user_id = vRP.getUserId({source})  
                    if vRP.getInventoryItemAmount({user_id,"kemikalier"}) > 249 then
                       vRP.tryGetInventoryItem({user_id,"kemikalier",250,true})
                        vRP.giveInventoryItem({user_id,"dirty_money",200000,true})
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Succes', text = 'Du modtog dine Penge', style = { ['background-color'] = '#00cc66', ['color'] = '#ffffff' } })
                    else
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Error', text = 'Du havede ikke 250 Meth på dig'})
                            end
                        end)


Citizen.CreateThread(function()
    if (GetCurrentResourceName() ~= "bucho-stoffer") then 
        print("[" .. GetCurrentResourceName() .. "] " .. "Info: Du må ikke ændre denne tekst");
        print("[" .. GetCurrentResourceName() .. "] " .. "Info: Du må ikke ændre denne tekst");
        print("[" .. GetCurrentResourceName() .. "] " .. "Info: Du må ikke ændre denne tekst");
        print("[" .. GetCurrentResourceName() .. "] " .. "Info: Du må ikke ændre denne tekst");
        print("[" .. GetCurrentResourceName() .. "] " .. "Info: Du må ikke ændre denne tekst");
    end
end)