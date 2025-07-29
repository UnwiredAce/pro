local typing = false
local printedCommand = ""
local savedCommands = {}

local yOffset = 10
function love.load()
    inputText = ""
    love.keyboard.setKeyRepeat(true)
end

function love.textinput(t)
    inputText = inputText .. t
end

function love.keypressed(key)
    if key == "backspace" then
        inputText = string.sub(inputText, 1, 0)
        printedCommand = string.sub(printedCommand, 1, 0)
    elseif key == "space" then
        typing = true
    elseif key == "return" then
        typing = false
        printedCommand = inputText
        yOffset = yOffset + 20
        table.insert(savedCommands, printedCommand)
        print("User typed: " .. inputText)
    end
end

function love.draw()
    love.graphics.print("Command:", 10, 10)
    love.graphics.print("Printed - Command:" .. printedCommand, 10, 30)
        love.graphics.print(printedCommand, 400, yOffset)
    if not typing then
        love.graphics.print("Waiting for commands", 80, 10)
    else
        love.graphics.print(inputText, 80, 10)
    end
end