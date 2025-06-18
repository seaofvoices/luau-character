#!/bin/sh

set -e

scripts/build-single-file.sh .darklua-bundle.json build/character.luau
scripts/build-roblox-model.sh .darklua.json build/character.rbxm
