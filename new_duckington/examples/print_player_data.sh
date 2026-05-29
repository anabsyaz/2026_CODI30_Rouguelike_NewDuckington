#!/bin/bash
# This is an example for how to get the player's data and change it

# This is how you get loading and saving functions from the script
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

# This is the function from stats.sh, it will load all the player's data to the local memory so you can use it.
load_player_data

# This is a demo to show you how to use the variables you get by the function load_player_data
display_stats() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  STATS          ║"
    echo "╠══════════════════════════════╣"
    printf "║  LVL: %3d   XP: %5d/%-5d  ║\n" "$PLAYER_LEVEL" "$PLAYER_XP" "$PLAYER_XP_NEXT" # These are the variable names for the player data. 
    printf "║  HP : %5d/%-5d            ║\n" "$PLAYER_HP" "$PLAYER_HP_MAX"                  # You could check the stats.sh for all the variables.
    printf "║  NRG: %5d/%-5d            ║\n" "$PLAYER_NRG" "$PLAYER_NRG_MAX"
    printf "║  ATK: %3d   DEF: %3d         ║\n" "$PLAYER_ATK" "$PLAYER_DEF"
    printf "║  SPD: %3d   LCK: %3d%%        ║\n" "$PLAYER_SPD" "$PLAYER_LCK"
    echo "╚══════════════════════════════╝"
}

# Display the stats right now
display_stats

# Change some of them
PLAYER_HP=$(( PLAYER_HP - 30 ))      # loss HP
PLAYER_GOLD=$(( PLAYER_GOLD + 50 ))  # gain gold
PLAYER_XP=$(( PLAYER_XP + 20 ))      # gain HP

# Display the stats after changing
display_stats

# Save the stats to the file
save_player_data





