#!/bin/bash -x
#constant
START_POSITION = 0

#variable
dice=0

rollDie() {
	dice=$(( RANDOM % 6 + 1 ))
}
rollDie
echo $dice
