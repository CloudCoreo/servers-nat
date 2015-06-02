cloudcoreo-nat
==============

Highly Available NAT instance configuration

In addition, it will create and maintain a <b>mostly-available</b> NAT instance in the public subnets.

* <b>Mostly-Available</b> refers to the fact that the HA will go down in the event of its AZ outage, but auto scaling will relaunch in a different AZ ensuring minimum downtime of the NAT

This repo is designed to work with the [CloudCoreo](http://www.cloudcoreo.com) engine. Adding this repository as a sub-module will ensure a High-uptime NAT is configured to work even in the event of a loss of availability zone.

## Description
Highly Available NAT instance configuration

## OVERRIDE OPTIONAL VARIABLES
* <b>VPC_NAME:</b>
  * required: true
  * description: this is the name of your vpc as defined by your [CloudCoreo](http://www.cloudcoreo.com) setup
  * default: test-vpc
* <b>PUBLIC_SUBNET_NAME:</b>
  * required: true
  * description: this is the name of the public subnet group as defined by your [CloudCoreo](http://www.cloudcoreo.com) setup
  * default: test-public-subnet
* <b>NAT_SG_NAME:</b>
  * required: true
  * description: the name of the security group to create for the NAT
  * default: "NAT-sg"
* <b>NAT_INGRESS_PORTS:</b>
  * required: true
  * description: allowed ingress ports on the nat
  * default:
    * - "80"
    * - "443"
* <b>NAT_INGRESS_CIDRS:</b>
  * required: true
  * description: allowed ingress network cidrs on the nat
    * default :
    * - "0.0.0.0/0"
* <b>NAT_EGRESS_PORTS:</b>
  * required: true
  * description: allowed ingress ports on the nat
  * default:
    * - "0-65535"
* <b>NAT_INGRESS_CIDRS:</b>
  * required: true
  * description: allowed ingress network cidrs on the nat
    * default :
    * - "0.0.0.0/0"
* <b>NAT_NAME:</b>
  * required: true
  * description: the name of the nat instance
  * default: "NAT"
* <b>NAT_AMI:</b>
  * required: true
  * description: the ami id of the nat
  * default: "ami-d69aad93"
* <b>NAT_SIZE:</b>
  * required: true
  * description: the instance size of the nat
  * default: "m1.small"

## Icon
![alt text](https://raw.githubusercontent.com/CloudCoreo/servers-nat/master/images/naticon.png "HA-NAT icon")

## Diagram
![alt text](https://raw.githubusercontent.com/CloudCoreo/servers-nat/master/images/hanat.png "HA-NAT")

## Tags
1. Network
1. VPC
1. NAT
1. High Availability
