#!/bin/bash

# Set terminal text color to green
tput setaf 2

# Change directory to parent directory
cd ..

# Display message
echo "Installing dependencies..."

# Install necessary Haxelib libraries
haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install flixel-ui
haxelib install flixel-tools
haxelib git hxvlc https://github.com/MAJigsaw77/hxvlc 70e7f5f3e76d526ac6fb8f0e6665efe7dfda589d
haxelib install tjson
haxelib set SScript 8.1.6
haxelib git flxanimate https://github.com/ShadowMario/flxanimate dev
haxelib git linc_luajit https://github.com/superpowers04/linc_luajit
haxelib git hxdiscord_rpc https://github.com/MAJigsaw77/hxdiscord_rpc

# Reset terminal color
tput sgr0

# Display finished message
echo "Finished!"
read -p "Press Enter to continue..."