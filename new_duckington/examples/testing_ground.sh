#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items_manager.sh"
load_player_data
display_player_stats
get_item_pool
test_use_item
display_player_stats
save_player_data