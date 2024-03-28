local front = peripheral.wrap("front")
local back = peripheral.wrap("back")
local FrLprev = 0
local FrRprev = 0
local BLprev = 0
local BRprev = 0
while true do
    local DTilt, UTilt, LTwist, RTwist
    local f1 = function() DTilt = front.getAnalogInput("front") end
    local f2 = function() UTilt = back.getAnalogInput("front") end
    local f3 = function() LTwist = front.getAnalogInput("top") end
    local f4 = function() RTwist = back.getAnalogInput("top") end
    parallel.waitForAll(f1,f2,f3,f4)
    FrL = (DTilt-LTwist)+(RTwist-UTilt)
    FrR = (DTilt-RTwist)+(LTwist-UTilt)
    BL = (UTilt-LTwist)+(RTwist-DTilt)
    BR = (UTilt-RTwist)+(LTwist-DTilt)
    f1 = function()
        if not (FrL == FrLprev) then
            FrLprev = FrL
            front.setAnalogOutput("left", FrL)
        end
    end
    f2 = function()
        if not (FrR == FrRprev) then
            FrRprev = FrR
            front.setAnalogOutput("right", FrR)
        end
    end
    f3 = function()
        if not (BL == BLprev) then
            BLprev = BL
            back.setAnalogOutput("left", BL)
        end
    end
    f4 = function()
        if not( BR == BRprev) then
            BRprev = BR
            back.setAnalogOutput("right", BR)
        end
    end
    parallel.waitForAll(f1,f2,f3,f4)
end