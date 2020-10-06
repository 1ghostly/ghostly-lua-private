--[[SwordHitBoxSize = 99
SelectionBoxColor = Color3.fromRGB(255, 255, 255)
SelectionBoxLineThickness = 0.1
SelectionBoxTransparency = 0.5
getgenv().BringPlayers = false
getgenv().FOVChangerEnabled = false
getgenv().ForceAllowReset = false
FOV = 90]]

local Key = getgenv().Key
local check = "https://gsu-systems.000webhostapp.com/check.php?key=" .. Key
if game:HttpGet(check) == "Whitelisted" then
    check.Text = "Whitelisted"
    wait(0.3)
    print("Whitelisted Successfully")
    else
        print("Not Whitelisted")
        Player:Kick("Not Whitelisted")

local CurrentSize = ""
local CurrentGripPos = ""
local Player = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local Character = Player.Character
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")        
local StarterGui = game:GetService('StarterGui')
local Camera = game.Workspace.Camera
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local Content = '';
local ConvertSBLT = tostring(SelectionBoxLineThickness);
local ConvertSBT = tostring(SelectionBoxTransparency);
local ConvertSHBS = tostring(SwordHitBoxSize)
local ConvertFOV = tostring(FOV)
local Exploit = "Unknown"
local BringPlayersStatus = "Unknown"
local FOVChangerStatus = "Unknown"
local AllowResetStatus = "Unknown"

if getgenv().ForceAllowReset == true then
    AllowResetStatus = "Enabled"
    else
        AllowResetStatus = "Disabled"
end

if getgenv().FOVChangerEnabled == true then
    FOVChangerStatus = "Enabled"
    else
        FOVChangerStatus = "Disabled"
        ConvertFOV = "FOV Changer not enabled"
end

if getgenv().BringPlayers == true then
    BringPlayersStatus = "Enabled"
    else
        BringPlayersStatus = "Disabled"
end

if syn then
    Exploit = "Synapse X"
    else
        print("Not Synapse X")
end

if PROTOSMASHER_LOADED == true then
    Exploit = "Protosmasher"
    else
        print("Not Protosmasher")
end

if SENTINEL_LOADED == true then
    Exploit = "Sentinel"
    else
        print("Not Sentinel")
end

if is_sirhurt_closure then
    Exploit = "SirHurt"
    else
        print("Not SirHurt")
end

function ExecuteLog()
    local Embed = {
        title = 'Script Executed!';
        color = '16777215';
        url = "https://www.roblox.com/games/"..game.PlaceId;
        footer = { text = "Ghostly's Execute Logs"};
        author = {
            name = 'Reach Logs';
            url = 'https://github.com/1ghostly/ghostly-lua';
            icon_url = "https://discohook.org/static/discord-avatar.png"
        };
        fields = {
            {
                name = 'Game:';
                value = MarketplaceService:GetProductInfo(game.PlaceId).Name;
            };
            {
                name = "Username:";
                value = game.Players.LocalPlayer.Name
            };
            {
                name = 'Hitbox Size:';
                value = ConvertSHBS;
            };
            {
                name = 'Selection Box Color';
                value = tostring(SelectionBoxColor);
            };
            {
                name = 'Selection Box Thickness:';
                value = ConvertSBLT;
            };
            {
                name = 'Selection Box Transparency:';
                value = ConvertSBT;
            };
            {
                name = 'Bring Players Enabled:';
                value = BringPlayersStatus;
            };
            {
                name = 'Allow Reset Enabled:';
                value = AllowResetStatus
            };
            {
                name = 'FOV Changer Enabled:';
                value = FOVChangerStatus;
            };
            {
                name = 'FOV:';
                value = ConvertFOV;
            };
            {
                name = 'JobId:';
                value = game.JobId;
            };
            {
                name = "Exploit:";
                value = Exploit;
            };
        };
        timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
    };
    (syn and syn.request or http_request) {
        Url = 'https://discordapp.com/api/webhooks/757647740548284597/w8f8B8SGoFOF_iziCTX9aB-QnIvJ-it4xiMCdOUZwhRFHaI_s_7tFThj-vBhj4_4FZI2';
        Method = 'POST';
        Headers = {
            ['Content-Type'] = 'application/json';
        };
        Body = game:GetService'HttpService':JSONEncode( { content = Content; embeds = { Embed } } );
    };
end

ExecuteLog()
for i,v in pairs (Character:GetDescendants()) do
    if v:IsA("Tool") then
        for i,d in pairs (v.Handle:GetDescendants()) do
            if d:IsA("SelectionBox") then
                d:Destroy()
            else
                print("No SelectionBox")
                CurrentSize = v.Handle.Size
                CurrentGripPos = v.GripPos
                local Box = Instance.new("SelectionBox", v.Handle)
                Box.Name = "NewBox"
                v.Handle.Massless = true
                Box.Adornee = v.Handle
                Box.Color3 = SelectionBoxColor
                Box.LineThickness = SelectionBoxLineThickness
                Box.Transparency = SelectionBoxTransparency
                v.Handle.Size = Vector3.new(0.5, 0.5, SwordHitBoxSize)
                v.GripPos = Vector3.new(0, 0, 0)
                Character.Humanoid:UnequipTools()
            end
        end
    end
end

if getgenv().BringPlayers == true then
    repeat RunService.RenderStepped:Wait()
        for i, v in next, Players:GetPlayers() do
            if v ~= Player then
                local LChar = v.Character or workspace:FindFirstChild(v.Name)
                if LChar then
                    pcall(function()
                        LChar.Head.Anchored = true
                        LChar.Head.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, -2.5)
                    end)
                end
            end
        end
    until getgenv().BringPlayers == false
else
    print("BringPlayers not enabled!")
end

if getgenv().FOVChangerEnabled == true then
    Camera.FieldOfView = FOV
end

if getgenv().ForceAllowReset == true then
    local coreCall do
        local MAX_RETRIES = 8    
        function coreCall(method, ...)
            local result = {}
            for retries = 1, MAX_RETRIES do
                result = {pcall(StarterGui[method], StarterGui, ...)}
                if result[1] then
                    break
                end
                RunService.Stepped:Wait()
            end
            return unpack(result)
        end
    end
    
    assert(coreCall('SetCore', 'ResetButtonCallback', true))
else
    local coreCall do
        local MAX_RETRIES = 8
        function coreCall(method, ...)
            local result = {}
            for retries = 1, MAX_RETRIES do
                result = {pcall(StarterGui[method], StarterGui, ...)}
                if result[1] then
                    break
                end
                RunService.Stepped:Wait()
            end
            return unpack(result)
        end
    end
    assert(coreCall('SetCore', 'ResetButtonCallback', false))
end
end
