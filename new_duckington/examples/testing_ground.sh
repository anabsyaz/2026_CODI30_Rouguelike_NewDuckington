#!/bin/bash
set -e
source new_duckington/main.sh
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items_manager.sh"

load_player_data
display_player_skill_cards
use_item "tactical_retreat"
display_player_skill_cards