-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect( "images/background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "images/platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight - 25
