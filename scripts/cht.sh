#!/usr/bin/env bash

langugages=$(echo "golang c cpp typescript javascript rust csharp" | "tr" " " "\n")
core_utils=$(echo "find xargs sed awk grep" | "tr" " " "\n")
selected=$(echo -e "$langugages\n$core_utils" | fzf)

read -p "Give me thy query peasant: " query

if echo "$languages" | grep -qs $selected; then
	tmux split-window -v bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
	curl cht.sh/$selected~$query
fi
