Player = {}
Player.__index = Player

require "rectangle"
require "imgui"

function Player:create(sprite, name, health, mana, ammo, indicatorsize)
    --generic player class -> init values need to be imported from chummer5
    local plyr = {}
    setmetatable(plyr, Player)
    --add vars here
    plyr.sprite = sprite--[[do the sprites here]]
    plyr.name = name
    plyr.health = health
    plyr.mana = mana
    plyr.ammo = ammo
    --plyr.range = range
    --plyr.speed = speed
    --plyr.initiative = initiative
    plyr.indicatorsize = indicatorsize
    color = {red = 255, green = 255, blue = 255, alpha = 255}
    plyr.indicator = Rectangle:create(plyr.indicatorsize, color, 5)

    return plyr
end

function Player:getHealth()
    return self.health
end

function Player:increaseHealth(heal)
    self.health = self.health + heal
end

function Player:decreaseHealth(damage)
    self.health = self.health - damage
end

function Player:getMana()
    return self.mana
end

function Player:increaseMana(amount)
    self.mana = self.mana + amount
end

function Player:decreaseMana(amount)
    self.mana = self.mana - amount
end

function Player:getAmmo()
    return self.ammo
end

function Player:increaseAmmo(amount)
    self.ammo = self.ammo + amount
end

function Player:decreaseAmmo(amount)
    self.ammo = self.ammo - amount
end

function Player:getName()
    return self.name
end

function Player:moveIndicator()
    x, y = love.mouse.getPosition()
    self.indicator:moveTo(levelValue(x, self.indicator.size.x), levelValue(y, self.indicator.size.y))
end

function Player:draw()
    --draw player sprite
end
--[[
function levelValue(x, y)
    local a = math.floor( x/2 )
    local b = math.floor( y/2 )
    if a % b ~=  0 then
        local fac = a % b
        print("LevelValue:\t", a-fac)
        return a - fac
    else
        print("LevelValue:\t", a)
        return a
    end
end
]]
----[[
function levelValue(x, y) --props to grump from love2dforums 
	return math.floor(x / math.max(1, y)) * 32;
end
--]]
---------------------------------------------IMGUI TESTING---------------------------------------------
function love.textinput(t)
    imgui.TextInput(t)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.keypressed(key)
    imgui.KeyPressed(key)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.keyreleased(key)
    imgui.KeyReleased(key)
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
        if button == 2 then
            if not inmenu then
                inmenu = true
            end
        end
    end
end

function love.mousereleased(x, y, button, istouch)
    imgui.MouseReleased(button)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

--Testing Menus

function imguiMainMenu()
    if imgui.Button("Settings") then
        --get some Settings done and make persistent in conf.lua
    end
    if imgui.Button("Continue") then
        --state = gameState.gameLoop
    end
    if imgui.Button("Exit") then
        --state = gameState.end
    end
end

function imguiContextMenu()
    if imgui.Button("Move") then
        --if destination <= player.speed: [speed = movementrange]
        --move to destination
        --else:
        -- either move as far as possible |or| destination to far away 
    end
    if imgui.Button("Attack") then
        --if attack not aoe:
        --attack entity
        --else:
        --for entity in attack.range
        --attack entity
    end
    if imgui.Button("View Stats") then
        --do some raycastiong to determine targeted object
        --call imguiViewstats(obj)
        --then calls obj.stats functions
        --displays them accordingly
    end
    if imgui.Button("Change Indicator Settings") then
        --state = gameState.indicatorsettings
        --maybee set bool to allow function to be called in love.draw()
        --???
    end
    if imgui.Button("Quit") then
        --call function toi safely quit the game
        --save settings to settings file
        --save stats to chummer 5
        --anything missing????
    end
end

function imguiChangeIndicator()
    local status
    imgui.Text("Change Indicator Properties")
    local r = player1.indicaafelytor.color.red/255
    local g = player1.indicator.color.green/255
    local b = player1.indicator.color.blue/255
    local a = player1.indicator.color.alpha/255
    status, r, g, b, a = imgui.ColorEdit4("Color", r, g, b, a)
    local color = {red = r*255, green = g*255, blue = b*255, alpha = a*255}
    player1.indicator:setColor(color)
    if imgui.Button("confirm") then
        inmenu = false
        --staate = gameState.gameLoop
    end
end

--[[
function love.mousepressed(x, y, button, istouch)
    if button == 2 then
        print("buttonpressed")
        if inmenu then
            inmenu = false
        else
            inmenu = true
        end
    end
end
]]
function love.load(arg)
    inmenu = false
    local size = {x=64, y=64}
    player1 = Player:create("sprite", "name", 100, 100, 25, size)
end

function love.update(dt)
    imgui.NewFrame()
end

function love.draw()

    if inmenu then 
        imguiChangeIndicator()
    end

    imgui.Render()
end


function love.quit()
    imgui.ShutDown()
end