package backend;

import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.mappings.FlxGamepadMapping;
import flixel.input.keyboard.FlxKey;

class Controls
{
	//Keeping same use cases on stuff for it to be easier to understand/use
	//I'd have removed it but this makes it a lot less annoying to use in my opinion

	//You do NOT have to create these variables/getters for adding new keys,
	//but you will instead have to use:
	//   controls.justPressed("ui_up")   instead of   controls.UI_UP

	//Dumb but easily usable code, or Smart but complicated? Your choice.
	//Also idk how to use macros they're weird as fuck lol

	// Pressed buttons (directions)
	public var UI_UP_P(get, never):Bool;
	public var UI_DOWN_P(get, never):Bool;
	public var UI_LEFT_P(get, never):Bool;
	public var UI_RIGHT_P(get, never):Bool;
	public var NOTE_UP_P(get, never):Bool;
	public var NOTE_DOWN_P(get, never):Bool;
	public var NOTE_LEFT_P(get, never):Bool;
	public var NOTE_RIGHT_P(get, never):Bool;
	private function get_UI_UP_P() return justPressed('ui_up') || TouchInput.isSwipe('up');
	private function get_UI_DOWN_P() return justPressed('ui_down') || TouchInput.isSwipe('down');
	private function get_UI_LEFT_P() return justPressed('ui_left') || TouchInput.isSwipe('left');
	private function get_UI_RIGHT_P() return justPressed('ui_right') || TouchInput.isSwipe('right');
	private function get_NOTE_UP_P() return justPressed('note_up');
	private function get_NOTE_DOWN_P() return justPressed('note_down');
	private function get_NOTE_LEFT_P() return justPressed('note_left');
	private function get_NOTE_RIGHT_P() return justPressed('note_right');

	// Held buttons (directions)
	public var UI_UP(get, never):Bool;
	public var UI_DOWN(get, never):Bool;
	public var UI_LEFT(get, never):Bool;
	public var UI_RIGHT(get, never):Bool;
	public var NOTE_UP(get, never):Bool;
	public var NOTE_DOWN(get, never):Bool;
	public var NOTE_LEFT(get, never):Bool;
	public var NOTE_RIGHT(get, never):Bool;
	private function get_UI_UP() return pressed('ui_up') || TouchInput.isSwipe('up');
	private function get_UI_DOWN() return pressed('ui_down') || TouchInput.isSwipe('down');
	private function get_UI_LEFT() return pressed('ui_left') || TouchInput.isSwipe('left');
	private function get_UI_RIGHT() return pressed('ui_right') || TouchInput.isSwipe('right');
	private function get_NOTE_UP() return pressed('note_up');
	private function get_NOTE_DOWN() return pressed('note_down');
	private function get_NOTE_LEFT() return pressed('note_left');
	private function get_NOTE_RIGHT() return pressed('note_right');

	// Released buttons (directions)
	public var UI_UP_R(get, never):Bool;
	public var UI_DOWN_R(get, never):Bool;
	public var UI_LEFT_R(get, never):Bool;
	public var UI_RIGHT_R(get, never):Bool;
	public var NOTE_UP_R(get, never):Bool;
	public var NOTE_DOWN_R(get, never):Bool;
	public var NOTE_LEFT_R(get, never):Bool;
	public var NOTE_RIGHT_R(get, never):Bool;
	private function get_UI_UP_R() return justReleased('ui_up') || TouchInput.isSwipe('up');
	private function get_UI_DOWN_R() return justReleased('ui_down') || TouchInput.isSwipe('down');
	private function get_UI_LEFT_R() return justReleased('ui_left') || TouchInput.isSwipe('left');
	private function get_UI_RIGHT_R() return justReleased('ui_right') || TouchInput.isSwipe('right');
	private function get_NOTE_UP_R() return justReleased('note_up');
	private function get_NOTE_DOWN_R() return justReleased('note_down');
	private function get_NOTE_LEFT_R() return justReleased('note_left');
	private function get_NOTE_RIGHT_R() return justReleased('note_right');


	// Pressed buttons (others)
	public var ACCEPT(get, never):Bool;
	public var BACK(get, never):Bool;
	public var PAUSE(get, never):Bool;
	public var RESET(get, never):Bool;
	private function get_ACCEPT() return justPressed('accept');
	private function get_BACK() return justPressed('back') || TouchInput.BACK();
	private function get_PAUSE() return justPressed('pause') || TouchInput.BACK();
	private function get_RESET() return justPressed('reset');

	//Gamepad & Keyboard stuff
	public var keyboardBinds:Map<String, Array<FlxKey>>;
	public var gamepadBinds:Map<String, Array<FlxGamepadInputID>>;
	public function justPressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustPressed(keyboardBinds[key]));
		if(result) controllerMode = false;

		return result || _myGamepadJustPressed(gamepadBinds[key]) #if mobile || mobileControlsJustPressed(key) #end;
	}

	public function pressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyPressed(keyboardBinds[key]));
		if(result) controllerMode = false;

		return result || _myGamepadPressed(gamepadBinds[key]) #if mobile || mobileControlsPressed(key) #end;
	}

	public function justReleased(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustReleased(keyboardBinds[key]));
		if(result) controllerMode = false;

		return result || _myGamepadJustReleased(gamepadBinds[key]) #if mobile || mobileControlsJustReleased(key) #end;
	}

	public var controllerMode:Bool = false;
	private function _myGamepadJustPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustPressed(key))
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyPressed(key))
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadJustReleased(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustReleased(key))
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}

	  #if mobile
    public var isSubState:Bool = false;
    var vPad:mobile.FlxVirtualPad;
    var mcontrols:mobile.Mobilecontrols;
    public function mobileControlsPressed(key:String):Bool
    {
        var button:Bool = false;
        vPad = isSubState ? MusicBeatSubstate.instance.vPad : MusicBeatState.instance.vPad;
        mcontrols = MusicBeatState.instance.mcontrols;
        if (vPad != null)
        {
            switch(key.toLowerCase())
            {
                case 'accept':
                    if (vPad.buttonA != null) button = vPad.buttonA.pressed;
                case 'back':
                    if (vPad.buttonB != null) button = vPad.buttonB.pressed;
                case 'ui_left':
                    if (vPad.buttonLeft != null) button = vPad.buttonLeft.pressed;
                case 'ui_down':
                    if (vPad.buttonDown != null) button = vPad.buttonDown.pressed;
                case 'ui_up':
                    if (vPad.buttonUp != null) button = vPad.buttonUp.pressed;
                case 'ui_right':
                    if (vPad.buttonRight != null) button = vPad.buttonRight.pressed;
            }
        }

        if (mcontrols != null)
        {
            var mcontrolsArray:Array<mobile.FlxButton> = mcontrols.mode.toLowerCase().startsWith('vpad') ?
            [
                mcontrols.vPad.buttonLeft,
                mcontrols.vPad.buttonDown,
                mcontrols.vPad.buttonUp,
                mcontrols.vPad.buttonRight
            ] : [
                mcontrols.hitbox.buttonLeft,
                mcontrols.hitbox.buttonDown,
                mcontrols.hitbox.buttonUp,
                mcontrols.hitbox.buttonRight
            ];
            switch(key.toLowerCase())
            {
                case 'note_left':
                    if (mcontrolsArray[0] != null) button = mcontrolsArray[0].pressed;
                case 'note_down':
                    if (mcontrolsArray[1] != null) button = mcontrolsArray[1].pressed;
                case 'note_up':
                    if (mcontrolsArray[2] != null) button = mcontrolsArray[2].pressed;
                case 'note_right':
                    if (mcontrolsArray[3] != null) button = mcontrolsArray[3].pressed;
            }
        }
        return button;
    }
    public function mobileControlsJustPressed(key:String):Bool
    {
        var button:Bool = false;
        vPad = isSubState ? MusicBeatSubstate.instance.vPad : MusicBeatState.instance.vPad;
        mcontrols = MusicBeatState.instance.mcontrols;
        if (vPad != null)
        {
            switch(key.toLowerCase())
            {
                case 'accept':
                    if (vPad.buttonA != null) button = vPad.buttonA.justPressed;
                case 'back':
                    if (vPad.buttonB != null) button = vPad.buttonB.justPressed;
                case 'ui_left':
                    if (vPad.buttonLeft != null) button = vPad.buttonLeft.justPressed;
                case 'ui_down':
                    if (vPad.buttonDown != null) button = vPad.buttonDown.justPressed;
                case 'ui_up':
                    if (vPad.buttonUp != null) button = vPad.buttonUp.justPressed;
                case 'ui_right':
                    if (vPad.buttonRight != null) button = vPad.buttonRight.justPressed;
            }
        }

        if (mcontrols != null)
        {
            var mcontrolsArray:Array<mobile.FlxButton> = mcontrols.mode.toLowerCase().startsWith('vpad') ?
            [
                mcontrols.vPad.buttonLeft,
                mcontrols.vPad.buttonDown,
                mcontrols.vPad.buttonUp,
                mcontrols.vPad.buttonRight
            ] : [
                mcontrols.hitbox.buttonLeft,
                mcontrols.hitbox.buttonDown,
                mcontrols.hitbox.buttonUp,
                mcontrols.hitbox.buttonRight
            ];
            switch(key.toLowerCase())
            {
                case 'note_left':
                    if (mcontrolsArray[0] != null) button = mcontrolsArray[0].justPressed;
                case 'note_down':
                    if (mcontrolsArray[1] != null) button = mcontrolsArray[1].justPressed;
                case 'note_up':
                    if (mcontrolsArray[2] != null) button = mcontrolsArray[2].justPressed;
                case 'note_right':
                    if (mcontrolsArray[3] != null) button = mcontrolsArray[3].justPressed;
            }
        }
        return button;
    }
    public function mobileControlsJustReleased(key:String):Bool
    {
        var button:Bool = false;
        vPad = isSubState ? MusicBeatSubstate.instance.vPad : MusicBeatState.instance.vPad;
        mcontrols = MusicBeatState.instance.mcontrols;
        if (vPad != null)
        {
            switch(key.toLowerCase())
            {
                case 'accept':
                    if (vPad.buttonA != null) button = vPad.buttonA.justReleased;
                case 'back':
                    if (vPad.buttonB != null) button = vPad.buttonB.justReleased;
                case 'ui_left':
                    if (vPad.buttonLeft != null) button = vPad.buttonLeft.justReleased;
                case 'ui_down':
                    if (vPad.buttonDown != null) button = vPad.buttonDown.justReleased;
                case 'ui_up':
                    if (vPad.buttonUp != null) button = vPad.buttonUp.justReleased;
                case 'ui_right':
                    if (vPad.buttonRight != null) button = vPad.buttonRight.justReleased;
            }
        }

        if (mcontrols != null)
        {
            var mcontrolsArray:Array<mobile.FlxButton> = mcontrols.mode.toLowerCase().startsWith('vpad') ?
            [
                mcontrols.vPad.buttonLeft,
                mcontrols.vPad.buttonDown,
                mcontrols.vPad.buttonUp,
                mcontrols.vPad.buttonRight
            ] : [
                mcontrols.hitbox.buttonLeft,
                mcontrols.hitbox.buttonDown,
                mcontrols.hitbox.buttonUp,
                mcontrols.hitbox.buttonRight
            ];
            switch(key.toLowerCase())
            {
                case 'note_left':
                    if (mcontrolsArray[0] != null) button = mcontrolsArray[0].justReleased;
                case 'note_down':
                    if (mcontrolsArray[1] != null) button = mcontrolsArray[1].justReleased;
                case 'note_up':
                    if (mcontrolsArray[2] != null) button = mcontrolsArray[2].justReleased;
                case 'note_right':
                    if (mcontrolsArray[3] != null) button = mcontrolsArray[3].justReleased;
            }
        }
        return button;
    }
    #end

	// IGNORE THESE
	public static var instance:Controls;
	public function new()
	{
		keyboardBinds = ClientPrefs.keyBinds;
		gamepadBinds = ClientPrefs.gamepadBinds;
	}
}