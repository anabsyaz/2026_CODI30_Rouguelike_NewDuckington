#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/enemies/ememy_example.sh"
source "$GAME_ROOT/combat/attack.sh"
source "$GAME_ROOT/combat/flee.sh"
source "$GAME_ROOT/screens/lose_screen.sh"

load_player_data



player_turn=true
base_flee_chance=10
battle_end=false

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

clear

while [[ $battle_end == false ]]; do
	clear
# player turn loop
	while [[ $player_turn == true ]]; do

		
	    echo -e "${CYAN}========================================${NC}"
	    echo -e "${YELLOW}         ⚔ YOUR TURN ⚔${NC}"
	    echo -e "${CYAN}========================================${NC}"
	    echo

	    echo -e "${WHITE}Choose your action:${NC}"
	    echo -e "${RED}[1] Attack${NC}"
	    echo -e "${BLUE}[2] Skill${NC}"
	    echo -e "${YELLOW}[3] Item${NC}"
	    echo -e "${GREEN}[4] Flee${NC} (your flee chance is $(( $base_flee_chance + $PLAYER_SPD*PLAYER_LCK/2 ))%)"
	    echo

	    read -p "Enter choice: " action


	    case $action in
	        1|attack|Attack)
	            
	            echo -e "${RED}You attack the enemy!${NC}"
	            attack

	            ;;
	            
	        2|skill|Skill)
	            
	            echo -e "${BLUE}You prepare a skill...${NC}"
	            bash skill.sh
	            ;;
	            
	        3|item|Item)
	            
	            echo -e "${YELLOW}Opening inventory...${NC}"
	            bash item.sh
	            ;;
	            
	        4|flee|Flee)
	            
	            echo -e "${GREEN}You attempt to flee!${NC}"
	            bash flee.sh
	            ;;
	            
	        *)
	            echo
	            echo -e "Invalid option. Try again."
	            sleep 2
	            bash combat_manager.sh
	            ;;
	    esac

	    sleep 1

	    player_turn=false
	    
	done



	while [[ player_turn != true ]]; do
		
	    echo -e "${YELLOW}========================================${NC}"
	    echo -e "${RED}         ⚔ ENEMY TURN ⚔${NC}"
	    echo -e "${YELLOW}========================================${NC}"

 	


	    echo -e "${RED}$ENEMY_NAME has used ${ENEMY_ATK_NAME:-"claw"}${NC}"

	    DAMAGE_TAKEN=$(($ENEMY_ATK-$PLAYER_DEF))

	    echo -e "you have taken $DAMAGE_TAKEN damage"
	    PLAYER_HP=$(($PLAYER_HP-$DAMAGE_TAKEN))

		if [[ $PLAYER_HP -lt 1 ]]; then
	    	PLAYER_HP=0
		fi

	   	echo "You now have $PLAYER_HP HP remaining"
	    read -p "press enter to continue: " hi
	    player_turn=true

	    if [[ $PLAYER_HP == 0 ]]; then
	    	battle_end=true
	    	lose_screen
	    fi	
	    

	    break
	    
	done

done

