import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers(doFullFloat,isFullscreen)
import XMonad.Hooks.SetWMName
import qualified XMonad.Actions.FlexibleManipulate as Flex
main = xmonad =<< xmobar (ewmh myConfig)
myConfig = defaultConfig     
        { modMask = mod4Mask
         ,terminal = "terminator"
	 , workspaces = myWorkspaces
	, startupHook =  myStartup
	, handleEventHook = fullscreenEventHook
	, layoutHook = smartBorders $ layoutHook defaultConfig
	, manageHook =  manageHook'
       }
--Workspaces for my computer.
myWorkspaces = ["1:Home" , "2:Web" , "3:Media" , "4:Development" , "5:Steam" , "6:Terminals", "7:File Manager" , "8:IM", "9:Moar" ]

--Startup
myStartup = do
    spawn "bash $HOME/.fehbg"


--window management
manageHook' = composeAll [ isFullscreen		--> doFullFloat
			 , className =? "Steam" --> doShift "5:Steam"
			 , className =? "Steam" --> doFloat
			 , className =? "net-minecraft-MinecraftLauncher" --> doFullFloat
			 , className =? "steam" --> doFullFloat -- bigpicture-mode 
			 , className =? "Geany" --> doShift "4:Development"
			 , className =? "simutrans" --> doFloat
			 , insertPosition Below Newer	
		         ]
