#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"

export_player_data() {
    save_player_data
    # take the player data, hash it in a way that is specific to the game so it's easy to unhash it and load game state,
    # and save it to a file in the save directory
    local save_file="$GAME_ROOT/save/save_data.txt"
    # create the save directory if it doesn't exist
    mkdir -p "$GAME_ROOT/save"
    # save the player data to the file
    echo "Saving game data to $save_file..."
    # you can use any hashing method you like, for example, base64 encoding, or a simple custom hash function
    local player_data_hash=$(echo "$PLAYER_NAME,$PLAYER_LEVEL,$PLAYER_XP,$PLAYER_XP_NEXT,$PLAYER_STAT_POINTS,$PLAYER_GOLD,$PLAYER_FLOOR,$PLAYER_HP,$PLAYER_HP_MAX,$PLAYER_ATK,$PLAYER_DEF,$PLAYER_NRG,$PLAYER_NRG_MAX,$PLAYER_SPD,$PLAYER_LCK,$PLAYER_WEAPON,$PLAYER_ARMOR,$PLAYER_HAT,$PLAYER_ITEMS,$PLAYER_SKILL_CARDS" | base64)
    echo "$player_data_hash" > "$save_file"
    echo "Game data saved successfully!"
}
