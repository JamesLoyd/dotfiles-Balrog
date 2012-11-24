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
main = xmonad =<< xmobar  myConfig
myConfig = defaultConfig     
        { modMask = mod4Mask
         ,terminal = "terminator"
	 , workspaces = myWorkspaces
	, startupHook =  myStartup
	, handleEventHook = fullscreenEventHook
	, layoutHook = smartBorders $ layoutHook defaultConfig
	, manageHook = composeOne [
	      isFullscreen -?> doFullFloat
          ]
       }
--Workspaces for my computer.
myWorkspaces = ["1:Home" , "2:Web" , "3:Media" , "4:Development" , "5:Stuff" , "6:Terminals", "7:File Manager" , "8:IM", "9:Moar" ]

--Startup
myStartup = do
    spawn "bash $HOME/.fehbg"

