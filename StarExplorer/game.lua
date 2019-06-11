
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )

-- Configure image sheet
local sheetOptions =
{
    frames =
    {
        {   -- 1) asteroid 1
            x = 0,
            y = 0,
            width = 102,
            height = 85
        },
        {   -- 2) asteroid 2
            x = 0,
            y = 85,
            width = 90,
            height = 83
        },
        {   -- 3) asteroid 3
            x = 0,
            y = 168,
            width = 100,
            height = 97
        },
        {   -- 4) ship
            x = 0,
            y = 265,
            width = 98,
            height = 79
        },
        {   -- 5) laser
            x = 98,
            y = 265,
            width = 14,
            height = 40
        },
    }
}
local objectSheet = graphics.newImageSheet( "images/gameObjects.png", sheetOptions )

-- Initialize variables
local lives = 3
local score = 0
local died = false

local asteroidsTable = {}

local ship
local gameLoopTimer
local livesText
local scoreText

local backGroup
local mainGroup
local uiGroup


local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end


local function createAsteroid()

   local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
   table.insert( asteroidsTable, newAsteroid )
   physics.addBody( newAsteroid, "dynamic", { radius=40, bounce=0.8 } )
   newAsteroid.myName = "asteroid"

   local whereFrom = math.random( 3 )

   if ( whereFrom == 1 ) then
       -- From the left
       newAsteroid.x = -60
       newAsteroid.y = math.random( 500 )
       newAsteroid:setLinearVelocity( math.random( 40,120 ), math.random( 20,60 ) )
   elseif ( whereFrom == 2 ) then
       -- From the top
       newAsteroid.x = math.random( display.contentWidth )
       newAsteroid.y = -60
       newAsteroid:setLinearVelocity( math.random( -40,40 ), math.random( 40,120 ) )
   elseif ( whereFrom == 3 ) then
       -- From the right
       newAsteroid.x = display.contentWidth + 60
       newAsteroid.y = math.random( 500 )
       newAsteroid:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
   end

   newAsteroid:applyTorque( math.random( -6,6 ) )
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
