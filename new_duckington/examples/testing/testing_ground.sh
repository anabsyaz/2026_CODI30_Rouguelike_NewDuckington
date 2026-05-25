#!/bin/bash

export GAME_ROOT="$(dirname "$0")/../.."
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items-pool.sh"
load_player_data
display_player_stats
display_player_equipment
display_player_items
display_player_skill_cards
get_item_pool