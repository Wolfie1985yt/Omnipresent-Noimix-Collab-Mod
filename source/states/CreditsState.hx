package states;

import objects.AttachedSprite;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:FlxColor;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Credits Menu", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['Omnipresent Noimix Dev Team'],
			['Wolfie_1985',			'wolfie',			'Main Coder, Charter',										'https://www.youtube.com/channel/UC8mx-rDEJcj8PzT49bifHzw',										'00b0ff'],
			['Charizardslash',		'char',				'Charter',													'https://x.com/charthedumbass',																	'8a008d'],
			['Estaguy',				'Estaguy',			'Artist for the mod and RoSE',								'https://youtube.com/@Estaguy24',																'c20007'],
			['Heckat',				'heckat',			'Help with Coding, Charter',								'https://x.com/Heckqt',																			'ff822c'],
			['Leafy-Ivy_Ray',		'leafy',			'Charter, Provided some Events to use',						'https://www.youtube.com/@TheReal-Leafy',														'ff79a4'],
			['Mr. Half',			'half',				'Charter, Tester',											'https://youtube.com/@mr_half?si=o1tNdtZvDyG3jB6V',												'ffffff'],
			['Raimbowcore12',		'raimbow',			'Charter, Helped with camera events',						'https://www.youtube.com/channel/UCkfi2umVQlsj6SUs1sTxPHg',										'1dff00'],
			['Sulonam',				'Sulonam',			'Made Startscreens, Co-Director of RoSE',					'https://www.youtube.com/@MMMandComino',														'e34c00'],
			[''],
			['Musicians'],
			['Noichi',				'noichi',			'Main Musician and Biggest Inspiration',					'https://twitter.com/Noichi_yt?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',			'c60008'],
			['Alvstxr',				'al',				'Other Main Musician and Second Biggest Inspiration',		'https://www.youtube.com/@alvstxr',																'de2caf'],
			['IamDaDogeOfDaFuture',	'doge',				'Original Musician of Omnipresent',							'https://www.youtube.com/@iamdadogeofdafuture',													'ffffff'],
			[''],
			['Artists'],
			['AnarackWarriors',		'anarack',			'Owner of Fatal Error',										'https://twitter.com/AnarackWStudios?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',	'd42930'],
			['AngelGamePad',		'Angelgamepad',		'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@Angelgamepad456/videos',												'ec1c24'],
			['Arthur / ADJ',		'arthur',			'Made Lord X Sprites I think',								'https://twitter.com/AdjDraws?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',			'979797'],
			['Artisus',				'Artisus',			'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@TrustedArtist',														'ffffff'],
			['Ayybeff',				'ayybeff',			'Artist',													'https://www.youtube.com/@ayybeff/featured',													'0010ff'],
			['Bawnic',				'Bawnic',			'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/channel/UCDmeDB6bvF66KDIYwH8vs_Q',										'151ea1'],
			['Blue Demon',			'Blue Demon',		'Made Bunny BF Needlemouse',								'https://www.youtube.com/@blueberryoni/videos',													'434ee8'],
			['Bnux Master',			'face',				'Artist',													'',																								'878787'],
			['Boyo',				'Boyo',				'Artist of Restoration of Sonic.EXE',						'',																								'585858'],
			['CatTheFenix',			'face',				'Artist',													'https://twitter.com/CatTheFenix',																'878787'],
			['Cherribun',			'cherribun',		'Original Sonic.EXE mod Artist',							'https://twitter.com/casinobunbun',																'ff92b5'],
			['CommandoDev',			'commando',			'Original Sonic.EXE mod Artist / Director',					'https://twitter.com/CommandoDev_?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',		'b622b9'],
			['Danix',				'Danix',			'Artist',													'',																								'000cb7'],
			['Divide',				'divide',			'Original Faker Artist',									'https://drive.google.com/file/d/1JlalyUieEGe0DHd_lzP0vUtEdZbPHEZH/view?usp=sharing',			'000cb7'],
			['DStickman',			'DStickman',		'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@DStickmanP',															'ffca18'],
			['Erick Animations',	'erick',			'Original Sonic.EXE mod Artist',							'https://twitter.com/ErickAnim101?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',		'878787'],
			['GioIsDead',			'GioIsDead',		'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@JustANormalYoutubeGuy',												'ff0000'],
			['G-San',				'face',				'Artist',													'',																								'878787'],
			['HyperDream',			'HyperDream',		'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@-Illusional-',														'7fd8ff'],
			['Inski',				'Inski',			'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@EduMakesStuff91',														'18209b'],
			['Jack Gore',			'jack',				'Owner of Hog',												'https://twitter.com/HogSweeped?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',		'bf0000'],
			['JoeDoughBoi',			'joedoughboi',		'Owner of Sonic.EXE and Lord X',							'https://twitter.com/losermakesgames?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',	'454545'],
			['John9Doe',			'john',				'Made Tailsdoll, Xterion, and 3D BF Sprites',				'https://x.com/pr1nter3?lang=en',																'ffffff'],
			['LeefLett',			'LeefLett',			'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@LeefLett',															'ffd032'],
			['LooneyDude',			'looney',			'Creator of Sunky',											'https://x.com/girdude?lang=en',																'0003c6'],
			['Luc',					'Luc',				'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@LucPal165',															'1ecc4f'],
			['Madzilla',			'madzilla',			'Original Sonic.EXE mod Artist',							'https://twitter.com/MadzillaKOTH',																'1ecc4f'],
			['MajinCrast',			'MajinCrast',		'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/channel/UCZEIlnS1W2WOvK1A0A2p4wQ',										'000986'],
			['Noveni',				'noveni',			'Artist of EXETernal',										'https://twitter.com/NoveniNine',																'd99e7c'],
			['O Mundo de Bê',		'mundo',			'Made EXE Sprites',											'https://www.youtube.com/@omundodebe8746/videos',												'fff200'],
			['Puffywuffy',			'face',				'Artist',													'',																								'878787'],
			['Raven',				'raven',			'Owner of Faker and Former Director of VS Sonic.EXE',		'https://twitter.com/corven_03',																'aaaaaa'],
			['ScorchVx',			'scorch',			'Artist / Owner of Grimeware',								'https://twitter.com/ScorchVx?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',			'ffffff'],
			['ShutUpJoJo',			'jojo',				'Original Owner of Needlemouse and Artist of VS Sonic.EXE',	'https://x.com/shutupjojo_',																	'565656'],
			['Stankfield',			'stankfield',		'Original Sonic.EXE mod Artist',							'https://twitter.com/stankfield',																'8100dd'],
			['TheGreatBeyond',		'TheGreatBeyond',	'Artist/Animator of Restoration of Sonic.EXE',				'https://www.youtube.com/@TheGreatBeyond-sj6ic',												'29951d'],
			['Torresmmo',			'Torresmmo',		'Artist',													'https://x.com/Torrmate',																		'33bcfa'],
			['Treno',				'TRENO',			'Artist/Animator of Restoration of Sonic.EXE',				'https://www.youtube.com/channel/UCONuNNcnJn7y12TjZvsbILg',										'ffc5d8'],
			['Zekuta',				'zekuta',			'Original Sonic.EXE mod Artist',							'https://twitter.com/zekutaanim',																'96ecff'],
			['ZolZarolZ',			'ZolZarolZ',		'Artist of Restoration of Sonic.EXE',						'https://www.youtube.com/@zolcabeludo',															'502f19'],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',		'shadowmario',		'Main Programmer and Head of Psych Engine',					 'https://ko-fi.com/shadowmario',		'444444'],
			['Riveren',				'riveren',			'Main Artist/Animator of Psych Engine',						 'https://twitter.com/riverennn',		'14967B'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'bb',				'Ex-Programmer of Psych Engine',							 'https://twitter.com/bbsub3',			'3E813A'],
			['shubs',				'',					'Ex-Programmer of Psych Engine\nI don\'t support them.',	 '',									'A1A1A1'],
			[''],
			['Engine Contributors'],
			['CrowPlexus',			'crowplexus',		'Input System v3, Major Help and Other PRs',				 'https://twitter.com/crowplexus',		'A1A1A1'],
			['Keoiki',				'keoiki',			'Note Splash Animations and Latin Alphabet',				 'https://twitter.com/Keoiki_',			'D2D2D2'],
			['SqirraRNG',			'sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform', 'https://twitter.com/gedehari',		'E1843A'],
			['EliteMasterEric',		'mastereric',		'Runtime Shaders support',									 'https://twitter.com/EliteMasterEric',	'FFBD40'],
			['PolybiusProxy',		'proxy',			'.MP4 Video Loader Library (hxCodec)',						 'https://twitter.com/polybiusproxy',	'DCD294'],
			['Tahir',				'tahir',			'Implementing & Maintaining SScript and Other PRs',			 'https://twitter.com/tahirk618',		'A04397'],
			['iFlicky',				'flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',	 'https://twitter.com/flicky_i',		'9E29CF'],
			['KadeDev',				'kade',				'Fixed some issues on Chart Editor and Other PRs',			 'https://twitter.com/kade0912',		'64A250'],
			['superpowers04',		'superpowers04',	'LUA JIT Fork',												 'https://twitter.com/superpowers04',	'B957ED'],
			['CheemsAndFriends',	'face',	'Creator of FlxAnimate\n(Icon will be added later, merry christmas!)',	 'https://twitter.com/CheemsnFriendos',	'A1A1A1'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",						 'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",							 'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",							 'https://twitter.com/evilsk8r',		'5ABD4B'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",							 'https://twitter.com/kawaisprite',		'378FC7']
		];
		
		for(i in defaultList) {
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Mods.currentModDirectory = creditsStuff[i][5];
				}

				var str:String = 'credits/missing_icon';
				if(creditsStuff[i][1] != null && creditsStuff[i][1].length > 0)
				{
					var fileName = 'credits/' + creditsStuff[i][1];
					if (Paths.fileExists('images/$fileName.png', IMAGE)) str = fileName;
					else if (Paths.fileExists('images/$fileName-pixel.png', IMAGE)) str = fileName + '-pixel';
				}

				var icon:AttachedSprite = new AttachedSprite(str);
				if(str.endsWith('-pixel')) icon.antialiasing = false;
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Mods.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();

		#if mobile addVPad(NONE, B); #end

		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT || TouchInput.justPressed(grpOptions.members[curSelected]) && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = Math.exp(-elapsed * 12);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(item.x - 70, lastX, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(200 + -40 * Math.abs(item.targetY), item.x, lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:FlxColor = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		//trace('The BG color is: $newColor');
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	function pushModCreditsToList(folder:String)
	{
		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
	}
	#end

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
