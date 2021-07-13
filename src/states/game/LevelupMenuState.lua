

LevelupMenuState = Class{__includes = BaseState}

function LevelupMenuState:init(onClose)
    -- todo pass in the values that I need to display or are they global?
    
    -- todo see BattleMessageState and BattleMenuState for more as needed, this is a hybrid of the two
    self.onClose = onClose or function() end

    -- todo
    self.levelMenu = Menu {
        cursor = false,
        font = "medium",
        x = VIRTUAL_WIDTH - 128,
        y = VIRTUAL_HEIGHT - 200,
        width = 128,
        height = 128,
        items = {
            {
                text = 'test',
            },
            {
                text = 'test',
            },
            {
                text = 'test2',
            }
        }
    }
end

function LevelupMenuState:update(dt)
    self.levelMenu:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    
        gStateStack:pop()
        self.onClose()
    
    end

end

function LevelupMenuState:render()
    self.levelMenu:render()
end