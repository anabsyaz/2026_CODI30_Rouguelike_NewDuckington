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
            - Skill
                - Skill card slots
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


## Story

It's a rogue-like game set in a world where ducks and bears are at war. There is an organization called New Duckington beside a pond known as Whispering Waters. Ducks from all around the world gathered there to form an alliance against the bears.

The bears, being unorganized, failed in their attempts to attack the alliance. However, one bear rose above the others and formed a pact with a dragon. Together, they launched a devastating assault that massacred the ducks of Whispering Waters.

You play as one of the few surviving ducks, driven by vengeance and determined to hunt down the bear and dragon duo responsible for the destruction.

## Progression of Events

You begin the story at Whispering Waters

Magic asteriod lands and the ducks race the bears (and win; cannot advance if the duck loses the race). The ducks gain superpowers from the asteroid. 

Ducks storm the Bear castle and fight for vengeance 

## Concept
- Turn-based
- Text-based
- Rogue-like
- Keep level on death (lose your items, stat boosts)
- Refurbished terminal interface
- Items (weapons, armour) boosts stats (on equip) (similar to accessories)
- Potions (stat multipliers) (one-time use)
- Skill card system (one card slot- can get more later with ascending levels, each card is individual, and it has a skill tree) (the thing where it does the thing)
- Manual save (git push) (figure out save systems later)
- Online feature (maybe) (constant git pushing)
- Auto update (part of online feature)
- No traveling (will be storytelling instead) (no WASD movement)
- after every fight: gold drops, xp drops, weapon drops (rng dependant)
- Stats: ATK (damage done), HP (amount of damage you can take), DEF (damage reduction), NRG (prevents skill card spamming), SPD (evasion; avoid all damage, influences flee chances), LCK (influence crit and drops) (start with ~2%)
- Stats scale with level, you get ~1/level stat points to allocate specifically to individual stats to create different builds
- Built-In cheat codes (QoL)

## Objective / use case
- Final boss is the bear/dragon duo (100th floor)
- You fight cronies, grunts. etc on the way
- Add funny story on the way though

## Interactions (What uses or where it used)
- On your attack turn: you have one action per turn; either use item, attack, or flee/run/escape
- When the enemy dies, you get your loot drops with ASCII menu
- the menu displays stats, levels, xp, xp needed, battle summary, drops, hp
- cool drops get appropriate fanfare
- map interface is after the menu, this phase is when you can choose where to go next. 
- Not all battles end in a map choice, sometimes you are forced to go somewhere. (forced boss fights every 10 floors)

## flowchart / Design
```
╔══════════════════════════════╗
║       NEW DUCKINGTON         ║
╚══════════════════════════════╝
               │
               ▼
╔══════════════════════════════╗
║          MAIN MENU           ║
╚══════════════════════════════╝
               │
               ▼
╔══════════════════════════════╗
║      LOAD / NEW GAME         ║
║   Manual save  (git push)    ║
╚══════════════════════════════╝
               │
               ▼
╔══════════════════════════════╗
║      CHARACTER SCREEN        ║
║  ATK · HP · DEF · NRG        ║
║        SPD · LCK             ║
╚══════════════════════════════╝
               │
━━━━━━━━━━━━ FLOOR LOOP ━━━━━━━━━━━━
               │
               ▼
╔══════════════════════════════╗
║    STORY BEAT / NARRATION    ║◄──────────────────────────────────────────┐
╚══════════════════════════════╝                                           │
               │                                                           │
               ▼                                                           │
╔══════════════════════════════╗                                           │
║      ENCOUNTER BEGINS        ║                                           │
║   Cronies, grunts, etc.      ║                                           │
╚══════════════════════════════╝                                           │
               │                                                           │
               ▼                                                           │
╔══════════════════════════════╗    Flee     ╔══════════════╗              │
║         PLAYER TURN          ║────────────►║   ESCAPED!   ║──► (map)     │
║ Attack · Item · Skill · Flee ║             ╚══════════════╝              │
╚══════════════════════════════╝                                           │
               │  ▲                                                        │
               │  └──────────────── enemy still alive ──────────────────┐  │
               ▼                                                        │  │
╔══════════════════════════════╗                                        │  │
║         ENEMY TURN           ║                                        │  │
╚══════════════════════════════╝                                        │  │
               │                                                        │  │
               ▼                                                        │  │
╔══════════════════════════════╗                                        │  │
║       DUCK DEFEATED?         ║                                        │  │
╚══════════════════════════════╝                                        │  │
        │              │                                                │  │
       Yes         No (enemy dead)                                      │  │
        │              │                                                │  │
        ▼              └────────────────────────────────────────────────┘  │
╔══════════════╗                                                           │
║ DEATH SCREEN ║         ▼ (enemy dead, continue)                          │
║  Keep LVL    ║                                                           │
║  Lose items  ║  ╔══════════════════════════════╗                         │
╚══════════════╝  ║    LOOT SCREEN (ASCII menu)  ║                         │
        │         ║  Gold · XP · Weapon/Armour   ║                         │
        │         ║  Cool drops get fanfare      ║                         │
        │         ╚══════════════════════════════╝                         │
        │                        │                                         │
        │                        ▼                                         │
        │         ╔══════════════════════════════╗                         │
        │         ║          LEVEL UP?           ║                         │
        │         ║  Allocate stat points        ║                         │
        │         ║  Unlock skill card slots     ║                         │
        │         ╚══════════════════════════════╝                         │
        │                        │                                         │
        │         ━━━━━━━ EVERY 10 FLOORS ━━━━━━━                          │
        │                        │                                         │
        │                        ▼                                         │
        │         ╔══════════════════════════════╗                         │
        │         ║    FLOOR 10 / 20 / ... / 90? ║                         │
        │         ╚══════════════════════════════╝                         │
        │                │               │                                 │
        │               Yes              No                                │
        │                │               │                                 │
        │                ▼               ▼                                 │
        │         ╔════════════╗  ╔════════════════════════════╗           │
        │         ║ BOSS FIGHT ║  ║     MAP / PATH CHOICE      ║           │
        │         ║ (no map    ║  ║  Choose next encounter     ║           │
        │         ║  choice)   ║  ╚════════════════════════════╝           │
        │         ╚════════════╝                │                          │
        │                │                      │                          │
        │                └──────────┬───────────┘                          │
        │                           │                                      │
        │                           ▼                                      │
        │         ╔══════════════════════════════╗                         │
        │         ║          FLOOR 100?          ║                         │
        │         ╚══════════════════════════════╝                         │
        │                │               │                                 │
        │               Yes              No ───────────────────────────────┘
        │                │
        │         ━━━━━━ FLOOR 100 ━━━━━━
        │                │
        │                ▼
        │         ╔══════════════════════════════╗
        │         ║  FINAL BOSS — BEAR/DRAGON    ║
        │         ║  The ones who massacred      ║
        │         ║      New Duckington          ║
        │         ╚══════════════════════════════╝
        │                        │
        │                        ▼
        │         ╔══════════════════════════════╗
        │         ║   VICTORY — VENGEANCE        ║
        │         ║        SERVED                ║
        │         ╚══════════════════════════════╝
        │
        └──► restart floor loop (keep LVL, lose items/boosts)
```

## Modifications (current / completed / future)


## Appendix / Supporting Docs
