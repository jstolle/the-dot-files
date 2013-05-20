import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
	xmproc <- spawnPipe "/usr/bin/xmobar /root/.xmobarrc"
	xmonad $ defaultConfig
		{ manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts  $  layoutHook defaultConfig
		, modMask = mod4Mask
		, terminal = "urxvt"
		, focusFollowsMmouse = "False"
		} `additionalKeys`
		[ ((mod4Mask, xK_l), spawn "xscreensaver-command -lock")
		, ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
		, ((0, xK_Print), spawn "scrot")
		]
