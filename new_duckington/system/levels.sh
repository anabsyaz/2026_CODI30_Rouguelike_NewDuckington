#!/bin/bash

# Leveling system: XP, levels, stat points, and level-up menu.

[ -z "$GAME_ROOT" ] && export GAME_ROOT="$(dirname "$0")/.."

## load_player_data
# Load saved player variables from GAME_ROOT/data/ into the shell.
load_player_data(){
    # shellcheck disable=SC1090
    source "$GAME_ROOT/data/player_data.sh" # WHERE PLAYER DATA FILES ARE STORED - ADJUST AS NEEDED!!!!!!
}

## levels_xp_for_next_level(level)
# Return XP required for next level (defaults to PLAYER_LEVEL). Formula: 100 + (L-1)*50
levels_xp_for_next_level() {
    local level="${1:-$PLAYER_LEVEL}"

    # ensure level >= 1
    if [[ -z "$level" || "$level" -lt 1 ]]; then
        level=1
    fi

    # Return computed XP requirement. Example: level 1 -> 100, level 2 -> 150
    echo $((100 + ((level - 1) * 50)))
}

## levels_sync_progression()
# Initialize progression variables and compute PLAYER_XP_NEXT.
levels_sync_progression() {
    : "${PLAYER_LEVEL:=1}"
    : "${PLAYER_XP:=0}"
    : "${PLAYER_STAT_POINTS:=0}"

    PLAYER_XP_NEXT="$(levels_xp_for_next_level "$PLAYER_LEVEL")"
}

## levels_level_up()
# Apply a single level-up: increment level, grant stat point, update threshold.
# Also apply a small base stat bonus on level-up: +1 to most stats, +0.1 to luck.
levels_level_up() {
    PLAYER_LEVEL=$((PLAYER_LEVEL + 1))
    PLAYER_STAT_POINTS=$((PLAYER_STAT_POINTS + 1))

    # Base level bonuses (apply immediately on level-up):
    PLAYER_HP_MAX=$(( ${PLAYER_HP_MAX:-0} + 10 ))
    PLAYER_HP=$(( ${PLAYER_HP:-0} + 10 ))
    PLAYER_ATK=$(( ${PLAYER_ATK:-0} + 1 ))
    PLAYER_DEF=$(( ${PLAYER_DEF:-0} + 1 ))
    PLAYER_NRG_MAX=$(( ${PLAYER_NRG_MAX:-0} + 1 ))
    PLAYER_NRG=$(( ${PLAYER_NRG:-0} + 1 ))
    PLAYER_SPD=$(( ${PLAYER_SPD:-0} + 1 ))
    # Increase luck by 0.1 (store as decimal string). Use awk to preserve one decimal.
    PLAYER_LCK=$(awk "BEGIN{printf \"%.1f\", (${PLAYER_LCK:-0} + 0.1)}")

    PLAYER_XP_NEXT="$(levels_xp_for_next_level "$PLAYER_LEVEL")"
}

## levels_check_level_up()
# Consume XP and apply level-ups repeatedly until PLAYER_XP < PLAYER_XP_NEXT.
levels_check_level_up() {
    levels_sync_progression

    while (( PLAYER_XP >= PLAYER_XP_NEXT )); do
        # consume the XP required for this level and level up
        PLAYER_XP=$((PLAYER_XP - PLAYER_XP_NEXT))
        levels_level_up
    done
}

## levels_gain_xp(xp)
# Add XP (argument) to PLAYER_XP, then check for level-ups. Validates input.
levels_gain_xp() {
    local xp_gain="${1:-0}"

    # Validate numeric input (allows negative but those are ignored below)
    [[ "$xp_gain" =~ ^-?[0-9]+$ ]] || return 1
    # If xp_gain is zero or negative do nothing (no XP awarded)
    (( xp_gain <= 0 )) && return 0

    levels_sync_progression
    PLAYER_XP=$((PLAYER_XP + xp_gain))
    # After adding XP, check and apply any level-ups
    levels_check_level_up
}

## levels_spend_stat_point(stat, amount)
# Spend stat points to increase a named stat; validates amount and deducts points.
levels_spend_stat_point() {
    local stat_name="${1:-}"
    local amount="${2:-1}"

    [[ "$amount" =~ ^[0-9]+$ ]] || return 1
    (( amount > 0 )) || return 1
    (( PLAYER_STAT_POINTS >= amount )) || return 1

    case "$stat_name" in
        HP|HP_MAX)
                # +10 max HP per point and heal by same amount
            PLAYER_HP_MAX=$((PLAYER_HP_MAX + (amount * 10)))
            PLAYER_HP=$((PLAYER_HP + (amount * 10)))
            ;;
        ATK)
            PLAYER_ATK=$((PLAYER_ATK + amount))
            ;;
        DEF)
            PLAYER_DEF=$((PLAYER_DEF + amount))
            ;;
        NRG|NRG_MAX)
            PLAYER_NRG_MAX=$((PLAYER_NRG_MAX + amount))
            PLAYER_NRG=$((PLAYER_NRG + amount))
            ;;
        SPD)
            PLAYER_SPD=$((PLAYER_SPD + amount))
            ;;
        LCK)
            PLAYER_LCK=$((PLAYER_LCK + amount))
            ;;
        *)
            # unknown stat name -> error
            return 1
            ;;
    esac

    # Deduct points and re-sync progression
    PLAYER_STAT_POINTS=$((PLAYER_STAT_POINTS - amount))
    levels_check_level_up
}

## levels_level_up_menu()
# Interactive menu for spending PLAYER_STAT_POINTS; shows stats and saves changes.
levels_level_up_menu() {
    # Interactive menu to spend PLAYER_STAT_POINTS
    : "${PLAYER_STAT_POINTS:=0}"

    if (( PLAYER_STAT_POINTS <= 0 )); then
        echo "No stat points available to spend."
        return 0
    fi

    # Ensure save_player_data is available (optional) so the menu can persist
    # changes automatically. If the helper is not defined, try sourcing
    # the stats helper which may provide it.
    if ! declare -f save_player_data >/dev/null 2>&1; then
        if [[ -f "$GAME_ROOT/system/stats.sh" ]]; then
            # shellcheck disable=SC1090
            source "$GAME_ROOT/system/stats.sh"
        fi
    fi

    levels_sync_progression

    while (( PLAYER_STAT_POINTS > 0 )); do
        echo "========================================"
        printf "Level: %d   XP: %d/%d   Stat points: %d\n" "$PLAYER_LEVEL" "$PLAYER_XP" "$PLAYER_XP_NEXT" "$PLAYER_STAT_POINTS"
        printf "HP : %d/%d   ATK: %d   DEF: %d\n" "$PLAYER_HP" "$PLAYER_HP_MAX" "$PLAYER_ATK" "$PLAYER_DEF"
        printf "NRG: %d/%d   SPD: %d   LCK: %d\n" "$PLAYER_NRG" "$PLAYER_NRG_MAX" "$PLAYER_SPD" "$PLAYER_LCK"
        echo "----------------------------------------"
        echo "Choose a stat to increase (points left: $PLAYER_STAT_POINTS):"
        echo " 1) HP   (+10 max HP per point)"
        echo " 2) ATK  (+1 ATK per point)"
        echo " 3) DEF  (+1 DEF per point)"
        echo " 4) NRG  (+1 NRG max per point)"
        echo " 5) SPD  (+1 SPD per point)"
        echo " 6) LCK  (+1 LCK per point)"
        echo " 7) Show stats"
        echo " 8) Done (save and exit)"

        read -r -p "Choice [1-8]: " choice

        case "$choice" in
            1) stat="HP" ;;
            2) stat="ATK" ;;
            3) stat="DEF" ;;
            4) stat="NRG" ;;
            5) stat="SPD" ;;
            6) stat="LCK" ;;
            7)
                # Show detailed stats without spending points
                printf "\nCurrent stats:\n"
                printf "HP : %d/%d\n" "$PLAYER_HP" "$PLAYER_HP_MAX"
                printf "ATK: %d   DEF: %d\n" "$PLAYER_ATK" "$PLAYER_DEF"
                printf "NRG: %d/%d   SPD: %d   LCK: %d\n\n" "$PLAYER_NRG" "$PLAYER_NRG_MAX" "$PLAYER_SPD" "$PLAYER_LCK"
                continue
                ;;
            8)
                # If a save helper exists, persist changes then exit menu
                if declare -f save_player_data >/dev/null 2>&1; then
                    save_player_data
                fi
                echo "Exiting level-up menu."
                return 0
                ;;
            *)
                echo "Invalid choice." ;;
        esac

        # ask amount if the player has multiple points
        if (( PLAYER_STAT_POINTS > 1 )); then
            read -r -p "How many points to spend on $stat? (1-$PLAYER_STAT_POINTS) [1]: " amt
            amt="${amt:-1}"
            if ! [[ "$amt" =~ ^[0-9]+$ ]] || (( amt < 1 || amt > PLAYER_STAT_POINTS )); then
                echo "Invalid amount." && continue
            fi
        else
            amt=1
        fi

        if levels_spend_stat_point "$stat" "$amt"; then
            echo "Spent $amt point(s) on $stat."
            # save after successful spend if save_player_data exists
            if declare -f save_player_data >/dev/null 2>&1; then
                save_player_data
            fi
        else
            echo "Failed to spend points on $stat."
        fi
    done

    # final save if possible
    if declare -f save_player_data >/dev/null 2>&1; then
        save_player_data
    fi

    echo "No stat points remaining."
    return 0
}