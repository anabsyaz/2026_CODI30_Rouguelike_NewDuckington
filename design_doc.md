# Design Document

## Overview
It's a rogue-like game, there is an orgnization called New Duckington. It's beside a pond called Whispering Waters. The player is a Duck. All the ducks in the world travelled to Whispering Waters to form an alliance against the bears. The unorganized bears tried to attack, but failed miserably. One bear stood out, and formed a pact with a dragon and then massacred the ducks. You play as a duck that is after the dragon and bear duo in order to get vengeance.

## Concept
It's a text-based rogue-like RPG with a turn based combat system.

## Mechanics (Move/Text/Item)
- Randomly generated room structure each run
    - Starting room
    - Ending room (boss room)
    - Multiple room paths that connect
        - Looks almost like a branch
            - Branches out
            - Multiple paths may merge into one
            - @Weibo-student make ASCII representation
    - Always progresses forwards
    - When you finish a room, display ASCII of paths @Weibo-student
- Room types
    - Shop rooms
        - You can buy items like potions or weapons or skill cards
        - ALL of the shops are run by the same duck in a bear costume
    - Enemy rooms
        - This is where you would fight enemies
        - Enemies will be randomly chosen when entering a room
    - Event rooms
        - Events will be randomly chosen from a list when entering an event room
        - An "event" is when you are provided with a small text describing a setting or scenario where you will be presented pre-determined options 
- Out of Combat
    - You choose which room to go to next/plan your route
    - You can switch out weapons/armor or whatever
    - These will be seperate buttons/inputs
- Combat structure
    - Turn based (in a loop)
        - No enemy intent displayed
        - Display player status (like health)
        - Calculate statuses for player
            - Examples: fire damage, weakness/strength duration
        - Player does action
            - Attack
                - Change enemy hp, check if they die
            - Use Item
                - Effects depends on item
            - Flee
                - Chance to escape combat
        - Calculate statuses for enemies
        - Enemies do actions
            - Random
                - Attack
                    - Do damage, check if player dies
                - Flee
        - Repeat
- Inventory system
    - Catagories:
        - Equipment
            - Armor
            - Weapon
        - One-time-use Items
            - eg) health potion
        - Skill Cards
            - Actives/Passives
            - Does not need to be equipped
            - Actives should have a good effect while also taking a resource like energy
            - Passives are passive effects
            - Active example: fireball
            - Passive example: health gain on kill
- Equipment
    - Armor
        - Armor will increase statistics and maybe have innate passives when equipped
        - Hat slot 
    - Weapons
- Statistics
    - Energy
        - 0-5 by default
        - Increment by 1 at the start of your turn
        - Used for skills
    - Health
    - ATK (damage done)
    - DEF (damage reduction) 
    - NRG (prevents skill card spamming)
    - SPD (evasion; avoid all damage, influences flee chances)
    - LCK (influence crit and drops) (start with ~2%)
    - Stats scale with level, you get ~1/level stat points to allocate specifically to individual stats to create different builds


## Story / Theme
There is an organization called New Duckington. It's beside a pond called Whispering Waters. The player is a Duck. All the ducks in the world travelled to Whispering Waters to form an alliance against the bears. The unorganized bears tried to attack, but failed miserably. One bear stood out, and formed a pact with a dragon and then massacred the ducks. You play as a duck that is after the dragon and bear duo in order to get vengeance. go more in-depth herer i guess