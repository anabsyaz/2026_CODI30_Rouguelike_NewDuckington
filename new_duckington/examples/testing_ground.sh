#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export GAME_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"

load_player_data