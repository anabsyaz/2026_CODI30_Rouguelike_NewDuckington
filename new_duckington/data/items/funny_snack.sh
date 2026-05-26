#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Funny Snack"
ITEM_TYPE="Consumable"
ITEM_DESC="Your easy way out!"
item_effect() {
    # Sets HP to 0
    PLAYER_HP=0
    echo "You have escaped reality! But at what cost? Your HP has dropped to 0."
}
ITEM_RARITY="Legendary"
ITEM_NUMBER=002