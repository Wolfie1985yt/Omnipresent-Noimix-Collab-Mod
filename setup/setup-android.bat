@echo off
color 0a
cd ..
@echo on
echo Installing dependencies.
haxelib install lime 8.0.2
haxelib set lime 8.0.2
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
haxelib git SScript https://github.com/MaysLastPlays-Stuff/SScript
haxelib git flxanimate https://github.com/MaysLastPlays-Stuff/flxanimate dev
haxelib git linc_luajhaxelib set flixelit https://github.com/superpowers04/linc_luajit
echo Finished!
pause
