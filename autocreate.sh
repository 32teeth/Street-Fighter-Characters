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
export rocket='🚀'

RESPONSE="${greenbg}Running Process ${nc}\n"

clear
echo -e "${RESPONSE}";

create_workflows () {
  mkdir -p .codecatalyst/workflows
  cd .codecatalyst/workflows
  while [[ $n -le 1000 ]]
  do
    echo -e "${RESPONSE}\n${running} ${bold} creating workflow-${n}workflow${nc}";
    touch workflow-${n}.yaml
    tee workflow-${n}.yaml << END
Name: workflow-$n
SchemaVersion: 1.0
RunMode: QUEUED
Triggers:
  - Type: Push
    Branches:
      - group-by-organization-id
Actions:
  Mock:
    Identifier: aws/workflows-mock-gamma@v1
    Inputs:
      Sources:
        - WorkflowSource
END
    RESPONSE="${RESPONSE}\n${check} ${white} created workflow-${n} workflow${nc}";

    if ! ((n % 40)); then
        RESPONSE="${RESPONSE}\n${rocket} ${white} [ushing last 10 workflows]${nc}";
        commit_workflows
    fi

    ((n = n + 1))
  done
}

commit_workflows () {
  git add . && git commit -am "updateting workflows" && git push
}

create_workflows