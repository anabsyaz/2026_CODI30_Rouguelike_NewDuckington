# Design Document

## Overview
It's a rogue-like game, there is an orgnization called new duckington. It's beside a pond called Whispering Waters. The player is a Duck. All the ducks in the world travelled to Whispering Waters to form an alliance against the bears. The unorganized bears tried to attack, but failed miserably. One bear stood out, and formed a pact with a dragon and then massacred the ducks. You play as a duck that is after the dragon and bear duo in order to get vengence.

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