--[[-Sword Settings-]]--

--Change number values to your desired value

SwordHitBoxSize = 99
SelectionBoxColor = Color3.fromRGB(255, 255, 255)
SelectionBoxLineThickness = 0.1
SelectionBoxTransparency = 0.5

--[[-Options-]]--

--Change false to your desired option

getgenv().BringPlayers = false
getgenv().FOVChangerEnabled = false

--[[-FOV Settings-]]--

--Change number values to your desired value
--70 is the default FOV

FOV = 80

--[[-Loader-]]--

loadstring(game:HttpGet(('https://raw.githubusercontent.com/1ghostly/ghostly-lua/master/ghostly-sword-reach.lua'),true))()
