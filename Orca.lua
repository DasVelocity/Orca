--[[                                                                                                                                                                                           
                                             @@                                                         
                                           @Waa*@@@@                                                    
                                           @@o**o#a@@@                                                  
                                            @$ooaoao*$@@                                                
                                            @@o*oooa#oa@@                                               
                                             @@*oooaaoo*#@@                                             
                                              @@oooooaoooo@@                                            
                                              @@aaooooooo*#@@  @@@@@@@@@@@@@@@@@                        
                                               @MaoooB@@@@@@@@$M#oaaaaooooooaoaoM$@@@@@                 
                                              @@@@@@@*a*oooo***o*oooooooooo*o*o**oooo*a$@@@             
                                           @@@@$a#oao**ooo**oo*o*o**oooooooooooooo*ooo**a#B@@           
                                        @@@$oooooo*oo*o*o*ooo*****oo**o***o*ooo*o*ooo#**o***@@          
                                     @@@Mo*o*oooao*ooo*oo*********oo***o****a#@@@@@@@#*ooo*o#@@         
                                   @@@ooo*o*****ao*oooooo*******ooo**o*oo*o@@         @@@@**#o@@        
                                 @@*#oo*oooo*o**oo*ooooo*o**o*o**o**ooo*aW@         @@@@ @o#oo@@@@      
                               @@a*#ooo**oo*o*o*o**ooooooo*o*****o**ooo**@             @@o#ho**a*@@     
                             @@##**oo*******ooo*o*o*oooooooooooooooo*oo*o@@          @@o*aoooo#k@@      
                            @@#ooo**ooo*oooo**ooo*o*a*ooooo*o*oooo*o***ooo@@      @@ao@@@@@@@@@@@@      
                          @@a*o**oooo*ooooooo*ooo*o*o*o**oo*o*o*oo*o***oo#*h#@@@o##aooao**o*##h@@       
                         @@oo**ooooooo*o#hkkha#o*o*o****o**#**oa*o*ooo**ooao***o**o*****oa*oW@@@        
                        @@a*oo*oooo***M@@@   @@@@h*o*****oooo@@oo*o*oo**@@M$@@@@@@@$#oooo*a@@@          
                      @@@*o****oooo*B@            @@@@#ooaho@@o*ooo*o*oo@@            @@@@@             
                      @@a*ooo**oooaa@                      @@****oo**ooa@@          @@@@                
                     @@ho*oaooooooo#@                      @Mo**o****ooM@      @@@@@@                   
                    @@ooooooo*h#@@@@@@@@@@@@@@@@          @@a**o******h@@@@@@@@@                        
                   @@@**oo*h@@@@               @@@@@@@@@@@@ao*oo**oooo@@@@                              
                  @@@ao*oa@@@                           @@#**ooooo*oo@@                                 
               @@@$@@ooa@@@@                           @@**o*o******@@                                  
             @@Wooo$@a@@M*M@@                         @@oo**ao**#a@@                                    
              @@M**a*aa@@Wooooa@@                       @$ooooaoo*#@@                                      
              @@kaooa**@@aaoo*ooo@@                     @@oaoa*a*@@@                                        
             @@ahoooooo@@*oaoaoook@@                   @@oaao@@@@                                           
             @@*#o*o*B@@@a*ooooooo@@                    @@@@@                                               
             @@@@@@@@@  @@a*ooo***#@                                                                        
                          @@@@@BMa#@                                                                        
                                 @@@                                                                        
                     
                                _____ ______  _____   ___  
                                |  _  || ___ \/  __ \ / _ \ 
                                | | | || |_/ /| /  \// /_\ \
                                | | | ||    / | |    |  _  |
                                \ \_/ /| |\ \ | \__/\| | | |
                                 \___/ \_| \_| \____/\_| |_/
                            
                            
                Devloper: Velocity, Gemeni, oh and i also took a look at DarkDex V5.
                         

]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ICONS = {
    RemoteEvent = "rbxassetid://413369506",
    RemoteFunction = "rbxassetid://413369623",
    BindableEvent = "rbxassetid://1149451354",
    BindableFunction = "rbxassetid://117286174639157",
    Folder = "rbxassetid://4458901886",
    Game = "rbxassetid://392155452"
}

local ContentProvider = game:GetService("ContentProvider")
local toPreload = {}
for _, id in pairs(ICONS) do
    table.insert(toPreload, id)
end
ContentProvider:PreloadAsync(toPreload)

local currentSelected = nil
local toggleKey = Enum.KeyCode.K
local displayOrderBase = 100
local isVisible = true
local eventsList = {}
local filteredList = {}
local defaultSize = UDim2.new(0, 850, 0, 650)

local discordInvite = "https://discord.gg/sNUgTFCnNs"
pcall(function()
    if type(syn) == "table" and syn.open_url then
        syn.open_url(discordInvite)
    else
        setclipboard(discordInvite)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Discord Invite",
            Text = "Link copied to clipboard! Paste it to join.",
            Duration = 5
        })
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Orca"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = displayOrderBase + 100

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = defaultSize
mainFrame.Position = UDim2.new(0.5, -425, 0.5, -325)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = false

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 36)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -330, 1, 0)
titleLabel.Position = UDim2.new(0, 16, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Orca Explorer"
titleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Font = Enum.Font.RobotoMono
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 26)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
closeButton.TextSize = 12
closeButton.Font = Enum.Font.RobotoMono
closeButton.Parent = titleBar

local scanButton = Instance.new("TextButton")
scanButton.Name = "ScanButton"
scanButton.Size = UDim2.new(0, 120, 0, 26)
scanButton.Position = UDim2.new(1, -250, 0, 5)
scanButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
scanButton.BorderSizePixel = 0
scanButton.Text = "Scan Events"
scanButton.TextColor3 = Color3.fromRGB(200, 200, 200)
scanButton.TextSize = 12
scanButton.Font = Enum.Font.RobotoMono
scanButton.Parent = titleBar

local refreshButton = Instance.new("TextButton")
refreshButton.Name = "RefreshButton"
refreshButton.Size = UDim2.new(0, 70, 0, 26)
refreshButton.Position = UDim2.new(1, -120, 0, 5)
refreshButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
refreshButton.BorderSizePixel = 0
refreshButton.Text = "REFRESH"
refreshButton.TextColor3 = Color3.fromRGB(200, 200, 200)
refreshButton.TextSize = 11
refreshButton.Font = Enum.Font.RobotoMono
refreshButton.Parent = titleBar

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -36)
contentFrame.Position = UDim2.new(0, 0, 0, 36)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local explorerPanel = Instance.new("Frame")
explorerPanel.Name = "ExplorerPanel"
explorerPanel.Size = UDim2.new(0.4, -1, 1, 0)
explorerPanel.Position = UDim2.new(0, 0, 0, 0)
explorerPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
explorerPanel.BorderSizePixel = 0
explorerPanel.Parent = contentFrame

local searchBar = Instance.new("TextBox")
searchBar.Name = "SearchBar"
searchBar.Size = UDim2.new(1, -10, 0, 28)
searchBar.Position = UDim2.new(0, 5, 0, 5)
searchBar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
searchBar.BorderSizePixel = 0
searchBar.Text = "Search events..."
searchBar.TextColor3 = Color3.fromRGB(140, 140, 140)
searchBar.TextSize = 13
searchBar.Font = Enum.Font.RobotoMono
searchBar.ClearTextOnFocus = true
searchBar.Parent = explorerPanel

local explorerHeader = Instance.new("Frame")
explorerHeader.Name = "Header"
explorerHeader.Size = UDim2.new(1, 0, 0, 32)
explorerHeader.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
explorerHeader.BorderSizePixel = 0
explorerHeader.Position = UDim2.new(0, 0, 0, 38)
explorerHeader.Parent = explorerPanel

local explorerTitle = Instance.new("TextLabel")
explorerTitle.Name = "Title"
explorerTitle.Size = UDim2.new(1, -20, 1, 0)
explorerTitle.Position = UDim2.new(0, 10, 0, 0)
explorerTitle.BackgroundTransparency = 1
explorerTitle.Text = "EVENTS"
explorerTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
explorerTitle.TextSize = 13
explorerTitle.TextXAlignment = Enum.TextXAlignment.Left
explorerTitle.Font = Enum.Font.RobotoMono
explorerTitle.Parent = explorerHeader

local explorerCount = Instance.new("TextLabel")
explorerCount.Name = "Count"
explorerCount.Size = UDim2.new(0, 120, 1, 0)
explorerCount.Position = UDim2.new(1, -120, 0, 0)
explorerCount.BackgroundTransparency = 1
explorerCount.Text = "0 found"
explorerCount.TextColor3 = Color3.fromRGB(140, 140, 140)
explorerCount.TextSize = 12
explorerCount.Font = Enum.Font.RobotoMono
explorerCount.Parent = explorerHeader

local explorerScroll = Instance.new("ScrollingFrame")
explorerScroll.Name = "ExplorerScroll"
explorerScroll.Size = UDim2.new(1, 0, 1, -70)
explorerScroll.Position = UDim2.new(0, 0, 0, 70)
explorerScroll.BackgroundTransparency = 1
explorerScroll.BorderSizePixel = 0
explorerScroll.ScrollBarThickness = 3
explorerScroll.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
explorerScroll.Parent = explorerPanel

local explorerLayout = Instance.new("UIListLayout")
explorerLayout.SortOrder = Enum.SortOrder.LayoutOrder
explorerLayout.Padding = UDim.new(0, 4)
explorerLayout.Parent = explorerScroll

local separator = Instance.new("Frame")
separator.Name = "Separator"
separator.Size = UDim2.new(0, 2, 1, 0)
separator.Position = UDim2.new(0.4, 0, 0, 0)
separator.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
separator.BorderSizePixel = 0
separator.Parent = contentFrame

local detailsPanel = Instance.new("Frame")
detailsPanel.Name = "DetailsPanel"
detailsPanel.Size = UDim2.new(0.6, -2, 1, 0)
detailsPanel.Position = UDim2.new(0.4, 2, 0, 0)
detailsPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
detailsPanel.BorderSizePixel = 0
detailsPanel.Parent = contentFrame

local detailsHeader = Instance.new("Frame")
detailsHeader.Name = "Header"
detailsHeader.Size = UDim2.new(1, 0, 0, 32)
detailsHeader.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
detailsHeader.BorderSizePixel = 0
detailsHeader.Parent = detailsPanel

local detailsTitle = Instance.new("TextLabel")
detailsTitle.Name = "Title"
detailsTitle.Size = UDim2.new(1, -110, 1, 0)
detailsTitle.Position = UDim2.new(0, 10, 0, 0)
detailsTitle.BackgroundTransparency = 1
detailsTitle.Text = "PROPERTIES"
detailsTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
detailsTitle.TextSize = 13
detailsTitle.TextXAlignment = Enum.TextXAlignment.Left
detailsTitle.Font = Enum.Font.RobotoMono
detailsTitle.Parent = detailsHeader

local fireButton = Instance.new("TextButton")
fireButton.Name = "FireButton"
fireButton.Size = UDim2.new(0, 90, 0, 24)
fireButton.Position = UDim2.new(1, -100, 0, 4)
fireButton.BackgroundColor3 = Color3.fromRGB(220, 60, 40)
fireButton.BorderSizePixel = 0
fireButton.Text = "FIRE EVENT"
fireButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fireButton.TextSize = 11
fireButton.Font = Enum.Font.RobotoMono
fireButton.Visible = false
fireButton.Parent = detailsHeader

local detailsContent = Instance.new("ScrollingFrame")
detailsContent.Name = "DetailsContent"
detailsContent.Size = UDim2.new(1, 0, 1, -32)
detailsContent.Position = UDim2.new(0, 0, 0, 32)
detailsContent.BackgroundTransparency = 1
detailsContent.BorderSizePixel = 0
detailsContent.ScrollBarThickness = 3
detailsContent.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
detailsContent.Parent = detailsPanel

local defaultMessage = Instance.new("TextLabel")
defaultMessage.Name = "DefaultMessage"
defaultMessage.Size = UDim2.new(1, -20, 0, 80)
defaultMessage.Position = UDim2.new(0, 10, 0, 50)
defaultMessage.BackgroundTransparency = 1
defaultMessage.Text = "Click 'Scan Events' to search the game for RemoteEvent/RemoteFunction/BindableEvent/BindableFunction instances bru."
defaultMessage.TextColor3 = Color3.fromRGB(120, 120, 120)
defaultMessage.TextSize = 14
defaultMessage.TextWrapped = true
defaultMessage.Font = Enum.Font.RobotoMono
defaultMessage.Parent = detailsContent

local confirmDialog = Instance.new("Frame")
confirmDialog.Name = "ConfirmDialog"
confirmDialog.Size = UDim2.new(0, 300, 0, 150)
confirmDialog.Position = UDim2.new(0.5, -150, 0.5, -75)
confirmDialog.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
confirmDialog.BorderSizePixel = 0
confirmDialog.Visible = false
confirmDialog.Parent = screenGui
confirmDialog.ZIndex = 200

local confirmText = Instance.new("TextLabel")
confirmText.Size = UDim2.new(1, 0, 0.6, 0)
confirmText.BackgroundTransparency = 1
confirmText.Text = "Do you want to permanently close the menu?"
confirmText.TextColor3 = Color3.fromRGB(200, 200, 200)
confirmText.TextSize = 14
confirmText.Font = Enum.Font.RobotoMono
confirmText.TextWrapped = true
confirmText.Parent = confirmDialog

local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0.5, 0, 0.4, 0)
yesButton.Position = UDim2.new(0, 0, 0.6, 0)
yesButton.BackgroundColor3 = Color3.fromRGB(220, 60, 40)
yesButton.Text = "Yes"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextSize = 14
yesButton.Font = Enum.Font.RobotoMono
yesButton.Parent = confirmDialog

local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0.5, 0, 0.4, 0)
noButton.Position = UDim2.new(0.5, 0, 0.6, 0)
noButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noButton.Text = "No"
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.TextSize = 14
noButton.Font = Enum.Font.RobotoMono
noButton.Parent = confirmDialog

local resizeHandle = Instance.new("Frame")
resizeHandle.Name = "ResizeHandle"
resizeHandle.Size = UDim2.new(0, 20, 0, 20)
resizeHandle.AnchorPoint = Vector2.new(1, 1)
resizeHandle.Position = UDim2.new(1, 0, 1, 0)
resizeHandle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
resizeHandle.Parent = mainFrame

local ALLOWED_CLASSES = {
    ["RemoteEvent"] = true,
    ["RemoteFunction"] = true,
    ["BindableEvent"] = true,
    ["BindableFunction"] = true
}

local nextLayoutOrder = 1
local lastScan = 0

-- notficationnnnn, ultra bad but, works.
local function showNotification(message)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 48)
    notif.Position = UDim2.new(1, 20, 0, 20)
    notif.AnchorPoint = Vector2.new(1, 0)
    notif.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notif.BorderSizePixel = 0
    notif.BackgroundTransparency = 0
    notif.Parent = screenGui
    notif.ZIndex = 50
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, -24, 1, 0)
    txt.Position = UDim2.new(0, 12, 0, 0)
    txt.BackgroundTransparency = 1
    txt.Text = message
    txt.TextColor3 = Color3.fromRGB(240, 240, 240)
    txt.TextSize = 14
    txt.Font = Enum.Font.RobotoMono
    txt.TextWrapped = true
    txt.ZIndex = 51
    txt.Parent = notif
    TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0, 20)}):Play()
    task.delay(3, function()
        TweenService:Create(notif, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 20, 0, 20), BackgroundTransparency = 1}):Play()
        task.delay(0.45, function() notif:Destroy() end)
    end)
end

local function getIconForObject(obj)
    local id = ICONS[obj.ClassName] or ICONS.Folder
    if typeof(id) ~= "string" or #id < 5 then
        return ICONS.Folder
    end
    return id
end

local function clearExplorerList()
    for _, child in pairs(explorerScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    nextLayoutOrder = 1
end

local function createSection(title)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 26)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.LayoutOrder = nextLayoutOrder
    nextLayoutOrder = nextLayoutOrder + 1
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -12, 1, 0)
    label.Position = UDim2.new(0, 6, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 13
    label.Font = Enum.Font.RobotoMono
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    frame.Parent = explorerScroll
    return frame
end

local function showRemoteDetails(remoteObj)
    currentSelected = remoteObj
    for _, child in pairs(detailsContent:GetChildren()) do
        if child.Name ~= "DefaultMessage" then
            child:Destroy()
        end
    end
    defaultMessage.Visible = false
    if remoteObj:IsA("RemoteEvent") or remoteObj:IsA("BindableEvent") then
        fireButton.Visible = true
    else
        fireButton.Visible = false
    end
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = detailsContent
    local function createDetailItem(title, value, layoutOrder, color)
        local item = Instance.new("Frame")
        item.Name = title
        item.Size = UDim2.new(1, -20, 0, 52)
        item.Position = UDim2.new(0, 10, 0, 0)
        item.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
        item.BorderSizePixel = 0
        item.LayoutOrder = layoutOrder
        item.Parent = detailsContent
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -16, 0.35, 0)
        titleLabel.Position = UDim2.new(0, 8, 0, 6)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = title
        titleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.TextSize = 11
        titleLabel.Font = Enum.Font.RobotoMono
        titleLabel.Parent = item
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(1, -16, 0.65, -6)
        valueLabel.Position = UDim2.new(0, 8, 0.35, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = tostring(value)
        valueLabel.TextColor3 = color or Color3.fromRGB(255, 255, 255)
        valueLabel.TextXAlignment = Enum.TextXAlignment.Left
        valueLabel.TextSize = 13
        valueLabel.Font = Enum.Font.RobotoMono
        valueLabel.TextWrapped = true
        valueLabel.Parent = item
    end
    createDetailItem("Name", remoteObj.Name, 1)
    createDetailItem("ClassName", remoteObj.ClassName, 2, Color3.fromRGB(100, 200, 255))
    createDetailItem("FullName", remoteObj:GetFullName(), 3)
    createDetailItem("Parent", remoteObj.Parent and remoteObj.Parent:GetFullName() or "nil", 4)
    createDetailItem("Archivable", remoteObj.Archivable, 5, Color3.fromRGB(100, 255, 100))
    createDetailItem("Attributes", #remoteObj:GetAttributes(), 6)
    createDetailItem("Tags", table.concat(remoteObj:GetTags(), ", "), 7)
    detailsContent.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
end

local function createListItem(parent, obj)
    local item = Instance.new("Frame")
    item.Name = obj:GetFullName()
    item.Size = UDim2.new(1, 0, 0, 28)
    item.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    item.BackgroundTransparency = 1
    item.BorderSizePixel = 0
    item.LayoutOrder = nextLayoutOrder
    nextLayoutOrder = nextLayoutOrder + 1
    item.Parent = parent
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = item

    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = getIconForObject(obj)
    icon.ImageColor3 = Color3.fromRGB(200, 200, 200)
    icon.ScaleType = Enum.ScaleType.Fit
    icon.ZIndex = 2
    icon.Parent = item

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -48, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = obj.Name .. "  [" .. obj.ClassName .. "]"
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextSize = 13
    label.Font = Enum.Font.RobotoMono
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.ZIndex = 2
    label.Parent = item

    btn.MouseEnter:Connect(function()
        item.BackgroundTransparency = 0.85
        item.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
        icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)
    btn.MouseLeave:Connect(function()
        item.BackgroundTransparency = 1
        icon.ImageColor3 = Color3.fromRGB(200, 200, 200)
    end)
    btn.MouseButton1Click:Connect(function()
        showRemoteDetails(obj)
    end)
    return item
end

local function populateExplorer(buckets)
    clearExplorerList()
    if #buckets.RemoteEvent > 0 then
        createSection("RemoteEvent")
        for _, obj in ipairs(buckets.RemoteEvent) do
            if table.find(filteredList, obj) then createListItem(explorerScroll, obj) end
        end
    end
    if #buckets.RemoteFunction > 0 then
        createSection("RemoteFunction")
        for _, obj in ipairs(buckets.RemoteFunction) do
            if table.find(filteredList, obj) then createListItem(explorerScroll, obj) end
        end
    end
    if #buckets.BindableEvent > 0 then
        createSection("BindableEvent")
        for _, obj in ipairs(buckets.BindableEvent) do
            if table.find(filteredList, obj) then createListItem(explorerScroll, obj) end
        end
    end
    if #buckets.BindableFunction > 0 then
        createSection("BindableFunction")
        for _, obj in ipairs(buckets.BindableFunction) do
            if table.find(filteredList, obj) then createListItem(explorerScroll, obj) end
        end
    end
    explorerScroll.CanvasSize = UDim2.new(0, 0, 0, explorerLayout.AbsoluteContentSize.Y + 8)
end

local function filterEvents(query)
    query = (query == "Search events..." and "") or (query or "")
    filteredList = {}
    for _, obj in ipairs(eventsList) do
        if obj.Name:lower():find(query:lower()) or obj.ClassName:lower():find(query:lower()) or obj:GetFullName():lower():find(query:lower()) then
            table.insert(filteredList, obj)
        end
    end
    local buckets = {
        RemoteEvent = {},
        RemoteFunction = {},
        BindableEvent = {},
        BindableFunction = {}
    }
    for _, obj in ipairs(filteredList) do
        table.insert(buckets[obj.ClassName], obj)
    end
    for className, list in pairs(buckets) do
        table.sort(list, function(a, b) return a:GetFullName():lower() < b:GetFullName():lower() end)
    end
    explorerCount.Text = #filteredList .. " found"
    populateExplorer(buckets)
end

local function scanEvents()
    if #eventsList > 0 then
        showNotification("already loaded")
        return
    end
    if tick() - lastScan < 0.6 then return end
    lastScan = tick()
    defaultMessage.Visible = false
    clearExplorerList()
    eventsList = {}
    local buckets = {
        RemoteEvent = {},
        RemoteFunction = {},
        BindableEvent = {},
        BindableFunction = {}
    }
    for _, inst in ipairs(game:GetDescendants()) do
        if ALLOWED_CLASSES[inst.ClassName] then
            table.insert(buckets[inst.ClassName], inst)
            table.insert(eventsList, inst)
        end
    end
    for className, list in pairs(buckets) do
        table.sort(list, function(a, b) return a:GetFullName():lower() < b:GetFullName():lower() end)
    end
    explorerCount.Text = tostring(#eventsList) .. " found"
    filteredList = eventsList
    filterEvents("")
    isVisible = true
    mainFrame.Visible = true
    mainFrame.Size = defaultSize
end

local function toggleVisibility()
    isVisible = not isVisible
    mainFrame.Visible = isVisible
    if isVisible then
        mainFrame.Size = defaultSize
    end
end

-- Boettttoons
scanButton.MouseButton1Click:Connect(scanEvents)
refreshButton.MouseButton1Click:Connect(scanEvents)

fireButton.MouseButton1Click:Connect(function()
    if currentSelected and (currentSelected:IsA("RemoteEvent") or currentSelected:IsA("BindableEvent")) then
        if currentSelected:IsA("RemoteEvent") then
            local ok = pcall(function() currentSelected:FireServer() end)
            if ok then showNotification("Fired RemoteEvent: "..currentSelected.Name) end
        elseif currentSelected:IsA("BindableEvent") then
            local ok = pcall(function() currentSelected:Fire() end)
            if ok then showNotification("Fired BindableEvent: "..currentSelected.Name) end
        end
    end
end)

closeButton.MouseButton1Click:Connect(function()
    confirmDialog.Visible = true
end)

yesButton.MouseButton1Click:Connect(function()
    confirmDialog.Visible = false
    screenGui:Destroy()
end)

noButton.MouseButton1Click:Connect(function()
    confirmDialog.Visible = false
end)

-- the little search bar
searchBar.Focused:Connect(function()
    if searchBar.Text == "Search events..." then
        searchBar.Text = ""
        searchBar.TextColor3 = Color3.fromRGB(220, 220, 220)
    end
end)
searchBar.FocusLost:Connect(function()
    if searchBar.Text == "" then
        searchBar.Text = "Search events..."
        searchBar.TextColor3 = Color3.fromRGB(140, 140, 140)
    end
    filterEvents(searchBar.Text == "Search events..." and "" or searchBar.Text)
end)
searchBar.Changed:Connect(function(prop)
    if prop == "Text" then
        if searchBar.Text ~= "Search events..." then
            filterEvents(searchBar.Text)
        end
    end
end)

local dragging = false
local dragStart = nil
local startPos = nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

local resizing = false
local resizeStart = nil
local startSize = nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
        resizeStart = input.Position
        startSize = mainFrame.Size
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - resizeStart
        local newSizeX = math.clamp(startSize.X.Offset + delta.X, 400, 1200)
        local newSizeY = math.clamp(startSize.Y.Offset + delta.Y, 300, 900)
        mainFrame.Size = UDim2.new(0, newSizeX, 0, newSizeY)
        explorerPanel.Size = UDim2.new(0.4, -1, 1, 0)
        detailsPanel.Size = UDim2.new(0.6, -2, 1, 0)
        separator.Position = UDim2.new(0.4, 0, 0, 0)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = false
    end
end)

-- menu toggle thing
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == toggleKey then
        toggleVisibility()
    end
end)

defaultMessage.Visible = true
fireButton.Visible = false
explorerCount.Text = "0 found"
mainFrame.Visible = true
