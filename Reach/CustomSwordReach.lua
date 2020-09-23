SwordHitBoxSize = 99
SelectionBoxColor = Color3.fromRGB(100, 222, 0)
SelectionBoxLineThickness = 0.1
SelectionBoxTransparency = 0.9

getgenv().LoopKill = true;

local CurrentSize = ""
local CurrentGripPos = ""
local Player = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local Character = Player.Character
local MarketplaceService = game:GetService("MarketplaceService")
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local Content = '';
local ConvertSBLT = tostring(SelectionBoxLineThickness);
local ConvertSBT = tostring(SelectionBoxTransparency);
local ConvertSHBS = tostring(SwordHitBoxSize)
local Exploit = "Unknown"

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

if getgenv().LoopKill == true then
    
end