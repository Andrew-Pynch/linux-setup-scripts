#!/usr/bin/env bash
rm -rf ~/.tmux.conf
cp .tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

