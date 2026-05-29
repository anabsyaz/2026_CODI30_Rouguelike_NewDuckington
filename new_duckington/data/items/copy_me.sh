#!/bin/bash

# import what you need here, for example:
# source new_duckington/main.sh
# source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Copy Me" # Name of the item that will be displayed by the game
ITEM_TYPE="Consumable" # Type of the item, which can be "Consumable", "Junk", "Skill Card", "Book"
ITEM_DESC="A mysterious item that seems to have no effect. Maybe it's just a copy of something else?"
item_effect() {
    # This function defines the effect of the item when used by the player.
    # You can modify the player's stats or inventory here.
    echo "You used $ITEM_NAME, but nothing happened."
    # save the game
    # save_player_data
}
ITEM_RARITY="Legendary" # Rarity of the item, which can be "Common", "Uncommon", "Rare", "Epic", "Legendary"
ITEM_NUMBER=001 # Unique identifier for the item
ITEM_COST=0 # Cost of the item in the shop, if it's a shop item. You can set it to 0 if it's not a shop item.
ITEM_SELL=0 # Sell price of the item in the shop, if it's a shop item. You can set it to 0 if it's unsellable.