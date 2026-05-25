#!/bin/bash

# This file gets all the items under the data/items folder and put them into the variable ITEMS_POOL, 
# which will be used in the game to generate random items for the player.

export GAME_ROOT="$(dirname "$0")/.."
ITEMS_POOL=()
for item_file in "$GAME_ROOT/data/items/"*; do
    if [[ -f "$item_file" ]]; then
        item_name=$(basename "$item_file")
        ITEMS_POOL+=("$item_name")
    fi
done

get_item_pool() {
    echo "${ITEMS_POOL[@]}"
}