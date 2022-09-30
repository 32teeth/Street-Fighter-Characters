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


STUDENTS=( Abel Abigail Adon Akira Akuma A-K-I Alex Balrog Birdie Blanka C-Viper Cammy Chun-Li Cody Dan Decapre Dee-Jay Dhalsim Dudley E-Honda Eagle Ed El-Fuerte Elena Eleven Evil-Ryu F-A-N-G- Falke Fei-Long G Geki Gen Gill Gouken Guile Guy Hakan Hugo Ibuki Ingrid Jamie Joe JP Juli Juni Juri Kage Karin Ken Kimberly Kolin Laura Lee Lily Lucia Luke M-Bison Maki Makoto Marisa Menat Mike Manon Nash Necalli Necro Oni Oro Poison Q R-Mika Rashid Remy Retsu Rolento Rose Rufus Ryu Sagat Sakura Sean Seth Shin-Akuma Sodom T-Hawk Twelve Urien Vega Violent-Ken Yang Yun Zangief Zeku)

create_workflows () {
  cd .github/workflows
  for STUDENT in "${STUDENTS[@]}";
  do
    echo -e "${RESPONSE}\n${running} ${bold} creating ${STUDENT} workflow${nc}";
    touch ${STUDENT}.yaml
    tee ${STUDENT}.yaml << END
name: CI
on:
  push:
    branches: [ "${STUDENT}" ]
  pull_request:
    branches: [ "${STUDENT}" ]

  workflow_dispatch:
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Run a one-line script
        run: echo ${STUDENT}!
END
    RESPONSE="${RESPONSE}\n${check} ${white} created ${STUDENT} workflow${nc}";
  done
}

create_branches () {
  for STUDENT in "${STUDENTS[@]}";
  do
    echo -e "${RESPONSE}\n${running} ${bold} creating ${STUDENT} branch${nc}";
    git checkout -b ${STUDENT}
    RESPONSE="${RESPONSE}\n${check} ${white} created ${STUDENT} branch${nc}";
  done
}

delete_branches () {
  for STUDENT in "${STUDENTS[@]}";
  do
    echo -e "${RESPONSE}\n${running} ${bold} deleting ${STUDENT} branch${nc}";
    #git branch -D ${STUDENT}
    git push origin --delete ${STUDENT}
    #git push origin -d ${STUDENT}
    RESPONSE="${RESPONSE}\n${check} ${white} deleted ${STUDENT} branch${nc}";
  done
}

sync_branches () {
  for STUDENT in "${STUDENTS[@]}";
  do
    echo -e "${RESPONSE}\n${running} ${bold} pushing ${STUDENT} branch${nc}";
    git checkout ${STUDENT}
    git rebase main
    git add . && git commit -am "updateing ${STUDENT}" && git push
    RESPONSE="${RESPONSE}\n${check} ${white} pushed ${STUDENT} branch${nc}";
  done
}

push_branches () {
  for STUDENT in "${STUDENTS[@]}";
  do
    echo -e "${RESPONSE}\n${running} ${bold} pushing ${STUDENT} branch${nc}";
    git checkout ${STUDENT}
    git push origin ${STUDENT}
    RESPONSE="${RESPONSE}\n${check} ${white} pushed ${STUDENT} branch${nc}";
  done
}

push_branch () {
  for STUDENT in "${STUDENTS[@]}";
  do
    echo -e "${RESPONSE}\n${running} ${bold} pushing ${STUDENT} branch${nc}";
    git checkout ${STUDENT}
    git push
    RESPONSE="${RESPONSE}\n${check} ${white} pushed ${STUDENT} branch${nc}";
  done
}

create_workflows