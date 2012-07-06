import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition


main =  xmonad =<< xmobar  myConfig
myConfig = defaultConfig     
        { modMask = mod4Mask
         , terminal = "terminator"
	 , workspaces = myWorkspaces
	, startupHook =  myStartup
       }

--Workspaces
myWorkspaces = ["1:Home" , "2:Web" , "3:Media" , "4:Development" , "5:Stuff" , "6:Terminals", "7:Booty" , "8:lolcats", "9:minecraft" ]

--Startup
myStartup = do
    spawn "bash $HOME/.fehbg"
