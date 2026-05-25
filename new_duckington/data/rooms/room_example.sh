#!/bin/bash
# Room data file — only stores room descriptions and rewards, no logic here

# ─────────────────────────────────────────
# PART 1: Preview shown when choosing this room on the map
# ─────────────────────────────────────────
ROOM_PREVIEW="Flickering firelight bleeds through the cracks of the door. You can hear something pacing heavily inside."

# ─────────────────────────────────────────
# PART 2: Description shown when entering the room
# ─────────────────────────────────────────
ROOM_ENCOUNTER="You push open the door. A bear soldier stands with its back to you, warming itself by a fire. It slowly turns around, eyes red, and lets out a low growl."

# ─────────────────────────────────────────
# PART 3: Which enemy this room spawns
# room_manager will look for this file inside data/enemies/
# ─────────────────────────────────────────
ROOM_ENEMY="bear_grunt.sh"

# ─────────────────────────────────────────
# PART 4: Bonus rewards after combat
# ─────────────────────────────────────────
ENEMY_GOLD_DROP=10
ENEMY_XP_DROP=20
ENEMY_ITEM_DROP=""