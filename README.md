# Overfable
https://docs.google.com/document/d/1BndaS9E9zW7pufR5NAbLEkqlf4gSGu8N2WPT1sfg_bM/edit?usp=sharing
INSTRUCTIONS TO MAKE GAME MORE ENJOYABLE:
  This game (so far) contains a total of 6 super unique monsters with fairly difficult attacks. To trigger these fights, you need to walk around in the current room and it will eventually throw you into a combat interface. The second and third rooms will spawn 1 of 3 'land' animals (John Fox Kennedy, Teddy Grizzlevelt, and Parissss de Paris). Stick around to fight each of them. The fourth and fifth rooms will spawn 1 of 3 'water' animals (Captain Jack Swimmer & BlackBeak, BirdLock Holmes, and Indiana Jaws). Stick around to fight each of them. 
  The sixth room will only spawn the final boss, MonKing. He has three phases, and five total attacks. GOOD LUCK!! He's super cute btw and has a revamp for each phase where he looks kinda scarier. After that, once you walk off to the right(to the end of the room), a black screen will emerge and that will unfortunately be the end of the game. 
  
5/21: 
	Sasha: Worked on some of the UI for the combat, like the border, text, and heart.
	Gavin: 
5/22: 
	Sasha: Worked on fullscreen and ratios. Made the heart a PImage. Worked on switching screens. Started working on the first attack.
	Gavin: Fixed outer borders for the heart. Made Monster, Damageable, and Player classes. Started working on the second attack.
5/23: 
	Sasha: Worked on the first attack.
	Gavin: Worked on the second attack, Inside method. Pellet class. Tried to make damageables do damage.
5/24: 
	Sasha: Continued to work on first attack using countdown
	Gavin: Hitboxes and invulnerability with blinking heart.
5/25: 
	Sasha: Finished attack1.
	Gavin: Finished attack2, player can do damage.
5/26: 
	Sasha: Implemented random attack chooser. Text update screen before attack. Speech bubble, staggered text. Started working on a health bar.
	Gavin: Fixed attack2, added DF, nerfed INV.
5/27: 
	Sasha: Finished health bar.
	Gavin: Monster animation
5/28: 
	Sasha: Worked on text functionality in combat UI. Implemented ‘update’ text feature for each monster that displays new updated text after every attack. Implemented wrap around text for speech bubble. Added text skipping feature. Created a forest background for the first route and successfully tied it in with the protagonist moving. 
	Gavin: Worked on Hurt and death animation for Teddy Grizzlevelt, made protagonist. 
5/29: 
	Sasha: Added more forest images for the first route. Working on a scrolling algorithm for the first route. Made decent progress on scrolling and added ratios for fullscreen compatibility. 
	Gavin: Made protagonist images sharper, implemented walking and walking animations. Made a monster subclass for Teddy, cleaned up monster superclass.  
5/30: 
	Sasha: implemented full functionality with scrolling algorithm and a full route graphics wise(all images put into game). Figured out transition between combat and character walking through route. 
	Gavin: implemented animations for the second monster, BirdLock, and started working on the first attack. Improved teddy quality, made animations for boss, MonKing. 
5/31: 
	Sasha: wrote in a boss class. Added code for encountering Teddy Grizzlevelt as the first monster. Added demo for monking at the end of the route for MVP presentation. 
	Gavin: Made a subclass of boss for MonKing. Finished animations for MonKing.
6/2: 
	Sasha: fixed a bunch of functionality issues with combat that appeared after adding transition from combat algorithm. Issues: if you didn’t skip the text the program would break, couldn’t move from fight to item button. 
	Gavin:  fixed walking animation glitch for character where it wouldn’t register at some points. Added trapheart class and three yellow lines for mode for MonKing. Slowed down player animation and movement. Drew and implemented banana images for the first attack. 
6/3: 
	Sasha: working on standardizing monster class to make main less crowded. 
	Gavin: buffed second attack for teddy - more pellets that move faster. Worked on third monster, indiana jaws, animation. 
6/4: 
	Sasha: successfully implemented Birdlock’s first attack, Hawkson. Implemented second attack but needs major work in terms of hitbox and movement. 
	Gavin: successfully implemented all Indiana Jaws display animation. Condensed main by adding separate methods for monsters and all screens(FIGHT, ITEM, TEXT, ENEMY, SPEECH)
6/5: 
	Sasha: fixed random error that popped up after merge(gray screen would appear with combat set to false so character wouldn’t appear). Working more on attack 2 for birdlock(implementing ratios for full functionality across all displays). Gray screen error appeared AGAIN! Fixed broken hitbox for attack 2 for BirdLock. Added class for John Fox Kennedy(fourth monster), with set methods, a constructor, and fields. Implemented first attack for JFK, but need to fix hitbox. 
	Gavin: added shark fin for first Indiana Jaws attack. Implemented animations for John Fox Kennedy, added a method for Indiana Jaws. finished half of jaws attack 1. Added hitbox for shark fin. Finished attack 2, shark whip for Indiana Jaws. Hurt and dead animation for JFK implemented. 
6/6: 
	Sasha: finished attack 2 for JFK but need to work on hitbox. 
	Gavin: organized data folder but everything broke so reversed it back. Started snake animations. Jaws animations were higher quality. Resized fox. 
6/7: 
	Sasha: SAID GOODBYE TO FULLSCREEN DREAMS(read full commit message to understand my heartbreak).  fixed all hitbox for John Fox Kennedy, officially done. 
	Gavin: resized animations, created a new damaged method for easier functionality with image based attacks. 
6/8: 
	Sasha: final fixes for katana attack for fox. Katana looks better. Fixing birdlock’s attack hitboxes. 
	Gavin: more on JFK animations.  Added all monsters to main draw for full functionality. JFK has cuter death animation. Started working on animation for penguins(last monster). 
6/9: 
	Sasha: officially fixed hitboxes for Birdlock’s attacks and resized everything. Remade JFK’s hat attack completely(new image with cool spinning and a good hitbox). Working on snake’s 1st attack. 
	Gavin: started attack 1 for blackbeak. Made cannon animations and added to data folder. 
6/10: 
	Sasha: working on attack 1 for snake. Issues with program speed because of loading images for so many snake ‘pellets’. Also snake border checking that would make it change direction doesn’t work.(more complicated since changing images is involved).
	Gavin: 	finished attack 1 for blackbeak. Made cutlass animations and added to data folder for attack 2. 

6/11: 
	Sasha: finished attack for snake. Moving on to boss. Also added update text and dialogue for JFK and Parissss. 
	Gavin: finished attack 2 for blackbeak. Added name for snake(Parissss de Paris). Added extra name for blackbeak(2 penguins: Blackbeak and Captain Jack Swimmer). Added branch image files for MonKing’s first attack. 
6/12: 
	Sasha: finished MonKing’s second attack, third attack, and fourth attack. Third and fourth were duos(taken from previous monsters in the game). Second attack was variation of Teddy’s 1st attack except with bananas. Added good hitboxes for the three attacks. More functionality for scrolling screen(player can move into previous screens). Monking’s fourth attack is unbelievably hard. Added cycles with a revamped monking for cycle 2. Finished monking’s attack 1. 
	Gavin: started attack 1 for MonKing(branches moving up and down attack). Implemented MonKing attack 5. Added even more revamped monking for cycle 3. Fixed hitboxes for branches.
MONKING DONE
6/13: 
Sasha: connected both routes, relocated cliff scene to the end for showoff against MonKing. Spawning algorithm for monsters correlated with location. 
Gavin: drew and added waterfall and bridge scenes for second route. 

DONE

