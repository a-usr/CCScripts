local front = peripheral.wrap("front")
local back = peripheral.wrap("back")
local monitors = {peripheral.find("monitor") }
local FrLprev = 0
local FrRprev = 0
local BLprev = 0
local BRprev = 0
while true do
    local DTilt = front.getAnalogInput("front")
    local UTilt = back.getAnalogInput("front")
    local LTwist = front.getAnalogInput("top")
    local RTwist = back.getAnalogInput("top")
    FrL = (DTilt-LTwist)+(RTwist-UTilt)
    FrR = (DTilt-RTwist)+(LTwist-UTilt)
    BL = (UTilt-LTwist)+(RTwist-DTilt)
    BR = (UTilt-RTwist)+(LTwist-DTilt)
    if not (FrL == FrLprev) then
        FrLprev = FrL
        front.setAnalogOutput("left", FrL)
    end
    if not (FrR == FrRprev) then
        FrRprev = FrR
        front.setAnalogOutput("right", FrR)
    end
    if not (BL == BLprev) then
        BLprev = BL
        back.setAnalogOutput("left", BL)
    end
    if not( BR == BRprev) then
        BRprev = BR
        back.setAnalogOutput("right", BR)
    end
    -- os.pullEvent("redstone") --
end
