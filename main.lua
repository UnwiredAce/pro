local commands = {"search","help","inventory"}
local scriptCommand = "No command"

local typing = false

local function scripting()
    if typing then
        
    end
end
function love.load()
    
end

function love.update(dt)
    if love.keyboard.isDown('space') and not typing then
        scriptCommand = "Waiting for command"
        typing = true
    end
    if love.keyboard.isDown('escape') and typing then
        typing = false
        scriptCommand = "No command"
    end
    scripting()
end

function love.draw()
    love.graphics.print("Command: " .. scriptCommand)
end