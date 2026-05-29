#!/bin/bash
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Wonster"
ITEM_TYPE="Consumable"
ITEM_DESC="A mysterious concoction that doesn't get you high. Restores 50 NRG."
item_effect() {
    if [[ "$PLAYER_NRG + 50" -ge "$PLAYER_NRG_MAX" ]]; then
        nrg_restored=$((PLAYER_NRG_MAX - PLAYER_NRG))
        PLAYER_NRG=$PLAYER_NRG_MAX
        echo "You used $ITEM_NAME, and you restored $nrg_restored NRG. Your NRG is now full at $PLAYER_NRG/$PLAYER_NRG_MAX."
    else
        PLAYER_NRG=$((PLAYER_NRG + 50))
        echo "You used $ITEM_NAME, and your NRG is now at $PLAYER_NRG/$PLAYER_NRG_MAX."
    fi

    # save the game
    save_player_data
}
ITEM_RARITY="Legendary"
ITEM_NUMBER=009
ITEM_COST=100
ITEM_SELL=50