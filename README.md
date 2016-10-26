cloudcoreo-nat
==============

Highly Available NAT instance configuration

In addition, it will create and maintain a <b>mostly-available</b> NAT instance in the public subnets.

* <b>Mostly-Available</b> refers to the fact that the HA will go down in the event of its AZ outage, but auto scaling will relaunch in a different AZ ensuring minimum downtime of the NAT

This repo is designed to work with the [CloudCoreo](http://www.cloudcoreo.com) engine. Adding this repository as a sub-module will ensure a High-uptime NAT is configured to work even in the event of a loss of availability zone.

## Description
Highly Available NAT instance configuration

## OVERRIDE OPTIONAL VARIABLES
* `VPC_NAME:`
  * required: true
  * description: this is the name of your vpc as defined by your [CloudCoreo](http://www.cloudcoreo.com) setup
  * default: test-vpc
* `PUBLIC_SUBNET_NAME:`
  * required: true
  * description: this is the name of the public subnet group as defined by your [CloudCoreo](http://www.cloudcoreo.com) setup
  * default: test-public-subnet
* `NAT_SG_NAME:`
  * required: true
  * description: the name of the security group to create for the NAT
  * default: "NAT-sg"
* `NAT_INGRESS_PORTS:`
  * required: true
  * description: allowed ingress ports on the nat
  * default:
    * - "80"
    * - "443"
* `NAT_INGRESS_CIDRS:`
  * required: true
  * description: allowed ingress network cidrs on the nat
    * default :
    * - "0.0.0.0/0"
* `NAT_EGRESS_PORTS:`
  * required: true
  * description: allowed ingress ports on the nat
  * default:
    * - "0-65535"
* `NAT_INGRESS_CIDRS:`
  * required: true
  * description: allowed ingress network cidrs on the nat
    * default :
    * - "0.0.0.0/0"
* `NAT_NAME:`
  * required: true
  * description: the name of the nat instance
  * default: "NAT"
* `NAT_AMI:`
  * description: the ami id of the nat
  * switch: INSTANCE::region
  * cases:
    * us-east-1: ami-303b1458
    * us-west-1: ami-ada746e9
    * us-west-2: ami-69ae8259
    * eu-west-1: ami-ef76e898
    * eu-central-1: ami-1e073a03
    * ap-southeast-1: ami-1a9dac48
    * ap-northeast-1: ami-11dc2a11
    * ap-southeast-2: ami-43ee9e79
    * sa-east-1: ami-63fa417e
  * type: case
* `NAT_SIZE:`
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

## Categories
1. Network
