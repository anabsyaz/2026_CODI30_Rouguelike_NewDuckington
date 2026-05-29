#!/bin/bash
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Max Potion"
ITEM_TYPE="Consumable"
ITEM_DESC="A mysterious concoction that is made from bear guts and dragon scales. Heals all HP."
item_effect() {
    # calculate the amount of HP to restore
    health_restored=$((PLAYER_HP_MAX - PLAYER_HP))
    # restore HP to max
    PLAYER_HP=$PLAYER_HP_MAX
    echo "You used $ITEM_NAME, and you restored $health_restored HP. Your HP is now full at $PLAYER_HP/$PLAYER_HP_MAX."

    # save the game
    save_player_data
}
ITEM_RARITY="Epic"
ITEM_NUMBER=006
ITEM_COST=300
ITEM_SELL=150