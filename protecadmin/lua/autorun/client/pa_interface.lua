--Creatin' that ghey font
resource.AddFile("resouce/fonts/CaviarDreams_Bold.ttf")
surface.CreateFont( "Protec", {
	font = "Caviar Dreams Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 15,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ProtecMenu()

	--outside area
	local OutsideArea = vgui.Create("DPanel")
	OutsideArea:SetPos(0,0)
	OutsideArea:SetSize(ScrW(),ScrH())
	OutsideArea:SetAlpha(0)
	function OutsideArea:OnMouseReleased()
		OutsideArea:Remove()
		BASE:Close()

	end

	--BASE WINDOW
	local w = 1200
	local h = 860
	BASE = vgui.Create("DFrame")
	BASE:SetSize(w,h)
	BASE:SetAlpha(0)
	BASE:AlphaTo(255,0.2,0)
	BASE:Center()
	BASE:SetDraggable(false)
	BASE:MakePopup(true)
	BASE:SetTitle("")
	BASE:SetVisible(true)
	BASE:ShowCloseButton(false)
	BASE:SetDeleteOnClose(true)
	function BASE:Paint()
		Derma_DrawBackgroundBlur( self, self.startTime )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 255,255,255) )
		draw.RoundedBox(0,0,h-20,w,20,Color(0,87,157))
		draw.DrawText("PROTEC ADMIN MENU 0.1","Protec", 80, h-17, Color(255,255,255, 255),1)
	end
	--END BASE WINDOW

	--START FUNCTION BUTTONS (ON LEFT)
	local ItemsPanel = vgui.Create( "DScrollPanel", BASE )
	ItemsPanel:SetSize( 143, h-20 )
	ItemsPanel:SetPos( 0, 0 )
	local VBar = ItemsPanel:GetVBar()
	function VBar:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, 1, h, Color( 233, 232, 240, 255 ) )
	end
	function VBar.btnUp:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, 1, h, Color( 233, 232, 240, 255 ) )
		--draw.RoundedBox( 0, 0, 0, 1, h, Color( 191, 191, 191, 255) )
	end
	function VBar.btnDown:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, 1, h, Color( 233, 232, 240, 255 ) )
	end
	function VBar.btnGrip:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, 1, h, Color( 233, 232, 240, 255 ) )
	end

	--protec buttons
	local ProtecIconSel={}
	ProtecIconSel[1] = Material("materials/Manage Players/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[2] = Material("materials/Ban List/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[3] = Material("materials/Command List/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[4] = Material("materials/Plugins/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[5] = Material("materials/Ranks/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[6] = Material("materials/Reports/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[7] = Material("materials/Prop Protection/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[8] = Material("materials/Sandbox Settings/_selected_1.png", "no-clamp smooth")
	ProtecIconSel[9] = Material("materials/ProTec Settings/_selected_1.png", "no-clamp smooth")
	local ProtecIconDe={}
	ProtecIconDe[1] = Material("materials/Manage Players/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[2] = Material("materials/Ban List/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[3] = Material("materials/Command List/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[4] = Material("materials/Plugins/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[5] = Material("materials/Ranks/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[6] = Material("materials/Reports/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[7] = Material("materials/Prop Protection/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[8] = Material("materials/Sandbox Settings/_deselected_1.png", "no-clamp smooth")
	ProtecIconDe[9] = Material("materials/ProTec Settings/_deselected_1.png", "no-clamp smooth")

	local ProtecItems={}
	ProtecItems[1]="Manage Players"
	ProtecItems[2]="Ban List"
	ProtecItems[3]="Command List"
	ProtecItems[4]="Plugins"
	ProtecItems[5]="Ranks"
	ProtecItems[6]="Reports"
	ProtecItems[7]="Prop Protection"
	ProtecItems[8]="Sandbox Settings"
	ProtecItems[9]="ProTec Settings"

	-- for k,v in pairs(ProtecItems) do
	-- 	local ProtecItem = vgui.Create("DButton",ItemsPanel)
	-- 	ProtecItem:SetSize(128,128)
	-- 	ProtecItem:SetText("")
	-- 	ProtecItem:SetPos(0,ProtecItem:GetTall()*k-128)


	-- 	local IconSelect = ProtecIconSel[k]
	-- 	local ColSelect = Color(233,232,240,255)
	-- 	local IconDeselect = ProtecIconDe[k]
	-- 	local ColDeselect = Color(255,255,255,255)

	-- 	ProtecItem.Icon = IconDeselect
	-- 	ProtecItem.Col = ColDeselect
	-- 	ProtecItem:SetToggle(false)

	-- 	function ProtecItem:Paint()
	-- 		ProtecItem.DoClick = function(self)
	-- 			print("Clicked "..v)
	-- 			if IsValid(CurButton) and CurButton!=self then
	-- 				CurButton = self
	-- 				print(CurButton)
	-- 				self:SetToggle(false)
	-- 				self.Col =  ColDeselect
	-- 				self.Icon = IconDeselect
	-- 			elseif(!IsValid(CurButton)) then 
	-- 				CurButton = self
	-- 				print(CurButton)
	-- 				self:SetToggle(true)
	-- 				self.Col = ColSelect
	-- 				self.Icon = IconSelect
	-- 			end
	-- 		end

	-- 		draw.RoundedBox(0,0,0,128,128,Color(191,191,191,255))--outline
	-- 		draw.RoundedBox(0,0,1,128,126,ProtecItem.Col)

	-- 		surface.SetDrawColor(ProtecItem.Col)
	-- 		surface.SetMaterial(ProtecItem.Icon)
	-- 		surface.DrawTexturedRect(32-4,32-4,64-6,64-6)
	-- 		draw.SimpleText(v,"Protec",5,105,Color( 50, 50, 50, 255 ),0,0)
	-- 	end
	-- end

	for k,v in pairs(ProtecItems) do
		local ProtecItem = vgui.Create("DCheckBox",ItemsPanel)
		ProtecItem:SetSize(128,128)
		ProtecItem:SetPos(0,ProtecItem:GetTall()*k-128)


		local IconSelect = ProtecIconSel[k]
		local ColSelect = Color(233,232,240,255)
		local IconDeselect = ProtecIconDe[k]
		local ColDeselect = Color(255,255,255,255)

		ProtecItem.Icon = IconDeselect
		ProtecItem.Col = ColDeselect
		ProtecItem:SetChecked(true)
		function ProtecItem:OnChange(bVal)
			if (bVal) then
				self.Col =  ColDeselect
				self.Icon = IconDeselect
			else
				self.Col = ColSelect
				self.Icon = IconSelect
			end
		end

		function ProtecItem:Paint()
			draw.RoundedBox(0,0,0,128,128,Color(191,191,191,255))--outline
			draw.RoundedBox(0,0,1,128,126,ProtecItem.Col)

			surface.SetDrawColor(ProtecItem.Col)
			surface.SetMaterial(ProtecItem.Icon)
			surface.DrawTexturedRect(32-4,32-4,64-6,64-6)
			draw.SimpleText(v,"Protec",5,105,Color( 50, 50, 50, 255 ),0,0)
		end
	end


	--START PANELS
	--parent panel for the children
	local PPANEL = vgui.Create("DPanel",BASE)
	PPANEL:SetPos(129,0)
	PPANEL:SetSize(BASE:GetWide()-129,840)
	function PPANEL:Paint()
		draw.RoundedBox(0,0,0,BASE:GetWide(),BASE:GetTall()-20,Color(233,232,240,255))
	end
	--end parent panel

	--child panel
	local CPANEL = vgui.Create("DPanel",PPANEL)
	CPANEL:Dock(FILL)
	CPANEL:DockMargin(35,25,25,25)
	function CPANEL:Paint()
		draw.RoundedBox(6,0,0,CPANEL:GetWide(),CPANEL:GetTall(),Color(0,0,0,50))
		draw.RoundedBox(6,1,1,CPANEL:GetWide()-2,CPANEL:GetTall()-2,Color(191,191,191,255))
		draw.RoundedBox(5,2,2,CPANEL:GetWide()-4,CPANEL:GetTall()-4,Color(255,255,255,255))
	end
	--end child panel

	--END PANELS


	--PLAYER LIST UNDER "MANAGE PLAYERS"
	function managePlayers()
		local plyList = vgui.Create( "DListView", CPANEL )
		plyList:SetPos( 5, 16 )
		plyList:SetSize( 245, 300 )
		plyList:SetMultiSelect( false )
		plyList:AddColumn( "#" )--index
		plyList:AddColumn( "PLAYER" )
		--plyList:AddColumn( "RANK" )
		plyList:AddColumn( "STEAMID" )
		plyList:AddColumn( "PING" )
		plyList.m_bHideHeaders = true -- hides the default header

		local plyListIndex = vgui.Create( "DButton", CPANEL ) -- custom header for the DListView
		plyListIndex:SetPos( 5, 0 )
		plyListIndex:SetSize( 245, 16 )
		plyListIndex:SetText( "Players" )
		plyListIndex.DoClick = function()
		    for k, Line in pairs( plyList.Lines ) do -- deselect all lines on click
		        Line:SetSelected( false )
		    end
		end

		function plyListIndex:Paint()
		    draw.RoundedBoxEx( 6, 1, 0, self:GetWide() - 2, self:GetTall(), Color( 45, 45, 46 ), true, true )
		end

		for k, v in pairs( player.GetAll() ) do
			plyList:AddLine(v:EntIndex(),v:Nick(),v:SteamID(),v:Ping())
		end

		function plyList:Paint()
		    draw.RoundedBoxEx( 6, 0, 0, plyList:GetWide(), plyList:GetTall(), Color( 45, 50, 53 ) ) 
		end

		for k, v in pairs( plyList.Lines ) do
		    function v:Paint()
		        if k % 2 == 0 then
		            draw.RoundedBoxEx( 6, 0, 0, plyList:GetWide(), 25, Color( 57, 55, 54 ) ) 
		        else
		            draw.RoundedBoxEx( 6, 0, 0, plyList:GetWide(), 25, Color( 69, 69, 69 ) )
		        end
		    end
		end
	end
	--END PLAYER LIST

	--DRAW CLOSE BUTTON
	local CLOSE = vgui.Create("DButton",BASE)
	CLOSE:SetSize(16,16)
	CLOSE:SetPos((w-CLOSE:GetWide())-5,5)
	CLOSE:SetText("X")
	CLOSE:SetFont("Protec")
	CLOSE:SetTextColor(Color(181,181,181,255))
	CLOSE.m_bSetDisabled = true
	function CLOSE:Paint()
		draw.RoundedBox(6,0,0,16,16,Color(0,0,0,0))
	end
	CLOSE.DoClick = function() 
		BASE:Close()
	end

	--BASE INIT
	function BASE:Init()
		self.startTime = SysTime()
	end
end

--Add the console command to toggle the menu
concommand.Add("pt_menu",ProtecMenu)
--usermessage.Hook("!menu",Menu)
