#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export GAME_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$GAME_ROOT/save/save_game.sh"

# Load the player's data from the save file. This function should be called at the start of the game to initialize the player's stats and inventory.
load_player_data() {
    local save_file="$GAME_ROOT/save/save_data.txt"
    if [[ -f "$save_file" ]]; then
        echo "Loading game data from $save_file..."
        local player_data_hash=$(cat "$save_file")
        # you can use the same hashing method you used in save_game.sh to decode the player data
        local player_data=$(echo "$player_data_hash" | base64 --decode)
        IFS=',' read -r PLAYER_NAME PLAYER_LEVEL PLAYER_XP PLAYER_XP_NEXT PLAYER_STAT_POINTS PLAYER_GOLD PLAYER_FLOOR PLAYER_HP PLAYER_HP_MAX PLAYER_ATK PLAYER_DEF PLAYER_NRG PLAYER_NRG_MAX PLAYER_SPD PLAYER_LCK PLAYER_WEAPON PLAYER_ARMOR PLAYER_HAT PLAYER_ITEMS PLAYER_SKILL_CARDS <<< "$player_data"
        echo "Game data loaded successfully!"
    else
        echo "No save file found. Starting a new game..."
        # initialize player data with default values
        PLAYER_NAME="Player"
        PLAYER_LEVEL=1
        PLAYER_XP=0
        PLAYER_XP_NEXT=100
        PLAYER_STAT_POINTS=0
        PLAYER_GOLD=0
        PLAYER_FLOOR=1
        PLAYER_HP=100
        PLAYER_HP_MAX=100
        PLAYER_ATK=10
        PLAYER_DEF=5
        PLAYER_NRG=50
        PLAYER_NRG_MAX=50
        PLAYER_SPD=10
        PLAYER_LCK=2
        PLAYER_WEAPON="None"
        PLAYER_ARMOR="None"
        PLAYER_HAT="None"
        PLAYER_ITEMS="None"
        PLAYER_SKILL_CARDS="None"
        export_player_data
    fi
}

