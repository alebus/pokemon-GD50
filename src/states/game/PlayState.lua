--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.dialogueOpened = false
end

function PlayState:update(dt)
    if not self.dialogueOpened and love.keyboard.wasPressed('p') then
        
        -- debug 
        debugHP = 25
        self.level.player.party.pokemon[1].currentExp = self.level.player.party.pokemon[1].currentExp + 50
        -- heal player pokemon
        gSounds['heal']:play()
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP + debugHP
        
        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has been healed!',
    
        function()
            self.dialogueOpened = false
        end))
    end

    -- todo debug - level up when you press l
    if not self.dialogueOpened and love.keyboard.wasPressed('l') then
        
        -- self.level.player.party.pokemon[1].currentExp = 
        self.level.player.party.pokemon[1]:levelUp()
        print("debug: level up player")
        --print_r(self.level.player.party.pokemon[1])
        
    end


    self.level:update(dt)
end

function PlayState:render()
    self.level:render()
end