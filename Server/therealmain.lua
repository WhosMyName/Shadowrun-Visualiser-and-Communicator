local sti = require "sti"

enttable = {} --table containing all to be drawn entitiys

function love.load()
    sprites = love.graphics.newSpriteBatch(--[[enter file name here]]--[[enter amount of maximum spries here]])
end

function love.update(dt)
end

function love.draw()
    for i=0, #enttable do
        entitiy[1]:draw()
    end
end

---------TODO: Get Inputhandler to work with mouse and gamepad

local state --from http://lua.space/gamedev/handling-input-in-lua

local gameStates = {}

gameStates.menu = {
    keysReleased = {},
    gpButtonsReleased = {},
    bindings = {
        backToGame = function()  state = gameStates.gameLoop  end,
        scrollUp   = function() --[[<...>]] end,
        scrollDown = function() --[[<...>]] end,
        select     = function() --[[<...>]] end,
    },
    keys = {
        escape     = "backToGame",
        up         = "scrollUp",
        down       = "scrollDown",
        ["return"] = "select",
    },
    gpButtonsPressed = {
        back = "backToGame",
        up   = "scrollUp",
        down = "scrollDown",
        a    = "select",
    },
    mouseButtonPressed = {
        --???
    },
    mouseButtonReleased = {

    }
}
gameStates.gameLoop = {
    keysReleased = {},
    gpButtonsReleased = {},
    bindings = {
        openMenu   = function()  state = gameStates.menu  end,
        jump       = function() --[[<...>]] end,
        left       = function() --[[<...>]] end,
        right      = function() --[[<...>]] end,
    },
    keys = {
        escape = "openMenu",
        lshift = "jump",
        left   = "left",
        right  = "right",
    },
    gpButtonsPressed = {
        back    = "openMenu",
        a       = "jump",
        dpleft  = "left",
        dpright = "right",
    }
}

function inputHandler( input )
    local action = state.bindings[input]
    if action then  return action()  end
end

function love.keypressed( k )
    -- you might want to keep track of this to change display prompts
    INPUTMETHOD = "keyboard"
    imgui.KeyPressed(key)
    if not imgui.GetWantCaptureKeyboard() then
        local binding = state.keys[k]
        return inputHandler( binding )
    end
end

function love.keyreleased( k )
    imgui.KeyReleased(key)
    if not imgui.GetWantCaptureKeyboard() then
        local binding = state.keysReleased[k]
        return inputHandler( binding )
    end
end

function love.gamepadpressed( gamepad, button )
    -- you might want to keep track of this to change display prompts
    INPUTMETHOD = "gamepad"
    local binding = state.gpButtonsPressed[button]
    return inputHandler( binding )
end

function love.gamepadreleased( gamepad, button )
    local binding = state.gpButtonsReleased[button]
    return inputHandler( binding )
end

function love.textinput(t)
    imgui.TextInput(t)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.mousemoved(x, y)
    imgui.MouseMoved(x, y)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

function love.mousepressed(x, y, button, istouch)
    imgui.MousePressed(button)
    if not imgui.GetWantCaptureMouse() then
        local binding = state.mouseButtonPressed[button]
        return inputHandler( binding )
    end
end

function love.mousereleased(x, y, button, istouch)
    imgui.MouseReleased(button)
    if not imgui.GetWantCaptureMouse() then
        local binding = state.mouseButtonReleased[button]
        return inputHandler( binding )
    end
end