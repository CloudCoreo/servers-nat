cloudcoreo-nat
==============

Highly Available NAT instance configuration

In addition, it will create and maintain a <b>mostly-available</b> NAT instance in the public subnets.

* <b>Mostly-Available</b> refers to the fact that the HA will go down in the event of its AZ outage, but auto scaling will relaunch in a different AZ ensuring minimum downtime of the NAT

This repo is designed to work with the [CloudCoreo](http://www.cloudcoreo.com) engine. Adding this repository as a sub-module will ensure a High-uptime NAT is configured to work even in the event of a loss of availability zone.


## Description
Highly Available NAT instance configuration


## Hierarchy
![composite inheritance hierarchy](https://raw.githubusercontent.com/CloudCoreo/servers-nat/master/images/hierarchy.png "composite inheritance hierarchy")



## Required variables with no default

**None**


## Required variables with default

### `NAT_SG_NAME`:
  * description: the name of the security group to create for the NAT
  * default: NAT-sg


### `VPC_NAME`:
  * description: the name of the VPC
  * default: test-vpc


### `NAT_INGRESS_PORTS`:
  * description: allowed ingress ports on the nat
  * default: 0..65535

### `NAT_INGRESS_CIDRS`:
  * description: allowed ingress network cidrs on the nat
  * default: 0.0.0.0/0

### `NAT_EGRESS_PORTS`:
  * description: allowed ingress ports on the nat
  * default: 0..65535

### `NAT_EGRESS_CIDRS`:
  * description: allowed ingress network cidrs on the nat
  * default: 0.0.0.0/0

### `REGION`:
  * description: use default except for multiple region use cases
  * default: PLAN::region

### `NAT_NAME`:
  * description: the name of the nat instance
  * default: NAT


### `NAT_SIZE`:
  * description: the instance size of the nat
  * default: t2.small


### `NAT_GROUP_SIZE_MIN`:
  * description: the miniumum number of NAT instances to launch
  * default: 1

### `NAT_GROUP_SIZE_MAX`:
  * description: the maximum number of NAT instances to launch
  * default: 1

### `PUBLIC_SUBNET_NAME`:
  * description: the cloudcoreo name of the public vpc subnets
  * default: test-public-subnet


### `TIMEZONE`:
  * description: the timezone the servers should come up in
  * default: America/Chicago


### `MONITORINTERVAL`:
  * description: time in seconds between route checks
  * default: 20

### `PRIVATE_SUBNET_NAME`:
  * description: 
  * default: test-private-subnet


### `PRIVATE_SUBNETS`:
  * description: 
  * default: COMPOSITE::coreo_aws_vpc_subnet.test-private-subnet.subnet_ids



## Optional variables with default

### `NAT_KEY`:
  * description: The name of the key to use for the nat box
  * default: TBS


### `LOGFILE`:
  * description: ha-nat log file
  * default: /var/log/ha-nat.log



## Optional variables with no default

### `NAT_AMI`:
  * description: the ami id of the nat

### `DATADOG_KEY`:
  * description: If you have a datadog key, enter it here and we will install the agent

### `SUFFIX`:
  * description: when used will use the value to suffix the names of all converged objects

## Tags
1. Network
1. VPC
1. NAT
1. High Availability

## Categories
1. Network



## Diagram
![alt text](https://raw.githubusercontent.com/CloudCoreo/servers-nat/master/images/diagram.png "HA-NAT")


## Icon
![alt text](https://raw.githubusercontent.com/CloudCoreo/servers-nat/master/images/icon.png "HA-NAT icon")

