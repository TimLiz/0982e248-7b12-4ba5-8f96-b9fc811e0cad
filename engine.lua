local AutoRob = {}

local keys, network = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/JailWare/main/Fetcher.lua"))()

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

    if vehicle_data.Type ~= "Chassis" and vehicle_data.Type ~= "Motorcycle" and vehicle_data.Type ~= "Heli" and vehicle_data.Type ~= "DuneBuggy" and vehicle_data.Make ~= "Volt" then -- weird vehicles that are not supported
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

local old_fire_server = getupvalue(network.FireServer, 1);
setupvalue(network.FireServer, 1, function(key, ...)
    if key == keys.Damage then 
        return;
    end;

    return old_fire_server(key, ...);
end);

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

local Q = {}
local S = false
local R = Vector3.new()


--P = game:GetService("Players").LocalPlayer.Character.Humanoid

local function vtp(part, ic)
	--P:SetStateEnabled("FallingDown", false)
	local jc = (ic - ic.p) + part.Position + Vector3.new(0, 500, 0)
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

function AutoRob.FarmTP(cframe,ExitCar)
    local tried = tried or {};
    local nearest_vehicle = utilities:get_nearest_vehicle(tried);
    
for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if nearest_vehicle:FindFirstChild("Seat") then
            if nearest_vehicle.Seat.PlayerName.Value == "" then
                local dist = (nearest_vehicle.PrimaryPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if dist <= 1100 then
                movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, dependencies.variables.player_speed);
                wait(0.5)   
                local enter_attempts = 1;

        repeat -- attempt to enter car
            network:FireServer(keys.EnterCar, nearest_vehicle, nearest_vehicle.Seat);
                    
            enter_attempts = enter_attempts + 1;

            task.wait(0.1);
        until enter_attempts == 10 or nearest_vehicle.Seat.PlayerName.Value == player.Name;

        if nearest_vehicle.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
                    table.insert(tried, nearest_vehicle);

                    return AutoRob.FarmTP(cframe, tried or {nearest_vehicle});
                end;
                    break
                end
            end
        end
    end

    wait(0.5)
    for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if v:FindFirstChild("Seat") then
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then
                if dependencies.helicopters[v.Name] then
                   -- movement:move_to_position(nearest_vehicle.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                   print("Heli")
                   v.Model.TopDisc.CFrame = v.Model.TopDisc.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.Model.TopDisc, cframe + Vector3.new(0, 500, 0))
                    v.Model.TopDisc.CFrame = v.Model.TopDisc.CFrame + Vector3.new(0, -400, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    --network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[v.Name] then
                    --movement:move_to_position(nearest_vehicle.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    v.CameraVehicleSeat.CFrame = v.CameraVehicleSeat.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.CameraVehicleSeat, cframe + Vector3.new(0, 500, 0))
                    v.CameraVehicleSeat.CFrame = v.CameraVehicleSeat.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    --network:FireServer(keys.ExitCar)
                elseif v.Name == "DuneBuggy" then
                    --movement:move_to_position(nearest_vehicle.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    v.BoundingBox.CFrame = v.BoundingBox.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.BoundingBox, cframe + Vector3.new(0, 500, 0))
                    v.BoundingBox.CFrame = v.BoundingBox.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    --network:FireServer(keys.ExitCar)
                elseif v.Name == "Chassis" then
                    --movement:move_to_position(v.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                else
                    --movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                    v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.PrimaryPart, cframe + Vector3.new(0, 500, 0))
                    v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, -500, 0)
                    --G_17_(cframe)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            --Ib("E")
                    --network:FireServer(keys.ExitCar)
                end
            end
        end
    end
end

function AutoRob.CarTP(cframe)
    local relative_position = (cframe.Position - player.Character.HumanoidRootPart.Position);
    local target_distance = relative_position.Magnitude;

    if target_distance <= 20 and not workspace:Raycast(player.Character.HumanoidRootPart.Position, relative_position.Unit * target_distance, dependencies.variables.raycast_params) then 
        player.Character.HumanoidRootPart.CFrame = cframe; 
        
        return;
    end; 

    local tried = tried or {};
    local nearest_vehicle = utilities:get_nearest_vehicle(tried);

    if game.Players.LocalPlayer.Character.Humanoid.Sit == false then 
        local vehicle_distance = (nearest_vehicle.Seat.Position - player.Character.HumanoidRootPart.Position).Magnitude; 

        if target_distance < vehicle_distance then -- if target position is closer than the nearest vehicle
            movement:move_to_position(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed);
        else 
            if nearest_vehicle.Seat.PlayerName.Value ~= player.Name then
                movement:move_to_position(player.Character.HumanoidRootPart, nearest_vehicle.Seat.CFrame, dependencies.variables.player_speed, false, nearest_vehicle, tried);

                local enter_attempts = 1;

                repeat -- attempt to enter car
                    network:FireServer(keys.EnterCar, nearest_vehicle, nearest_vehicle.Seat);
                    
                    enter_attempts = enter_attempts + 1;

                    task.wait(0.1);
                until enter_attempts == 5 or nearest_vehicle.Seat.PlayerName.Value == player.Name;

                if nearest_vehicle.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
                    table.insert(tried, nearest_vehicle);

                    return AutoRob.CarTP(cframe, tried or {nearest_vehicle});
                end;
            end;

            local vehicle_root_part; -- inline conditional would be way too long

            if dependencies.helicopters[nearest_vehicle.Name] then -- each type of vehicle has a different root part, which is why we sort them so we can do this
                vehicle_root_part = nearest_vehicle.Model.TopDisc;
            elseif dependencies.motorcycles[nearest_vehicle.Name] then 
                vehicle_root_part = nearest_vehicle.CameraVehicleSeat;
            elseif nearest_vehicle.Name == "DuneBuggy" then 
                vehicle_root_part = nearest_vehicle.BoundingBox;
            else 
                vehicle_root_part = nearest_vehicle.PrimaryPart;
            end;

           vehicle_root_part.CFrame = vehicle_root_part.CFrame + Vector3.new(0, 500, 0)
           vtp(vehicle_root_part, cframe + Vector3.new(0, 500, 0))
           vehicle_root_part.CFrame = vehicle_root_part.CFrame + Vector3.new(0, -500, 0)

            repeat -- attempt to exit car
                task.wait(0.15);
                network:FireServer(keys.ExitCar);
            until nearest_vehicle.Seat.PlayerName.Value ~= player.Name;
        end;
    else if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if v:FindFirstChild("Seat") then
            if v.Seat.PlayerName.Value == game:GetService("Players").LocalPlayer.Name then
                if dependencies.helicopters[v.Name] then
                   -- movement:move_to_position(nearest_vehicle.Model.TopDisc, cframe, dependencies.variables.vehicle_speed);
                   print("Heli")
                   v.Model.TopDisc.CFrame = v.Model.TopDisc.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.Model.TopDisc, cframe + Vector3.new(0, 500, 0))
                    v.Model.TopDisc.CFrame = v.Model.TopDisc.CFrame + Vector3.new(0, -400, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    --network:FireServer(keys.ExitCar)
                elseif dependencies.motorcycles[v.Name] then
                    --movement:move_to_position(nearest_vehicle.CameraVehicleSeat, cframe, dependencies.variables.vehicle_speed);
                    v.CameraVehicleSeat.CFrame = v.CameraVehicleSeat.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.CameraVehicleSeat, cframe + Vector3.new(0, 500, 0))
                    v.CameraVehicleSeat.CFrame = v.CameraVehicleSeat.CFrame + Vector3.new(0, -400, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    --network:FireServer(keys.ExitCar)
                elseif v.Name == "DuneBuggy" then
                    --movement:move_to_position(nearest_vehicle.BoundingBox, cframe, dependencies.variables.vehicle_speed);
                    v.BoundingBox.CFrame = v.BoundingBox.CFrame + Vector3.new(0, 500, 0)
                    vtp(nearest_vehicle.BoundingBox, cframe + Vector3.new(0, 500, 0))
                    v.BoundingBox.CFrame = v.BoundingBox.CFrame + Vector3.new(0, -500, 0)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    --network:FireServer(keys.ExitCar)
                elseif v.Name == "Chassis" then
                    --movement:move_to_position(v.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                else
                    --movement:move_to_position(nearest_vehicle.PrimaryPart, cframe, dependencies.variables.vehicle_speed);
                    v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 500, 0)
                    vtp(v.PrimaryPart, cframe + Vector3.new(0, 500, 0))
                    v.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, -500, 0)
                    --G_17_(cframe)
                    task.wait(0.15);
                    for _,d in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                        if d.Part == v.Seat then
                            d:Callback(d,true)
                        end
                    end
                    task.wait(0.15);
                    if ExitCar then
        local replicated_storage = game:GetService("ReplicatedStorage");
		
            local game_folder = replicated_storage.Game;
            local team_choose_ui = require(game_folder.TeamChooseUI);    
            local exit_car_function = getupvalue(team_choose_ui.Init, 3);

            exit_car_function()
    end
                    local deez = game:GetService("VirtualInputManager")

			local function Ib(ic)
				deez:SendKeyEvent(true, ic, false, game)
				wait()
				deez:SendKeyEvent(false, ic, false, game)
			end
            --Ib("E")
                    --network:FireServer(keys.ExitCar)
                end
            end
        end
    end
    end;
end
end

function AutoRob.Punch()
    local replicated_storage = game:GetService("ReplicatedStorage");
    local game_folder = replicated_storage.Game;
    local default_actions = require(game_folder.DefaultActions);
    local punch_function = getupvalue(default_actions.punchButton.onPressed, 1).attemptPunch;
    punch_function()
end

local function Qb(mc)
    return tonumber((tostring(mc):gsub("%D", "")))
end

function AutoRob.MaxMoney()
    local mc, nc = game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Container.Bottom.Progress.Amount.Text:match("(.-)/(.+)")
    return game.Players.LocalPlayer.PlayerGui.RobberyMoneyGui.Enabled and mc and nc and Qb(mc) >= Qb(nc)
end

return AutoRob
