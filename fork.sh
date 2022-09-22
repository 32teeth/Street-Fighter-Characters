#!/bin/bash

#---------------------------------
# FANCY STUFF
#---------------------------------
export nc='\033[0m' # No Color
export bold='\033[1m'
export white='\033[37m'
export greenbg='\033[42m'
export check='✅'
export running='⏳'

RESPONSE="${greenbg}Running Git Process ${nc}\n"

clear
echo -e "${RESPONSE}";


BEES=( Abel Abigail Adon Akira Akuma A-K-I Alex Balrog Birdie Blanka C-Viper Cammy Chun-Li Cody Dan Decapre Dee Jay Dhalsim Dudley E-Honda Eagle Ed El Fuerte Elena Eleven Evil Ryu F-A-N-G- Falke Fei Long G Geki Gen Gill Gouken Guile Guy Hakan Hugo Ibuki Ingrid Jamie Joe JP Juli Juni Juri Kage Karin Ken Kimberly Kolin Laura Lee Lily Lucia Luke M-Bison Maki Makoto Marisa Menat Mike Manon Nash Necalli Necro Oni Oro Poison Q R-Mika Rashid Remy Retsu Rolento Rose Rufus Ryu Sagat Sakura Sean Seth Shin-Akuma Sodom T-Hawk Twelve Urien Vega Violent Ken Yang Yun Zangief Zeku)
cd .github/workflows

for BEE in "${BEES[@]}";
do
  git checkout -b ${BEE}
  git push origin ${BEE}
done

