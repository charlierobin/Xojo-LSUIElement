# A simple Xojo demo for LSUIElement
 
[LSUIElement reference on Apple Developer Documentation](https://developer.apple.com/documentation/bundleresources/information_property_list/lsuielement "Apple Dev Docs")

A simple script step (positioned after the main Build step) that modifies the app’s `Info.plist` using PlistBuddy (so you need to have that available, either through an Xcode install or some other way).

When run, the app will *not* show a menu bar and will *not* show in the user’s dock, although clicking on its window will bring it to the front as usual, ie: the window will activate. But the menu bar will still be the menu bar of whatever app was active previously.

    var path as String = CurrentBuildLocation + "/" + CurrentBuildAppName.ReplaceAll( " ", "\ " )

    var result as String = DoShellCommand( "/usr/libexec/PlistBuddy -c ""Add :LSUIElement bool true"" " + path + ".app/Contents/Info.plist" )

    if result <> "" then print( result )

So (unless your app is one designed to just run and run until shutdown, or quits by itself in some way) you’ll need to provide some other way of quitting (and whatever other things would usually be done via menu items). Here it's a Quit button, but of course you could get into creating a "status" menu that will live on the right hand side of the user’s screen along with all their other bits and pieces.

[NSStatusItem page on the Apple Developer Documentation](https://developer.apple.com/documentation/appkit/nsstatusitem)
