Config = {}

Config.NotifyType = 'qbcore'                                --(qbcore | okok)<--This is the 2 options. Right now only supports QBCore:Notify or okokNotify

Config.PaymentType = 'cash'                                 -- 'cash' or 'bank' What account to use for payment
Config.DriversTest = true                                   --[[False = Do not have to take the drivers test to get a Drivers License(will give drivers_license after questionairre.) True = Requires you to take Drivers Test to get driver_license]]
Config.SpeedMultiplier = 3.6                           --KM/H = 3.6 MPH = 2.236936
Config.MaxErrors       = 20
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
Config.GiveItem = true                                      -- true = will give item after passing. False = will require players to go to city hall to accuire item                                     -- Do you want to ped to fade in as you get closer?  Config.GiveItem = true                                      -- true = will give item after passing. False = will require players to go to city hall to accuire item

Config.Amount = {
    ['theoretical'] = 150,                                   --theoretical test payment amount(If Config.DriversTest = false then the theoritical test will go to the drivers test amount.)
    ['driving']     = 1500,                                  --Drivers Test Payment Amount
    ['cdl']         = 2500                                   --CDL Test Payment Amount
}

Config.Location = {
    ['ped'] = vector4(214.56, -1400.25, 30.58, 323.03),     --Location of Ped to spawn if Config.UseTarget is true
    ['marker'] = vector3(215.31, -1398.99, 30.58),          --Location of Blip and marker
    ['spawn'] = vector4(240.3858, -1414.18, 30.457, 320.0)   -- Location to spawn vehicle upon starting Drivers Test
} Config.Blip = {                                             -- Blip Config
  Sprite = 380,
  Display = 4,
  Color = 1,
  Scale = 0.8,
  ShortRange = true,
  BlipName = 'Rijschool'
}

Config.VehicleModels = {
  driver = 'vwpolo',                                         -- Car to spawn with Driver's Test
  cdl = 'stockade'                                          -- Truck to spawn with CDL Test
}
  Config.SpeedLimits = {                                      -- Speed Limits in each zone
  traag     = 35,
  bbkom     = 55,
  stad      = 75,
  snelweg   = 125
}
  Config.CheckPoints = {                                      -- Each Cheackpoint for the Drivers Test

  --1 
  {
    Pos = {x = 255.139, y = -1400.731, z = 28.537},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Ga naar het volgend punt (' .. Config.SpeedLimits['traag']-5 .. ' km/h)', 5000)
    end
  },

  --2
  {
    Pos = {x = 271.874, y = -1370.574, z = 29.932}, 
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Nergens tegenrijden, he!', 5000)
    end
  },

  --3
  {
    Pos = {x = 234.907, y = -1345.385, z = 28.542},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('~r~Let op~s~ Hier kunnen mensen oversteken', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Goed~s~, rij maar verder.', 5000)
      end)
    end
  },

  --4
  {
    Pos = {x = 217.821, y = -1410.520, z = 27.292},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      setCurrentZoneType('bbkom')
      Citizen.CreateThread(function()
        DrawMissionText('~r~Stop!~s~ Kijk links en rechts. U komt nu in de bebouwde kom (' .. Config.SpeedLimits['bbkom']-5 .. ' km/h)', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(6000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Goed~s~, slaag rechtsaf en volg verdere instructies.', 5000)
      end)
    end
  },

  --5
  {
    Pos = {x = 181.8290, y = -1389.93, z = 27.837},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Hier rechts af. Let op voor het verkeer.', 5000)
    end
  },

  --6
  {
    Pos = {x = 209.4000, y = -1328.96, z = 27.933},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('~r~Let op!~s~ hier heb ik al eens iemand overreden!', 5000)
    end
  },

  --7
  {
    Pos = {x = 218.3623, y = -1146.64, z = 27.922},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('~r~STOP~s~ Ik dacht dat ik een duif zag oversteken!', 5000)
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
      DrawMissionText('Aan uw linkerkant bevindt zich het ~g~Blokkenpark!~s~', 5000)
    end
  },

  --9
  {
    Pos = {x = 434.0342, y = -549.704, z = 27.293},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      setCurrentZoneType('snelweg')
      DrawMissionText('U mag nu de snelweg oprijden. Let goed op uw snelheid (' .. Config.SpeedLimits['snelweg'] .. ' km/h)', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  --10
  {
    Pos = {x = 664.4438, y = -230.153, z = 42.298},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Blijf deze weg volgen!', 5000)
    end
  },
  --11
  {
    Pos = {x = 1030.041, y = 303.9883, z = 82.095},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Ja, nog altijd deze weg volgen!', 5000)
    end
  },
--12
  {
    Pos = {x = 1426.583, y = 709.8778, z = 76.810},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Deze weg, ja. Blijven volgen...', 5000)
    end
  },
--13
  {
    Pos = {x = 1633.356, y = 1140.220, z = 81.944},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Stoort het als ik een sigaretje rook?', 5000)
    end
  },
--14
  {
    Pos = {x = 1829.505, y = 2083.786, z = 71.599},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Uhu, Uhu, goed bezig! Even mijn gsm checken...', 5000)
    end
  },
  --15
  {
    Pos = {x = 2227.877, y = 2740.093, z = 44.005},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Oh ja, hier moet je er af.', 5000)
    end
  },
  --16
  {
    Pos = {x = 2433.341, y = 2862.021, z = 47.638},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      setCurrentZoneType('stad')
      DrawMissionText('~r~STOP! STOP! STOP!~s~', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
      DrawMissionText('Verdorie, pokemon kwijt. Euhm hier links af naar de stad (' .. Config.SpeedLimits['stad'] .. ' km/h)', 5000)
    end
  },
  --17
  {
    Pos = {x = 2172.100, y = 3013.084, z = 44.000},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Heb jij hier ook goede ontvangst?', 5000)
    end
  },
  --18
  {
    Pos = {x = 1824.189, y = 2943.899, z = 44.341},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('We zullen maar geen hallo tegen mijn vader zeggen, zeker? Rij maar door', 5000)
    end
  },
--19
  {
    Pos = {x = 1454.967, y = 2724.651, z = 36.167},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Mmmh, verse aarbeien.', 5000)
    end
  },
--20
  {
    Pos = {x = 1250.306, y = 2685.479, z = 37.176},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      setCurrentZoneType('stad')
      DrawMissionText('Niet vergeten, we zitten nu in een bebouwde kom (' .. Config.SpeedLimits['bbkom']-5 .. ' km/h)', 5000)
    end
  },
--21
  {
    Pos = {x = 790.13, y = 2703.126, z = 40.076},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Doe eens zot, ga maar links af!', 5000)
    end
  },
--22
  {
    Pos = {x = 724.0625, y = 2417.053, z = 58.743},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('*Doet raam open en snuift* Mmmmmh, plattelandslucht', 5000)
    end
  },
--24
  {
    Pos = {x = 696.0855, y = 2198.466, z = 58.607},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('~r~Pas op voor overstekende wilde dieren!~s~', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Dat was op het nippertje~s~, rij maar verder.', 5000)

      end)
    end
  },
--25
  {
    Pos = {x = 317.0678, y = 2091.758, z = 102.39},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('*Zingt* Country roooooaaaaad, take me hoooooome ♪', 5000)
    end
  },
--26
  {
    Pos = {x = -157.336, y = 1874.443, z = 196.81},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Je mag deze weg blijven volgen.', 5000)
    end
  },
--27
  {
    Pos = {x = 142.5294, y = 1597.681, z = 228.08},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Fuck, ik moet plassen', 5000)
    end
  },
--28
  {
    Pos = {x = 311.5831, y = 1024.846, z = 209.03},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Hier rechtdoor rijden.', 5000)
    end
  },
--29
  {
    Pos = {x = 286.8121, y = 772.8760, z = 183.47},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Sla hier rechts af.', 5000)
    end
  },
--30
  {
    Pos = {x = 131.4464, y = 575.3565, z = 182.00},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Niet te snel met al die bochten!', 5000)
    end
  },
--31
  {
    Pos = {x = -151.372, y = 518.3598, z = 138.56},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Ugh, nu ben ik misselijk.', 5000)
    end
  },
--32
  {
    Pos = {x = -339.313, y = 486.8434, z = 111.39},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Nee, sla maar links af.', 5000)
    end
  },
--33
  {
    Pos = {x = -314.349, y = 452.8746, z = 106.86},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('En hier terug rechts af.', 5000)
    end
  },
--35
  {
    Pos = {x = -531.837, y = 441.7765, z = 96.974},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Hier scherp links af', 5000)
    end
  },
--36
  {
    Pos = {x = -540.336, y = 278.2394, z = 81.578},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Hier moet je traag rijden (' .. Config.SpeedLimits['traag'] .. ' km/h)', 5000)
    end
  },
--37
  {
    Pos = {x = -545.576, y = 147.9981, z = 62.055},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('Stoppen, dit is een druk kruispunt.', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Goed zo~s~, ga maar verder.', 5000)

      end)
    end
  },
--38
  {
    Pos = {x = -566.853, y = -64.0655, z = 40.673},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Weg blijven volgen', 5000)
    end
  },
--39
  {
    Pos = {x = -425.159, y = -276.440, z = 34.671},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Blijven volgen!', 5000)
    end
  },
--40
  {
    Pos = {x = -296.036, y = -376.676, z = 28.623},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Gevaarlijk kruispunt. Kijk goed links en rechts voordat je oversteekt!', 5000)
    end
  },
--41
  {
    Pos = {x = -255.217, y = -637.447, z = 32.055},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Sla links af en direct terug rechts.', 5000)
    end
  },
--42
  {
    Pos = {x = -285.154, y = -854.646, z = 30.351},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Hier naar links', 5000)
    end
  },
  --43
  {
    Pos = {x = 76.27635, y = -1000.16, z = 27.924},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Je mag hier naar rechts', 5000)
    end
  },
  -- bijna einde

--44
  {
    Pos = {x = 77.11723, y = -1339.42, z = 27.855},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Dat was ... euhm ... rij maar door naar de rijschool', 5000)
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