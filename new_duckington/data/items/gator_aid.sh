#!/bin/bash
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Gator Aid"
ITEM_TYPE="Consumable"
ITEM_DESC="A mysterious concoction that doesn't get you high. Restores 5 NRG."
item_effect() {
    if [[ "$PLAYER_NRG + 5" -ge "$PLAYER_NRG_MAX" ]]; then
        nrg_restored=$((PLAYER_NRG_MAX - PLAYER_NRG))
        PLAYER_NRG=$PLAYER_NRG_MAX
        echo "You used $ITEM_NAME, and you restored $nrg_restored NRG. Your NRG is now full at $PLAYER_NRG/$PLAYER_NRG_MAX."
    else
        PLAYER_NRG=$((PLAYER_NRG + 5))
        echo "You used $ITEM_NAME, and your NRG is now at $PLAYER_NRG/$PLAYER_NRG_MAX."
    fi

    # save the game
    save_player_data
}
ITEM_RARITY="Uncommon"
ITEM_NUMBER=007
ITEM_COST=20
ITEM_SELL=10