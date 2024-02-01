#!/bin/bash

set -xe

shopt -s expand_aliases

. alias.sh

## Step 1

# Configure h1
## Example use
#h1 ip addr add 10.1.0.2/24 brd + dev h1-eth0 # Configure the interface IP
#h1 ip route add default via 10.1.0.1 dev h1-eth0 # Configure the routing table
h1 ip addr add 1.1.0.2/24 brd + dev h1-eth0
h1 ip route add default via 1.1.0.1 dev h1-eth0

# Configure r1
r1 ip addr add 1.1.0.1/24 brd + dev r1-eth0
r1 ip addr add 1.0.1.1/30 brd + dev r1-eth1
r1 ip addr add 1.0.3.1/30 brd + dev r1-eth2
r1 ip route add default via 1.0.1.2 dev r1-eth1

# Configure h2
h2 ip addr add 1.2.0.2/24 brd + dev h2-eth0
h2 ip route add default via 1.2.0.1 dev h2-eth0

# Configure r2
r2 ip addr add 1.2.0.1/24 brd + dev r2-eth0
r2 ip addr add 1.0.1.2/30 brd + dev r2-eth1
r2 ip addr add 1.0.3.1/30 brd + dev r2-eth2
r2 ip route add default via 1.0.3.2 dev r2-eth2

# Configure h3
h3 ip addr add 10.0.0.2/24 brd + dev h3-eth0
h3 ip route add default via 10.0.0.1 dev h3-eth0

# Configure h4
h4 ip addr add 10.0.0.3/24 brd + dev h4-eth0
h4 ip route add default via 10.0.0.1 dev h4-eth0

# Configure r3
r3 ip addr add 10.0.0.1/24 brd + dev r3-eth0
r3 ip addr add 1.0.2.2/30 brd + dev r3-eth1
r3 ip addr add 1.0.3.2/30 brd + dev r3-eth2
r3 ip route add default via 1.0.2.1 dev r3-eth1

## Step 2
# Enable NAT on r3

# Allow traffic from r3-eth0 to r3-eth1 and r3-eth2

# Allow established returning traffic from r3-eth1 and r3-2th2 to r3-eth0

# Drop all other traffic
