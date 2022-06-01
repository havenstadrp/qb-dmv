# ESX DMVSchool Converted to QBCore. With Many new features
We all know the old dmvschool from esx right? Well welcome it to QBCore Framework with a few added details.
 
## If Config.UseNewQB = true
This uses the new QBCore export for DrawText
![This is an image](https://i.imgur.com/7kEKN84.png)
## If Config.UseNewQB = false
This uses a function that has been around to draw a marker for a specific location
![This is an image](https://i.imgur.com/mMYYUlH.png)

## If you use Config.UseTarget the above 2 configs does not matter
![This is an image](https://i.imgur.com/9BqL4oj.png)

## First you will need the MLO for the driving school
You can find the MLO here:
https://forum.cfx.re/t/mlo-driving-school-interior/1466079

# Installation

## Insert Item into QBCore/Shared/Items.lua:
```
['permit']						 = {['name'] = 'permit',						['label'] = 'Driving Permit',			['weight'] = 0,			['type'] = 'item',		['image'] = 'id_card.png',				['unique'] = true,		['useable'] = true,		['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A Driving permit to show you can drive a vehicle as long as you have a passenger'},
```

If you want to give players an id_card instead then go into the server.lua and replace any instance of permit to id_card and don't worry about adding the above line.
Update:(you will have to add permit to the players table in the metadata column for exsisting players as it wont auto update. This means this script looks for permit to be true/false in the license portion of the metadata column on which options to give you. So if you pass the theoritical test it changes permit to true in the metadata column, so you can then do the driving test) -- atleast to my knowledge


## Open qb-core/server/players.lua and find:

```
PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['driver'] = true,
        ['business'] = false,
        ['weapon'] = false,
    }
```
and replace with:
```
PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['driver'] = false,
        ['business'] = false,
        ['weapon'] = false,
        ['permit'] = false
    }
```
## Open qb-core/shared/main.lua
Fine ```QBShared.StarterItems``` and remove the driver license line.

## Open qb-cityhall/client/main.lua
Replace this:
```
local idTypes = {
    ["id_card"] = {
        label = "ID Card",
        item = "id_card"
    },
    ["driver_license"] = {
        label = "Drivers License",
        item = "driver_license"
    },
    ["weaponlicense"] = {
        label = "Firearms License",
        item = "weaponlicense"
    }
}
```

With This:

```
local idTypes = {
    ["id_card"] = {
        label = "ID Card",
        item = "id_card"
    },
    ["driver_license"] = {
        label = "Drivers License",
        item = "driver_license"
    },
    ["weaponlicense"] = {
        label = "Firearms License",
        item = "weaponlicense"
    },
    ["permit"] = {
        label = "Drivers Permit",
        item = "permit"
    }
}
```

Then Replace This:

```
RegisterNUICallback('requestLicenses', function(data, cb)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = {}

    for type,_ in pairs(licensesMeta) do
        if licensesMeta[type] then
            local licenseType = nil
            local label = nil

            if type == "driver" then
                licenseType = "driver_license"
                label = "Drivers Licence"
            elseif type == "weapon" then
                licenseType = "weaponlicense"
                label = "Firearms License"
            end

            availableLicenses[#availableLicenses+1] = {
                idType = licenseType,
                label = label
            }
        end
    end
    cb(availableLicenses)
end)
```

With This:

```
RegisterNUICallback('requestLicenses', function(data, cb)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = {}

    for type,_ in pairs(licensesMeta) do
        if licensesMeta[type] then
            local licenseType = nil
            local label = nil

            if type == "driver" then
                licenseType = "driver_license"
                label = "Drivers Licence"
            elseif type == "weapon" then
                licenseType = "weaponlicense"
                label = "Firearms License"
            elseif type == "permit" then
                licenseType = "permit"
                label = "Drivers Permit"
            end

            availableLicenses[#availableLicenses+1] = {
                idType = licenseType,
                label = label
            }
        end
    end
    cb(availableLicenses)
end)
```

## And last go to qb-cityhall/server/main.lua and replace:
```
RegisterServerEvent('qb-cityhall:server:requestId')
AddEventHandler('qb-cityhall:server:requestId', function(identityData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if identityData.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif identityData.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif identityData.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    end

    Player.Functions.AddItem(identityData.item, 1, nil, info)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[identityData.item], 'add')
end)
```

With This:


```
RegisterNetEvent('qb-cityhall:server:requestId', function(identityData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if identityData.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif identityData.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif identityData.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    elseif identityData.item == "permit" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Drivers Permit"
    end

    Player.Functions.AddItem(identityData.item, 1, nil, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[identityData.item], 'add')
    Player.Functions.RemoveMoney("cash", 50)
end)
```

# New Details

Added Permit to database defaults false. So now qb-dmv won't look to see if they have the item in their inventory rather the database to see if true or false. So they can't spam taking the test.

Fixed the Drivers Test activating upon opening the Menu. Now Drivers Test activates upon clicking Start Drivers Test.

Fixed the players from being able to go back to the dmv menu to start a second driver's test while the original is still going.

Added a config for GiveItem. If false then upon completion of the drivers test then they have to go to City Hall to Buy a license. If true then qb-dmv will give them the item.

Added Permit upon completion of Theoretical test

Vehicle will despawn once MaxErrors(can be edited in config.lua) has been reached

Player will be teleported back to the DMV once MaxErrors has been reached.

Theoritcal Test UI has been updated and looks different.

Added ability to only have to take Theoritcal Test(Config.DriversTest) if it is set to false then players will only have to take Theoritcal test to get a Driver's License. Set to True to make players take driving test to get a drivers license.

Implemented Target and QBCores new export for DrawText

Added a config to use okokNotify or QBCore:Notify

Maybe others that I can't think of at the moment.

# Planned Details

Make it so players must be in starting vehicle to complete the drivers test

# Contact Me

If you have any questions or any problems please don't hesitate to message me or ask on the qbcore discord. We are happy to help.

Bama94#1994

QBCore Discord: https://discord.gg/pKUZvJBxq4

# Credits

ConnorTheDev#5982 - Credit for finding the way to add to the database.(I was unaware of this method)
cambrey1#2143 - Credit for sending me the files to find the reason behind the UI getting stuck on screen after failing test and trying again.
