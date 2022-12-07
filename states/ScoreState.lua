local bronze = love.graphics.newImage('images/bronze.png')
local silver = love.graphics.newImage('images/silver.png')
local gold = love.graphics.newImage('images/gold.png')



ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
    if self.score < 5 then
        love.graphics.draw(bronze,100,100,0,0.5,0.5)
        love.graphics.draw(bronze,350,100,0,0.5,0.5) 
    elseif self.score >=5 and self.score <10 then
        love.graphics.draw(silver,100,100,0,0.5,0.5)
        love.graphics.draw(silver,350,100,0,0.5,0.5) 
    else
        love.graphics.draw(gold,100,100,0,0.5,0.5)
        love.graphics.draw(gold,350,100,0,0.5,0.5) 
    end
      

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end