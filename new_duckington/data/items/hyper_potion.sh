#!/bin/bash
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Hyper Potion"
ITEM_TYPE="Consumable"
ITEM_DESC="A mysterious concoction that is made from bear guts and dragon scales. Heals 120 HP."
item_effect() {
    if [[ "$PLAYER_HP + 120" -ge "$PLAYER_HP_MAX" ]]; then
        health_restored=$((PLAYER_HP_MAX - PLAYER_HP))
        PLAYER_HP=$PLAYER_HP_MAX
        echo "You used $ITEM_NAME, and you restored $health_restored HP. Your HP is now full at $PLAYER_HP/$PLAYER_HP_MAX."
    else
        PLAYER_HP=$((PLAYER_HP + 120))
        echo "You used $ITEM_NAME, and Your HP is now at $PLAYER_HP/$PLAYER_HP_MAX."
    fi

    # save the game
    save_player_data
}
ITEM_RARITY="Rare"
ITEM_NUMBER=005
ITEM_COST=150
ITEM_SELL=75