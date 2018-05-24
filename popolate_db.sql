#user la si popola quando gli utenti si registrano per giocare

#character_choosen si popola quando gli utenti scelgono il character e gli atribuiscono forza,intelligenza, agilità e costituzione; 
#mentre gli altri valoriu si inseriscono e aggiornano in automatico

#dungeonRoutes viene popolata in automatico

#dungeonRooms viene popolata in automatico

#objectInRoom viene popolata in automatico

#char_object inizialmente, quando l'utente sceglie il character contiene solo "spada" e "cibo"


#popolo characters

INSERT INTO characters (name, description) VALUES ();


#popolo rooms

INSERT INTO rooms (descrizione) VALUES ("");


#popolo object

INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("");


#popolo enemies

INSERT INTO enemies (name, description, attack, defense, hit_points, damage) VALUES ();


INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant bat",2,2,2,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant boar",4,2,5,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant centipede",6,0,3,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant constrictor snake",4,0,3,2);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant crab",5,4,3,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant crocodile",0,1,2,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant eagle",1,6,5,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Giant elk",0,5,4,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Baboon",4,2,5,2);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Badger",6,1,4,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Bat",3,4,4,2);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Black bear",5,1,1,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Blood hawk",4,2,4,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Spider",3,5,3,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Stirge",6,3,5,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Swarm of bats",0,5,4,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Swarm of insects",0,4,2,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Copper dragon wyrmling",4,6,3,2);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Dragon turtle",6,6,2,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Ogre",0,5,1,3);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Oni",6,2,2,1);
INSERT INTO enemies (name, attack, defense, hit_points, damage) VALUES ("Stone giant",6,0,4,3);




INSERT INTO rooms (descrizione) VALUES ("A crack in the ceiling above the middle of the north wall allows a trickle of water to flow down to the floor. The water pools near the base of the wall, and a rivulet runs along the wall an out into the hall. The water smells fresh.");
INSERT INTO rooms (descrizione) VALUES ("Thick cobwebs fill the corners of the room, and wisps of webbing hang from the ceiling and waver in a wind you can barely feel. One corner of the ceiling has a particularly large clot of webbing within which a goblin's bones are tangled.");
INSERT INTO rooms (descrizione) VALUES ("Tapestries decorate the walls of this room. Although they may once have been brilliant in hue, they now hang in graying tatters. Despite the damage of time and neglect, you can perceive once-grand images of wizards' towers, magical beasts, and symbols of spellcasting. The tapestry that is in the best condition bulges out weirdly, as though someone stands behind it (an armless statue of a female human spellcaster).");
INSERT INTO rooms (descrizione) VALUES ("Rats inside the room shriek when they hear the door open, then they run in all directions from a putrid corpse lying in the center of the floor. As these creatures crowd around the edges of the room, seeking to crawl through a hole in one corner, they fight one another. The stinking corpse in the middle of the room looks human, but the damage both time and the rats have wrought are enough to make determining its race by appearance an extremely difficult task at best.");
INSERT INTO rooms (descrizione) VALUES (" Neither light nor darkvision can penetrate the gloom in this chamber. An unnatural shade fills it, and the room's farthest reaches are barely visible. Near the room's center, you can just barely perceive a lump about the size of a human lying on the floor. (It might be a dead body, a pile of rags, or a sleeping monster that can take advantage of the room's darkness.) ");
INSERT INTO rooms (descrizione) VALUES ("Burning torches in iron sconces line the walls of this room, lighting it brilliantly. At the room's center lies a squat stone altar, its top covered in recently spilled blood. A channel in the altar funnels the blood down its side to the floor where it fills grooves in the floor that trace some kind of pattern or symbol around the altar. Unfortunately, you can't tell what it is from your vantage point.");
INSERT INTO rooms (descrizione) VALUES ("A liquid-filled pit extends to every wall of this chamber. The liquid lies about 10 feet below your feet and is so murky that you can't see its bottom. The room smells sour. A rope bridge extends from your door to the room's other exit.");
INSERT INTO rooms (descrizione) VALUES ("Fire crackles and pops in a small cooking fire set in the center of the room. The smoke from a burning rat on a spit curls up through a hole in the ceiling. Around the fire lie several fur blankets and a bag. It looks like someone camped here until not long ago, but then left in a hurry.");
INSERT INTO rooms (descrizione) VALUES ("A flurry of bats suddenly flaps through the doorway, their screeching barely audible as they careen past your heads. They flap past you into the rooms and halls beyond. The room from which they came seems barren at first glance.");
INSERT INTO rooms (descrizione) VALUES ("Rusting spikes line the walls and ceiling of this chamber. The dusty floor shows no sign that the walls move over it, but you can see the skeleton of some humanoid impaled on some wall spikes nearby.");
INSERT INTO rooms (descrizione) VALUES ("You open the door, and the reek of garbage assaults your nose. Looking inside, you see a pile of refuse and offal that nearly reaches the ceiling. In the ceiling above it is a small hole that is roughly as wide as two human hands. No doubt some city dweller high above disposes of his rubbish without ever thinking about where it goes.");
INSERT INTO rooms (descrizione) VALUES ("You open the door, and the room comes alive with light and music. A sourceless, warm glow suffuses the chamber, and a harp you cannot see plays soothing sounds. Unfortunately, the rest of the chamber isn't so inviting. The floor is strewn with the smashed remains of rotting furniture. It looks like the room once held a bed, a desk, a chest, and a chair.");
INSERT INTO rooms (descrizione) VALUES (" A skeleton dressed in moth-eaten garb lies before a large open chest in the rear of this chamber. The chest is empty, but you note two needles projecting from the now-open lock. Dust coats something sticky on the needles' points.");
INSERT INTO rooms (descrizione) VALUES (" Rounded green stones set in the floor form a snake's head that points in the direction of the doorway you stand in. The body of the snake flows back and toward the wall to go round about the room in ever smaller circles, creating a spiral pattern on the floor. Similar green-stone snakes wend along the walls, seemingly at random heights, and their long bodies make wave shapes.");
INSERT INTO rooms (descrizione) VALUES ("The manacles set into the walls of this room give you the distinct impression that it was used as a prison and torture chamber, although you can see no evidence of torture devices. One particularly large set of manacles -- big enough for an ogre -- have been broken open.");
INSERT INTO rooms (descrizione) VALUES ("You gaze into the room and hundreds of skulls gaze coldly back at you. They're set in niches in the walls in a checkerboard pattern, each skull bearing a half-melted candle on its head. The grinning bones stare vacantly into the room, which otherwise seems empty");
INSERT INTO rooms (descrizione) VALUES ("Unlike the flagstone common throughout the dungeon, this room is walled and floored with black marble veined with white. The ceiling is similarly marbled, but the thick pillars that hold it up are white. A brown stain drips down one side of a nearby pillar.");
INSERT INTO rooms (descrizione) VALUES ("A huge iron cage lies on its side in this room, and its gate rests open on the floor. A broken chain lies under the door, and the cage is on a rotting corpse that looks to be a hobgoblin. Another corpse lies a short distance away from the cage. It lacks a head.");
INSERT INTO rooms (descrizione) VALUES ("This room is a tomb. Stone sarcophagi stand in five rows of three, each carved with the visage of a warrior lying in state. In their center, one sarcophagus stands taller than the rest. Held up by six squat pillars, its stone bears the carving of a beautiful woman who seems more asleep than dead. The carving of the warriors is skillful but seems perfunctory compared to the love a sculptor must have lavished upon the lifelike carving of the woman.");
INSERT INTO rooms (descrizione) VALUES ("A dim bluish light suffuses this chamber, its source obvious at a glance. Blue-glowing lichen and violet-glowing moss cling to the ceiling and spread across the floor. It even creeps down and up each wall, as if the colonies on the floor and ceiling are growing to meet each other. Their source seems to be a glowing, narrow crack in the ceiling, the extent of which you cannot gauge from your position. The air in the room smells fresh and damp.");
INSERT INTO rooms (descrizione) VALUES ("You open the door to confront a room of odd pillars. Water rushes down from several holes in the ceiling, and each hole is roughly a foot wide. The water pours in columns that fall through similar holes in the floor, flowing down to some unknown depth. Each of the eight pillars of water drops as much liquid as a stream in winter thaw. The floor is damp and looks slippery.");
INSERT INTO rooms (descrizione) VALUES ("This room smells strange, no doubt due to the weird sheets of black slime that drip from cracks in the ceiling and spread across the floor. The slime seeps from the shattered stone of the ceiling at a snails crawl, forming a mess of dangling walls of gook. As you watch, a bit of the stuff separates from a sheet and drops to the ground with a wet plop.");
INSERT INTO rooms (descrizione) VALUES ("This room is hung with hundreds of dusty tapestries. All show signs of wear: moth holes, scorch marks, dark stains, and the damage of years of neglect. They hang on all the walls and hang from the ceiling to brush against the floor, blocking your view of the rest of the room.");
INSERT INTO rooms (descrizione) VALUES ("You catch a whiff of the unmistakable metallic tang of blood as you open the door. The floor is covered with it, and splashes of blood spatter the walls. Some drops even reach the ceiling. It looks fresh, but you don't see any bodies or footprints leaving the chamber.");
INSERT INTO rooms (descrizione) VALUES ("Three low, oblong piles of rubble lie near the center of this small room. Each has a weapon jutting upright from one end -- a longsword, a spear, and a quarterstaff. The piles resemble cairns used to bury dead adventurers.");
INSERT INTO rooms (descrizione) VALUES ("Huge rusted metal blades jut out of cracks in the walls, and rusting spikes project down from the ceiling almost to the floor. This room may have once been trapped heavily, but someone triggered them, apparently without getting killed. The traps were never reset and now seem rusted in place.");
INSERT INTO rooms (descrizione) VALUES ("Several round pits lie in the floor of the room before you. Spaced roughly equally apart, each is about 15 feet in diameter and appears about 20 feet deep. A lattice of thick iron bars covers the top of each pit, and each lattice has a door of iron bars that can be lifted open. The pits smell of sweat and offal, but the room seems unoccupied.");
INSERT INTO rooms (descrizione) VALUES ("Many doors fill the room ahead. Doors of varied shape, size, and design are set in every wall and even the ceiling and floor. Barely a hand's width lies between one door and the next. All the doors but the one you entered by are shut, and many have obvious locks.");
INSERT INTO rooms (descrizione) VALUES ("A strange ceiling is the focal point of the room before you. It's honeycombed with hundreds of holes about as wide as your head. They seem to penetrate the ceiling to some height beyond a couple feet, but you can't be sure from your vantage point.");
INSERT INTO rooms (descrizione) VALUES (" This chamber was clearly smaller at one time, but something knocked down the wall that separated it from an adjacent room. Looking into that space, you see signs of another wall knocked over. It doesn't appear that anyone made an effort to clean up the rubble, but some paths through see more usage than others.");
INSERT INTO rooms (descrizione) VALUES ("A chill wind blows against you as you open the door. Beyond it, you see that the floor and ceiling are nothing but iron grates. Above and below the grates the walls extend up and down with no true ceiling or floor within your range of vision. It's as though the chamber is a bridge through the shaft of a great well. Standing on the edge of this shaft, you feel a chill wind pass down it and over your shoulder into the hall beyond.");
INSERT INTO rooms (descrizione) VALUES ("This room is shattered. A huge crevasse shears the chamber in half, and the ground and ceilings are tilted away from it. It's as though the room was gripped in two enormous hands and broken like a loaf of bread. Someone has torn a tall stone door from its hinges somewhere else in the dungeon and used it to bridge the 15-foot gap of the chasm between the two sides of the room. Whatever did that must have possessed tremendous strength because the door is huge, and the enormous hinges look bent and mangled.");
INSERT INTO rooms (descrizione) VALUES (" A pit yawns open before you just on the other side of the door's threshold. The entire floor of the room has fallen into a second room beneath it. Across the way you can spy a door in the wall now 15 feet off the rubble-strewn floor, and near the center of the room stands a thick column of mortared stone that appears to hold the spiral staircase that leads down to what was the lower level.");
INSERT INTO rooms (descrizione) VALUES ("As the door opens, it scrapes up frost from a floor covered in ice. The room before you looks like an ice cave. A tunnel wends its way through solid ice, and huge icicles and pillars of frozen water block your vision of its farthest reaches.");
INSERT INTO rooms (descrizione) VALUES ("A 30-foot-tall demonic idol dominates this room of black stone. The potbellied statue is made of red stone, and its grinning face holds what looks to be two large rubies in place of eyes. A fire burns merrily in a wide brazier the idol holds in its lap.");
INSERT INTO rooms (descrizione) VALUES ("Several exits lead from this room, but only one is within the mouth of a man. The door opposite you stands within an intricate stone carving of a man's wide-open mouth. The man's nose and eyes loom over the door while his sculpted hair splays out across the wall on either side.");
INSERT INTO rooms (descrizione) VALUES ("The door creaks open, which somewhat overshadows the sound of bubbling liquid. Before you is a room about which alchemists dream. Three tables bend beneath a clutter of bottles of liquid and connected glass piping. Several bookshelves stand nearby stuffed to overfilling with a jumble of books, jars, bottles, bags, and boxes. The alchemist who set this all up doesn't seem to be present, but a beaker of green fluid boils over a burner on one of the tables.");
INSERT INTO rooms (descrizione) VALUES ("The scent of earthy decay assaults your nose upon peering through the open door to this room. Smashed bookcases and their sundered contents litter the floor. Paper rots in mold-spotted heaps, and shattered wood grows white fungus.");
INSERT INTO rooms (descrizione) VALUES (" Several white marble busts that rest on white pillars dominate this room. Most appear to be male or female humans of middle age, but one clearly bears small horns projecting from its forehead and another is spread across the floor in a thousand pieces, leaving one pillar empty.");
INSERT INTO rooms (descrizione) VALUES (" A dozen statues stand or kneel in this room, and each one lacks a head and stands in a posture of action or defense. All are garbed for battle. It's difficult to tell for sure without their heads, but two appear to be dwarves, one might be an elf, six appear human, and the rest look like they might be orcs.");
INSERT INTO rooms (descrizione) VALUES (" A rusted portcullis stands just beyond the door. Looking into the room, you see three other exits, similarly blocked by portcullises. Four skeletons dressed in aged clothing and rusting armor lie on the floor in the room against the walls. They seem in poses of repose rather than violence.");
INSERT INTO rooms (descrizione) VALUES ("This tiny room holds a curious array of machinery. Winches and levers project from every wall, and chains with handles dangle from the ceiling. On a nearby wall, you note a pictogram of what looks like a scythe on a chain. ");
INSERT INTO rooms (descrizione) VALUES ("This narrow room at first appears to be a dead-end corridor, but then you note several metal plates on the walls set at about eye height. Looking more closely, you see that one of these plates is slid aside to reveal a peephole.");
INSERT INTO rooms (descrizione) VALUES ("You open the door to a scene of carnage. Two male humans, a male elf, and a female dwarf lie in drying pools of their blood. It seems that they might once have been wearing armor, except for the elf, who remains dressed in a blue robe. Clearly they lost some battle and victors stripped them of their valuables.");
INSERT INTO rooms (descrizione) VALUES ("The door in front of you seems to be stuck.");
INSERT INTO rooms (descrizione) VALUES ("fThis chamber served as an armory for some group of creatures. Armor and weapon racks line the walls and rusty and broken weapons litter the floor. It hasn't been used in a long time, and all the useful weapons have been taken but for a single sword. Unlike the other weapons in the room, this one gleams untarnished in the light.");
INSERT INTO rooms (descrizione) VALUES ("There's a hiss as you open this door, and you smell a sour odor, like something rotten or fermented. Inside you see a small room lined with dusty shelves, crates, and barrels. It looks like someone once used this place as a larder, but it has been a long time since anyone came to retrieve food from it.");
INSERT INTO rooms (descrizione) VALUES (" A horrendous, overwhelming stench wafts from the room before you. Small cages containing small animals and large insects line the walls. Some of the creatures look sickly and alive but most are clearly dead. Their rotting corpses and the unclean cages no doubt result in the zoo's foul odor. A cat mews weakly from its cage, but the other creatures just silently shrink back into their filthy prisons.");
INSERT INTO rooms (descrizione) VALUES ("A cluster of low crates surrounds a barrel in the center of this chamber. Atop the barrel lies a stack of copper coins and two stacks of cards, one face up. Meanwhile, atop each crate rests a fan of five face-down playing cards. A thin layer of dust covers everything. Clearly someone meant to return to their game of cards.");
INSERT INTO rooms (descrizione) VALUES (" This chamber of well-laid stones holds a wide bas-relief of a pastoral scene. In it you see a mountain like Mount Waterdeep, except that Castle Waterdeep and the city are missing. Instead, a small fishing village is a short way from a walled complex with several tall towers.");
INSERT INTO rooms (descrizione) VALUES ("A stone throne stands on a foot-high circular dais in the center of this cold chamber. The throne and dais bear the simple adornments of patterns of crossed lines -- a pattern also employed around each door to the room.");
INSERT INTO rooms (descrizione) VALUES (" A wall that holds a seat with a hole in it is in this chamber. It's a privy! The noisome stench from the hole leads you to believe that the privy sees regular use.");
INSERT INTO rooms (descrizione) VALUES ("The burble of water reaches your ears after you open the door to this room. You see the source of the noise in the far wall: a large fountain artfully carved to look like a seashell with the figure of a seacat spewing clear water into its basin.");
INSERT INTO rooms (descrizione) VALUES ("This room holds six dry circular basins large enough to hold a man and a dry fountain at its center. All possess chipped carvings of merfolk and other sea creatures. It looks like this room once served some group of people as a bath.");

INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Animal Shapes",TRUE,5,-3,-1,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Antipathy",TRUE,-6,4,-1,-1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Barkskin",TRUE,4,-2,-5,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Calm Animals",TRUE,-2,-6,-2,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Freedom",TRUE,2,3,1,-5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Gate",TRUE,-2,-1,-1,-6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Prismatic Spray",TRUE,-6,-1,-4,-4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Rage",TRUE,3,0,-5,-1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Hardening",TRUE,6,6,5,-3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Sanctuary",TRUE,5,2,-5,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Ice Storm",TRUE,2,1,-3,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Kinetic Control",TRUE,-5,6,-6,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Lesser Restoration",TRUE,-1,1,0,-4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Mage's Disjunction",TRUE,6,6,3,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Sunbeam",TRUE,0,-3,2,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Make Whole",TRUE,2,4,2,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Telekinesis",TRUE,5,3,-5,-6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Undeath to Death",TRUE,0,6,-3,-3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Minor Creation",TRUE,1,-2,0,6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Nailed to the Sky",TRUE,-6,-5,-6,-6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Obscure Object",TRUE,-6,2,1,-4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Phantasmal Killer",TRUE,0,2,-2,-6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Zone of Truth",TRUE,3,4,3,2);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Power Word Stun",TRUE,-3,3,1,0);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Arcane Eye",FALSE,6,5,3,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Genesis",FALSE,-2,4,4,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Project Image",FALSE,-4,-6,4,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Refuge",FALSE,6,-6,2,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Blasphemy",FALSE,-5,-1,-2,6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Harm",FALSE,3,2,1,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Screen",FALSE,0,2,2,2);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Call Lightning",FALSE,4,0,-5,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Illusory Script",FALSE,1,6,-5,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Sound Burst",FALSE,1,2,3,0);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Darkness",FALSE,0,-1,-2,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Magic Fang",FALSE,-2,0,0,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Sympathy",FALSE,5,6,4,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Eagle's Splendor",FALSE,3,-2,-1,2);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Enervation",FALSE,2,-2,-2,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Unhallow",FALSE,3,3,6,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Warp Wood",FALSE,2,6,5,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Zone of Silence",FALSE,6,-5,-5,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Polar Ray",FALSE,0,-4,6,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Forceful Hand",FALSE,-3,0,-2,6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Owl's Wisdom",FALSE,-3,-4,-1,6);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus) VALUES ("Food ration",FALSE,0,0,0,2);

INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Sword",TRUE,5,-3,-1,1,5);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Penis Niger",TRUE,-1,4,-1,-1,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Storm",TRUE,4,-2,-5,5,2);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Flash",TRUE,-2,-6,-2,5,1);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Hammer",TRUE,2,3,1,-5,4);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Gun",TRUE,-2,-1,-1,-6,3);
INSERT INTO objects (name, defense_attack, att_bonus, def_bonus, per_bonus, hit_bonus,damage) VALUES ("Thunder",TRUE,-2,-1,-1,-6,5);
INSERT INTO objects (name) VALUES ("Coin");