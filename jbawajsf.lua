if game.CoreGui:FindFirstChild("Jailbreak Auto Rob") then
    game.CoreGui["Jailbreak Auto Rob"]:Destroy()
end

local keys, network = loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteH4T-Dev/0982e248-7b12-4ba5-8f96-b9fc811e0cad/main/fetcher.lua"))()

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteH4T-Dev/0982e248-7b12-4ba5-8f96-b9fc811e0cad/main/engine.lua"))()

local HasherClient = {
    Modules = {
        HashTable = '',
        DonutFunc = '',
        KickFunc = '',
        HeliFunc = '',
        ExplodeWallFunc = ''
    },
    Hashes = {
        Donut1 = '',   
        Donut2 = '',    
        KickHash = '',  
        Team = '',      
        GiftSafe = '',  
        HeliCrate = '', 
        Interact = '',  
        Eject = '',     
        Taze = '',      
        GrabGun = ''    
    }
    }

--Collect All Hashes
    
for i,v in pairs(getgc(true)) do
    if HasherClient.Modules.HashTable == '' and type(v) == 'table' then
        for i2,v2 in pairs(v) do
            if type(v2) == 'string' and v2:sub(1,1) == '!' and v2:len() > 10 then
                HasherClient.Modules.HashTable = v
            end
        end
    end
    --Donut1 Func
    if HasherClient.Modules.DonutFunc == '' and type(v) == 'table' and rawget(v,'Fun') and rawget(v,'Part') and type(v.Fun) == 'function' and v.Part.Name == 'Donut' then
        HasherClient.Modules.DonutFunc = v.Fun
    end
    if HasherClient.Modules.KickFunc == '' and type(v) == 'function' and getfenv(v).script and getfenv(v).script == game:GetService('Players').LocalPlayer.PlayerScripts.LocalScript then
        if debug.getconstants(v) and table.find(debug.getconstants(v),'FailedPcall') then
            HasherClient.Modules.KickFunc = v
        end
    end
    if HasherClient.Modules.HeliFunc == '' and type(v) == 'table' and type(rawget(v, "Heli")) == "table" then
        HasherClient.Modules.HeliFunc = v.Heli.Update
    end
    if HasherClient.Modules.ExplodeWallFunc == ''  and type(v) == 'function' and getfenv(v).script and getfenv(v).script == game:GetService('Players').LocalPlayer.PlayerScripts.LocalScript then
        if debug.getconstants(v) and table.find(debug.getconstants(v),'ExplodeWall') and table.find(debug.getconstants(v),'FireServer') then
            HasherClient.Modules.ExplodeWallFunc = v
        end
    end
    end
    
    --Donut 1
    Donut1Constants = {}
    for i,v in pairs(getconstants(HasherClient.Modules.DonutFunc)) do
    if type(v) == 'string' and v ~= 'sub' and v ~= 'reverse' and v ~= 'Name' and v ~= 'tick' and v ~= 'FireServer' then
        table.insert(Donut1Constants, v)
    end
    end
    local FF_Donut1Constants = Donut1Constants[1]
    local LL_Donut1Constants = Donut1Constants[table.maxn(Donut1Constants)]
    for i, v in pairs(HasherClient.Modules.HashTable) do
    if string.find(i, FF_Donut1Constants) and string.find(i, LL_Donut1Constants) and FF_Donut1Constants:sub(1,1) == i:sub(1,1) and LL_Donut1Constants:sub(#LL_Donut1Constants,#LL_Donut1Constants) == i:sub(#i,#i) then
        HasherClient.Hashes.Donut1 = i
        break
    end
    end
    
    --Donut 2
    
    Donut2Func = getproto(require(game:GetService("ReplicatedStorage").Game.Item.Donut).InputBegan, 1)
    Donut2Constants = {}
    for i,v in pairs(getconstants(Donut2Func)) do
    if type(v) == 'string' and v ~= 'sub' and v ~= 'reverse' and v ~= 'Name' and v ~= 'tick' and v ~= 'FireServer' and v ~= 'SpringItemRotation' and v ~= 'Config' and v ~= 'Motion' and v ~= 'Hip' and v ~= 'Springs' and v ~= 'ItemRotation' and v ~= 'SetTarget' and v ~= 'Local' and v ~= 'LastConsumed' then
        table.insert(Donut2Constants, v)
    end
    end
    local FF_Donut2Constants = Donut2Constants[1]
    local LL_Donut2Constants = Donut2Constants[table.maxn(Donut2Constants)]
    for i, v in pairs(HasherClient.Modules.HashTable) do
    if string.find(i, FF_Donut2Constants) and string.find(i, LL_Donut2Constants) and FF_Donut2Constants:sub(1,1) == i:sub(1,1) and LL_Donut2Constants:sub(#LL_Donut2Constants,#LL_Donut2Constants) == i:sub(#i,#i) then
        HasherClient.Hashes.Donut2 = i
        break
    end
    end
    
    --KickHash
    
    KickHashConstants = {}
    for i,v in pairs(getconstants(HasherClient.Modules.KickFunc)) do
    if type(v) == 'string' and v ~= 'sub' and v ~= 'reverse' and v ~= 'Name' and v ~= 'tick' and v ~= 'FireServer' and v ~= 'FailedPcall' and v ~= 'pcall' and v ~= '' then
        table.insert(KickHashConstants, v)
    end
    end
    local FF_KickHashConstants = KickHashConstants[1]
    local LL_KickHashConstants = KickHashConstants[table.maxn(KickHashConstants)]
    for i, v in pairs(HasherClient.Modules.HashTable) do
    if string.find(i, FF_KickHashConstants) and string.find(i, LL_KickHashConstants) and FF_KickHashConstants:sub(1,1) == i:sub(1,1) and LL_KickHashConstants:sub(#LL_KickHashConstants,#LL_KickHashConstants) == i:sub(#i,#i) then
        HasherClient.Hashes.KickHash = i
        break
    end
    end
    
    --Team
    
    TeamFunc = getproto(require(game:GetService("ReplicatedStorage").Game.TeamChooseUI).Show, 4)
    TeamConstants = {}
    for i,v in pairs(getconstants(TeamFunc)) do
    if type(v) == 'string' and v ~= 'sub' and v ~= 'reverse' and v ~= 'Name' and v ~= 'tick' and v ~= 'FireServer' and v ~= 'Police' and v ~= 'Prisoner' and v ~= 'assert' and v ~= '' then
        table.insert(TeamConstants, v)
    end
    end
    local FF_TeamConstants = TeamConstants[1]
    local LL_TeamConstants = TeamConstants[table.maxn(TeamConstants)]
    for i, v in pairs(HasherClient.Modules.HashTable) do
    if string.find(i, FF_TeamConstants) and string.find(i, LL_TeamConstants) and FF_TeamConstants:sub(1,1) == i:sub(1,1) and LL_TeamConstants:sub(#LL_TeamConstants,#LL_TeamConstants) == i:sub(#i,#i) then
        HasherClient.Hashes.Team = i
        break
    end
    end
    

    
    --Interact
    
    InteractConstants = {}
    for i,v in pairs(getconstants(HasherClient.Modules.ExplodeWallFunc)) do  
    if type(v) == 'string' and v ~= 'sub' and v ~= 'reverse' and v ~= 'Name' and v ~= 'tick' and v ~= 'FireServer' and v ~= '' and v ~= 'ExplodeWall' then
        table.insert(InteractConstants, v)
    end
    end
    local FF_InteractConstants = InteractConstants[1]
    local LL_InteractConstants = InteractConstants[table.maxn(InteractConstants)]
    for i, v in pairs(HasherClient.Modules.HashTable) do
    if string.find(i, FF_InteractConstants) and string.find(i, LL_InteractConstants) and FF_InteractConstants:sub(1,1) == i:sub(1,1) and LL_InteractConstants:sub(#LL_InteractConstants,#LL_InteractConstants) == i:sub(#i,#i) then
        HasherClient.Hashes.Interact = i
    end
    end
    
    --

    local KickVHash = (function()
        for i,v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "t") and rawget(v, "i") == 0.1 and type(rawget(v, "c")) == "function" then
                local con = getconstants(v.c)
                if table.find(con, "Eject") and table.find(con, "MouseButton1Down") then
                    local bruh = getproto(v.c,1)
                    local aaa = getconstants(bruh)
                    local Kcon2 = {}
                    for i, v in pairs(aaa) do
                        if type(v) == "string" and v ~= "FireServer" then
                            table.insert(Kcon2, v)
                        end
                    end
                    local ka = Kcon2[1]
                    local kb = Kcon2[table.maxn(Kcon2)]
                    for i, v in pairs(AllHashes) do
                        if string.find(i, ka) and string.find(i, kb) then
                            return i
                        end
                    end
                end
            end
        end
    end)()

    Client = {
        Hashes = {
            Donut1 = HasherClient.Hashes.Donut1,    
            Donut2 = HasherClient.Hashes.Donut2,    
            KickHash = HasherClient.Hashes.KickHash,  
            Team = HasherClient.Hashes.Team,      
            GiftSafe = HasherClient.Hashes.GiftSafe,  
            HeliCrate = HasherClient.Hashes.HeliCrate, 
            Interact = HasherClient.Hashes.Interact,  
            Taze = TeamHash,
            KickVehicle = KickVHash,      
        },
        Toggles = {
            Walkspeed = false,
            JumpPower = false,
            InfJump = false,
            NoClip = false,
            NoRagdoll = false,
            Godmode = false,
            AutoFarm = false,
            AutoArrest = false,
            RainbowNitro = false,
            RainbowCar = false,
            InfNitro = false,
            RainbowCarS = false,
            LoopExplode = false,
            LoopVolcano = false,
            LoopSewer = false,
            OpenAllDoors = false,
            NoTirePop = false,
            NoWait = false,
            CtrlClickTP = false,
            Breakout = false
        },
        Values = {
            WalkSpeed = 16,
            JumpPower = 50,
            Method = 1,
            carspeed = 1,
            turnspeed = 1.5,
            suspention = 3,
            brakes = 1
        },
        Teleports = {
            ['Jewelry Out'] = CFrame.new(156.103851, 18.540699, 1353.72388),
            ['Jewelry In'] = CFrame.new(133.300705, 17.9375954, 1316.42407),
            ['Bank Out'] = CFrame.new(11.6854906, 17.8929214, 788.188171),
            ['Bank In'] = CFrame.new(24.6513691, 19.4347649, 853.291687),
            ['Museum Out'] = CFrame.new(1103.53406, 138.152878, 1246.98511),
            ['Donut Shop'] = CFrame.new(76.4559402, 21.0584793, -1591.01416, 0.790199757, 0.156331331, -0.592574954, 0.015425493, 0.96153754, 0.274239838, 0.612655461, -0.225844979, 0.757395089),
            ['Gas Station'] = CFrame.new(-1584.1051, 18.4732189, 721.38739),
            ['PowerPlant'] = CFrame.new(702.740967, 39.0193367, 2371.88672, -0.998025119, -0.00970620103, -0.0620610416, -0.00215026829, 0.992689848, -0.120674998, 0.0627786592, -0.120303221, -0.990750134),
            ['Airport'] = CFrame.new(-1227.47449, 64.4552231, 2787.64233),
            ['Gun Shop'] = CFrame.new(-27.8670673, 17.7929249, -1774.66882),
            ['Volcano Base'] = CFrame.new(1726.72266, 50.4146309, -1745.76196),
            ['City Base'] = CFrame.new(-244.824478, 17.8677788, 1573.81616),
            ['Boat Port'] = CFrame.new(-407.957886, 22.5707016, 2049.26074, -0.976195455, 0.0327876508, -0.214399904, 0.00279002171, 0.990324318, 0.138744399, 0.216874525, 0.134843469, -0.966841578),
            ['Boat Cave'] = CFrame.new(1875.21838, 32.8055534, 1909.28687, -0.701772571, 0.0434923843, -0.711072326, -0.0087880427, 0.997530222, 0.0696865618, 0.712346911, 0.0551530346, -0.699657202),
            ['Prison Cells'] = CFrame.new(-1461.07605, -0.318537951, -1824.14917),
            ['Prison Yard'] = CFrame.new(-1219.36316, 17.7750931, -1760.8584),
            ['Prison Parking'] = CFrame.new(-1173.36951, 18.698061, -1533.47656),
            ['1M Shop'] = CFrame.new(706.598267, 20.5805721, -1573.26294),
            ['Military Base'] = CFrame.new(766.283386, 18.0144463, -324.15921),
            ['Evil Lair'] = CFrame.new(1735.52405, 18.1646328, -1726.05249),
            ['Secret Agent Base'] = CFrame.new(1506.60754, 69.8824005, 1634.42456),
            ['Garage'] = CFrame.new(-384.259521, 19.6279697, 1221.55005),
            ['Lookout'] = CFrame.new(1328.05725, 166.614426, 2609.93457),
            ['Casino'] = CFrame.new(-272.717804, 19.515337, -4677.16992, 0.990908921, 3.56018255e-08, -0.134534627, -3.41914586e-08, 1, 1.27937607e-08, 0.134534627, -8.07751555e-09, 0.990908921),
        }
        }

    local startedTime = tick();
for i,v in pairs(getgc(true)) do
if not KickFunc and type(v) == 'function' and getfenv(v).script and getfenv(v).script == game:GetService('Players').LocalPlayer.PlayerScripts.LocalScript then
    if debug.getconstants(v) and table.find(debug.getconstants(v),'FailedPcall') then
        KickFunc = v
    end
end
end



if not KickFunc then
return nil 
end
--Notif('Please give DevHub some time to load!',3)


wait(0.5)
--Load GC Framework
local startedTime = tick();
for i,v in pairs(getgc(true)) do
if not Network and type(v) == 'table' and rawget(v,'FireServer') then
    Network = v
end
if not HashTable and type(v) == "table" then
    for i2,v2 in pairs(v) do
        if type(v2) == "string" and v2:sub(1,1) == "!" and v2:len() > 10 then
            HashTable = v
        end
    end
end
if not Falling and type(v) == "table" and rawget(v, 'Ragdoll') and rawget(v, 'Unragdoll') then
    Falling = v
end
if not DonutFunction and type(v) == "function" and getfenv(v).script == game:GetService("ReplicatedStorage").Inventory then
    DonutFunction = v
end
if not NitroTable and type(v) == "table" and rawget(v, "Nitro") and rawget(v,'NitroLastMax') then
    Nitro = v
end
if not GarageFuncCar and type(v) == 'function' and getfenv(v).script == game:GetService('ReplicatedStorage').Game.Garage.GarageUI then
    local Right = debug.getconstants(debug.getproto(require(game:GetService('ReplicatedStorage').Game.Garage.GarageUI).Init,1))
    if unpack(debug.getconstants(v)) == unpack(Right) and not table.find(debug.getconstants(v),'Index') then
        GarageFuncCar = v
    end
end
if not PlayFunc and type(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript then
    local con = getconstants(v)
    if table.find(con, "Play") and table.find(con, "Source") and table.find(con, "FireServer") then
        PlayFunc = v
    end
end
if not DoorOpenFunc and type(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript then
    local con = getconstants(v)
    if table.find(con, "SequenceRequireState") then
        DoorOpenFunc = v
    end
end
if not BBClient and type(v) == 'table' and rawget(v,'doesPlayerOwn') then
    BBClient = v
end
end
wait(.5)
if not HashTable[Client.Hashes.KickHash] then
--Notif("DEBUG : Unable to Find Kick Hash! Continue with caution!")
end

if PoliceFunction then
ArrestFunc = getupvalue(getupvalue(PoliceFunction,1),7)
end

local W = {
	enabled = false,
    IncludeBank = false,
    IncludeJewelry = false,
    IncludeMuseum = false,
    IncludePlane = false,
    IncludeTrain = false,
    IncludePTrain = false,
    IncludePower = false,
    IncludeCasino = false,
    IncludeDrops = false,
    AutoPull = false,
    Premium = false
}

if game.Players.LocalPlayer.Name == "FaeeWasTaken" then
    Premium = true
else
    Premium = false
end



function teleport(location, ExitCar)
for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if v:FindFirstChild("Seat") then
            if v.Seat.PlayerName.Value == "" and v.Name == "Camaro" then
                local dist = (v.PrimaryPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if dist <= 5100 then
                    movement:move_to_position(player.Character.HumanoidRootPart, CFrame.new(v.PrimaryPart.Position.X, v.PrimaryPart.Position.Y, v.PrimaryPart.Position.Z), dependencies.variables.player_speed)
                    wait(1)
                    local enter_attempts = 1;

        repeat -- attempt to enter car
            for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                if d.Part == v.Seat then
                    d:Callback(d,true)
                end
            end
                    
            enter_attempts = enter_attempts + 1;

            task.wait(0.1);
        until enter_attempts == 10 or v.Seat.PlayerName.Value == player.Name;
                    break
                end
            end
        end
    end

wait(1)
for i,v in pairs(workspace.Vehicles:GetChildren()) do 
        if v:FindFirstChild('Seat') then
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then 
                local O, P
local Q = {}
local S = false
local R = Vector3.new()

Q = v.PrimaryPart
--P = game:GetService("Players").LocalPlayer.Character.Humanoid

local function vtp(ic)
	--P:SetStateEnabled("FallingDown", false)
	local jc = (ic - ic.p) + Q.Position + Vector3.new(0, 4, 0)
	local kc = ic.p - Q.Position
	local lc = workspace.Gravity
	--workspace.Gravity = 0
	for mc = 0, kc.Magnitude, 17.3 do
		if S then
			break
		end
		Q.CFrame = jc + kc.Unit * mc
		Q.Velocity, Q.RotVelocity = R, R
		wait()
	end
	if not S then
		Q.CFrame = ic
	end
	--workspace.Gravity = lc
end
v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 500, 0)

vtp(location + Vector3.new(0, 500, 0))

v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, -500, 0)
if ExitCar == true then
local replicated_storage = game:GetService("ReplicatedStorage");
		
local game_folder = replicated_storage.Game;

		local team_choose_ui = require(game_folder.TeamChooseUI);
		
 local exit_car_function = getupvalue(team_choose_ui.Init, 3);
            repeat -- attempt to exit car
                task.wait(0.15);
                exit_car_function()
            until v.Seat.PlayerName.Value ~= game.Players.LocalPlayer.Name;
end
            end
        end
        
end
        
end

--Ui Lib

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Jailbreak Auto Rob", 5013109572)

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

local MainPage = venyx:addPage("Main")
local Main = MainPage:addSection("Auto Rob")
local Main3 = MainPage:addSection("Options")
local Main2 = MainPage:addSection("Stores")

local StatusesPage = venyx:addPage("Statuses")
local Statuses = StatusesPage:addSection("Statuses")

local SettingsPage = venyx:addPage("Settings")
local Settings = SettingsPage:addSection("Settings")

if game.Players.LocalPlayer.Name == "FayyAlt" then
    local TeleportPage = venyx:addPage("Teleports")
    local Teleport = TeleportPage:addSection("Teleports")

    Teleport:addButton("Jewelry Store", function()
        teleport(CFrame.new(150, 18, 1373), true)
        print("Deez")
    end)
end

local oldRagdoll = Falling.Ragdoll
Falling.Ragdoll = function(...)
if Client.Toggles.NoRagdoll then
    return wait(9e9)
else
    return oldRagdoll(...)
end
end

local Status = Main:addButton("Auto Rob Disabled", function()end)
Main:addToggle("Auto Rob Enabled", nil, function(value)
	W.enabled = value
end)
Main:addToggle("Anti Ragdoll", nil, function(ragadoll)
	Client.Toggles.NoRagdoll = ragadoll
end)

Main2:addToggle("Include Bank", nil, function(IncludeBk)
    W.IncludeBank = IncludeBk
end)
Main2:addToggle("Include Jewelry", nil, function(IncludeJy)
    W.IncludeJewelry = IncludeJy
end)
Main2:addToggle("Include PowerPlant", nil, function(IncludePp)
    W.IncludePower = IncludePp
end)
Main2:addToggle("Include Casino", nil, function(IncludeC)
    W.IncludeCasino = IncludeC
end)
Main2:addToggle("Include Museum", nil, function(IncludeMm)
    W.IncludeMuseum = IncludeMm
end)
Main2:addToggle("Include CargoTrain", nil, function(IncludeCt)
    W.IncludeTrain = IncludeCt
end) --temp disabled
Main2:addToggle("Include Passenger Train", nil, function(IncludePt)
    W.IncludePTrain = IncludePt
end)
Main2:addToggle("Include CargoPlane", nil, function(IncludeCp)
    W.IncludePlane = IncludeCp
end)
Main2:addToggle("Include Airdrops", nil, function(IncludeAir)
    W.IncludeDrops = IncludeAir
end)

if Premium == true then
Main3:addToggle("Instant TP", nil, function(Instant)
    print("Soon")
end)
end

Main3:addToggle("AutoPull", nil, function(AutoPl)
    W.AutoPull = AutoPl

    while wait(0.5) do
        if not W.AutoPull then return end
            for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
                if v.Name == "Place Dynamite" then
                    v:Callback(true)
                end
            end
            wait(1)
        
    end
end)

Settings:addKeybind("Toggle GUI", Enum.KeyCode.LeftControl, function()
	venyx:toggle()
end, function()
end)

local Bank = Statuses:addButton("Bank", function()end)
local Jewelry = Statuses:addButton("Jewelry Store", function()end)
local Museum = Statuses:addButton("Museum", function()end)

local Bb = workspace.Museum.Roof.Hole.RoofPart
local powerOpen = false

local Jb = workspace.PowerPlant.Piston.Piston:FindFirstChildOfClass("TouchTransmitter") ~= nil

workspace.PowerPlant.Piston.Piston.ChildAdded:Connect(
    function(mc)
        if mc.ClassName == "TouchTransmitter" then
            Mb = false
            Jb = true
            powerOpen = true
        end
    end
)
workspace.PowerPlant.Piston.Piston.ChildRemoved:Connect(
    function(mc)
        if mc.ClassName == "TouchTransmitter" then
            Mb = false
            Jb = false
            powerOpen = false
            wait(298)
            Jb = true
            powerOpen = true
        end
    end
)


--local keys, network = loadstring(game:HttpGet("https://raw.githubusercontent.com/Introvert1337/RobloxReleases/main/Scripts/Jailbreak/KeyFetcher.lua"))();

local replicated_storage = game:GetService("ReplicatedStorage");
local run_service = game:GetService("RunService");
local pathfinding_service = game:GetService("PathfindingService");
local players = game:GetService("Players");
local tween_service = game:GetService("TweenService");

local player = players.LocalPlayer;

local dependencies = {
    variables = {
        up_vector = Vector3.new(0, 500, 0),
        raycast_params = RaycastParams.new(),
        path = pathfinding_service:CreatePath({WaypointSpacing = 3}),
        player_speed = 80, 
        vehicle_speed = 250
    },
    modules = {
        ui = require(replicated_storage.Module.UI),
        store = require(replicated_storage.App.store),
        player_utils = require(replicated_storage.Game.PlayerUtils),
        vehicle_data = require(replicated_storage.Game.Garage.VehicleData)
    },
    helicopters = {Heli = true}, -- heli is included in free vehicles
    motorcycles = {Volt = true}, -- volt type is "custom" but works the same as a motorcycle
    free_vehicles = {},
    unsupported_vehicles = {},
    door_positions = {}    
};

local movement = {};
local utilities = {};

--// function to toggle if a door can be collided with

function utilities:toggle_door_collision(door, toggle)
    for index, child in next, door.Model:GetChildren() do 
        if child:IsA("BasePart") then 
            child.CanCollide = toggle;
        end; 
    end;
end;

--// function to get the nearest vehicle that can be entered

function utilities:get_nearest_vehicle(tried) -- unoptimized
    local nearest;
    local distance = math.huge;

    for index, action in next, dependencies.modules.ui.CircleAction.Specs do -- all of the interations
        if action.IsVehicle and action.ShouldAllowEntry == true and action.Enabled == true and action.Name == "Enter Driver" then -- if the interaction is to enter the driver seat of a vehicle
            local vehicle = action.ValidRoot;

            if not table.find(tried, vehicle) and workspace.VehicleSpawns:FindFirstChild(vehicle.Name) then
                if not dependencies.unsupported_vehicles[vehicle.Name] and (dependencies.modules.store._state.garageOwned.Vehicles[vehicle.Name] or dependencies.free_vehicles[vehicle.Name]) and not vehicle.Seat.Player.Value then -- check if the vehicle is supported, owned and not already occupied
                    if not workspace:Raycast(vehicle.Seat.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then
                        local magnitude = (vehicle.Seat.Position - player.Character.HumanoidRootPart.Position).Magnitude; 
            
                        if magnitude < distance then 
                            distance = magnitude;
                            nearest = vehicle;
                        end;
                    end;
                end;
            end;
        end;
    end;

    return nearest;
end;

--// function to pathfind to a position with no collision above

function movement:pathfind(tried)
    local distance = math.huge;
    local nearest;

    local tried = tried or {};
    
    for index, value in next, dependencies.door_positions do -- find the nearest position in our list of positions without collision above
        if not table.find(tried, value) then
            local magnitude = (value.position - player.Character.HumanoidRootPart.Position).Magnitude;
            
            if magnitude < distance then 
                distance = magnitude;
                nearest = value;
            end;
        end;
    end;

    table.insert(tried, nearest);

    utilities:toggle_door_collision(nearest.instance, false);

    local path = dependencies.variables.path;
    path:ComputeAsync(player.Character.HumanoidRootPart.Position, nearest.position);

    if path.Status == Enum.PathStatus.Success then -- if path making is successful
        local waypoints = path:GetWaypoints();

        for index = 1, #waypoints do 
            local waypoint = waypoints[index];
            
            player.Character.HumanoidRootPart.CFrame = CFrame.new(waypoint.Position + Vector3.new(0, 2.5, 0)); -- walking movement is less optimal

            if not workspace:Raycast(player.Character.HumanoidRootPart.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the player
                utilities:toggle_door_collision(nearest.instance, true);

                return;
            end;

            task.wait(0.05);
        end;
    end;

    utilities:toggle_door_collision(nearest.instance, true);

    movement:pathfind(tried);
end;

--// function to interpolate characters position to a position

function movement:move_to_position(part, cframe, speed, car, target_vehicle, tried_vehicles)
    local vector_position = cframe.Position;
    
    if not car and workspace:Raycast(part.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is an object above us, use pathfind function to get to a position with no collision above
        movement:pathfind();
        task.wait(0.5);
    end;
    
    local y_level = 500;
    local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z); -- 500 studs above target position

    repeat -- use velocity to move towards the target position
        local velocity_unit = (higher_position - part.Position).Unit * speed;
        part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z);

        task.wait();

        part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z);
    until (part.Position - higher_position).Magnitude < 10;

    part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z);
    part.Velocity = Vector3.new(0, 0, 0);
end;

function movement:move_to_position2(part, cframe, speed, car, target_vehicle, tried_vehicles)
    local vector_position = cframe.Position;
    
    if not car and workspace:Raycast(part.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is an object above us, use pathfind function to get to a position with no collision above
        --movement:pathfind();
        task.wait(0.5);
    end;
    
    local y_level = 500;
    local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z); -- 500 studs above target position

    repeat -- use velocity to move towards the target position
        local velocity_unit = (higher_position - part.Position).Unit * speed;
        part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z);

        task.wait();

        part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z);
    until (part.Position - higher_position).Magnitude < 10;

    part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z);
    part.Velocity = Vector3.new(0, 0, 0);
end;


function movement:sellTP(part, cframe, speed, car, target_vehicle, tried_vehicles)
    local vector_position = cframe.Position;
    
    if not car and workspace:Raycast(part.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is an object above us, use pathfind function to get to a position with no collision above
        --movement:pathfind();
        task.wait(0.5);
    end;
    
    local y_level = 25;
    local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z); -- 500 studs above target position

    repeat -- use velocity to move towards the target position
        local velocity_unit = (higher_position - part.Position).Unit * speed;
        part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z);

        task.wait();

        part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z);
    until (part.Position - higher_position).Magnitude < 10;

    part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z);
    part.Velocity = Vector3.new(0, 0, 0);
end;

--// raycast filter

dependencies.variables.raycast_params.FilterType = Enum.RaycastFilterType.Blacklist;
dependencies.variables.raycast_params.FilterDescendantsInstances = {player.Character, workspace.Vehicles, workspace:FindFirstChild("Rain")};

workspace.ChildAdded:Connect(function(child) -- if it starts raining, add rain to collision ignore list
    if child.Name == "Rain" then 
        table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, child);
    end;
end);

player.CharacterAdded:Connect(function(character) -- when the player respawns, add character back to collision ignore list
    table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, character);
end);

--// get free vehicles, owned helicopters, motorcycles and unsupported/new vehicles

for index, vehicle_data in next, dependencies.modules.vehicle_data do
    if vehicle_data.Type == "Heli" then -- helicopters
        dependencies.helicopters[vehicle_data.Make] = true;
    elseif vehicle_data.Type == "Motorcycle" then --- motorcycles
        dependencies.motorcycles[vehicle_data.Make] = true;
    end;

    if vehicle_data.Type ~= "Chassis" and vehicle_data.Type ~= "Motorcycle" and vehicle_data.Type ~= "Heli" and vehicle_data.Type ~= "DuneBuggy" and vehicle_data.Make ~= "Volt" then -- weird vehicles that are not supported
        dependencies.unsupported_vehicles[vehicle_data.Make] = true;
    end;
    
    if not vehicle_data.Price then -- free vehicles
        dependencies.free_vehicles[vehicle_data.Make] = true;
    end;
end;

for index, value in next, workspace:GetChildren() do
    if value.Name:sub(-4, -1) == "Door" then 
        local touch_part = value:FindFirstChild("Touch");

        if touch_part and touch_part:IsA("BasePart") then
            for distance = 5, 100, 5 do 
                local forward_position, backward_position = touch_part.Position + touch_part.CFrame.LookVector * (distance + 3), touch_part.Position + touch_part.CFrame.LookVector * -(distance + 3); -- distance + 3 studs forward and backward from the door
                
                if not workspace:Raycast(forward_position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the forward position from the door
                    table.insert(dependencies.door_positions, {instance = value, position = forward_position});

                    break;
                elseif not workspace:Raycast(backward_position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the backward position from the door
                    table.insert(dependencies.door_positions, {instance = value, position = backward_position});

                    break;
                end;
            end;
        end;
    end;
end;

--// no damage and ragdoll 


local old_is_point_in_tag = dependencies.modules.player_utils.isPointInTag;
dependencies.modules.player_utils.isPointInTag = function(point, tag)
    if tag == "NoRagdoll" or tag == "NoFallDamage" then 
        return true;
    end;
    
    return old_is_point_in_tag(point, tag);
end;


G_8_ = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local player = game.Players.LocalPlayer

local tweenservice = game:GetService('TweenService')



function Notif(Text,Time)
    require(game:GetService("ReplicatedStorage").Game.Notification).SetColor(Color3.fromRGB(0,0,0))
    require(game:GetService("ReplicatedStorage").Game.Notification).new({
        Text = Text,
        Duration = Time
    })
end

local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end

local function tp(cframe,tried)
    local tried = tried or {};
    local nearest_vehicle = utilities:get_nearest_vehicle(tried);
    
    if player.Character.Humanoid.Sit == false then
        movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, dependencies.variables.player_speed);
        
        local enter_attempts = 1;

        repeat -- attempt to enter car
            for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                if d.Part == nearest_vehicle.Seat then
                    d:Callback(d,true)
                end
            end
                    
            enter_attempts = enter_attempts + 1;

            task.wait(0.1);
        until enter_attempts == 10 or nearest_vehicle.Seat.PlayerName.Value == player.Name;

        if nearest_vehicle.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
            table.insert(tried, nearest_vehicle);

            return tp(cframe, tried or {nearest_vehicle});
        end;

        --[[function G_17_(a)
  --va(true)
		local tween = tweenservice:Create(nearest_vehicle.PrimaryPart, TweenInfo.new((a.Position - player.Character.PrimaryPart.Position).Magnitude / 60), {CFrame = CFrame.new(a.Position)})
       tween:Play()
       tween.Completed:Wait()
  --va(false)
end--]]

        --[[wait(1)
        network:FireServer(keys.EnterCar, nearest_vehicle, nearest_vehicle.Seat);
        wait(1)--]]
       if dependencies.helicopters[nearest_vehicle.Name] then
                    movement:move_to_position(nearest_vehicle.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    --network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[nearest_vehicle.Name] then
                    movement:move_to_position(nearest_vehicle.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    --network:FireServer(keys.ExitCar)
                elseif nearest_vehicle.Name == "DuneBuggy" then
                    movement:move_to_position(nearest_vehicle.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    --network:FireServer(keys.ExitCar)
                elseif nearest_vehicle.Name == "Chassis" then
                    movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                else
                    movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                    --G_17_(cframe)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            Ib("E")
                    --network:FireServer(keys.ExitCar)
                end
    else
        for i,v in pairs(workspace.Vehicles:GetChildren()) do 
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then 
                
                if dependencies.helicopters[v.Name] then
                    movement:move_to_position(v.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[v.Name] then
                    movement:move_to_position(v.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif v.Name == "DuneBuggy" then
                    movement:move_to_position(v.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif v.Name == "Drone" then
                    Notif("Drone unsupported","3")
                else
                    movement:move_to_position(v.PrimaryPart,  cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            Ib("E")
                    --network:FireServer(keys.ExitCar)
                end
                --v:MoveTo(Vector3.new(-289.790344, 18.853775, 1603.8446)) -- Change the cords you want to TP Too. Current: Crime Base 
            end
        end
    end
end

local function tp2(cframe,tried)
    local tried = tried or {};
    local nearest_vehicle = utilities:get_nearest_vehicle(tried);
    
    if player.Character.Humanoid.Sit == false then
        movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, dependencies.variables.player_speed);
        
        local enter_attempts = 1;

        repeat -- attempt to enter car
            for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                if d.Part == nearest_vehicle.Seat then
                    d:Callback(d,true)
                end
            end
                    
            enter_attempts = enter_attempts + 1;

            task.wait(0.1);
        until enter_attempts == 10 or nearest_vehicle.Seat.PlayerName.Value == player.Name;

        if nearest_vehicle.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
            table.insert(tried, nearest_vehicle);

            return tp(cframe, tried or {nearest_vehicle});
        end;

        function G_17_(a)
  --va(true)
		local tween = tweenservice:Create(nearest_vehicle.PrimaryPart, TweenInfo.new((a.Position - player.Character.PrimaryPart.Position).Magnitude / 60), {CFrame = CFrame.new(a.Position)})
       tween:Play()
       tween.Completed:Wait()
  --va(false)
end

        --[[wait(1)
        network:FireServer(keys.EnterCar, nearest_vehicle, nearest_vehicle.Seat);
        wait(1)--]]
       if dependencies.helicopters[nearest_vehicle.Name] then
                    movement:move_to_position(nearest_vehicle.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    --network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[nearest_vehicle.Name] then
                    movement:move_to_position(nearest_vehicle.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    --network:FireServer(keys.ExitCar)
                elseif nearest_vehicle.Name == "DuneBuggy" then
                    movement:move_to_position(nearest_vehicle.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    --network:FireServer(keys.ExitCar)
                elseif nearest_vehicle.Name == "Chassis" then
                    movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                else
                    movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                    --G_17_(cframe)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            --Ib("E")
                    --network:FireServer(keys.ExitCar)
                end
    else
        for i,v in pairs(workspace.Vehicles:GetChildren()) do 
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then 
                
                if dependencies.helicopters[v.Name] then
                    movement:move_to_position(v.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[v.Name] then
                    movement:move_to_position(v.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif v.Name == "DuneBuggy" then
                    movement:move_to_position(v.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif v.Name == "Drone" then
                    Notif("Drone unsupported","3")
                else
                    movement:move_to_position(v.PrimaryPart,  cframe, dependencies.variables.vehicle_speed);
                    task.wait(0.05);
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            --Ib("E")
                    --network:FireServer(keys.ExitCar)
                end
                --v:MoveTo(Vector3.new(-289.790344, 18.853775, 1603.8446)) -- Change the cords you want to TP Too. Current: Crime Base 
            end
        end
    end
end

local Q = {}
local S = false
local R = Vector3.new()


--P = game:GetService("Players").LocalPlayer.Character.Humanoid

local function vtp(part, ic)
	--P:SetStateEnabled("FallingDown", false)
	local jc = (ic - ic.p) + part.Position + Vector3.new(0, 4, 0)
	local kc = ic.p - part.Position
	local lc = workspace.Gravity
	--workspace.Gravity = 0
	for mc = 0, kc.Magnitude, 17.3 do
		if S then
			break
		end
		part.CFrame = jc + kc.Unit * mc
		part.Velocity, part.RotVelocity = R, R
		wait()
	end
	if not S then
		part.CFrame = ic
	end
	--workspace.Gravity = lc
end

local function tp3(cframe,tried)
    local tried = tried or {};
    local nearest_vehicle = utilities:get_nearest_vehicle(tried);
    
    if player.Character.Humanoid.Sit == false then
        movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, dependencies.variables.player_speed);
        
        local enter_attempts = 1;

        repeat -- attempt to enter car
            network:FireServer(keys.EnterCar, nearest_vehicle, nearest_vehicle.Seat);
                    
            enter_attempts = enter_attempts + 1;

            task.wait(0.1);
        until enter_attempts == 10 or nearest_vehicle.Seat.PlayerName.Value == player.Name;

        if nearest_vehicle.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
            table.insert(tried, nearest_vehicle);

            return tp(cframe, tried or {nearest_vehicle});
        end;

        function G_17_(a)
  --va(true)
		local tween = tweenservice:Create(nearest_vehicle.PrimaryPart, TweenInfo.new((a.Position - player.Character.PrimaryPart.Position).Magnitude / 60), {CFrame = CFrame.new(a.Position)})
       tween:Play()
       tween.Completed:Wait()
  --va(false)
end

        --[[wait(1)
        network:FireServer(keys.EnterCar, nearest_vehicle, nearest_vehicle.Seat);
        wait(1)--]]
       if dependencies.helicopters[nearest_vehicle.Name] then
                   -- movement:move_to_position(nearest_vehicle.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                   nearest_vehicle.Model.TopDisc.CFrame = nearest_vehicle.Model.TopDisc.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.Model.TopDisc, cframe + Vector3.new(0, 500, 0))
                    nearest_vehicle.Model.TopDisc.CFrame = nearest_vehicle.Model.TopDisc.CFrame + Vector3.new(0, -400, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[nearest_vehicle.Name] then
                    --movement:move_to_position(nearest_vehicle.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    nearest_vehicle.CameraVehicleSeat.CFrame = nearest_vehicle.CameraVehicleSeat.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.CameraVehicleSeat, cframe + Vector3.new(0, 500, 0))
                    nearest_vehicle.CameraVehicleSeat.CFrame = nearest_vehicle.CameraVehicleSeat.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    network:FireServer(keys.ExitCar)
                elseif nearest_vehicle.Name == "DuneBuggy" then
                    --movement:move_to_position(nearest_vehicle.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    nearest_vehicle.BoundingBox.CFrame = nearest_vehicle.BoundingBox.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.BoundingBox, cframe + Vector3.new(0, 500, 0))
                    nearest_vehicle.BoundingBox.CFrame = nearest_vehicle.BoundingBox.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    network:FireServer(keys.ExitCar)
                elseif nearest_vehicle.Name == "Chassis" then
                    movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                else
                    --movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                    nearest_vehicle.PrimaryPart.CFrame = nearest_vehicle.PrimaryPart.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.PrimaryPart, cframe + Vector3.new(0, 500, 0))
                    nearest_vehicle.PrimaryPart.CFrame = nearest_vehicle.PrimaryPart.CFrame + Vector3.new(0, -500, 0)
                    --G_17_(cframe)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == nearest_vehicle.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            --Ib("E")
                    network:FireServer(keys.ExitCar)
                end
    else
        for i,v in pairs(workspace.Vehicles:GetChildren()) do 
            if v:FindFirstChild("Seat") then
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then 
                
                if dependencies.helicopters[v.Name] then
                    --movement:move_to_position(v.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                    v.Model.TopDisc.CFrame = v.Model.TopDisc.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.Model.TopDisc, cframe + Vector3.new(0, 500, 0))
                    v.Model.TopDisc.CFrame = v.Model.TopDisc.CFrame + Vector3.new(0, -400, 0)
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[v.Name] then
                    --movement:move_to_position(v.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    v.CameraVehicleSeat.CFrame = v.CameraVehicleSeat.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.CameraVehicleSeat, cframe + Vector3.new(0, 500, 0))
                    v.CameraVehicleSeat.CFrame = v.CameraVehicleSeat.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif v.Name == "DuneBuggy" then
                    --movement:move_to_position(v.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    v.BoundingBox.CFrame = v.BoundingBox.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.BoundingBox, cframe + Vector3.new(0, 500, 0))
                    v.BoundingBox.CFrame = v.BoundingBox.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.05);
                    network:FireServer(keys.ExitCar)
                elseif v.Name == "Drone" then
                    Notif("Drone unsupported","3")
                else
                    --movement:move_to_position(v.PrimaryPart,  cframe, dependencies.variables.vehicle_speed);
                    v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.PrimaryPart, cframe + Vector3.new(0, 500, 0))
                    v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.05);
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            --Ib("E")
                    network:FireServer(keys.ExitCar)
                end
                --v:MoveTo(Vector3.new(-289.790344, 18.853775, 1603.8446)) -- Change the cords you want to TP Too. Current: Crime Base 
            end
        end
    end
end
end

--[[local function teleport(location, ExitCar)

for i,v in pairs(workspace.Vehicles:GetChildren()) do 
        if v:FindFirstChild('Seat') then
            if v.Seat.PlayerName.Value == "FayyAlt"  then 
                local O, P
local Q = {}
local S = false
local R = Vector3.new()

Q = v.PrimaryPart
--P = game:GetService("Players").LocalPlayer.Character.Humanoid

local function vtp(ic)
	--P:SetStateEnabled("FallingDown", false)
	local jc = (ic - ic.p) + Q.Position + Vector3.new(0, 4, 0)
	local kc = ic.p - Q.Position
	local lc = workspace.Gravity
	workspace.Gravity = 0
	for mc = 0, kc.Magnitude, 17.3 do
		if S then
			break
		end
		Q.CFrame = jc + kc.Unit * mc
		Q.Velocity, Q.RotVelocity = R, R
		wait()
	end
	if not S then
		Q.CFrame = ic
	end
	workspace.Gravity = lc
end
v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 500, 0)

vtp(location + Vector3.new(0, 500, 0))

v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, -500, 0)
if ExitCar == true then
local replicated_storage = game:GetService("ReplicatedStorage");
		
local game_folder = replicated_storage.Game;

		local team_choose_ui = require(game_folder.TeamChooseUI);
		
 local exit_car_function = getupvalue(team_choose_ui.Init, 3);
            repeat -- attempt to exit car
                task.wait(0.15);
                exit_car_function()
            until v.Seat.PlayerName.Value ~= game.Players.LocalPlayer.Name;
end
            end
        end
        
end
        
end--]]

local function TP(cframe, tried) -- unoptimized
    movement:move_to_position(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed); 
end;

local function TP2(cframe, tried) -- unoptimized
    movement:move_to_position2(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed); 
end;

local O, P
local Q = {}
local S = false
local R = Vector3.new()

Q = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
P = game:GetService("Players").LocalPlayer.Character.Humanoid

local function Ub(ic)
	P:SetStateEnabled("FallingDown", false)
	local jc = (ic - ic.p) + Q.Position + Vector3.new(0, 4, 0)
	local kc = ic.p - Q.Position
	local lc = workspace.Gravity
	workspace.Gravity = 0
	for mc = 0, kc.Magnitude, 1.3 do
		if S then
			break
		end
		Q.CFrame = jc + kc.Unit * mc
		Q.Velocity, Q.RotVelocity = R, R
		wait()
	end
	if not S then
		Q.CFrame = ic
	end
	workspace.Gravity = lc
end
local function Tb(ic)
	P:SetStateEnabled("FallingDown", false)
	local jc = (ic - ic.p) + Q.Position + Vector3.new(0, 4, 0)
	local kc = ic.p - Q.Position
	local lc = workspace.Gravity
	workspace.Gravity = 0
	for mc = 0, kc.Magnitude, 2.5 do
		if S then
			break
		end
		Q.CFrame = jc + kc.Unit * mc
		Q.Velocity, Q.RotVelocity = R, R
		wait()
	end
	if not S then
		Q.CFrame = ic
	end
	workspace.Gravity = lc
end

local function Qb(mc)
    return tonumber((tostring(mc):gsub("%D", "")))
end
local function Rb()
    local mc, nc = game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Container.Bottom.Progress.Amount.Text:match("(.-)/(.+)")
    return game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled and mc and nc and Qb(mc) >= Qb(nc)
end

G_8_ = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local player = game.Players.LocalPlayer

local tweenservice = game:GetService('TweenService')

function G_17_(a)
  --va(true)
		local tween = tweenservice:Create(player.Character.HumanoidRootPart, TweenInfo.new((a.Position - player.Character.HumanoidRootPart.Position).Magnitude / 60), {CFrame = CFrame.new(a.Position)})
       tween:Play()
       tween.Completed:Wait()
  --va(false)
end

local AutoRob = {}

--local keys, network = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/JailWare/main/Fetcher.lua"))()

local replicated_storage = game:GetService("ReplicatedStorage");
local run_service = game:GetService("RunService");
local pathfinding_service = game:GetService("PathfindingService");
local players = game:GetService("Players");
local tween_service = game:GetService("TweenService");

local player = players.LocalPlayer;

local dependencies = {
    variables = {
        up_vector = Vector3.new(0, 500, 0),
        raycast_params = RaycastParams.new(),
        path = pathfinding_service:CreatePath({WaypointSpacing = 3}),
        player_speed = 80, 
        vehicle_speed = 250
    },
    modules = {
        store = require(replicated_storage.App.store),
        player_utils = require(replicated_storage.Game.PlayerUtils),
        vehicle_data = require(replicated_storage.Game.Garage.VehicleData)
    },
    helicopters = {Heli = true}, -- heli is included in free vehicles
    motorcycles = {Volt = true}, -- volt type is "custom" but works the same as a motorcycle
    free_vehicles = {},
    unsupported_vehicles = {},
    door_positions = {}    
};

local movement = {};
local utilities = {};

--// function to toggle if a door can be collided with

function utilities:toggle_door_collision(door, toggle)
    for index, child in next, door.Model:GetChildren() do 
        if child:IsA("BasePart") then 
            child.CanCollide = toggle;
        end; 
    end;
end;

--// function to get the nearest vehicle that can be entered



--// function to pathfind to a position with no collision above

function movement:pathfind(tried)
    local distance = math.huge;
    local nearest;

    local tried = tried or {};
    
    for index, value in next, dependencies.door_positions do -- find the nearest position in our list of positions without collision above
        if not table.find(tried, value) then
            local magnitude = (value.position - player.Character.HumanoidRootPart.Position).Magnitude;
            
            if magnitude < distance then 
                distance = magnitude;
                nearest = value;
            end;
        end;
    end;

    table.insert(tried, nearest);

    utilities:toggle_door_collision(nearest.instance, false);

    local path = dependencies.variables.path;
    path:ComputeAsync(player.Character.HumanoidRootPart.Position, nearest.position);

    if path.Status == Enum.PathStatus.Success then -- if path making is successful
        local waypoints = path:GetWaypoints();

        for index = 1, #waypoints do 
            local waypoint = waypoints[index];
            
            player.Character.HumanoidRootPart.CFrame = CFrame.new(waypoint.Position + Vector3.new(0, 2.5, 0)); -- walking movement is less optimal

            if not workspace:Raycast(player.Character.HumanoidRootPart.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the player
                utilities:toggle_door_collision(nearest.instance, true);

                return;
            end;

            task.wait(0.05);
        end;
    end;

    utilities:toggle_door_collision(nearest.instance, true);

    movement:pathfind(tried);
end;

--// function to interpolate characters position to a position

function movement:move_to_position(part, cframe, speed, car, target_vehicle, tried_vehicles)
    local vector_position = cframe.Position;
    
    if not car and workspace:Raycast(part.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is an object above us, use pathfind function to get to a position with no collision above
        movement:pathfind();
        task.wait(0.5);
    end;
    
    local y_level = 500;
    local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z); -- 500 studs above target position

    repeat -- use velocity to move towards the target position
        local velocity_unit = (higher_position - part.Position).Unit * speed;
        part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z);

        task.wait();

        part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z);

        if target_vehicle and target_vehicle.Seat.Player.Value then -- if someone occupies the vehicle while we're moving to it, we need to move to the next vehicle
            table.insert(tried_vehicles, target_vehicle);

            local nearest_vehicle = utilities:get_nearest_vehicle(tried_vehicles);

            if nearest_vehicle then 
                movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, 135, false, nearest_vehicle);
            end;

            return;
        end;
    until (part.Position - higher_position).Magnitude < 10;

    part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z);
    part.Velocity = Vector3.new(0, 0, 0);
end;

function movement:move_to_position2(part, cframe, speed, car, target_vehicle, tried_vehicles)
    local vector_position = cframe.Position;
    
    if not car and workspace:Raycast(part.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is an object above us, use pathfind function to get to a position with no collision above
        --movement:pathfind();
        task.wait(0.5);
    end;
    
    local y_level = 500;
    local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z); -- 500 studs above target position

    repeat -- use velocity to move towards the target position
        local velocity_unit = (higher_position - part.Position).Unit * speed;
        part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z);

        task.wait();

        part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z);

        if target_vehicle and target_vehicle.Seat.Player.Value then -- if someone occupies the vehicle while we're moving to it, we need to move to the next vehicle
            table.insert(tried_vehicles, target_vehicle);

            local nearest_vehicle = utilities:get_nearest_vehicle(tried_vehicles);

            if nearest_vehicle then 
                movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, 135, false, nearest_vehicle);
            end;

            return;
        end;
    until (part.Position - higher_position).Magnitude < 10;

    part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z);
    part.Velocity = Vector3.new(0, 0, 0);
end;

--// raycast filter

dependencies.variables.raycast_params.FilterType = Enum.RaycastFilterType.Blacklist;
dependencies.variables.raycast_params.FilterDescendantsInstances = {player.Character, workspace.Vehicles, workspace:FindFirstChild("Rain")};

workspace.ChildAdded:Connect(function(child) -- if it starts raining, add rain to collision ignore list
    if child.Name == "Rain" then 
        table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, child);
    end;
end);

player.CharacterAdded:Connect(function(character) -- when the player respawns, add character back to collision ignore list
    table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, character);
end);

--// get free vehicles, owned helicopters, motorcycles and unsupported/new vehicles

for index, vehicle_data in next, dependencies.modules.vehicle_data do
    if vehicle_data.Type == "Heli" then -- helicopters
        dependencies.helicopters[vehicle_data.Make] = true;
    elseif vehicle_data.Type == "Motorcycle" then --- motorcycles
        dependencies.motorcycles[vehicle_data.Make] = true;
    end;

    if vehicle_data.Type ~= "Chassis" and vehicle_data.Type ~= "Motorcycle" and vehicle_data.Type ~= "Heli" and vehicle_data.Type ~= "DuneBuggy" and vehicle_data.Make ~= "Volt" and vehicle_data.Make ~= "Wraith" then -- weird vehicles that are not supported
        dependencies.unsupported_vehicles[vehicle_data.Make] = true;
    end;
    
    if not vehicle_data.Price then -- free vehicles
        dependencies.free_vehicles[vehicle_data.Make] = true;
    end;
end;

--// get all positions near a door which have no collision above them

for index, value in next, workspace:GetChildren() do
    if value.Name:sub(-4, -1) == "Door" then 
        local touch_part = value:FindFirstChild("Touch");

        if touch_part and touch_part:IsA("BasePart") then
            for distance = 5, 100, 5 do 
                local forward_position, backward_position = touch_part.Position + touch_part.CFrame.LookVector * (distance + 3), touch_part.Position + touch_part.CFrame.LookVector * -(distance + 3); -- distance + 3 studs forward and backward from the door
                
                if not workspace:Raycast(forward_position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the forward position from the door
                    table.insert(dependencies.door_positions, {instance = value, position = forward_position});

                    break;
                elseif not workspace:Raycast(backward_position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the backward position from the door
                    table.insert(dependencies.door_positions, {instance = value, position = backward_position});

                    break;
                end;
            end;
        end;
    end;
end;

--// no damage and ragdoll 



local old_is_point_in_tag = dependencies.modules.player_utils.isPointInTag;
dependencies.modules.player_utils.isPointInTag = function(point, tag)
    if tag == "NoRagdoll" or tag == "NoFallDamage" then 
        return true;
    end;
    
    return old_is_point_in_tag(point, tag);
end;

function AutoRob.MakeNotification(txt, time)
    local p = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/JailWare/main/Notify.lua"))()
	p:MakeNotification({Name = "JailWare", Content = txt, Time = time})
end

function AutoRob.GetCasinoCode()
    local code = ""
    for i,v in pairs(game:GetService("Workspace").Casino.RobberyDoor.Codes:GetChildren()) do
        if v:FindFirstChildOfClass("Part") then
            for i2,v2 in pairs(v:GetChildren()) do
                if v2.SurfaceGui.TextLabel.Text ~= nil and v2.SurfaceGui.TextLabel.Text ~= "" then
                    code = code .. v2.SurfaceGui.TextLabel.Text
                end
            end
        end
    end
    return code
end

function AutoRob.Teleport(cframe)
    movement:move_to_position(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed); 
end

function AutoRob.Teleport2(cframe)
    movement:move_to_position2(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed); 
end

--[[
    Documentation:
    teleport(cframe)
    slide( cframe, speed (optional) )
    * Both can be called from getgenv as well
]]
for _,_garbage in pairs((getgc(true) or debug.getupvalues() or getupvalues() or debug.getregistry())) do
    if (type or typeof)(_garbage) == "table" then
        if rawget(_garbage, "Ragdoll") then
            _garbage = function(...) return end
        end
    end
end

getgenv().slide = function(cframe,...)
    local player = game:GetService("Players").LocalPlayer
    local root = player.Character.HumanoidRootPart
    local options = {...}
    local move = Instance.new("BodyVelocity", root)
    cframe = cframe + Vector3.new(0,1,0)
    
    for i = 0,(cframe.p - root.Position).magnitude, 1 do
        root.Parent.Humanoid.Sit = false

        move.MaxForce = Vector3.new(9e9,9e9,9e9)
        move.P = 3000
        move.Velocity = (cframe.p - root.Position).unit * 110
        
        for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            pcall(function()
                v.CanCollide = false
            end)
        end
        
        if (cframe.p - root.Position).magnitude < 3 or game:GetService("Players").LocalPlayer.Character.Humanoid.Health < 3 then
            move:Destroy()
            for i2 = 1, 10 do
                root.CFrame = cframe 
                wait()
            end
            break
        end
        
        game:GetService("RunService").Stepped:wait()
    end
    
    if options[1] ~= nil then
        root.Parent.Humanoid:SetStateEnabled(10, true)
    end

    if options[2] ~= nil then
        wait((options[2] or tonumber(options[2])))
    end
end

local function slidevehicle(vehicle, cframe, ExitCar)
    local worked, failed = pcall(function()
        if vehicle ~= nil then
            vehicle:SetPrimaryPartCFrame(vehicle.PrimaryPart.CFrame + Vector3.new(0,400,0))
            --To prevent bad
            local force = Instance.new("BodyVelocity", vehicle.Engine) force.Name = "Daddy" force.Velocity = Vector3.new(0,0,0) force.MaxForce = Vector3.new(9e9,9e9,9e9) force.P = 1000
            local origin = cframe
            
            wait(0.3)
            cframe = cframe + Vector3.new(0, vehicle.PrimaryPart.Position.y, 0)
            local root, mag = vehicle.PrimaryPart or vehicle.Model.TopDisc or vehicle.CameraVehicleSeat, 14
            local distance, distancel = cframe.p - root.Position, (cframe - cframe.p) + root.Position
            for i = 0, distance.magnitude, mag do
                local nextpos = distancel + distance.Unit * i
                vehicle:SetPrimaryPartCFrame(nextpos)
                root.Velocity,root.RotVelocity = Vector3.new(),Vector3.new()
                local currentpos = vehicle.PrimaryPart.Position - Vector3.new(0, vehicle.PrimaryPart.Position.y, 0)
                wait()
                local magafter = ((vehicle.PrimaryPart.Position - Vector3.new(0,vehicle.PrimaryPart.Position.y, 0)) - currentpos).magnitude
                if magafter > 500 then
                    wait(5)
                    teleport(cframe)
                    return
                end
            end
            for i = 1, 4 do
                vehicle:SetPrimaryPartCFrame(origin)
            end
            wait(1)
            root.Velocity,root.RotVelocity = Vector3.new(),Vector3.new()
            force:Destroy()
            
            game:GetService("ContextActionService"):UnbindAction("DisableInput")
            if ExitCar then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
            
            wait()
            
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
            end
            wait(1)
            if (origin.p - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 500 then
                wait(2)
                teleport(origin)
                return
            end
            wait(0.3)
            return true
        end
    end)
    if not worked then
        game:GetService("ContextActionService"):UnbindAction("DisableInput")
        return false    
    end
end

vehicle_data1 = require(replicated_storage.Game.Garage.VehicleData)
free_vehicles = {}
helicopters = {}
motorcycles = {}
unsupported_vehicles = {}

for index, vehicle_data in next, vehicle_data1 do
	if vehicle_data.Type == "Heli" then -- helicopters
        helicopters[vehicle_data.Make] = true;
    elseif vehicle_data.Type == "Motorcycle" then --- motorcycles
        motorcycles[vehicle_data.Make] = true;
    end;

    if vehicle_data.Type ~= "Chassis" and vehicle_data.Season and vehicle_data.Level and vehicle_data.Type ~= "Motorcycle" and vehicle_data.Type ~= "Heli" and vehicle_data.Type ~= "DuneBuggy" and vehicle_data.Make ~= "Volt" then -- weird vehicles that are not supported
        unsupported_vehicles[vehicle_data.Make] = true;
    end;

    if not vehicle_data.Price then -- free vehicles
        free_vehicles[vehicle_data.Make] = true;
    end;
end;

getgenv().teleport = function(cframe, ExitCar2, teleportornot)
    local debug1, debug2 = pcall(function()
        if (cframe.p - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 200 then
            local vehicles = game:GetService("Workspace").Vehicles:GetChildren()
            table.sort(vehicles, 
                function(v, v2) 
                    local v3 = v.PrimaryPart or v:FindFirstChildWhichIsA("Part")
                    local v4 = v2.PrimaryPart or v2:FindFirstChildWhichIsA("Part")

                    if v3 ~= nil and v4 ~= nil  then
                        return (v3.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 
                        (v4.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude 
                    end
                end)
            for _,v in pairs(vehicles) do
                if v.PrimaryPart ~= nil and v.Seat:FindFirstChild("Player") and v.Seat.Player.Value == true and tostring(v.Seat.PlayerName.Value) == game:GetService("Players").LocalPlayer.Name then
         			if not free_vehicles[v.Name] then
                        if not teleportornot then
                            slidevehicle(v, cframe, ExitCar2)
                        end
                        return
                    else
                        return
                    end
                end
            end

           

            for _,v in pairs(vehicles) do
                if v.PrimaryPart ~= nil and v.Seat.Player.Value == false and v:FindFirstChild("Camera") then
                   if not free_vehicles[v.Name] then
                    --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame -= Vector3.new(0,150,0)
                    AutoRob.Teleport(CFrame.new(Vector3.new(v.Camera.Position.x,-150,v.Camera.Position.z)),4)
                   -- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(0,v.Camera.CFrame.y + 150,0)
                    for i = 1, 200 do
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Camera.CFrame.p - Vector3.new(4,1,0))

                        for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                            if d.Part == v.Seat then
                                d:Callback(d, true)    
                            end
                        end

                        game:GetService("RunService").RenderStepped:wait()
                        
                        if tostring(v.Seat.PlayerName.Value) == game:GetService("Players").LocalPlayer.Name then
                            wait()
                            break
                        end
                    end
                    --wait(0.3)
                    if tostring(v.Seat.PlayerName.Value) == game:GetService("Players").LocalPlayer.Name then
                        if not teleportornot then
                            game:GetService("ContextActionService"):BindAction("DisableInput", 
                            function() return Enum.ContextActionResult.Sink end,
                            false,
                            unpack(Enum.PlayerActions:GetEnumItems()))
                            slidevehicle(v, cframe, ExitCar2)
                        end
                        break
                    end
                    wait(2)
                end
            end
            end
        else
            pcall(function()
                AutoRob.Teleport(cframe)
            end)
        end
    end)
    if not debug1 then print(debug2) end
end

spawn(function()
	while wait(2) do
		if game:GetService("Workspace").Banks:GetChildren()[1].Extra.Sign.Decal.Transparency == 0 then
			_G.BankRobbed = nil
		end
		if game:GetService("Workspace").Jewelrys:GetChildren()[1].Extras.Sign.Decal.Transparency == 0 then
			_G.JewRobbed = nil
		end
		for i,v in pairs(game:GetService("Workspace").Museum.Roof.Hole:GetChildren()) do
			if v.Name == "RoofPart" then
				if v.CanCollide == false then
				    _G.MusRobbed = nil
                end
			end
		end
		if not game:GetService("Workspace").Trains:GetChildren()[1] then
			_G.TrainRobbed = nil
		end
        if not game:GetService("Workspace"):FindFirstChild("Plane") then
            _G.PlaneRobbed = nil
        end
	end
end)

local vb


function vb()

for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
    if v:FindFirstChild("Seat") then
        if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then
           return v
            end
        end
    end
end


function wt()
		
if workspace:FindFirstChild("PlatformPart") then
		    workspace.PlatformPart:Destroy()
		  end
		
local Part = Instance.new("Part")
		  Part.Size = Vector3.new(160, 5, 160)
		  Part.CanCollide = true
		  Part.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 900, 0)
		  Part.Anchored = true
		  Part.Transparency = 0
		  Part.Name = "PlatformPart"
		  Part.Parent = workspace
		  
		  
if vb() then
		  
		vb():SetPrimaryPartCFrame(workspace.PlatformPart.CFrame)
		  
else
		 game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(workspace.PlatformPart.CFrame)
		 
end
 
end

local function enterVehicle()
    local vehicles = game:GetService("Workspace").Vehicles:GetChildren()
            table.sort(vehicles, 
                function(v, v2) 
                    local v3 = v.PrimaryPart or v:FindFirstChildWhichIsA("Part")
                    local v4 = v2.PrimaryPart or v2:FindFirstChildWhichIsA("Part")

                    if v3 ~= nil and v4 ~= nil  then
                        return (v3.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 
                        (v4.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude 
                    end
                end)

                for _,v in pairs(vehicles) do
                    if v.Name == "Heli" and v.PrimaryPart ~= nil and v.Seat.Player.Value == false and v:FindFirstChild("Camera") then
                       if not free_vehicles[v.Name] then
                        --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame -= Vector3.new(0,150,0)
                        AutoRob.Teleport2(CFrame.new(Vector3.new(v.Camera.Position.x,-150,v.Camera.Position.z)),4)
                       -- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(0,v.Camera.CFrame.y + 150,0)
                        for i = 1, 200 do
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Camera.CFrame.p - Vector3.new(4,1,0))
    
                            for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                                if d.Part == v.Seat then
                                    d:Callback(d, true)    
                                end
                            end
    
                            game:GetService("RunService").RenderStepped:wait()
                            
                            if tostring(v.Seat.PlayerName.Value) == game:GetService("Players").LocalPlayer.Name then
                                wait()
                                break
                            end
                        end
                    end
                end
                end
end

_G.AutoRobbing = nil
_G.BankRobbed = nil
_G.JewRobbed = nil
_G.MusRobbed = nil
_G.TrainRobbed = nil
_G.PowerRobbed = nil
_G.CasinoRobbed = nil
_G.PlaneRobbed = nil

function ec(tried)
    _G.AutoRobbing = true
    local replicated_storage = game:GetService("ReplicatedStorage");
    local game_folder = replicated_storage.Game;
    local default_actions = require(game_folder.DefaultActions);
    local punch_function = getupvalue(default_actions.punchButton.onPressed, 1).attemptPunch;

    --nearest_vehicle = utilities:get_nearest_vehicle(tried)
        --Jewelry
            --movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat, dependencies.variables.player_speed); 
        Main:updateButton(Status, "Jewelry | Teleporting to Jewelry Store...")
        getgenv().teleport(CFrame.new(136.667511, 18.5636292, 1352.01721), true)    
        --teleport(CFrame.new(138.730011, 18.3618584, 1374.12854))
        if game.workspace.Jewelrys:GetChildren()[1].Extras.Sign.Decal.Transparency > 0.01 then
        wait(1)
        Main:updateButton(Status, "Jewelry | Punching Cases")
        Ub(CFrame.new(134.001053, 19.6054764, 1322.71179, 0.0529524311, -1.74539583e-08, -0.998597026, 1.38760923e-08, 1, -1.67426748e-08, 0.998597026, -1.29700597e-08, 0.0529524311))
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(0.5)
        Ub(CFrame.new(131.661118, 19.6054764, 1312.83337, 0.173634604, 1.00183343e-07, -0.984810174, -5.9173999e-08, 1, 9.12954548e-08, 0.984810174, 4.24231068e-08, 0.173634604))
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(0.5)
        Ub(CFrame.new(130.287048, 19.6054764, 1301.97058, 0.173667863, -1.03825712e-07, -0.984804273, 6.14670199e-08, 1, -9.45882093e-08, 0.984804273, -4.41060486e-08, 0.173667863))
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(0.5)
        Ub(CFrame.new(129.939896, 18.6074409, 1293.01331, 0.395014912, 1.63491425e-08, -0.918674707, -8.12335159e-08, 1, -1.71326224e-08, 0.918674707, 8.13948162e-08, 0.395014912) + Vector3.new(0, 5, 0))
        wait(0.1)
        Ub(CFrame.new(151.807739, 21.1271744, 1292.10046, -0.792563975, 5.71237777e-08, -0.609788775, 2.86148816e-09, 1, 8.99588031e-08, 0.609788775, 6.95532023e-08, -0.792563975))
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(0.5)
        Ub(CFrame.new(151.807739, 21.1271744, 1292.10046, -0.792563975, 5.71237777e-08, -0.609788775, 2.86148816e-09, 1, 8.99588031e-08, 0.609788775, 6.95532023e-08, -0.792563975) +  Vector3.new(0,0,15))
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(1)
        punch_function()
        wait(0.5)
        Tb(CFrame.new(146.66069, 18.6074409, 1335.55603, -0.960322261, 2.41625333e-08, 0.278892756, 1.8517607e-08, 1, -2.28749659e-08, -0.278892756, -1.68029128e-08, -0.960322261))
        Tb(CFrame.new(106.504173, 18.6074409, 1341.88818, 0.983638704, 5.55496307e-08, 0.180152282, -5.22779438e-08, 1, -2.29085089e-08, -0.180152282, 1.31157059e-08, 0.983638704))
        Tb(CFrame.new(96.8006287, 36.6074371, 1283.66504, 0.982113898, 1.08999259e-07, 0.188287839, -1.10382864e-07, 1, -3.13731663e-09, -0.188287839, -1.77025488e-08, 0.982113898))
        Tb(CFrame.new(109.831238, 36.6074371, 1283.20837, 0.130986333, -1.74261383e-09, -0.991384149, -8.24567721e-08, 1, -1.26523343e-08, 0.991384149, 8.340362e-08, 0.130986333))
        Tb(CFrame.new(121.017097, 36.6074371, 1341.13611, 0.243956864, -5.78607064e-08, 0.969786108, -2.68181086e-08, 1, 6.64096618e-08, -0.969786108, -4.22089208e-08, 0.243956864))
        Tb(CFrame.new(107.055168, 36.6074371, 1343.80347, -0.140861824, -3.05204715e-08, 0.990029275, 2.94166558e-08, 1, 3.50132652e-08, -0.990029275, 3.40553825e-08, -0.140861824))
        Tb(CFrame.new(97.3674469, 54.6274376, 1286.39453, 0.906781495, -1.54581681e-08, 0.421600848, 9.39917744e-09, 1, 1.64496061e-08, -0.421600848, -1.09534968e-08, 0.906781495))
        Nb = game.workspace.Jewelrys:GetChildren()[1].Floors:GetChildren()[1]
        print("Escaping...")
        if Nb.Name == "2_StorageAndMeeting" then
            Main:updateButton(Status, "Jewelry | Selling")
            if Nb:FindFirstChild("Cameras") then
                Nb.Cameras:Destroy()
            end
            Ub(CFrame.new(120.840858, 54.7037621, 1286.46875) + Vector3.new(0, 5, 0))
            wait(1)
            Ub(CFrame.new(137.826569, 54.7037582, 1290.17102) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(139.727844, 54.7037582, 1302.3844) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(119.240585, 54.7037697, 1307.03503) + Vector3.new(0, 5, 0))
            wait(1.5)
            Ub(CFrame.new(111.498169, 54.7037659, 1308.68323) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(115.960121, 54.7037582, 1330.4126))
            Ub(CFrame.new(139.253326, 54.7037659, 1337.03137) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(164.055817, 61.1052017, 1332.69751) + Vector3.new(0, 5, 0))
            wait(2.5)
            Ub(CFrame.new(151.412704, 78.7537766, 1272.39331) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(132.691147, 78.7337494, 1289.06921) + Vector3.new(0, 5, 0))
            wait(1.5)
            Ub(CFrame.new(114.317047, 78.703743, 1281.43701))
            Ub(CFrame.new(97.8215027, 78.7337494, 1286.46631))
            Ub(CFrame.new(105.94696, 78.7037506, 1342.51001))
            Ub(CFrame.new(164.431213, 85.1051788, 1334.01599))
            wait(2.5)
            Tb(CFrame.new(153.144241, 102.703735, 1272.25732))
            Tb(CFrame.new(135.489014, 102.703743, 1277.57556))
            Tb(CFrame.new(136.827911, 102.703758, 1337.99451))
            Tb(CFrame.new(124.482269, 102.703743, 1339.41162))
            Tb(CFrame.new(113.767227, 118.753807, 1279.51355))
            Tb(CFrame.new(123.776573, 118.753815, 1279.35168))
            Tb(CFrame.new(131.090881, 118.703758, 1333.89832) + Vector3.new(0, -3.5, 0))
        elseif Nb.Name == "5_TheCEO" then
            Main:updateButton(Status, "Jewelry | Selling")
            if Nb:FindFirstChild("Lasers") then
                Nb.Lasers:Destroy()
            end
            Ub(CFrame.new(105.689491, 54.8037491, 1283.91492) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(132.397461, 54.8859596, 1304.04626) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(137.798431, 54.7037582, 1337.46094) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(163.357788, 61.1051979, 1332.19531) + Vector3.new(0, 5, 0))
            wait(2.5)
            Ub(CFrame.new(153.953995, 78.7037582, 1272.37842))
            Ub(CFrame.new(135.091019, 78.703743, 1289.62012))
            Ub(CFrame.new(101.894333, 78.703743, 1296.4292))
            Ub(CFrame.new(103.492928, 78.703743, 1307.36694))
            wait(1.5)
            Ub(CFrame.new(122.899849, 78.7772675, 1306.54114))
            Ub(CFrame.new(132.417557, 78.703743, 1337.47412))
            Ub(CFrame.new(163.594574, 85.1051941, 1332.98071))
            wait(2.5)
            Tb(CFrame.new(153.144241, 102.703735, 1272.25732))
            Tb(CFrame.new(135.489014, 102.703743, 1277.57556))
            Tb(CFrame.new(136.827911, 102.703758, 1337.99451))
            Tb(CFrame.new(124.482269, 102.703743, 1339.41162))
            Tb(CFrame.new(113.767227, 118.753807, 1279.51355))
            Tb(CFrame.new(123.776573, 118.753815, 1279.35168))
            Tb(CFrame.new(131.090881, 118.703758, 1333.89832) + Vector3.new(0, -3.5, 0))
        elseif Nb.Name == "6_LaserRooms" then
            Main:updateButton(Status, "Jewelry | Selling")
            if Nb:FindFirstChild("Cameras") then
                Nb.Cameras:Destroy()
            end
            Ub(CFrame.new(107.151382, 54.8037643, 1282.13306))
            Ub(CFrame.new(113.188622, 54.8037643, 1307.93799))
            Ub(CFrame.new(121.366989, 54.8037682, 1306.4873))
            Ub(CFrame.new(132.016251, 54.8037643, 1319.08569))
            Ub(CFrame.new(134.397217, 54.8037643, 1337.37402))
            Ub(CFrame.new(163.821136, 61.1051979, 1333.65759))
            wait(2.5)
            Ub(CFrame.new(154.325943, 78.7037506, 1274.31946))
            Ub(CFrame.new(124.592957, 78.7037659, 1278.81519))
            Ub(CFrame.new(125.817886, 78.7537384, 1288.64807))
            wait(1.5)
            Tb(CFrame.new(129.154999, 78.7537384, 1306.74451))
            wait(1.5)
            Tb(CFrame.new(131.734543, 78.7537537, 1322.48108))
            wait(1.5)
            Tb(CFrame.new(133.403366, 78.7537384, 1337.28723))
            Tb(CFrame.new(162.129395, 85.1051788, 1332.72913))
            print("Healing...")
            wait(5.5)
            Tb(CFrame.new(153.144241, 102.703735, 1272.25732))
            Tb(CFrame.new(135.489014, 102.703743, 1277.57556))
            Tb(CFrame.new(136.827911, 102.703758, 1337.99451))
            Tb(CFrame.new(124.482269, 102.703743, 1339.41162))
            Tb(CFrame.new(113.767227, 118.753807, 1279.51355))
            Tb(CFrame.new(123.776573, 118.753815, 1279.35168))
            Tb(CFrame.new(131.090881, 118.703758, 1333.89832))
        elseif Nb.Name == "4_CameraFloors" then
            Main:updateButton(Status, "Jewelry | Selling")
            if Nb:FindFirstChild("Cameras") then
                Nb.Cameras:Destroy()
            end
            Ub(CFrame.new(140.996811, 54.8037643, 1277.68311))
            Tb(CFrame.new(142.23439, 54.8037643, 1287.79126))
            Tb(CFrame.new(112.720749, 54.8037643, 1293.50769))
            Tb(CFrame.new(115.756256, 54.8037643, 1308.02795))
            Tb(CFrame.new(145.320511, 54.8037643, 1303.52893))
            Tb(CFrame.new(148.320023, 54.803772, 1318.10107))
            Tb(CFrame.new(115.337837, 54.8037643, 1323.95642))
            Tb(CFrame.new(119.602303, 54.8037682, 1339.82983))
            Ub(CFrame.new(162.235321, 61.1051941, 1332.73425))
            wait(3.5)
            Tb(CFrame.new(153.491547, 78.703743, 1273.2915))
            Tb(CFrame.new(144.313995, 78.7037506, 1275.79126))
            Tb(CFrame.new(148.108292, 78.703743, 1309.19568))
            Tb(CFrame.new(134.493301, 78.7037506, 1336.34705))
            Ub(CFrame.new(163.928467, 85.1051788, 1333.31384))
            wait(3.5)
            Tb(CFrame.new(153.144241, 102.703735, 1272.25732))
            Tb(CFrame.new(135.489014, 102.703743, 1277.57556))
            Tb(CFrame.new(136.827911, 102.703758, 1337.99451))
            Tb(CFrame.new(124.482269, 102.703743, 1339.41162))
            Tb(CFrame.new(113.767227, 118.753807, 1279.51355))
            Tb(CFrame.new(123.776573, 118.753815, 1279.35168))
            Tb(CFrame.new(131.090881, 118.703758, 1333.89832))
        elseif Nb.Name == "1_Classic" then
            Main:updateButton(Status, "Jewelry | Selling")
            Tb(CFrame.new(96.3076172, 54.8037758, 1283.98022))
            Tb(CFrame.new(136.646027, 54.7037697, 1337.32922) + Vector3.new(0, 10, 0))
            Ub(CFrame.new(163.409103, 61.1051979, 1333.87732))
            wait(3.5)
            Tb(CFrame.new(153.427948, 78.7037354, 1274.4762))
            Tb(CFrame.new(123.022408, 78.7037582, 1279.53979))
            Tb(CFrame.new(134.129974, 78.8037567, 1338.2168))
            Ub(CFrame.new(163.753738, 85.1051788, 1334.22095))
            wait(3.5)
            Tb(CFrame.new(153.144241, 102.703735, 1272.25732))
            Tb(CFrame.new(135.489014, 102.703743, 1277.57556))
            Tb(CFrame.new(136.827911, 102.703758, 1337.99451))
            Tb(CFrame.new(124.482269, 102.703743, 1339.41162))
            Tb(CFrame.new(113.767227, 118.753807, 1279.51355))
            Tb(CFrame.new(123.776573, 118.753815, 1279.35168))
            Tb(CFrame.new(131.090881, 118.703758, 1333.89832))
        elseif Nb.Name == "3_ExpandedStore" then
            Main:updateButton(Status, "Jewelry | Selling")
            Nb.Lasers:Destroy()
            Ub(CFrame.new(100.361702, 54.7537575, 1287.08691))
            Ub(CFrame.new(137.830124, 54.7537613, 1337.21375))
            Ub(CFrame.new(163.773331, 61.1052055, 1331.19421))
            wait(3.5)
            Ub(CFrame.new(153.206619, 78.703743, 1273.98682))
            Ub(CFrame.new(105.951363, 78.703743, 1285.37109) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(109.765045, 83.0215149, 1307.92883) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(109.765045, 83.0215149, 1307.92883) + Vector3.new(0, 10, 0))
            Ub(CFrame.new(117.632118, 78.7037506, 1339.44678) + Vector3.new(0, 10, 0))
            Ub(CFrame.new(162.188187, 85.1051788, 1333.39917))
            wait(3.5)
            Tb(CFrame.new(153.144241, 102.703735, 1272.25732))
            Tb(CFrame.new(135.489014, 102.703743, 1277.57556))
            Tb(CFrame.new(136.827911, 102.703758, 1337.99451))
            Tb(CFrame.new(124.482269, 102.703743, 1339.41162))
            Tb(CFrame.new(113.767227, 118.753807, 1279.51355))
            Tb(CFrame.new(123.776573, 118.753815, 1279.35168))
            Tb(CFrame.new(131.090881, 118.703758, 1333.89832))
        end
        wait(3.5)
        AutoRob.Teleport2(CFrame.new(-289.410736, 18.3619843, 1604.50146))
        Main:updateButton(Status, "Jewelry | Success!")
        _G.JewRobbed = true
		_G.AutoRobbing = false
        --wait(0.5)
        --enterVehicle()
        --wt()
    else
        return
    end
end

local function InstantTp(cframe)
    SpawnCar()
    wait(0.5)
    for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
    if v:FindFirstChild("Seat") then
        if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then
            repeat
                v.PrimaryPart.CFrame = cframe
                wait(0.5)
                until v.PrimaryPart.CFrame == cframe
            end
        end
    end
end



function ab()
    _G.AutoRobbing = true
        --print("Bank | Teleporting to bank...")
        Main:updateButton(Status, "Teleporting to bank...")
        --nearest_vehicle = utilities:get_nearest_vehicle(tried)
        --movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat, dependencies.variables.player_speed); 
        getgenv().teleport(CFrame.new(-7.85457563, 18.3619556, 867.587524), true)
        wait(3.5)
        --print("Bank | Waiting.. (3)")
        --Main:updateButton(Status, "Bank | Waiting.. (3)")
        --wait(1)
        --print("Bank | Waiting.. (2)")
        --Main:updateButton(Status, "Bank | Waiting.. (2)")
        --wait(1)
        --print("Bank | Waiting.. (1)")
        --Main:updateButton(Status, "Bank | Waiting.. (1)")
        --wait(3.5)
        Tb(CFrame.new(31.658287, 18.7341194, 860.295288))
        wait(0.1)
        Tb(CFrame.new(40.2629967, 18.7341385, 924.680481))
        wait(1)
        print("Bank | Teleporting to vault..")
        Main:updateButton(Status, "Teleporting to vault..")
        --[[for i,v in pairs(game:GetService("Workspace").Banks:GetChildren()[1].Layout) Do
            if v.Name == "01UpperManagement" then
                print("01UpperManagement")
            end
        end--]]
        Nb = game.workspace.Banks:GetChildren()[1].Layout:GetChildren()[1]
        if Nb.Name == "01UpperManagement" then
            if W.enabled == false then return end
            Ub(CFrame.new(86.6891632, 27.7893982, 919.55304))
            wait(1)
            Tb(CFrame.new(85.0449219, 30.3203545, 901.631714))
            Tb(CFrame.new(75.7619019, 37.149868, 889.624817))
            Tb(CFrame.new(78.9199753, 44.9200134, 873.116943))
            Tb(CFrame.new(70.3065491, 51.392189, 861.531677))
            Tb(CFrame.new(74.8635941, 56.245945, 850.862122))
            wait(1.5)
            Tb(CFrame.new(70.0843048, 60.2341843, 832.451355))
            Tb(CFrame.new(27.1561337, 60.2341919, 841.806702))
            wait(1.5)
            Tb(CFrame.new(32.7206306, 60.2341843, 862.579102) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(53.7243156, 60.2341843, 863.99054) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(57.5389671, 60.2341843, 886.989746) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(37.8139915, 60.2341881, 895.217529) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(44.8027611, 60.2341843, 925.830383) + Vector3.new(0, 5, 0))
            Tb(Nb.Money.CFrame)
            Main:updateButton(Status, "Opening Vault")
            wait(10)
            --print("Bank | Robbing..")
            --wait(35)
            Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                    local Police = game.Teams.Police:GetPlayers()
                
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                    --[[if (Police.PrimaryPart.CFrame - Nb.Door.Hinge).Magnitude > 100 then
                        Tb(CFrame.new(44.8027611, 60.2341843, 925.830383) + Vector3.new(0, 5, 0))
                        Tb(CFrame.new(37.8139915, 60.2341881, 895.217529) + Vector3.new(0, 5, 0))
                        Tb(CFrame.new(57.5389671, 60.2341843, 886.989746) + Vector3.new(0, 5, 0))
                        Tb(CFrame.new(53.7243156, 60.2341843, 863.99054) + Vector3.new(0, 5, 0))
                        Tb(CFrame.new(32.7206306, 60.2341843, 862.579102) + Vector3.new(0, 5, 0))
                    end--]]
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Tb(CFrame.new(44.8027611, 60.2341843, 925.830383) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(37.8139915, 60.2341881, 895.217529) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(57.5389671, 60.2341843, 886.989746) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(53.7243156, 60.2341843, 863.99054) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(32.7206306, 60.2341843, 862.579102) + Vector3.new(0, 5, 0))
            wait(1.5)
            Tb(CFrame.new(27.1561337, 60.2341919, 841.806702))
            Tb(CFrame.new(70.0843048, 60.2341843, 832.451355))
            Tb(CFrame.new(74.8635941, 56.245945, 850.862122))
            wait(1.5)
            Tb(CFrame.new(70.3065491, 51.392189, 861.531677) + Vector3.new(0, -3, 0))
            Tb(CFrame.new(78.9199753, 44.9200134, 873.116943) + Vector3.new(0, -3, 0))
            Tb(CFrame.new(75.7619019, 37.149868, 889.624817) + Vector3.new(0, -3, 0))
            Tb(CFrame.new(85.0449219, 30.3203545, 901.631714) + Vector3.new(0, -3, 0))
            Tb(CFrame.new(86.6891632, 27.7893982, 919.55304) + Vector3.new(0, -3, 0))
            wait(1)
            Tb(CFrame.new(40.2629967, 18.7341385, 924.680481) + Vector3.new(0, -3, 0))
            wait(0.1)
            Tb(CFrame.new(31.658287, 18.7341194, 860.295288) + Vector3.new(0, -3, 0))
            Tb(CFrame.new(-7.85457563, 18.3619556, 867.587524) + Vector3.new(0, -3, 0))
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            print("Bank | Completed")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "02Basement" then
            if W.enabled == false then return end
            Ub(CFrame.new(85.2395935, 9.23804855, 917.137939))
            wait(0.1)
            Ub(CFrame.new(93.143898, -0.66197598, 965.668213))
            wait(1)
            print("Bank | Bypassing")
            Ub(CFrame.new(40.6725388, -8.71194172, 946.312439))
            print("Bank | Opening Vault")
            if not game:GetService("Workspace").Banks:GetChildren()[1].Layout:GetChildren()[1].EscapeRoutes.BankDoor.Door.Model.BankDoor.CFrame == CFrame.new(92.7108383, -8.08316135, 927.305481, -0.984812617, 0, -0.173621148, 0, 1, 0, 0.173621148, 0, -0.984812617) then
                Ub(CFrame.new(46.1923447, -8.66194153, 951.135315))
            else
                repeat wait() until game:GetService("Workspace").Banks:GetChildren()[1].Layout:GetChildren()[1].EscapeRoutes.BankDoor.Door.Model.BankDoor.CFrame == CFrame.new(92.7108383, -8.08316135, 927.305481, -0.984812617, 0, -0.173621148, 0, 1, 0, 0.173621148, 0, -0.984812617)
            end
            wait(25)
            Ub(CFrame.new(46.1923447, -8.66194153, 951.135315))
            Ub(Nb.Money.CFrame)
            --wait(35)
                --print("Bank | Robbing...")
                Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Ub(CFrame.new(46.1923447, -8.66194153, 951.135315)) 
            Ub(CFrame.new(40.6725388, -8.71194172, 946.312439))
            print("Bank | Bypassing")
            wait(5)
            Ub(CFrame.new(93.143898, -0.66197598, 965.668213))
            wait(0.1)
            Ub(CFrame.new(85.2395935, 9.23804855, 917.137939) + Vector3.new(0, -3, 0))
            Ub(CFrame.new(40.2629967, 18.7341385, 924.680481)) 
            wait(0.1)
            Ub(CFrame.new(31.658287, 18.7341194, 860.295288))
            Ub(CFrame.new(-7.85457563, 18.3619556, 867.587524))
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            --print("Bank | Completed..")
            Main:updateButton(Status, "Bank | Success!")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "03Corridor" then
            if W.enabled == false then return end
            Ub(CFrame.new(56.2616272, 18.0231895, 923.147156))
            Ub(CFrame.new(56.2616272, 18.0231895, 923.147156) + Vector3.new(0, -5, 0))
            Ub(CFrame.new(57.0027695, -7.91255093, 926.284119))
            wait(5)
            Ub(CFrame.new(142.521637, -7.91255236, 908.833313))
            wait(1)
            print("Bank | Opening Vault")
            Ub(CFrame.new(177.591599, -7.91255188, 901.4599))
            Main:updateButton(Status, "Bank | Opening Vault")
            wait(25)
            Ub(Nb.Money.CFrame)
            --wait(35)
                Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Ub(CFrame.new(57.0027695, -7.91255093, 926.284119))
            wait(1.5)
            Ub(CFrame.new(56.2616272, 18.0231895, 923.147156) + Vector3.new(0, -5, 0))
            Ub(CFrame.new(56.2616272, 18.0231895, 923.147156))
            Ub(CFrame.new(40.2629967, 18.7341385, 924.680481))
            Ub(CFrame.new(31.658287, 18.7341194, 860.295288))
            Ub(CFrame.new(-7.85457563, 18.3619556, 867.587524))
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            --print("Bank | Success!")
            Main:updateButton(Status, "Bank | Success!")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "04Remastered" then
            if W.enabled == false then return end
            Nb.Lasers:Destroy()
            Ub(CFrame.new(57.0399055, 18.7390213, 923.058594))
            Ub(CFrame.new(101.271233, 1.43810892, 914.866943))
            Ub(CFrame.new(96.4731522, 1.4381094, 877.592529))
            wait(1.5)
            Ub(CFrame.new(69.4692078, 0.738134027, 880.448914))
            Ub(CFrame.new(66.1593094, 0.738133907, 874.290283))
            Ub(CFrame.new(33.0868454, 1.38810897, 878.794739))
            Ub(CFrame.new(33.0868454, 1.38810897, 878.794739) + Vector3.new(5, 0, 0))
            Ub(CFrame.new(33.5417023, 1.38810897, 886.067017))
            Main:updateButton(Status, "Bank | Opening Vault")
            wait(25)
            --[[if Nb.TriggerDoor.CFrame == CFrame.new(179.404755, -5.3535471, 901.254883, -0.978144407, 0, -0.207926437, 0, 1, 0, 0.207926437, 0, -0.978144407) then
                repeat 
                    wait(25)
                until Nb.TriggerDoor.CFrame == CFrame.new(31.1510067, 3.34677124, 886.760254, 0.978144467, 0, 0.207926437, 0, 1, 0, -0.207926437, 0, 0.978144467)
            else
                Ub(Nb.Money.CFrame)
            end--]]
            Ub(Nb.Money.CFrame)
            wait(35)
            Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        Main:updateButton(Status, "Robbery Failed!")
                        break
                    end
                    if game.Players.LocalPlayer.Team == "Prisoner" then
                        Main:updateButton(Status, "Robbery Failed..")
                        break
                    end
                    if game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == true then
                        break
                    end
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Tb(CFrame.new(33.0868454, 1.38810897, 878.794739) + Vector3.new(5, 0, 0))
            Tb(CFrame.new(33.0868454, 1.38810897, 878.794739))
            Tb(CFrame.new(66.1593094, 0.738133907, 874.290283))
            Tb(CFrame.new(69.4692078, 0.738134027, 880.448914))
            wait(1.5)
            Ub(CFrame.new(96.4731522, 1.4381094, 877.592529))
            Ub(CFrame.new(101.271233, 1.43810892, 914.866943))
            Ub(CFrame.new(57.0399055, 18.7390213, 923.058594))
            Tb(CFrame.new(44.8027611, 60.2341843, 925.830383) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(37.8139915, 60.2341881, 895.217529) + Vector3.new(0, 5, 0))
            Tb(CFrame.new(57.5389671, 60.2341843, 886.989746) + Vector3.new(0, 5, 0))
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            --print("Bank | Completed..")
            Main:updateButton(Status, "Bank | Success!")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "05Underwater" then
            if W.enabled == false then return end
            Ub(CFrame.new(57.788887, 18.7390518, 923.271606))
            Ub(CFrame.new(101.791046, 1.48826146, 913.994934))
            Ub(CFrame.new(98.2377625, -12.8453264, 879.403687))
            Tb(CFrame.new(93.747406, -12.8177538, 855.680786))
            Tb(Nb.Begin.CFrame)
            Main:updateButton(Status, "Bank | Opening Vault")
            wait(25)
            Tb(Nb.Money.CFrame)
            --wait(35)
            Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Ub(CFrame.new(98.2377625, -12.8453264, 879.403687))
            Ub(CFrame.new(92.0765457, -12.8450899, 856.279175))
            Ub(CFrame.new(57.788887, 18.7390518, 923.271606))
            Ub(CFrame.new(40.2629967, 18.7341385, 924.680481))
            Ub(CFrame.new(31.658287, 18.7341194, 860.295288))
            Ub(CFrame.new(-7.85457563, 18.3619556, 867.587524))
            
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            --print("Bank | Completed..")
            Main:updateButton(Status, "Bank | Success!")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "06TheBlueRoom" then
            if W.enabled == false then return end
            Ub(CFrame.new(57.6650238, 0.18574205, 922.797668) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(39.2707787, -0.0142833591, 926.307983))
            Tb(CFrame.new(24.7250786, -0.0142833591, 929.006592))
            Tb(CFrame.new(5.58055353, -0.0142832696, 931.88324))
            Tb(CFrame.new(-12.0175095, -0.0142832249, 934.511292))
            Tb(CFrame.new(-34.5056419, -0.0142833591, 937.998352))
            Main:updateButton(Status, "Bank | Opening Vault")
            wait(25)
            --[[if Nb.TriggerDoor.CFrame == CFrame.new(179.404755, -5.3535471, 901.254883, -0.978144407, 0, -0.207926437, 0, 1, 0, 0.207926437, 0, -0.978144407) then
                repeat 
                    wait(25)
                until Nb.TriggerDoor.CFrame == CFrame.new()
            end--]]
            Ub(Nb.Money.CFrame)
            --wait(35)
            Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Tb(CFrame.new(-12.0175095, -0.0142832249, 934.511292))
            Tb(CFrame.new(5.58055353, -0.0142832696, 931.88324))
            Tb(CFrame.new(24.7250786, -0.0142833591, 929.006592))
            Ub(CFrame.new(39.2707787, -0.0142833591, 926.307983))
            Ub(CFrame.new(57.6650238, 0.18574205, 922.797668))
            Ub(CFrame.new(57.6650238, 0.18574205, 922.797668) + Vector3.new(0, 5, 0))
            Ub(CFrame.new(40.2629967, 18.7341385, 924.680481))
            wait(1.5)
            Ub(CFrame.new(31.658287, 18.7341194, 860.295288))
            Ub(CFrame.new(-7.85457563, 18.3619556, 867.587524))
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            --print("Bank | Completed..")
            Main:updateButton(Status, "Bank | Success!")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "07TheMint" then
            if W.enabled == false then return end
            Ub(CFrame.new(57.5558395, 18.7390213, 922.700623))
            Ub(CFrame.new(103.168335, 1.38771868, 914.93158))
            Tb(CFrame.new(91.4982376, 1.38771868, 848.182434))
            Ub(CFrame.new(55.8684883, 0.387657762, 826.988586))
            Ub(CFrame.new(51.6042747, 0.387657762, 809.879517))
            Ub(CFrame.new(55.8684883, 0.387657762, 826.988586))
            Main:updateButton(Status, "Bank | Opening Vault")
            wait(25)
            --[[if Nb.TriggerDoor.CFrame == CFrame.new(179.404755, -5.3535471, 901.254883, -0.978144407, 0, -0.207926437, 0, 1, 0, 0.207926437, 0, -0.978144407) then
                repeat 
                    wait(25)
                until Nb.TriggerDoor.CFrame == CFrame.new(31.1510067, 3.34677124, 886.760254, 0.978144467, 0, 0.207926437, 0, 1, 0, -0.207926437, 0, 0.978144467)
            end--]]
            Ub(Nb.Money.CFrame)
            --wait(35)
            Main:updateButton(Status, "Bank | Robbing...")
            if OwnsGamepass then
                repeat
                    --wait(80)
                    wait()
                until Rb()
            else
                repeat
                    --wait(25)
                    wait()
                until Rb()
            end
            Main:updateButton(Status, "Bank | Selling")
            Ub(CFrame.new(55.8684883, 0.387657762, 826.988586))
            Tb(CFrame.new(91.4982376, 1.38771868, 848.182434))
            Ub(CFrame.new(103.168335, 1.38771868, 914.93158))
            Ub(CFrame.new(57.5558395, 18.7390213, 922.700623))
            Ub(CFrame.new(40.2629967, 18.7341385, 924.680481))
            Ub(CFrame.new(31.658287, 18.7341194, 860.295288))
            Ub(CFrame.new(-7.85457563, 18.3619556, 867.587524))
            repeat
                wait(5)
            until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
            --print("Bank | Completed..")
            Main:updateButton(Status, "Bank | Success!")
            _G.BankRobbed = true
					_G.AutoRobbing = false
        elseif Nb.Name == "08Deductions" then
            if W.enabled == false then return end
    end
    --enterVehicle()
    --wt()
end

function mb()
    _G.AutoRobbing = true
    Main:updateButton(Status, "Museum | Teleporting to Museum")
    getgenv().teleport(CFrame.new(1041.07166, 101.903236, 1237.63245), true)
    wait(1)
    Ub(CFrame.new(1129.79004, 107.905312, 1305.5481))
    print("Robbing..")
    --wait(0.5)
    --Ub(CFrame.new(1091.90515, 106.155235, 1330.61401))
    --[[for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                    if d.Part and tostring(d.Part.Parent) == "asimo3089" then
                        d:Callback(d,true)
                    end
                end--]]
    wait(1)
    repeat
        if not Bb.CanCollide == false then return
            for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                if d.Part and tostring(d.Part) == "DinoBone" then
                    d:Callback(d,true)
                end
            end
        wait(1)
    until Rb()
    Ub(CFrame.new(1041.07166, 101.903236, 1237.63245))
    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
        if d.Part and tostring(d.Part) == "Seat" then
            d:Callback(true)
        end
    end
    wait(5)
    Main:updateButton(Status, "Museum | Teleporting to Volcano Base")
    getgenv().teleport(CFrame.new(2287.22876, 20.1366863, -2067.20386), true)
    Main:updateButton(Status, "Museum | Selling")
    wait(10)
    Ub(CFrame.new(2217.45898, 19.480566, -2468.44116))
    Ub(CFrame.new(2274.37842, 19.4776516, -2544.64111) + Vector3.new(0, -3, 0))
    wait(2.5)
    Ub(CFrame.new(2288.20508, 19.8537636, -2587.63232) + Vector3.new(0, -3, 0))
    repeat
        wait(5)
    until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
    Ub(CFrame.new(2288.20508, 19.8537636, -2587.63232) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2274.37842, 19.4776516, -2544.64111) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2217.45898, 19.480566, -2468.44116))
    Ub(CFrame.new(2287.22876, 20.1366863, -2067.20386))
    Main:updateButton(Status, "Museum | Success!")
    _G.AutoRobbing = false
    _G.MusRobbed = true
end

local N = game:GetService("VirtualInputManager")
local O, P
local Q = {}

Q = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Y = game:GetService("RunService").Stepped

function SpawnCar()
    local args = {
        [1] = "Chassis",
        [2] = "Camaro"
    }

    game:GetService("ReplicatedStorage").GarageSpawnVehicle:FireServer(unpack(args))
end

local jc
if workspace:FindFirstChild("Plane") then
    jc = workspace.Plane:FindFirstChild("Root")
end

local S = false

local function Hb(ic, jc)
	local kc = tick()
	local lc = 0.1
	ic = (ic == nil or ic <= 0) and 0.001 or ic
	lc = (lc > ic) and ic or lc
	while tick() - kc < ic and S == false and (jc == nil or jc(tick() - kc)) do
		wait(lc)
	end
	return tick() - kc
end

function Pl()
    _G.AutoRobbing = true
    print("Enterting a Vehicle")
    Main:updateButton(Status, "Enterting Vehicle")
    getgenv().teleport(CFrame.new(97.9818497, 21.2636833, 2448.65259), false)
    print("Waiting for takeoff.")
    Main:updateButton(Status, "Waiting For takeoff.")
    Hb(21, function()
        return jc.Parent ~= nil and jc.Position.Y < 200
    end)
    print("TPing to plane...")
    Main:updateButton(Status, "TPing to plane...")
    repeat
        if jc then
            for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
                if v:FindFirstChild("Seat") then
                    if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then
                        local Q = {}
                        Q = v.PrimaryPart
                        Q.CFrame = jc.CFrame + Vector3.new(0, 10, 0)
                    end
                end
            end
            for i, v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                if v.Name == "Inspect Crate" then
                    v:Callback(true)
                end
            end
            wait(0.5)
        end
    until Rb()
    Main:updateButton(Status, "Selling...")
    --O:Disconnect()
    wait(0.5)
    getgenv().teleport(CFrame.new(-411.143799, 20.8924694, 1988.8031), true)
    wait(2.5)
    Tb(CFrame.new(-342.633423, 21.2636929, 2050.1731))
    Main:updateButton(Status, "Robbery Success!")
    _G.PlaneRobbed = true
    _G.AutoRobbing = false
end

workspace.Trains.ChildRemoved:Connect(function(ic)
	if ic.Name == "BoxCar" then
		robbedtrain = false
	end
end)

local robbedtrain = false

local function yb(ic)
	if ic.ClassName == "Model" then
		if ic.Name == "Drop" then
			local jc = ic:WaitForChild("Briefcase", 2)
			while jc and jc.Parent and ic:FindFirstChild("Parachute") do
				ic.ChildRemoved:Wait()
				wait()
			end
		end
	end
end

function ad()
    Main:updateButton(Status, "Teleporting to Airdrop")
    local Drop = workspace:FindFirstChild("Drop")
    local jc = Drop.Briefcase
    getgenv().teleport(jc.CFrame, true)
    Main:updateButton(Status, "Collecting Airdrop")
    for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
        if v.Part == jc then
            wait(v.Duration)
            v:Callback(true)
        end
    end
    Main:updateButton(Status, "Airdrop Success!")
end

function Ct()
    _G.AutoRobbing = true
    local Q = {}
    Q = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    local Y = game:GetService("RunService").Stepped
    Main:updateButton(Status, "CargoTrain | Teleporting to Train")
    local jc = game:GetService("Workspace").Trains.BoxCar.Model.Rob.Gold
    local cd = game:GetService("Workspace").Trains.BoxCar.Skeleton.RoofDoorClosed
    repeat
    getgenv().teleport(jc.CFrame + jc.Velocity * 2, false)
    until Q.CFrame == Q.CFrame + jc.Velocity * 2
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
    wait(1)
    O = Y:Connect(function()
	    Q.CFrame = cd.CFrame + Vector3.new(0, -5, 0)
	    Q.Velocity, Q.RotVelocity = R, R
    end)
    wait(0.45)
    O:Disconnect()
    Main:updateButton(Status, "Opening door...")
    local lc, mcq
    for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
        if v.Name == "Open Door" and tostring(v.Part) == "RoofDoorClosed" then
            v:Callback(true)
        end
    end
    Main:updateButton(Status, "Opening vault")
    for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
        if v.Name == "Breach Vault" then
            v:Callback(true)
        end
    end
    O = Y:Connect(function()
		Q.CFrame = jc.CFrame + Vector3.new(0, 3, 0)
		Q.Velocity, Q.RotVelocity = R, R
	end)
    wait(3.5)
    O:Disconnect()
    repeat
        if not game:GetService("Workspace").Trains:GetChildren()[1] then
            return
        else
            wait(1)
        end
    until Rb()
    --O:Disconnect()
    wait(2.5)
    O = Y:Connect(function()
	    Q.CFrame = cd.CFrame + Vector3.new(0, -5, 0)
	    Q.Velocity, Q.RotVelocity = R, R
    end)
    wait(0.45)
    O:Disconnect()
    Ub(cd.CFrame + Vector3.new(0, 10, 0))
    Ub(cd.CFrame + Vector3.new(0, 0, 10))
    Main:updateButton(Status, "Robbery Success!")
    _G.AutoRobbing = false
   _G.TrainRobbed = true
end

local function Pt()
    local kc = workspace.Trains:GetDescendants()
    local mc = kc[1]
    --if mc.Name == "Briefcase" and mc.Parent and mc:FindFirstChild("Weld") then
        repeat
            for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
                if v.Part and tostring(v.Part) == "SpyGlasses" then
                    v:Callback(true)
                end
            end
            wait(0.5)
            for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
                if v.Part and tostring(v.Part) == "Briefcase" then
                    v:Callback(true)
                end
            end
            wait(0.5)
            for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
                if v.Part and tostring(v.Part) == "Computer" then
                    v:Callback(true)
                end
            end
            wait(0.5)
            for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
                if v.Part and tostring(v.Part) == "Documents" then
                    v:Callback(true)
                end
            end
            wait(0.5)
            for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
                if v.Part and tostring(v.Part) == "Phone" then
                    v:Callback(true)
                end
            end
        until Rb()
    --end
    wait(5)
    Main:updateButton(Status, "Selling...")
    getgenv().teleport(CFrame.new(2287.22876, 20.1366863, -2067.20386), true)
    Main:updateButton(Status, "Selling")
    wait(10)
    Ub(CFrame.new(2217.45898, 19.480566, -2468.44116))
    Ub(CFrame.new(2274.37842, 19.4776516, -2544.64111) + Vector3.new(0, -3, 0))
    wait(2.5)
    Ub(CFrame.new(2288.20508, 19.8537636, -2587.63232) + Vector3.new(0, -3, 0))
    repeat
        wait(5)
    until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
    Ub(CFrame.new(2288.20508, 19.8537636, -2587.63232) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2274.37842, 19.4776516, -2544.64111) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2217.45898, 19.480566, -2468.44116))
    Ub(CFrame.new(2287.22876, 20.1366863, -2067.20386))
    Main:updateButton(Status, "Success!")
end

function sm()
    Main:updateButton(Status, "Teleporting to Donut Store")
    tp(CFrame.new(91.028389, 18.8579807, -1502.875))
    Ub(CFrame.new(110.529465, 19.8141632, -1575.52393))
    Ub(CFrame.new(76.6201019, 19.8141651, -1588.8407))
    wait(2.5)
    for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
        if v.Part and tostring(v.Part) == "02f87606-245b-4fa4-8573-a5955fce70f2" then
            v:Callback(true)
        end
    end
    Ub(CFrame.new(110.529465, 19.8141632, -1575.52393))
    Ub(CFrame.new(91.028389, 18.8579807, -1502.875))
    Main:updateButton(Status, "Teleporting to Gas Station")
    tp(CFrame.new(-1543.93372, 19.3271122, 699.741028))
    Ub(CFrame.new(-1595.72241, 18.5944366, 710.480591))
    Ub(CFrame.new(-1599.37097, 18.5944347, 686.100891))
    wait(5)
    for i,v in pairs(require(game.ReplicatedStorage.Module.UI).CircleAction.Specs) do
        if v.Part and tostring(v.Part) == "93149f67-f970-48b7-a3ba-c7eaf27192bb" then
            v:Callback(true)
        end
    end
    wait(2.5)
    Ub(CFrame.new(-1587.75146, 18.5944366, 685.338196))
    Ub(CFrame.new(-1584.90527, 18.5944366, 707.738464))
    Ub(CFrame.new(-1543.93372, 19.3271122, 699.741028))
end

local Jb = workspace.PowerPlant.Piston.Piston:FindFirstChildOfClass("TouchTransmitter") ~= nil
local Mb = not Jb
local b, c, d, e, f, g =
    getupvalues or debug.getupvalues,
    getupvalue or debug.getupvalue,
    setupvalue or debug.setupvalue,
    islclosure or is_l_closure,
    getconsts or debug.getconstants,
    (syn and syn.request or http_request) or request
local h = game:GetService("Players")
local i = h.LocalPlayer or h:GetPropertyChangedSignal("LocalPlayer"):Wait() or h.LocalPlayer
local j = game:GetService("VirtualInputManager")
local k, l
local m = {}
local n = Vector3.new()
local o = false
local p, q, r = Color3.fromRGB(0, 222, 0), Color3.fromRGB(222, 0, 0), Color3.fromRGB(222, 222, 222)
local ob, pb, qb, rb, sb, tb
if b then
    local mc = (getreg or debug.getregistry)()
    for nc = 1, #mc do
        local oc = mc[nc]
        if
            type(oc) == "function" and (is_protected_closure == nil or is_protected_closure(oc) == false) and
                (e == nil or e(oc))
         then
            for pc, qc in next, b(oc) do
                if pb == nil and type(qc) == "table" and #qc > 5 then
                    for rc = 1, #qc do
                        local sc = rawget(qc, rc)
                        if type(sc) == "table" then
                            if rawget(sc, "Name") == "Punch" then
                                pb = sc
                            end
                        else
                            break
                        end
                    end
                elseif
                    sb == nil and type(qc) == "function" and
                        (is_protected_closure == nil or is_protected_closure(qc) == false) and
                        (e == nil or e(qc)) and
                        b(qc)[#b(qc)] == qc
                 then
                    sb = qc
                end
            end
        elseif type(oc) == "table" and #oc == 0 then
            if rawget(oc, "CircleAction") then
                ob = oc.CircleAction.Specs
            elseif rawget(oc, "IsFlying") then
                oc.IsFlying = function()
                    return tostring(getfenv(2).script) == "Falling"
                end
            elseif rb == nil and rawget(oc, "Show") and rawget(oc, "ColorCorrection") then
                if oc.Maid then
                    rb = function()
                    end
                else
                    local pc, qc
                    for rc, sc in next, b(oc.Show) do
                        if type(sc) == "table" and sc.Unequip then
                            pc, qc = rc, sc
                            break
                        end
                    end
                    d(oc.Show, pc, nil)
                    pcall(oc.Show)
                    d(oc.Show, pc, qc)
                    rb = oc.Hide
                end
            elseif tb == nil and type(rawget(oc, "Init")) == "function" then
                for pc, qc in next, b(rawget(oc, "Init")) do
                    if type(qc) == "table" and rawget(qc, "SetGrid") then
                        tb = qc
                        break
                    end
                end
            end
        end
    end
    if rb then
        for nc = 1, #mc do
            local oc = mc[nc]
            if
                type(oc) == "function" and (is_protected_closure == nil or is_protected_closure(oc) == false) and
                    (e == nil or e(oc)) and
                    f(oc)[1] == "Police" and
                    f(oc)[3] == "assert"
             then
                qb = oc
                rb()
                break
            end
        end
    end
    if not (ob and pb and qb and rb and sb and tb) then
        wait(2)
    end
end


local function Nb(mc, nc)
    local oc = tick()
    local pc = 0.1
    mc = (mc == nil or mc <= 0) and 0.001 or mc
    pc = (pc > mc) and mc or pc
    while tick() - oc < mc and o == false and (nc == nil or nc(tick() - oc)) do
        wait(pc)
    end
    return tick() - oc
end

workspace.PowerPlant.Piston.Piston.ChildAdded:Connect(
    function(mc)
        if mc.ClassName == "TouchTransmitter" then
            Mb = false
            Jb = true
        end
    end
)
workspace.PowerPlant.Piston.Piston.ChildRemoved:Connect(
    function(mc)
        if mc.ClassName == "TouchTransmitter" then
            Mb = false
            Jb = false
            wait(298)
            Jb = true
        end
    end
)

function Pp()
    Main:updateButton(Status, "Teleporting to Power Plant")
    getgenv().teleport(CFrame.new(59.5785904, 21.3619766, 2338.87036), true)
    wait(1)
    Main:updateButton(Status, "Solving Puzzle 1/2")
    Ub(CFrame.new(87.260788, 21.6875839, 2323.24268))
    wait(2)
    for pc, qc in ipairs(tb.Grid) do
                for rc, sc in ipairs(qc) do
                    qc[rc] = sc + 1
                end
            end
            local nc, oc =
                pcall(
                syn.request,
                {
                    Url = "https://numberlink-solver.sagesapphire.repl.co",
                    Method = "POST",
                    Body = game:GetService("HttpService"):JSONEncode({Matrix = tb.Grid}),
                    Headers = {["Content-Type"] = "application/json"}
                }
            )
            if nc and type(oc) == "table" and oc.Success then
                tb.Grid = game:GetService("HttpService"):JSONDecode(oc.Body).Solution
                for pc, qc in ipairs(tb.Grid) do
                    for rc, sc in ipairs(qc) do
                        qc[rc] = sc - 1
                    end
                end
                tb.OnConnection()
                Nb(
                    3,
                    function()
                        return tb.IsOpen
                    end
                )
                
end
    Ub(CFrame.new(95.4168091, 21.6875687, 2334.49951) + Vector3.new(0, 10, 0))
    Ub(CFrame.new(147.429321, 22.0875397, 2295.38867))
    Ub(CFrame.new(211.521652, 16.2394981, 2248.51221))
    Ub(CFrame.new(145.7435, -3.70497417, 2099.57251))
    Ub(CFrame.new(119.832787, -10.7610016, 2101.0542))
    Main:updateButton(Status, "Solving Puzzle 2/2")
    wait(2.5)
    for pc, qc in ipairs(tb.Grid) do
                for rc, sc in ipairs(qc) do
                    qc[rc] = sc + 1
                end
            end
            local nc, oc =
                pcall(
                syn.request,
                {
                    Url = "https://numberlink-solver.sagesapphire.repl.co",
                    Method = "POST",
                    Body = game:GetService("HttpService"):JSONEncode({Matrix = tb.Grid}),
                    Headers = {["Content-Type"] = "application/json"}
                }
            )
            if nc and type(oc) == "table" and oc.Success then
                tb.Grid = game:GetService("HttpService"):JSONDecode(oc.Body).Solution
                for pc, qc in ipairs(tb.Grid) do
                    for rc, sc in ipairs(qc) do
                        qc[rc] = sc - 1
                    end
                end
                tb.OnConnection()
                Nb(
                    3,
                    function()
                        return tb.IsOpen
                    end
                )
    Ub(CFrame.new(89.2457657, -6.15257978, 2114.40015))
    Ub(CFrame.new(75.1932297, -0.926194012, 2102.9646))
    Ub(CFrame.new(35.4907227, -1.99992132, 2097.00708))
    Ub(CFrame.new(32.3169594, 0.347989976, 2122.46582))
    Ub(CFrame.new(32.3169594, 0.347989976, 2122.46582) + Vector3.new(0, 3, 0))
    Ub(CFrame.new(33.6459885, 12.5547476, 2149.00562))
    Ub(CFrame.new(58.4435921, 6.72346687, 2190.08374))
    Ub(CFrame.new(56.8307266, -1.42116606, 2203.62793))
    Ub(CFrame.new(104.435028, 21.2321644, 2266.23706))
    Ub(CFrame.new(104.435028, 21.2321644, 2266.23706) + Vector3.new(0, 3, 0))
    Ub(CFrame.new(50.4944649, 21.7625351, 2308.33984) + Vector3.new(0, -3, 0))
    getgenv().teleport(CFrame.new(2287.22876, 20.1366863, -2067.20386), true)
    Main:updateButton(Status, "Selling")
    wait(0.5)
    Ub(CFrame.new(2217.45898, 19.480566, -2468.44116) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2274.37842, 19.4776516, -2544.64111) + Vector3.new(0, -3, 0))
    wait(2.5)
    Ub(CFrame.new(2288.20508, 19.8537636, -2587.63232) + Vector3.new(0, -3, 0))
    repeat
        wait(5)
    until game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled == false
    Ub(CFrame.new(2288.20508, 19.8537636, -2587.63232) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2274.37842, 19.4776516, -2544.64111) + Vector3.new(0, -3, 0))
    Ub(CFrame.new(2217.45898, 19.480566, -2468.44116))
    Ub(CFrame.new(2287.22876, 20.1366863, -2067.20386))
    Main:updateButton(Status, "Success!")
end
end

bb = game.workspace.Banks:GetChildren()[1]
local Bb = workspace.Museum.Roof.Hole.RoofPart

local gc = 0
local hc = 0

while wait(0.5) do
    if W.enabled then

        if game.Players.LocalPlayer.Team.Name == "Prisoner" and game.Players.LocalPlayer.PlayerGui.MainGui.CellTime.Visible == false then
            --movement:escape()
            Main:updateButton(Status, "Escaping"..string.rep('.', gc % 3 + 1))
            wait(1)
            repeat
            TP(CFrame.new(-1147.1488, 18.4941444, -1380.0553))
            until game.Players.LocalPlayer.Team.Name == "Criminal"
        elseif game.workspace.Jewelrys:GetChildren()[1].Extras.Sign.Decal.Transparency > 0.01 and W.IncludeJewelry == true and _G.JewRobbed == nil then
            ec()
        elseif bb["Extra"].Sign.Decal.Transparency > 0.01 and W.IncludeBank == true and _G.BankRobbed == nil then
            ab()
        elseif Bb.CanCollide == false and W.IncludeMuseum == true and _G.MusRobbed == nil then
            mb()
        elseif game.Workspace:FindFirstChild("Plane") and W.IncludePlane == true and _G.PlaneRobbed == nil then
            Pl()
        elseif game.Workspace.Trains:FindFirstChild("BoxCar") and W.IncludeTrain == true and _G.TrainRobbed == nil then
            Ct()
        elseif game.Workspace.Trains:FindFirstChild("SteamEngine") and W.IncludePTrain == true then
            Pt()
        elseif powerOpen == true and W.IncludePower == true then
            Pp()
        elseif workspace:FindFirstChild("Drop") and W.IncludeDrops == true then
            ad()
        --[[elseif bb["Extra"].Sign.Decal.Transparency < 0.01 or game.workspace.Jewelrys:GetChildren()[1].Extras.Sign.Decal.Transparency < 0.01 or Bb.CanCollide == true then
            sm()--]]
        else
            Main:updateButton(Status, "Waiting for stores to open"..string.rep('.', gc % 3 + 1))
            gc = gc + 1
            --break
            --[[TP(CFrame.new(-105.979378, 92.9494934, 693.584839))
            local args = {
                [1] = "Chassis",
                [2] = "Camaro"
            }

            game:GetService("ReplicatedStorage").GarageSpawnVehicle:FireServer(unpack(args))
            wait(3.5)
            local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()--]]
        end
    else
        Main:updateButton(Status, "Auto Rob Disabled")
    end    
end


--[[while wait(0.5) do
    for i,v in pairs(game:GetService("CoreGui")["Jailbreak Auto Rob"].Main.Statuses.Statuses.Container:GetChildren()) do
    if v.Name == "Button" then
        if v:FindFirstChild("Title").Text == "Bank" then
            if game.Workspace.Banks:GetChildren()[1].Extra.Sign.Decal.Transparency > 0.01 then
                v.Title.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                v.Title.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        if v:FindFirstChild("Title").Text == "Jewelry Store" then
            if game.workspace.Jewelrys:GetChildren()[1].Extras.Sign.Decal.Transparency > 0.01 then
                v.Title.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                v.Title.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        if v:FindFirstChild("Title").Text == "Museum" then
            if Bb.Transparency == 1 then
                v.Title.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                v.Title.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end
end--]]

--[[for i,v in pairs(game:GetService("CoreGui")["Jailbreak Auto Rob"].Main.Statuses.Statuses.Container:GetChildren()) do
    game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors.ChildAdded:Connect(function()
        if v:FindFirstChild("Title").Text == "Jewelry Store" then
            v.Title.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            v.Title.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
    game:GetService("Workspace").Museum.Roof.Hole.RoofPart:GetPropertyChangedSignal("Transparency"):Connect(function()
        if game:GetService("Workspace").Museum.Roof.Hole.RoofPart.Transparency == 1 then
        if v:FindFirstChild("Title").Text == "Museum" then
            v.Title.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            v.Title.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
    end)
end--]]
