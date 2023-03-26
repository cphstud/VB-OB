#!/bin/bash
# inuput is jsonfile with tracking

input=$1
output=$2
jq -r '.| [.frameIdx, .gameClock,.homePlayers[].playerId, 
.homePlayers[].xyz[0],.homePlayers[].xyz[1], 
.awayPlayers[].playerId, .awayPlayers[].xyz[0], 
.awayPlayers[].xyz[1],.ball.xyz[0],.ball.xyz[1]] | @csv ' $input  > $output
