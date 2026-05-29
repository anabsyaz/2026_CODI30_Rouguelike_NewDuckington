#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/enemies/ememy_example.sh"

load_player_data

attack() {

DAMAGE_DONE=$(( $PLAYER_ATK - $ENEMY_DEF ))

echo "you have done $DAMAGE_DONE damage to the $ENEMY_NAME"

ENEMY_HP=$(( $ENEMY_HP - $DAMAGE_DONE ))

echo "the $ENEMY_NAME has taken $DAMAGE_DONE damage the enemy how has $ENEMY_HP HP"

}

attack