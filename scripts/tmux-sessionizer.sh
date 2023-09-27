#!/usr/bin/env bash

session = $(find ~ ~/personal ~/work -mindepth 1 -maxdepth 1 -type d | fzf)
session_name = $(basename "$session")

echo "session $session_name"
