    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if not Pos then 
            return 
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
            local PartTele = Instance.new("Part", game.Players.LocalPlayer.Character) -- Create part
            PartTele.Size = Vector3.new(10,1,10)
            PartTele.Name = "PartTele"
            PartTele.Anchored = true
            PartTele.Transparency = 1
            PartTele.CanCollide = true
            PartTele.CFrame = WaitHRP(game.Players.LocalPlayer).CFrame 
            PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                task.wait()
                WaitHRP(game.Players.LocalPlayer).CFrame = PartTele.CFrame
            end)
        end
        local didididididi = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.PartTele, TweenInfo.new(Distance / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Pos})
        didididididi:Play()
        if Distance <= 250 then
                didididididi:Cancel()
                game.Players.LocalPlayer.Character.PartTele.CFrame = Pos
            end
            didididididi:Play()
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not plr.Character:FindFirstChild("HumanoidRootPart") then
                if game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
                    game.Players.LocalPlayer.Character:FindFirstChild("PartTele"):Destroy()
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
                if (plr.Character.HumanoidRootPart.Position - plr.Character:FindFirstChild("PartTele").Position).Magnitude >= 100 then
                    game.Players.LocalPlayer.Character:FindFirstChild("PartTele"):Destroy()
                end
            end
        end)
    end
end)
