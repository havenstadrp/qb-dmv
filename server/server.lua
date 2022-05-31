QBCore = exports['qb-core']:GetCoreObject()

--Event to Remove Money from player upon failed attempt at theoritical test
RegisterNetEvent('qb-dmv:theorypaymentfailed', function()
    local amount = Config.Amount['theoretical']/2
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney(Config.PaymentType, amount)
<<<<<<< HEAD
    TriggerClientEvent('QBCore:Notify', "U betaalde €"..amount.."","success")
    TriggerClientEvent('QBCore:Notify', "Je bent gezakt voor de test. Probeer het opnieuw!", "error")
=======
    TriggerClientEvent('qb-dmv:Notify', source, 'You paid $'..amount, 3000, 'error', 'Paid')
    TriggerClientEvent('qb-dmv:Notify', source, 'You failed the test. Please try again!', 3000, 'error', 'Failed')

>>>>>>> 607214b2a11bf8ab1d507c7c7e27902344451af2
end)

--Event to Remove Money and Add Item upon successful attempt at theoritical test
RegisterNetEvent('qb-dmv:theorypaymentpassed', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    local license = true
    local info = {}
    if Config.DriversTest then
        local info = {}
        local _source = source
        local Player = QBCore.Functions.GetPlayer(_source)
        local licenseTable = Player.PlayerData.metadata['licences']
        info.type = "Drivers Permit"
        licenseTable['permit'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
        Player.Functions.RemoveMoney(Config.PaymentType, Config.Amount['theoretical'])
        if Config.GiveItem then
            Player.Functions.AddItem('permit', 1, nil, info)
<<<<<<< HEAD
            TriggerClientEvent('QBCore:Notify', "Je bent geslaagd en hebt je tijdelijk rijbewijs ontvange", "success")
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['permit'], 'add')
        else
            TriggerClientEvent('QBCore:Notify', "Je bent geslaagd voor de test. Ga naar het stadhuis om uw rijbewijs te krijgen")
        end
        TriggerClientEvent('QBCore:Notify', "U betaalde €"..Config.Amount['theoretical'], "success")
=======
            TriggerClientEvent('qb-dmv:Notify', source, 'You passed and got your permit. Congradulations!', 3000, 'success', 'Passed')
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['permit'], 'add')
        else
            TriggerClientEvent('qb-dmv:Notify', source, 'You passed the test. Go to city hall to get your permit. Congradulations!', 3000, 'success', 'Passed')
        end
        TriggerClientEvent('qb-dmv:Notify', source, 'You paid $'..Config.Amount['theoretical'], 3000, 'success', 'Paid')
>>>>>>> 607214b2a11bf8ab1d507c7c7e27902344451af2
    elseif Config.DriversTest == false then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
        local licenseTable = Player.PlayerData.metadata['licences']
        licenseTable['driver'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
        Player.Functions.RemoveMoney(Config.PaymentType, Config.Amount['driving'])
        if Config.GiveItem then
            Player.Functions.AddItem('driver_license', 1, nil, info)
<<<<<<< HEAD
            TriggerClientEvent('QBCore:Notify', "Je bent geslaagd en hebt je voorlopig rijbewijs gehaald", "success")
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['driver_license'], 'add')
        else
            TriggerClientEvent('QBCore:Notify', "Je bent geslaagd! Ga naar het stadhuis en haal je voorlopig rijbewijs")
        end
        TriggerClientEvent('QBCore:Notify', "U betaalde €"..Config.Amount['driving'],"success")
        
=======
            TriggerClientEvent('qb-dmv:Notify',source, 'You passed and got your drivers license. Congradulations!', 3000, 'success', 'Passed')
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['driver_license'], 'add')
        else
            TriggerClientEvent('qb-dmv:Notify', source, 'You passed! Got to city hall and get your drivers license.', 3000, 'success', 'Passed')
        end
        TriggerClientEvent('qb-dmv:Notify', source, 'You paid $ '..Config.Amount['driving'], 3000, 'info', 'Paid')
>>>>>>> 607214b2a11bf8ab1d507c7c7e27902344451af2
    end
end)

RegisterNetEvent('qb-dmv:driverpaymentpassed', function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if Config.DriversTest then
        local info = {}
        local _source = source
        local Player = QBCore.Functions.GetPlayer(_source)
        local licenseTable = Player.PlayerData.metadata['licences']
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        licenseTable['driver'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
        Player.Functions.RemoveMoney(Config.PaymentType, Config.Amount['driving'])
        if Config.GiveItem == true then
            Player.Functions.AddItem('driver_license', 1, nil, info)
<<<<<<< HEAD
            TriggerClientEvent('QBCore:Notify', "Je bent geslaagd voor het rijexamen en hebt je rijbewijs gekregen", "success")
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['driver_license'], 'add')
        else
            TriggerClientEvent('QBCore:Notify', "Je bent geslaagd voor het rijexamen. Ga naar het stadhuis om uw rijbewijs te halen")
        end
        TriggerClientEvent('QBCore:Notify', "U betaalde €"..Config.Amount['driving'],"success")
=======
            TriggerClientEvent('qb-dmv:Notify', source, 'You passed the drivers test and got your drivers licens. Congradulations!', 3000, 'success', 'Passed')
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['driver_license'], 'add')
        else
            TriggerClientEvent('qb-dmv:Notify', source, 'You passed the Drivers Test. Go to City Hall to get your license.', 3000, 'success', 'Passed')
        end
        TriggerClientEvent('qb-dmv:Notify', source, 'You paid $'..Config.Amount['driving'], 3000, 'success', 'Paid')
>>>>>>> 607214b2a11bf8ab1d507c7c7e27902344451af2
    end
end)

RegisterNetEvent('qb-dmv:driverpaymentfailed', function ()
    local amount = Config.Amount['driving']/2
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney(Config.PaymentType, amount)
<<<<<<< HEAD
    QBCore.Functions.Notify("U betaalde €"..amount.."","success")
=======
    TriggerClientEvent('qb-dmv:Notify', source, 'You paid $'..amount, 3000, 'success', 'Paid')
>>>>>>> 607214b2a11bf8ab1d507c7c7e27902344451af2
end)

QBCore.Functions.CreateCallback('qb-dmv:server:permitdata', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata['licences']
    if licenseTable['permit'] == true then
        cb(false)
    else
        cb(true)
    end
end)

QBCore.Functions.CreateCallback('qb-dmv:server:licensedata', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata['licences']
    if licenseTable['driver'] then
        cb(false)
    elseif licenseTable['permit'] and licenseTable['driver'] == false then
        cb(true)
    end
end)

