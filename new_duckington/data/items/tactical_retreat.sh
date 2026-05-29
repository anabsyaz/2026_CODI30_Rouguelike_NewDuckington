#!/bin/bash

# import what you need here, for example:
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Tactical Retreat" # Name of the item that will be displayed by the game
ITEM_TYPE="Skill Card" # Type of the item, which can be "Consumable", "Junk", "Skill Card", "Book"
ITEM_DESC="You live to fight another day"
item_effect() {
    # You learn the "Tactical Retreat" skill card, which allows you to escape from a battle without taking damage.
    echo "You used $ITEM_NAME and learned the Tactical Retreat skill card!"
    if [[ $PLAYER_SKILL_CARDS="" ]]; then
        PLAYER_SKILL_CARDS="Tactical Retreat"
    else
        PLAYER_SKILL_CARDS=$PLAYER_SKILL_CARDS, "Tactical Retreat"
    fi

    skill_card="$GAME_ROOT/data/skill-cards/Unequipped/tactical_retreat.sh"
    equipped_directory=$GAME_ROOT/data/skill-cards/Equipped/
    if [ -e "$GAME_ROOT/data/skill-cards/Unequipped/tactical_retreat.sh" ]; then
        mv "$skill_card" "$equipped_directory"
        save_player_data
    else
        echo "You already have this skill equipped!"
        echo "Try selling this instead!"
    fi
}
ITEM_RARITY="Rare"
ITEM_NUMBER=012
ITEM_COST=0
ITEM_SELL=800