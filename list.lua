-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )

local json = require( "json" )
local loadsave = require( "loadsave" )

local taxiTable = {}
taxiTable[1] = {location="TP.HCM", brand="Vina Sun", phone="838272727", subtitle="Vinasun Coporation", image="taxiLogos/vinasun.png"}
taxiTable[2] = {location="TP.HCM", brand="Mai Linh", phone="838383838", subtitle="Mai Linh Corporation", image="taxiLogos/mailinh.png"}
taxiTable[3] = {location="TP.HCM", brand="Example", phone="838454545", subtitle="Festival Coporation", image="taxiLogos/vinasun.png"}

loadsave.saveTable(taxiTable, "taxiTable.json")

local function onRowRender( event )

   --Set up the localized variables to be passed via the event table

   local row = event.row
   local id = row.index
   local params = event.row.params

   row.bg = display.newRect( 0, 0, display.contentWidth, 60 )
   row.bg.anchorX = 0
   row.bg.anchorY = 0
   row.bg:setFillColor( 1, 1, 1 )
   row:insert( row.bg )

   if ( event.row.params ) then    
      row.brandText = display.newText( params.brand, 12, 0, native.systemFontBold, 18 )
      row.brandText.anchorX = 0
      row.brandText.anchorY = 0.5
      row.brandText:setFillColor( 0 )
      row.brandText.y = 20
      row.brandText.x = 42

      row.phoneText = display.newText( params.phone, 12, 0, native.systemFont, 18 )
      row.phoneText.anchorX = 0
      row.phoneText.anchorY = 0.5
      row.phoneText:setFillColor( 0.5 )
      row.phoneText.y = 40
      row.phoneText.x = 42

      row.image = display.newImageRect( params.image, 15 , 40, 5 )
      row.image.x = display.contentWidth - 20
      row.image.y = row.height / 2

      row:insert( row.brandText )
      row:insert( row.phoneText )
      row:insert( row.image )
   end
   return true
end

local navBarHeight = 60
local tabBarHeight = 50
local myList = widget.newTableView {
   top = navBarHeight, 
   width = display.contentWidth, 
   height = display.contentHeight - navBarHeight - tabBarHeight,
   onRowRender = onRowRender,
   onRowTouch = onRowTouch,
   listener = scrollListener
}

for i = 1, #taxiTable do
   myList:insertRow{
      rowHeight = 60,
      isCategory = false,
      rowColor = { 1, 1, 1 },
      lineColor = { 0.90, 0.90, 0.90 },
      params = {
        brand = taxiTable[i].brand,
        phone = taxiTable[i].phone,
        image = taxiTable[i].image
      }
   }
end

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	local bg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	bg.anchorX = 0
	bg.anchorY = 0
	bg:setFillColor( 1 )	-- white
	
	-- create some text
	local title = display.newText( "Second View", 0, 0, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black
	title.x = display.contentWidth * 0.5
	title.y = 125
	
	local newTextParams = { text = "Loaded by the second tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
							x = 0, y = 0, 
							width = 310, height = 310, 
							font = native.systemFont, fontSize = 14, 
							align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black
	summary.x = display.contentWidth * 0.5 + 10
	summary.y = title.y + 215
	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

