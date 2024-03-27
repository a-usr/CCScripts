local front = peripheral.wrap("front")
local back = peripheral.wrap("back")
local monitors = {peripheral.find("monitor") }
while true do
    local DTilt = front.getAnalogInput("front")
    local UTilt = back.getAnalogInput("front")
    local LTwist = front.getAnalogInput("top")
    local RTwist = back.getAnalogInput("top")
    local monitors = { peripheral.find("monitor") }
    for _, monitor in pairs(monitors) do
        monitor.setCursorPos(0, 0)
        monitor.write("DTilt: ")
        monitor.write(DTilt)
        monitor.setCursorPos(0, 1)
        monitor.write("UTilt: ")
        monitor.write(UTilt)
        monitor.setCursorPos(0, 2)
        monitor.write("LTwist: ")
        monitor.write(LTwist)
        monitor.setCursorPos(0, 3)
        monitor.write("RTwist: ")
        monitor.write(RTwist)
        monitor.setCursorPos(0, 0)
    end
    print("DTilt: ")
    print(DTilt)
    print("UTilt: ")
    print(UTilt)
    print("LTwist: ")
    print(LTwist)
    print("RTwist: ")
    print(RTwist)
    front.setAnalogOutput("left", ((DTilt-LTwist)+(RTwist-UTilt)))
    front.setAnalogOutput("right", ((DTilt-RTwist)+(LTwist-UTilt)))
    back.setAnalogOutput("left", ((UTilt-LTwist)+(RTwist-DTilt)))
    back.setAnalogOutput("right", ((UTilt-RTwist)+(LTwist-DTilt)))
    
end