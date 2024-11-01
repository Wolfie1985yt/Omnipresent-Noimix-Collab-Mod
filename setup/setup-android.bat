@echo off
color 0a
cd ..
@echo on
echo Installing dependencies.
haxelib install lime 8.1.0
haxelib install lime 8.1.0
haxelib set lime 8.1.0
haxelib install openfl 9.2.2
haxelib set openfl 9.2.2
haxelib install flixel 5.5.0
haxelib set flixel 5.5.0
haxelib install flixel-addons 3.0.2
haxelib set flixel-addons 3.0.2
haxelib install flixel-ui
haxelib install flixel-tools
haxelib set hxCodec 2.6.1
haxelib install tjson
haxelib git flxanimate https://github.com/MaysLastPlays-Stuff/flxanimate main-mobile
haxelib git linc_luajit https://github.com/mcagabe19-stuff/linc_luajit-rewriten
echo Finished!
pause
