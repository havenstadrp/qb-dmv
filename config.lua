Config = {}

Config.PaymentType = 'cash'                                 -- 'cash' or 'bank' What account to use for payment
Config.DriversTest = true                                   --[[False = Do not have to take the drivers test to get a Drivers License(will give drivers_license after questionairre.) True = Requires you to take Drivers Test to get driver_license]]
Config.SpeedMultiplier = 2.236936                           --KM/H = 3.6 km/h = 2.236936
Config.MaxErrors       = 10
Config.UseTarget       = true                              --CURRENTLY NOT WORKING! (recommend leaving false until future update) Gotta fix the target menu to auto change without having to restart qb-target. True will use qb-target instead of qb-menu False will use qb-menu
--Config.Ped = 's_m_y_cop_01'
Config.Ped = {                                              --Will Spawn this ped for qb-target if Config.UseTarget is true
  {
		model = 's_m_y_cop_01',                                 -- Ped to spawn
		coords = vector4(214.3, -1400.02, 30.58, 324.41),       -- Coordinates to spawn ped at
		gender = 'male',                                        -- Pretty obvious
    gendernumber = 4                                        -- 4 = male 5 = female
	},
}
Config.FadeIn = true                                        -- Do you want to ped to fade in as you get closer?
Config.GiveItem = true                                      -- true = will give item after passing. False = will require players to go to city hall to accuire item

Config.Amount = {
    ['theoretical'] = 50,                                   --theoretical test payment amount(If Config.DriversTest = false then the theoritical test will go to the drivers test amount.)
    ['driving']     = 150,                                  --Drivers Test Payment Amount
    ['cdl']         = 250                                   --CDL Test Payment Amount
}

Config.Location = {
    ['ped'] = vector4(214.56, -1400.25, 30.58, 323.03),     --Location of Ped to spawn if Config.UseTarget is true
    ['marker'] = vector3(215.31, -1398.99, 30.58),          --Location of Blip and marker
    ['spawn'] = vector4(236.08, -1401.41, 30.58, 265.06)    -- Location to spawn vehicle upon starting Drivers Test
}
Config.Blip = {                                             -- Blip Config
  Sprite = 380,
  Display = 4,
  Color = 1,
  Scale = 0.8,
  ShortRange = true,
  BlipName = 'DMV School'
}

Config.VehicleModels = {
  driver = 'adder',                                         -- Car to spawn with Driver's Test
  cdl = 'stockade'                                          -- Truck to spawn with CDL Test
}

Config.SpeedLimits = {                                      -- Speed Limits in each zone
  residence = 50,
  town      = 70,
  freeway   = 120
}

Config.CheckPoints = {                                      -- Each Cheackpoint for the Drivers Test

  --1 
  {
     Pos = {x = 255.139, y = -1400.731, z = 28.537},
     Action = function(playerPed, vehicle, setCurrentZoneType)
       DrawMissionText('ga naar het volgend punt ' .. Config.SpeedLimits['residence'] .. 'km/h', 5000)
     end
  },

  --2
  {
    Pos = {x = 271.874, y = -1370.574, z = 29.932}, 
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt', 5000)
    end
  },

  --3
  {
    Pos = {x = 234.907, y = -1345.385, z = 28.542},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('stop mensen steken over', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Good~s~, continue.', 5000)

      end)
    end
  },

  --4
  {
    Pos = {x = 217.821, y = -1410.520, z = 27.292},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      Citizen.CreateThread(function()
        DrawMissionText('stop en kijk links en rechts hou u aan de snelheid' .. Config.SpeedLimits['town'] .. 'km/h', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(6000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Good~s~, turn right and follow the line', 5000)
      end)
    end
  },

  --5
  {
    Pos = {x = 181.8290, y = -1389.93, z = 27.837},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('let op het verkeer!', 5000)
    end
  },

 --6
  {
    Pos = {x = 209.4000, y = -1328.96, z = 27.933},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },

 --7
  {
    Pos = {x = 218.3623, y = -1146.64, z = 27.922},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('stop er rijden autos!', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
    end
  },

 --8
  {
    Pos = {x = 254.4004, y = -968.075, z = 27.922},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },

 --9
  {
    Pos = {x = 434.0342, y = -549.704, z = 27.293},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      DrawMissionText('het is tijd voor de snelweg op te gaan let op u snelheid ' .. Config.SpeedLimits['freeway'] .. 'km/h', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  --10
  {
    Pos = {x = 664.4438, y = -230.153, z = 42.298},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
 --11
  {
    Pos = {x = 1030.041, y = 303.9883, z = 82.095},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--12
  {
    Pos = {x = 1426.583, y = 709.8778, z = 76.810},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--13
  {
    Pos = {x = 1633.356, y = 1140.220, z = 81.944},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--14
  {
    Pos = {x = 1829.505, y = 2083.786, z = 71.599},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
  --15
  {
    Pos = {x = 2227.877, y = 2740.093, z = 44.005},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('rij de autosnelweg af', 5000)
    end
  },
  --16
  {
    Pos = {x = 2433.341, y = 2862.021, z = 47.638},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('stop sla links af', 5000)
    end
  },
  --17
  {
    Pos = {x = 2172.100, y = 3013.084, z = 44.000},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
  --18
  {
    Pos = {x = 1824.189, y = 2943.899, z = 44.341},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--19
  {
    Pos = {x = 1454.967, y = 2724.651, z = 36.167},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--20
  {
    Pos = {x = 1250.306, y = 2685.479, z = 36.176},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('max 50km !', 5000)
    end
  },
--21
  {
    Pos = {x = 747.7875, y = 2691.082, z = 38.813},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gevaarlijke weg!', 5000)
    end
  },
--22
  {
    Pos = {x = 724.0625, y = 2417.053, z = 58.743},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--23
  {
    Pos = {x = 713.5747, y = 2257.832, z = 50.030},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--24
  {
    Pos = {x = 696.0855, y = 2198.466, z = 58.607},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('stop wilde dieren', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Good~s~, continue.', 5000)

      end)
    end
  },
--25
  {
    Pos = {x = 317.0678, y = 2091.758, z = 102.39},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--26
  {
    Pos = {x = -157.336, y = 1874.443, z = 196.81},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--27
  {
    Pos = {x = 142.5294, y = 1597.681, z = 228.08},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--28
  {
    Pos = {x = 311.5831, y = 1024.846, z = 209.03},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--29
  {
    Pos = {x = 286.8121, y = 772.8760, z = 183.47},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('sla rechts af!', 5000)
    end
  },
--30
  {
    Pos = {x = 131.4464, y = 575.3565, z = 182.00},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('veel bochten pas je snelheid aan!', 5000)
    end
  },
--31
  {
    Pos = {x = -151.372, y = 518.3598, z = 138.56},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('veel bochten pas je snelheid aan!', 5000)
    end
  },
--32
  {
    Pos = {x = -339.313, y = 486.8434, z = 111.39},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('sla links af!', 5000)
    end
  },
--33
  {
    Pos = {x = -314.349, y = 452.8746, z = 106.86},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('sla rechts af!', 5000)
    end
  },
--34
  {
    Pos = {x = -468.870, y = 402.4369, z = 100.53},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('veel bochten pas je snelheid aan!', 5000)
    end
  },
--35
  {
    Pos = {x = -531.837, y = 441.7765, z = 96.974},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('scherpe bocht naar links!', 5000)
    end
  },
--36
  {
    Pos = {x = -540.336, y = 278.2394, z = 81.578},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('snelheid 50km!', 5000)
    end
  },
--37
  {
    Pos = {x = -545.576, y = 147.9981, z = 62.055},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('stop mensen steken over', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Good~s~, continue.', 5000)

      end)
    end
  },
--38
  {
    Pos = {x = -566.853, y = -64.0655, z = 40.673},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--39
  {
    Pos = {x = -425.159, y = -276.440, z = 34.671},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
--40
  {
    Pos = {x = -296.036, y = -376.676, z = 28.623},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('kijk links en rechts veel verkeer rij dan rechtdoor!', 5000)
    end
  },
--41
  {
    Pos = {x = -255.217, y = -637.447, z = 32.055},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga links daarna rechts!', 5000)
    end
  },
--42
  {
    Pos = {x = -285.154, y = -854.646, z = 30.351},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ga naar het volgend punt!', 5000)
    end
  },
  --43
  {
    Pos = {x = 76.27635, y = -1000.16, z = 27.924},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      DrawMissionText(' pas je snelheid aan je bent in een stad' .. Config.SpeedLimits['town'] .. 'km/h', 5000)
    end
  },
 -- bijna einde

--44
  {
    Pos = {x = 77.11723, y = -1339.42, z = 27.855},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('ik ben onder de indruk rij maar door naar de rijschool!', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  
  -- einde
  {
    Pos = {x = 233.0968, y = -1401.35, z = 29.105},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      function QBCore.Functions.DeleteVehicle(vehicle)
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
      end
    end
  },

}