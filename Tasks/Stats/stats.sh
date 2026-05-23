#!/bin/bash

lvl=1
hp=100
atk=10
def=10
nrg=10
spd=10
lck=2

display_stats() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  STATS          ║"
    echo "╠══════════════════════════════╣"
    printf "║  LVL: %d        XP: %d/%d       ║\n"
    printf "║  HP : %d/%d                    ║\n"
    printf "║  NRG: %d/%d                    ║\n"
    printf "║  ATK: %d        DEF: %d        ║\n"
    printf "║  SPD: %d        LCK: %d%%       ║\n"
    echo "╚══════════════════════════════╝"
}

display_stats