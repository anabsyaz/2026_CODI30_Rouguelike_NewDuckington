#!/bin/bash

# import what you need here, for example:
# source new_duckington/main.sh
# source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Old Boot"
ITEM_TYPE="Junk"
ITEM_DESC="A worn out boot that smells oddly like duck feet. It has no practical use, but it might be worth something to the right buyer."
item_effect() {
    echo "You used $ITEM_NAME, but nothing happened. Maybe you should try selling it instead?"
    # This item is useful for a story event later- 
    # you can trigger the event by having this item in your inventory and reaching a certain floor.
    save_player_data
}
ITEM_RARITY="Common"
ITEM_NUMBER=010 # Unique identifier for the item
ITEM_COST=0
ITEM_SELL=1