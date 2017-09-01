
Rectangle = {}
Rectangle.__index = Rectangle

function Rectangle:create(size, color, thickness)
    --rectangle class to use as Rectangle
    local rctngl = {}
    setmetatable(rctngl, Rectangle)
    rctngl.size = size
    rctngl.color = color
    rctngl.thickness = thickness
    rctngl.x = 0
    rctngl.y = 0
    rctngl.vertex1 = {rctngl.x, rctngl.y, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--TopLeftOutside
    rctngl.vertex2 = {rctngl.x + rctngl.size.x, rctngl.y, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--TopRightOutside
    rctngl.vertex3 = {rctngl.x + rctngl.size.x, rctngl.y + rctngl.size.y, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--BottomRightOutside
    rctngl.vertex4 = {rctngl.x, rctngl.y + rctngl.size.y, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--BottomLeftOutside
    rctngl.vertex5 = {rctngl.x + rctngl.thickness, rctngl.y + rctngl.thickness, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--TopLeftInside
    rctngl.vertex6 = {rctngl.x + rctngl.size.x - rctngl.thickness, rctngl.y + rctngl.thickness, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--TopRightInside
    rctngl.vertex7 = {rctngl.x + rctngl.size.x - rctngl.thickness, rctngl.y + rctngl.size.y - rctngl.thickness, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--BottomRightInside
    rctngl.vertex8 = {rctngl.x + rctngl.thickness, rctngl.y + rctngl.size.y - rctngl.thickness, 0, 0, rctngl.color.red, rctngl.color.green, rctngl.color.blue, rctngl.color.alpha}--BottomLeftInside    
    rctngl.verticies = {rctngl.vertex1, rctngl.vertex2, rctngl.vertex5,
    rctngl.vertex2, rctngl.vertex5, rctngl.vertex6,
    rctngl.vertex2, rctngl.vertex3, rctngl.vertex6,
    rctngl.vertex3, rctngl.vertex6, rctngl.vertex7,
    rctngl.vertex3, rctngl.vertex4, rctngl.vertex7,
    rctngl.vertex4, rctngl.vertex7, rctngl.vertex8,
    rctngl.vertex4, rctngl.vertex5, rctngl.vertex8,
    rctngl.vertex4, rctngl.vertex5, rctngl.vertex1
    } 
    rctngl.mesh = love.graphics.newMesh(rctngl.verticies, "triangles", "dynamic")
    
    return rctngl
end

function Rectangle:setSize(size)
    self.size = size    
    self.vertex1 = {self.x, self.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopLeftOutside
    self.vertex2 = {self.x + self.size.x, self.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopRightOutside
    self.vertex3 = {self.x + self.size.x, self.y + self.size.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomRightOutside
    self.vertex4 = {self.x, self.y + self.size.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomLeftOutside
    self.vertex5 = {self.x + self.thickness, self.y + self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopLeftInside
    self.vertex6 = {self.x + self.size.x - self.thickness, self.y + self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopRightInside
    self.vertex7 = {self.x + self.size.x - self.thickness, self.y + self.size.y - self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomRightInside
    self.vertex8 = {self.x + self.thickness, self.y + self.size.y - self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomLeftInside    
    self.verticies = {self.vertex1, self.vertex2, self.vertex5,
    self.vertex2, self.vertex5, self.vertex6,
    self.vertex2, self.vertex3, self.vertex6,
    self.vertex3, self.vertex6, self.vertex7,
    self.vertex3, self.vertex4, self.vertex7,
    self.vertex4, self.vertex7, self.vertex8,
    self.vertex4, self.vertex5, self.vertex8,
    self.vertex4, self.vertex5, self.vertex1
    }
    self.mesh:setVertices(self.verticies, 1)
    self:draw()
end

function Rectangle:setThickness(thickness)
    self.thickness = thickness
    self:setSize(self.size)
    self:draw()
end

function Rectangle:setColor(color)
    self.color = color
    for i = 1, self.mesh:getVertexCount() do
        self.mesh:setVertexAttribute(i, 3, self.color.red, self.color.green, self.color.blue, self.color.alpha)
    end 
    self:draw()
end

function Rectangle:setColor2(red, green, blue)
    self.color.red = red
    self.color.green = green
    self.color.blue = blue
    for i = 1, self.mesh:getVertexCount() do
        self.mesh:setVertexAttribute(i, 3, self.color.red, self.color.green, self.color.blue, self.color.alpha)
    end
    self:draw()
end

function Rectangle:setAlpha(alpha)
    self.color.alpha = alpha
    self:setColor(self.color)
    self:draw()
end 

function Rectangle:moveTo(x,y)
    self.x = x
    self.y = y
    self.vertex1 = {self.x, self.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopLeftOutside
    self.vertex2 = {self.x + self.size.x, self.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopRightOutside
    self.vertex3 = {self.x + self.size.x, self.y + self.size.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomRightOutside
    self.vertex4 = {self.x, self.y + self.size.y, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomLeftOutside
    self.vertex5 = {self.x + self.thickness, self.y + self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopLeftInside
    self.vertex6 = {self.x + self.size.x - self.thickness, self.y + self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--TopRightInside
    self.vertex7 = {self.x + self.size.x - self.thickness, self.y + self.size.y - self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomRightInside
    self.vertex8 = {self.x + self.thickness, self.y + self.size.y - self.thickness, 0, 0, self.color.red, self.color.green, self.color.blue, self.color.alpha}--BottomLeftInside    
    self.verticies = {self.vertex1, self.vertex2, self.vertex5,
    self.vertex2, self.vertex5, self.vertex6,
    self.vertex2, self.vertex3, self.vertex6,
    self.vertex3, self.vertex6, self.vertex7,
    self.vertex3, self.vertex4, self.vertex7,
    self.vertex4, self.vertex7, self.vertex8,
    self.vertex4, self.vertex5, self.vertex8,
    self.vertex4, self.vertex5, self.vertex1
    }
    self.mesh:setVertices(self.verticies, 1)
    self:draw()
end

function Rectangle:draw()
    love.graphics.draw(self.mesh,self.x,self.y)
end
