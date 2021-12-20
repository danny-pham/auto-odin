#!/bin/bash


WALLET=""
CHAINID="odin-mainnet-freya"
RATE="loki"
ADD_WALLET=odinxxx
VAL_WALLET=odinvaloperxxx

sleep 2

odind tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --from $WALLET --chain-id $CHAINID --node=tcp://localhost:26957 -y

sleep 10

BALANCE=$(odind query bank balances $ADD_WALLET --node=tcp://localhost:26957 | grep "amount" | cut -d'"' -f 2)
BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
BALANCE=$((BALANCE - 200000))

sleep 2

printf "%b\n\n\n" "--------------------------------------------------------------------------------"

odind tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --from $WALLET --chain-id $CHAINID --node=tcp://localhost:26957 -y

sleep 120
